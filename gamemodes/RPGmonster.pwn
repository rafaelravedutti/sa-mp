#include <a_samp>
#include <core>
#include <float>

new glob878[54];

new glob954[39];

new glob9F4[100];

new globB84[100];

new globD14[100];

new globEA4[100];

new glob1034[100];

new glob11C4[100] = { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };

new glob1354[100];

new glob14E4[100][2];

new glob1994[100];

new glob1B24;

new glob1B28[100];

new glob1CB8[100];

new glob1E48[100];

new glob1FD8[100];

new glob2168[100];

new glob22F8[100];

new glob2488[100];

new glob166D8[1497];

new glob17E3C[137];

new glob18060[135];

new glob1827C = 10;


function8(Float:arg0, Float:arg1)
{
	return 0 <= floatcmp(arg0, arg1);
}

function48(Float:arg0, Float:arg1)
{
	return 0 >= floatcmp(arg0, arg1);
}

public mktime(arg0, arg1, arg2, arg3, arg4, arg5)
{
	new var0 = 0;
	var0 = arg2 + (arg1 * 60) + (arg0 * 3600);
	new var1[12];
	if((!(arg5 % 4) && arg5 % 100) || !(arg5 % 400))
	{
	}
	else
	{
		var1 = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
	}
	new var2 = 0;
	var2 = arg3;
	if(arg4 > 1)
	{
		new var3 = 0;
		while(arg4 - 1 > ++var3++)
		{
			var2 = var2 + var1[var3];
		}
	}
	var0 = var0 + (var2 * 86400);
	for(new var3 = 1970; var3 < arg5; var3++)
	{
		var0 = var0 + 31536000;
		if((!(arg5 % 4) && arg5 % 100) || !(arg5 % 400))
		{
			var0 = var0 + 86400;
		}
	}
	return var0;
}

public Time()
{
	new var0 = 0, var1 = 0, var2 = 0;
	new var3 = 0, var4 = 0, var5 = 0;
	gettime(var0, var1, var2);
	getdate(var3, var4, var5);
	return mktime(var0, var1, var2, var5, var4, var3);
}

function504(arg0, arg1)
{
	new File:var0 = 0, File:var1 = 0;
	if(!fexist(arg0))
	{
		return 0;
	}
	var0 = fopen(arg0, 0);
	var1 = fopen(arg1, 1);
	new var2;
	new var3 = 0;
	for(new File:var4 = var0, new var5 = 4, flength(var0), var3 = flength(var0); 0 < var3; var3--)
	{
		fputchar(var1, fgetchar(var0, var2, false), false);
	}
	fclose(var0);
	fclose(var1);
	return 1;
}

function71C(arg0, arg1)
{
	if(!fexist(arg0))
	{
		return 0;
	}
	fremove(arg1);
	if(!function504(arg0, arg1))
	{
		return 0;
	}
	fremove(arg0);
	return 1;
}

public StripNewLine(arg0)
{
	new var0 = strlen(arg0);
	if(!arg0)
	{
		return 0;
	}
	if(arg0[var0 - 1] == 10 || arg0[var0 - 1] == 13)
	{
		arg0[var0 - 1] = 0;
		if(!arg0)
		{
			return 0;
		}
		if(arg0[var0 - 2] == 10 || arg0[var0 - 2] == 13)
		{
			arg0[var0 - 2] = 0;
		}
	}
	return 0;
}

functionA18(arg0, arg1, arg2)
{
	new var0[255];
	new var1 = 0;
	var0[0] = 0;
	if(strlen(arg0) <= arg1)
	{
		return var0;
	}
	if(strlen(arg0) <= arg2 + arg1)
	{
		arg2 = strlen(arg0) - arg1;
	}
	if(0 >= arg2)
	{
		return var0;
	}
	for(var1 = arg1; arg2 + arg1 > var1; var1++)
	{
		var0[var1 - arg1] = arg0[var1];
		if(!arg0[var1])
		{
			return var0;
		}
	}
	var0[arg2] = 0;
	return var0;
}

public copy(arg0, arg1, arg2)
{
	arg0 = 0;
	if(0 > arg2)
	{
		return 0;
	}
	if(strlen(arg1) < arg2)
	{
		arg2 = strlen(arg1);
	}
	new var0 = 0;
	for(var0 = 0; var0 < arg2; var0++)
	{
		arg0[var0] = arg1[var0];
		if(!arg1[var0])
		{
			return 1;
		}
	}
	arg0[arg2] = 0;
	return 1;
}

public copyEx(arg0, arg1, arg2, arg3)
{
	new var0 = 0;
	arg0 = 0;
	if(arg2 < 0 || arg3 > strlen(arg1))
	{
		return 0;
	}
	if(!arg2)
	{
		return 1;
	}
	if(strlen(arg1) < arg2 - arg3)
	{
		arg2 = strlen(arg1) - arg3;
	}
	for(var0 = arg3; arg2 + arg3 >= var0; var0++)
	{
		arg0[var0 - arg3] = arg1[var0];
		if(!arg1[var0])
		{
			return 1;
		}
	}
	arg0[arg2 - arg3] = 0;
	return 1;
}

public del(arg0, arg1)
{
	if(0 > arg1)
	{
		return 0;
	}
	new var0[255];
	set(var0, arg0);
	copyEx(arg0, var0, strlen(var0), arg1);
	return 1;
}

public set(arg0, arg1)
{
	new var0 = strlen(arg1);
	new var1 = 0;
	for(var1 = 0; var1 < var0; var1++)
	{
		arg0[var1] = arg1[var1];
	}
	arg0[var0] = 0;
	return 0;
}

public equal(arg0, arg1, arg2)
{
	if(strlen(arg0) != strlen(arg1))
	{
		return 0;
	}
	if(!strcmp(arg0, arg1, arg2))
	{
		return 1;
	}
	return 0;
}

function13BC(arg0, &arg1, arg2)
{
	new var0 = strlen(arg0);
	new var1 = arg1;
	new var2[255];
	while(arg1 < var0 && arg0[arg1] != arg2 && arg1 - var1 < 254)
	{
		var2[arg1 - var1] = arg0[arg1];
		arg1++;
	}
	var2[arg1 - var1] = 0;
	if(arg1 < var0 && arg0[arg1] == arg2)
	{
		arg1++;
	}
	return var2;
}

public getElement(arg0, arg1, arg2, arg3)
{
	new var0[255];
	new var1 = 0;
	set(var0, arg1);
	set(arg0, var0);
	while(strfind(var0, arg2, false, 0) > 0 && var1 < arg3)
	{
		var1++;
		copyEx(arg0, var0, strlen(var0), strfind(var0, arg2, false, 0) + 1);
		del(var0, strfind(var0, arg2, false, 0) + 1);
	}
	if(var1 < arg3)
	{
		set(arg0, glob60);
		return 0;
	}
	if(strfind(arg0, arg2, false, 0))
	{
		copyEx(arg0, arg0, strfind(arg0, arg2, false, 0), 0);
	}
	else
	{
		set(arg0, var0);
	}
	if(equal(arg0, arg2, true))
	{
		set(arg0, glob64);
	}
	return 0;
}

public mod(arg0, arg1)
{
	return arg0 - (floatround(arg0 / arg1, 1) * arg1);
}

public Float:div(arg0, arg1)
{
	return floatround(arg0 / arg1, 1);
}

public num_hash(arg0)
{
	new var0 = strlen(arg0);
	new var1 = 1;
	new var2 = 0;
	new var3 = 0;
	for(var3 = 0; var3 < var0; var3++)
	{
		var1 = (var1 + arg0[var3]) % 65521;
		var2 = (var2 + var1) % 65521;
	}
	return (var2 << 16) + var1;
}

public hash(arg0)
{
	new var0[255];
	var0[0] = 0;
	valstr(var0, num_hash(arg0), false);
	return var0;
}

function1CE4(arg0, arg1, arg2)
{
	new var0 = 0;
	new var1[255];
	new var2[255];
	set(var1, arg2);
	var0 = strfind(var1, arg0, false, 0);
	var2[0] = 0;
	while(0 <= var0)
	{
		strcat(var2, functionA18(var1, 0, var0), 255);
		strcat(var2, arg1, 255);
		var1 = functionA18(var1, var0 + strlen(arg0), strlen(var1) - var0);
		var0 = strfind(var1, arg0, false, 0);
	}
	strcat(var2, var1, 255);
	return var2;
}

function1FD4(arg0)
{
	new var0[255];
	var0[0] = 0;
	if(!arg0)
	{
		return var0;
	}
	new var1 = 0;
	for(var1 = 0; strlen(arg0) > var1; var1++)
	{
		var0[var1] = tolower(arg0[var1]);
	}
	var0[strlen(arg0)] = 0;
	return var0;
}

public udb_hash(arg0)
{
	new var0 = strlen(arg0);
	new var1 = 1;
	new var2 = 0;
	new var3 = 0;
	for(var3 = 0; var3 < var0; var3++)
	{
		var1 = (var1 + arg0[var3]) % 65521;
		var2 = (var2 + var1) % 65521;
	}
	return (var2 << 16) + var1;
}

public udb_encode(arg0)
{
	new var0[255];
	set(var0, arg0);
	var0 = function1CE4("_", " 00", var0);
	var0 = function1CE4(";", " 01", var0);
	var0 = function1CE4("!", " 02", var0);
	var0 = function1CE4("/", " 03", var0);
	var0 = function1CE4("\\", " 04", var0);
	var0 = function1CE4("[", " 05", var0);
	var0 = function1CE4("]", " 06", var0);
	var0 = function1CE4("?", " 07", var0);
	var0 = function1CE4(".", " 08", var0);
	var0 = function1CE4("*", " 09", var0);
	var0 = function1CE4("<", " 10", var0);
	var0 = function1CE4(">", " 11", var0);
	var0 = function1CE4("{", " 12", var0);
	var0 = function1CE4("}", " 13", var0);
	var0 = function1CE4(":", " 14", var0);
	var0 = function1CE4("|", " 15", var0);
	return var0;
}

public udb_decode(arg0)
{
	new var0[255];
	set(var0, arg0);
	var0 = function1CE4(" 01", ";", var0);
	var0 = function1CE4(" 02", "!", var0);
	var0 = function1CE4(" 03", "/", var0);
	var0 = function1CE4(" 04", "\\", var0);
	var0 = function1CE4(" 05", "[", var0);
	var0 = function1CE4(" 06", "]", var0);
	var0 = function1CE4(" 07", "?", var0);
	var0 = function1CE4(" 08", ".", var0);
	var0 = function1CE4(" 09", "*", var0);
	var0 = function1CE4(" 10", "<", var0);
	var0 = function1CE4(" 11", ">", var0);
	var0 = function1CE4(" 12", "{", var0);
	var0 = function1CE4(" 13", "}", var0);
	var0 = function1CE4(" 14", ":", var0);
	var0 = function1CE4(" 15", "|", var0);
	var0 = function1CE4(" 00", "_", var0);
	return var0;
}

public udb_Exists(arg0)
{
	new var0[255];
	new var1[255];
	set(var1, udb_encode(arg0));
	set(var0, var1);
	strcat(var0, ".1.player", 255);
	if(fexist(var0))
	{
		return 1;
	}
	set(var0, var1);
	strcat(var0, ".2.player", 255);
	if(fexist(var0))
	{
		return 1;
	}
	set(var0, var1);
	strcat(var0, ".3.player", 255);
	if(fexist(var0))
	{
		return 1;
	}
	return 0;
}

public udb_Remove(arg0)
{
	new var0[255];
	new var1[255];
	if(!udb_Exists(arg0))
	{
		return 0;
	}
	set(var1, udb_encode(arg0));
	set(var0, var1);
	strcat(var0, ".1.player", 255);
	fremove(var0);
	set(var0, var1);
	strcat(var0, ".2.player", 255);
	fremove(var0);
	set(var0, var1);
	strcat(var0, ".3.player", 255);
	fremove(var0);
	return 1;
}

public udp_PRIVATE_clearbroken(arg0)
{
	new var0[255];
	new var1[255];
	new var2[255];
	set(var0, arg0);
	set(var1, var0);
	strcat(var1, ".1.player", 255);
	set(var2, var0);
	strcat(var2, ".2.player", 255);
	if(fexist(var1) && fexist(var2))
	{
		fremove(var2);
	}
	else
	{
		set(var1, var0);
		strcat(var1, ".2.player", 255);
		set(var2, var0);
		strcat(var2, ".3.player", 255);
		if(fexist(var1) && fexist(var2))
		{
			fremove(var2);
		}
		else
		{
			set(var1, var0);
			strcat(var1, ".3.player", 255);
			set(var2, var0);
			strcat(var2, ".1.player", 255);
			if(fexist(var1) && fexist(var2))
			{
				fremove(var2);
			}
			else
			{
			}
		}
	}
	return 0;
}

public udb_Save(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15, arg16, arg17, arg18, arg19)
{
	new var0[255];
	var0[0] = 0;
	new var1[255];
	new File:var2 = 0;
	valstr(var1, arg1, false);
	strcat(var0, var1, 255);
	strcat(var0, ";", 255);
	valstr(var1, arg2, false);
	strcat(var0, var1, 255);
	strcat(var0, ";", 255);
	valstr(var1, arg3, false);
	strcat(var0, var1, 255);
	strcat(var0, ";", 255);
	valstr(var1, arg4, false);
	strcat(var0, var1, 255);
	strcat(var0, ";", 255);
	valstr(var1, arg5, false);
	strcat(var0, var1, 255);
	strcat(var0, ";", 255);
	valstr(var1, arg6, false);
	strcat(var0, var1, 255);
	strcat(var0, ";", 255);
	valstr(var1, arg7, false);
	strcat(var0, var1, 255);
	strcat(var0, ";", 255);
	valstr(var1, arg8, false);
	strcat(var0, var1, 255);
	strcat(var0, ";", 255);
	valstr(var1, arg9, false);
	strcat(var0, var1, 255);
	strcat(var0, ";", 255);
	valstr(var1, arg10, false);
	strcat(var0, var1, 255);
	strcat(var0, ";", 255);
	strcat(var0, arg11, 255);
	format(var0, 255, "%s;%f;%f;%f;%f;%f", var0, arg12, arg13, arg14, arg15, arg16);
	strcat(var0, ";", 255);
	valstr(var1, arg17, false);
	strcat(var0, var1, 255);
	strcat(var0, ";", 255);
	valstr(var1, arg18, false);
	strcat(var0, var1, 255);
	strcat(var0, ";", 255);
	valstr(var1, arg19, false);
	strcat(var0, var1, 255);
	new var3[255];
	new var4[255];
	new var5[255];
	set(var3, udb_encode(arg0));
	udp_PRIVATE_clearbroken(var3);
	set(var4, var3);
	strcat(var4, ".1.player", 255);
	set(var5, var3);
	strcat(var5, ".2.player", 255);
	if(fexist(var4))
	{
		var2 = fopen(var5, 1);
		fwrite(var2, var0);
		fclose(var2);
		fremove(var4);
		return 1;
	}
	set(var4, var3);
	strcat(var4, ".2.player", 255);
	set(var5, var3);
	strcat(var5, ".3.player", 255);
	if(fexist(var4))
	{
		var2 = fopen(var5, 1);
		fwrite(var2, var0);
		fclose(var2);
		fremove(var4);
		return 1;
	}
	set(var4, var3);
	strcat(var4, ".3.player", 255);
	set(var5, var3);
	strcat(var5, ".1.player", 255);
	if(fexist(var4))
	{
		var2 = fopen(var5, 1);
		fwrite(var2, var0);
		fclose(var2);
		fremove(var4);
		return 1;
	}
	var2 = fopen(var5, 1);
	fwrite(var2, var0);
	fclose(var2);
	return 0;
}

public udb_Load(arg0, &arg1, &arg2, &arg3, &arg4, &arg5, &arg6, &arg7, &arg8, &arg9, &arg10, arg11, &arg12, &arg13, &arg14, &arg15, &arg16, &arg17, &arg18, &arg19)
{
	new var0[255];
	var0[0] = 0;
	arg1 = 0;
	arg2 = 0;
	arg3 = 0;
	arg4 = 0;
	arg5 = 0;
	arg6 = 0;
	arg7 = 0;
	arg8 = 0;
	arg9 = 0;
	arg10 = 0;
	arg11 = 0;
	arg12 = 0;
	arg13 = 0;
	arg14 = 0;
	arg15 = 0;
	arg16 = 0;
	arg17 = 0;
	arg18 = 0;
	arg19 = 0;
	new File:var1 = 0;
	new var2[255];
	new var3[255];
	set(var2, udb_encode(arg0));
	udp_PRIVATE_clearbroken(var2);
	set(var3, var2);
	strcat(var3, ".1.player", 255);
	if(fexist(var3))
	{
		var1 = fopen(var3, 0);
		fread(var1, var0, 255);
		fclose(var1);
	}
	set(var3, var2);
	strcat(var3, ".2.player", 255);
	if(fexist(var3))
	{
		var1 = fopen(var3, 0);
		fread(var1, var0, 255);
		fclose(var1);
	}
	set(var3, var2);
	strcat(var3, ".3.player", 255);
	if(fexist(var3))
	{
		var1 = fopen(var3, 0);
		fread(var1, var0, 255);
		fclose(var1);
	}
	StripNewLine(var0);
	if(var0[0])
	{
		new var4 = 0;
		arg1 = strval(function13BC(var0, var4, 59));
		arg2 = strval(function13BC(var0, var4, 59));
		arg3 = strval(function13BC(var0, var4, 59));
		arg4 = strval(function13BC(var0, var4, 59));
		arg5 = strval(function13BC(var0, var4, 59));
		arg6 = strval(function13BC(var0, var4, 59));
		arg7 = strval(function13BC(var0, var4, 59));
		arg8 = strval(function13BC(var0, var4, 59));
		arg9 = strval(function13BC(var0, var4, 59));
		arg10 = strval(function13BC(var0, var4, 59));
		set(arg11, function13BC(var0, var4, 59));
		arg12 = floatstr(function13BC(var0, var4, 59));
		arg13 = floatstr(function13BC(var0, var4, 59));
		arg14 = floatstr(function13BC(var0, var4, 59));
		arg15 = floatstr(function13BC(var0, var4, 59));
		arg16 = floatstr(function13BC(var0, var4, 59));
		arg17 = strval(function13BC(var0, var4, 59));
		arg18 = strval(function13BC(var0, var4, 59));
		arg19 = strval(function13BC(var0, var4, 59));
		return 1;
	}
	return 0;
}

public udb_getClantag(arg0)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10[255], var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16 = 0, var17 = 0, var18 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18))
	{
		return var10;
	}
	var10[0] = 0;
	return var10;
}

public udb_getPwdHash(arg0)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10[255], var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16 = 0, var17 = 0, var18 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18))
	{
		return var0;
	}
	return 0;
}

public udb_getAccState(arg0)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10[255], var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16 = 0, var17 = 0, var18 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18))
	{
		return var1;
	}
	return -1;
}

public udb_getPosition(arg0, arg1, arg2, arg3)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10[255], var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, arg1, arg2, arg3, var11, var12, var13, var14, var15))
	{
		return 1;
	}
	return 0;
}

public udb_getAng(arg0, arg1)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10[255], var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16 = 0, var17 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, arg1, var14, var15, var16, var17))
	{
		return 1;
	}
	return 0;
}

public udb_getSkin(arg0)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10[255], var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16 = 0, var17 = 0, var18 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18))
	{
		return var2;
	}
	return 0;
}

public udb_getBankMoney(arg0)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10[255], var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16 = 0, var17 = 0, var18 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18))
	{
		return var3;
	}
	return 0;
}

public udb_getHealth(arg0, arg1)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10[255], var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16 = 0, var17 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, arg1, var15, var16, var17))
	{
		return 1;
	}
	return 0;
}

public udb_getGasoline(arg0)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10[255], var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16 = 0, var17 = 0, var18 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18))
	{
		return var4;
	}
	return 0;
}

public udb_getHabaerea(arg0)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10[255], var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16 = 0, var17 = 0, var18 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18))
	{
		return var5;
	}
	return 0;
}

public udb_gethabterre(arg0)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10[255], var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16 = 0, var17 = 0, var18 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18))
	{
		return var6;
	}
	return 0;
}

public udb_getHabnauti(arg0)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10[255], var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16 = 0, var17 = 0, var18 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18))
	{
		return var7;
	}
	return 0;
}

public udb_getPrisao(arg0)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10[255], var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16 = 0, var17 = 0, var18 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18))
	{
		return var8;
	}
	return 0;
}

public udb_getProf(arg0)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10[255], var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16 = 0, var17 = 0, var18 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18))
	{
		return var9;
	}
	return 0;
}

public udb_getPescas(arg0)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10[255], var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16 = 0, var17 = 0, var18 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18))
	{
		return var16;
	}
	return 0;
}

public udb_getSeguros(arg0)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10[255], var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16 = 0, var17 = 0, var18 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18))
	{
		return var17;
	}
	return 0;
}

public udb_getSalarios(arg0)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10[255], var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16 = 0, var17 = 0, var18 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18))
	{
		return var18;
	}
	return 0;
}

public udb_setClantag(arg0, arg1)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10[255], var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16 = 0, var17 = 0, var18 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18))
	{
		udb_Save(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, arg1, var11, var12, var13, var14, var15, var16, var17, var18);
		return 1;
	}
	return 0;
}

public udb_setPwdHash(arg0, arg1)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10[255], var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16 = 0, var17 = 0, var18 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18))
	{
		udb_Save(arg0, arg1, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18);
		return 1;
	}
	return 0;
}

public udb_setPassword(arg0, arg1)
{
	return udb_setPwdHash(arg0, udb_hash(arg1));
}

public udb_setAccState(arg0, arg1)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10[255], var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16 = 0, var17 = 0, var18 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18))
	{
		udb_Save(arg0, var0, arg1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18);
		return 1;
	}
	return 0;
}

public udb_CheckLogin(arg0, arg1)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10[255], var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16 = 0, var17 = 0, var18 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18) && udb_hash(arg1) == var0)
	{
		return 1;
	}
	return 0;
}

public udb_Create(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15, arg16, arg17, arg18, arg19)
{
	if(udb_Exists(arg0))
	{
		return 0;
	}
	udb_Save(arg0, udb_hash(arg1), arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15, arg16, arg17, arg18, arg19);
	return 1;
}

public udb_setPosition(arg0, arg1, arg2, arg3)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10[255], var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16 = 0, var17 = 0, var18 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18))
	{
		udb_Save(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, arg1, arg2, arg3, var14, var15, var16, var17, var18);
		return 1;
	}
	return 0;
}

public udb_setAng(arg0, arg1)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10[255], var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16 = 0, var17 = 0, var18 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18))
	{
		udb_Save(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, arg1, var15, var16, var17, var18);
		return 1;
	}
	return 0;
}

public udb_setSkin(arg0, arg1)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10[255], var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16 = 0, var17 = 0, var18 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18))
	{
		udb_Save(arg0, var0, var1, arg1, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18);
		return 1;
	}
	return 0;
}

public udb_setBankMoney(arg0, arg1)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10[255], var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16 = 0, var17 = 0, var18 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18))
	{
		udb_Save(arg0, var0, var1, var2, arg1, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18);
		return 1;
	}
	return 0;
}

public udb_setHealth(arg0, arg1)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10[255], var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16 = 0, var17 = 0, var18 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18))
	{
		udb_Save(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, arg1, var16, var17, var18);
		return 1;
	}
	return 0;
}

public udb_setGasoline(arg0, arg1)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10[255], var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16 = 0, var17 = 0, var18 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18))
	{
		udb_Save(arg0, var0, var1, var2, var3, arg1, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18);
		return 1;
	}
	return 0;
}

public udb_setHabaerea(arg0, arg1)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10[255], var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16 = 0, var17 = 0, var18 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18))
	{
		udb_Save(arg0, var0, var1, var2, var3, var4, arg1, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18);
		return 1;
	}
	return 0;
}

public udb_setHabterre(arg0, arg1)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10[255], var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16 = 0, var17 = 0, var18 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18))
	{
		udb_Save(arg0, var0, var1, var2, var3, var4, var5, arg1, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18);
		return 1;
	}
	return 0;
}

public udb_setHabnauti(arg0, arg1)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10[255], var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16 = 0, var17 = 0, var18 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18))
	{
		udb_Save(arg0, var0, var1, var2, var3, var4, var5, var6, arg1, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18);
		return 1;
	}
	return 0;
}

public udb_setPrisao(arg0, arg1)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10[255], var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16 = 0, var17 = 0, var18 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18))
	{
		udb_Save(arg0, var0, var1, var2, var3, var4, var5, var6, var7, arg1, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18);
		return 1;
	}
	return 0;
}

public udb_setProf(arg0, arg1)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10[255], var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16 = 0, var17 = 0, var18 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18))
	{
		udb_Save(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, arg1, var10, var11, var12, var13, var14, var15, var16, var17, var18);
		return 1;
	}
	return 0;
}

public udb_setPescas(arg0, arg1)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10[255], var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16 = 0, var17 = 0, var18 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18))
	{
		udb_Save(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, arg1, var17, var18);
		return 1;
	}
	return 0;
}

public udb_setSeguros(arg0, arg1)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10[255], var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16 = 0, var17 = 0, var18 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18))
	{
		udb_Save(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, arg1, var18);
		return 1;
	}
	return 0;
}

public udb_setSalarios(arg0, arg1)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10[255], var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16 = 0, var17 = 0, var18 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18))
	{
		udb_Save(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, arg1);
		return 1;
	}
	return 0;
}

public dini_Exists(arg0)
{
	if(fexist(arg0))
	{
		return 1;
	}
	return 0;
}

public dini_Remove(arg0)
{
	if(!fexist(arg0))
	{
		return 0;
	}
	fremove(arg0);
	return 1;
}

public dini_Create(arg0)
{
	new File:var0 = 0;
	if(fexist(arg0))
	{
		return 0;
	}
	var0 = fopen(arg0, 1);
	fclose(var0);
	return 1;
}

public dini_PRIVATE_ExtractKey(arg0)
{
	new var0[255];
	var0[0] = 0;
	if(strfind(arg0, "=", true, 0) == -1)
	{
		return var0;
	}
	set(var0, function1FD4(functionA18(arg0, 0, strfind(arg0, "=", true, 0))));
	return var0;
}

public dini_PRIVATE_ExtractValue(arg0)
{
	new var0[255];
	var0[0] = 0;
	if(strfind(arg0, "=", true, 0) == -1)
	{
		return var0;
	}
	set(var0, functionA18(arg0, strfind(arg0, "=", true, 0) + 1, strlen(arg0)));
	return var0;
}

public dini_Set(arg0, arg1, arg2)
{
	new File:var0 = 0, File:var1 = 0;
	new var2 = 0;
	new var3[255];
	if(!arg1)
	{
		return 0;
	}
	format(var3, 255, "%s.part", arg0);
	var0 = fopen(arg0, 0);
	if(!var0)
	{
		return 0;
	}
	fremove(var3);
	var1 = fopen(var3, 1);
	while(fread(var0, var3, 255))
	{
		StripNewLine(var3);
		if(!var2 && equal(dini_PRIVATE_ExtractKey(var3), arg1, true))
		{
			format(var3, 255, "%s=%s", arg1, arg2);
			var2 = 1;
		}
		fwrite(var1, var3);
		fwrite(var1, "\r\n");
	}
	if(!var2)
	{
		format(var3, 255, "%s=%s", arg1, arg2);
		fwrite(var1, var3);
		fwrite(var1, "\r\n");
	}
	fclose(var0);
	fclose(var1);
	format(var3, 255, "%s.part", arg0);
	return function71C(var3, arg0);
}

public dini_IntSet(arg0, arg1, arg2)
{
	new var0[255];
	format(var0, 255, "%d", arg2);
	return dini_Set(arg0, arg1, var0);
}

public dini_Int(arg0, arg1)
{
	return strval(dini_Get(arg0, arg1));
}

public dini_Bool(arg0, arg1)
{
	return strval(dini_Get(arg0, arg1));
}

public dini_BoolSet(arg0, arg1, arg2)
{
	new var0[255];
	format(var0, 255, "%d", arg2);
	return dini_Set(arg0, arg1, var0);
}

public dini_Unset(arg0, arg1)
{
	new File:var0 = 0, File:var1 = 0;
	new var2[255];
	format(var2, 255, "%s.part", arg0);
	var0 = fopen(arg0, 0);
	if(!var0)
	{
		return 0;
	}
	fremove(var2);
	var1 = fopen(var2, 1);
	while(fread(var0, var2, 255))
	{
		StripNewLine(var2);
		if(equal(dini_PRIVATE_ExtractKey(var2), arg1, true))
		{
		}
		else
		{
			format(var2, 255, "%s", var2);
			fwrite(var1, var2);
			fwrite(var1, "\r\n");
		}
	}
	fclose(var0);
	fclose(var1);
	format(var2, 255, "%s.part", arg0);
	return function71C(var2, arg0);
}

public dini_Get(arg0, arg1)
{
	new File:var0 = 0;
	new var1[255];
	new var2[255];
	var1[0] = 0;
	var0 = fopen(arg0, 0);
	if(!var0)
	{
		return var1;
	}
	while(fread(var0, var1, 255))
	{
		StripNewLine(var1);
		if(equal(dini_PRIVATE_ExtractKey(var1), arg1, true))
		{
			var2[0] = 0;
			strcat(var2, dini_PRIVATE_ExtractValue(var1), 255);
			fclose(var0);
			return var2;
		}
	}
	fclose(var0);
	return var1;
}

public dini_Isset(arg0, arg1)
{
	new File:var0 = 0;
	new var1[255];
	var0 = fopen(arg0, 0);
	if(!var0)
	{
		return 0;
	}
	while(fread(var0, var1, 255))
	{
		StripNewLine(var1);
		if(equal(dini_PRIVATE_ExtractKey(var1), arg1, true))
		{
			fclose(var0);
			return 1;
		}
	}
	fclose(var0);
	return 0;
}

main()
{
	print("\n----------------------------------");
	print("  Monster Server RPG by Allan");
	print("----------------------------------\n");
	glob1B24 = 12;
	return 0;
}

public OnGameModeInit()
{
	print("GameModeInit()");
	SetGameModeText("Monster RPG");
	AddPlayerClass(0, -1958.5108, 293.6747, 35.4687, 269.1424, 0, 0, 0, 0, 0, 0);
	AddStaticVehicle(596, -1588.248, 748.0393, -5.4904, 359.9997, 0, 1);
	AddStaticVehicle(523, -1584.0218, 749.491, -5.6656, 180.9965, 0, 0);
	AddStaticVehicle(523, -1579.8461, 749.0731, -5.6572, 181.8757, 0, 0);
	AddStaticVehicle(596, -1574.2565, 742.4982, -5.5206, 88.9996, 0, 1);
	AddStaticVehicle(523, -1573.5986, 734.6491, -5.669, 90.0025, 0, 0);
	AddStaticVehicle(497, -1679.5951, 706.1431, 30.7954, 90.5113, 0, 1);
	AddStaticVehicle(437, -1988.5008, 162.0946, 27.6508, 0.0, 1, 1);
	AddStaticVehicle(437, -1988.336, 131.3477, 27.6942, 0.0, 1, 1);
	AddStaticVehicle(410, -2089.6644, -83.5934, 34.7975, 359.9729, 6, 6);
	AddStaticVehicle(410, -2081.2825, -83.4889, 34.8086, 4.09, 6, 6);
	AddStaticVehicle(461, -2022.3978, -124.3721, 34.7831, 179.9716, 6, 6);
	AddStaticVehicle(487, -2032.246, -155.6209, 35.4655, 0.006, 1, 6);
	AddStaticVehicle(475, -2088.8313, -156.0123, 35.0983, 359.9812, 6, 6);
	AddStaticVehicle(475, -2092.4036, -145.2735, 35.0985, 0.0399, 6, 6);
	AddStaticVehicle(475, -2092.3504, -132.4997, 35.0965, 0.4675, 6, 6);
	AddStaticVehicle(487, -1829.1175, 1300.2818, 59.8816, 204.0558, 54, 29);
	AddStaticVehicle(453, -1556.1756, 1260.8344, -0.5926, 234.7669, 69, 69);
	AddStaticVehicle(453, -1565.1834, 1259.7523, -0.5379, 227.8784, 69, 69);
	AddStaticVehicle(453, -1578.2353, 1260.0367, -0.0552, 228.0563, 69, 69);
	AddStaticVehicle(493, -1474.4727, 687.5855, -0.2038, 268.8839, 6, 6);
	AddStaticVehicle(453, -1473.3943, 703.5045, -0.4342, 272.7461, 6, 6);
	AddStaticVehicle(420, -1703.0906, 1003.9793, 17.3777, 91.1513, 6, 1);
	AddStaticVehicle(520, -1687.7857, 999.6074, 17.3444, 270.719, 6, 1);
	AddStaticVehicle(409, -1816.4678, 1311.4034, 50.2891, 275.5557, 1, 1);
	AddStaticVehicle(409, -1829.7209, 1289.6336, 50.2512, 110.5457, 1, 1);
	AddStaticVehicle(433, -1307.1634, 456.9035, 7.5908, 89.9428, 0, 0);
	AddStaticVehicle(433, -1306.519, 463.9993, 7.6435, 89.6542, 0, 0);
	AddStaticVehicle(433, -1306.5568, 460.6202, 7.6451, 90.4466, 0, 0);
	AddStaticVehicle(433, -1309.4953, 444.8434, 7.6132, 55.0, 0, 0);
	AddStaticVehicle(433, -1307.2222, 447.7583, 7.5936, 54.9896, 0, 0);
	AddStaticVehicle(470, -1241.5156, 445.2167, 7.1592, 326.9935, 44, 44);
	AddStaticVehicle(470, -1232.7764, 451.6961, 7.168, 89.998, 0, 0);
	AddStaticVehicle(425, -1403.2001, 465.2319, 7.7642, 181.0, 0, 0);
	AddStaticVehicle(425, 308.9299, 1990.3327, 18.2169, 180.0702, 0, 0);
	AddStaticVehicle(425, 309.5914, 2056.1018, 18.1975, 180.0104, 0, 0);
	AddStaticVehicle(599, -1574.1393, 722.2083, -5.0514, 90.0, 0, 1);
	AddStaticVehicle(490, -1638.4981, 686.0985, -5.0522, 90.0, 0, 1);
	AddStaticVehicle(490, -1638.8158, 678.3303, -5.0547, 90.0, 0, 1);
	AddStaticVehicle(599, -1596.2554, 676.9788, -5.0483, 360.0, 0, 1);
	AddStaticVehicle(601, -1591.0669, 706.9367, -5.0472, 0.0, 0, 1);
	AddStaticVehicle(601, -1573.9584, 711.4353, -5.0499, 0.0, 0, 1);
	AddStaticVehicle(528, -1612.457, 692.7164, -5.0542, 0.0, 0, 1);
	AddStaticVehicle(593, -1705.9878, -230.8742, 14.2757, 90.0, 1, 1);
	AddStaticVehicle(592, -1667.096, -184.9636, 14.3663, 270.0, 1, 1);
	AddStaticVehicle(456, -520.0032, -495.0567, 26.3558, 0.0, 17, 0);
	AddStaticVehicle(456, -557.1138, -499.0924, 25.752, 0.0, 17, 0);
	AddStaticVehicle(456, -529.4785, -495.0567, 26.3558, 0.0, 17, 0);
	AddStaticVehicle(456, -484.135, -473.0813, 25.6976, 180.0, 17, 0);
	AddStaticVehicle(456, -489.4562, -473.0988, 25.6957, 180.0, 17, 0);
	AddStaticVehicle(456, -494.4126, -473.0661, 25.6973, 180.0, 17, 0);
	AddStaticVehicle(456, -499.5871, -472.9991, 25.6967, 180.0, 17, 0);
	AddStaticVehicle(456, -504.6507, -473.065, 25.6954, 180.0, 17, 0);
	AddStaticVehicle(456, -508.8906, -472.9949, 25.6974, 180.0, 17, 0);
	AddStaticVehicle(435, -589.4819, -472.2841, 25.3028, 180.0, 17, 0);
	AddStaticVehicle(403, -590.0012, -487.4199, 25.3026, 180.0, 17, 0);
	AddStaticVehicle(435, -584.6341, -471.0558, 25.1865, 180.0, 17, 0);
	AddStaticVehicle(403, -584.8274, -487.7698, 25.1827, 180.0, 17, 0);
	AddStaticVehicle(450, -579.5821, -471.2551, 25.1868, 180.0, 17, 0);
	AddStaticVehicle(591, -574.592, -471.1815, 25.1864, 180.0, 17, 0);
	AddStaticVehicle(403, -574.9036, -488.2773, 25.186, 180.0, 17, 0);
	AddStaticVehicle(403, -579.769, -488.0979, 25.1867, 180.0, 17, 0);
	AddStaticVehicle(490, -1639.0357, 657.8603, -5.5227, 90.0, 53, 6);
	AddStaticVehicle(599, -1639.3332, 661.9144, -5.5222, 90.0, 53, 6);
	AddStaticVehicle(427, -1638.9056, 665.8078, -5.5217, 90.0, 53, 6);
	AddStaticVehicle(599, -1638.633, 670.1574, -5.5152, 90.0, 0, 0);
	AddStaticVehicle(598, -1638.693, 674.0748, -5.5152, 90.0, 0, 0);
	AddStaticVehicle(598, -1623.0613, 653.6203, -5.5211, 270.0, 53, 6);
	AddStaticVehicle(597, -1639.0077, 653.7394, -5.5208, 90.0, 53, 6);
	AddStaticVehicle(598, -1623.0347, 649.6097, -5.5206, 270.0, 53, 6);
	new File:var0 = 0;
	new var1 = 0;
	new var2[256];
	new var3 = 0, Float:var4 = 0.0, Float:var5 = 0.0, Float:var6 = 0.0, Float:var7 = 0.0, var8 = 0, var9 = 0;
	var0 = fopen("rcars.ini", 2);
	while(fread(var0, var2))
	{
		var1 = 0;
		var3 = strval(function13BC(var2, var1, 32));
		var4 = floatstr(function13BC(var2, var1, 32));
		var5 = floatstr(function13BC(var2, var1, 32));
		var6 = floatstr(function13BC(var2, var1, 32));
		var7 = floatstr(function13BC(var2, var1, 32));
		var8 = strval(function13BC(var2, var1, 32));
		var9 = strval(function13BC(var2, var1, 32));
		AddStaticVehicle(var3, var4, var5, var6, var7, var8, var9);
	}
	fclose(var0);
	SetTimer("Bancos", 1000, true);
	SetTimer("CheckFuel", 30000, true);
	SetTimer("MoneyGrubScoreUpdate", 1000, true);
	SetTimer("Taxi", 5000, true);
	SetTimer("Tempo", 60000, true);
	SetTimer("PoliceArea", 10, true);
	SetTimer("AdminArea", 10, true);
	SetTimer("Postos", 10, true);
	SetTimer("AreadePesca", 10, true);
	SetTimer("Cooperativa", 10, true);
	SetTimer("Carga", 10, true);
	SetTimer("Descarga", 10, true);
	SetTimer("TempoPrisao", 60000, true);
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerInterior(playerid, 14);
	SetPlayerPos(playerid, 258.4892, -41.4008, 1002.0233);
	SetPlayerFacingAngle(playerid, 90.0);
	SetPlayerCameraPos(playerid, 256.0815, -43.0476, 1003.0233);
	SetPlayerCameraLookAt(playerid, 258.4892, -41.4008, 1002.0233);
	GameTextForPlayer(playerid, "~g~Por favor, faca LOGIN ou  REGISTRESSE! ~n~ coder: Allan", 5000, 3);
	return 1;
}

public OnGameModeExit()
{
	for(new var0 = 0; var0 < 100; var0++)
	{
		if(glob9F4[var0] == 1)
		{
			udb_setAccState(PlayerName(var0), GetPlayerMoney(var0));
			new Float:var1 = 0.0;
			GetPlayerHealth(var0, var1);
			udb_setHealth(PlayerName(var0), var1);
			udb_setGasoline(PlayerName(var0), globEA4[var0]);
		}
	}
	print("GameModeExit()");
	return 1;
}

public OnPlayerConnect(playerid)
{
	GameTextForPlayer(playerid, "BEM VINDO ao ~r~Monster RPG! ~n~Coder: Allan", 5000, 6);
	SendClientMessage(playerid, 0xFF990000, "..:Monster RPG Mode:..");
	SendClientMessage(playerid, 0xFFFF00AA, "Para ajuda inicial digite /ajuda");
	SendClientMessage(playerid, 0xFFFF00AA, "Para os comandos do RPG digite /rajuda");
	SendClientMessage(playerid, 0xFFFF00AA, "Para uma breve explicação sobre o RPG digite /aprender");
	SendClientMessage(playerid, 0xFFFF00AA, "Obs: É preciso se registrar para jogar o RPG Mode.");
	if(udb_Exists(PlayerName(playerid)))
	{
		new var0[256];
		format(var0, 255, "Olá %s, Bem vindo! ATENÇÃO! Seu nick já esta registado neste server!", PlayerName(playerid));
		SendClientMessage(playerid, 0xFFFF00AA, var0);
		SendClientMessage(playerid, 0xFFFF00AA, "Entre com '/rlogin [senha]' para entrar com seu usuario registrado!");
	}
	else
	{
		new var0[256];
		format(var0, 255, "Olá %s, Bem Vindo! ATENÇÃO! Entre com '/rregister [senha]' para poder Jogar!", PlayerName(playerid));
		SendClientMessage(playerid, 0xFFFF00AA, var0);
	}
	glob9F4[playerid] = 0;
	globD14[playerid] = 0;
	globB84[playerid] = 0;
	GivePlayerMoney(playerid, 0);
	globEA4[playerid] = udb_getGasoline(PlayerName(playerid));
	SetPlayerColor(playerid, 0xAFAFAFAA);
	return 0;
}

public OnPlayerDisconnect(playerid, reason)
{
	if(glob9F4[playerid] == 1)
	{
		udb_setAccState(PlayerName(playerid), GetPlayerMoney(playerid));
		new Float:var0 = 0.0;
		GetPlayerHealth(playerid, var0);
		udb_setHealth(PlayerName(playerid), var0);
		udb_setGasoline(PlayerName(playerid), globEA4[playerid]);
	}
	return 0;
}

public OnPlayerSpawn(playerid)
{
	glob1994[playerid] = 0;
	SetPlayerInterior(playerid, 0);
	if(!glob9F4[playerid])
	{
		SetPlayerPos(playerid, -1958.5108, 293.6747, 35.4687);
		SetPlayerFacingAngle(playerid, 90.0);
		TogglePlayerControllable(playerid, false);
		return 1;
	}
	if(udb_getPrisao(PlayerName(playerid)) == 1 && 1 != glob1034[playerid])
	{
		new var0 = 0, var1[255];
		TogglePlayerControllable(playerid, true);
		SetPlayerInterior(playerid, 6);
		SetPlayerPos(playerid, 262.954, 78.4338, 1002.0391);
		SendClientMessage(playerid, 0xAA3333AA, "Você cometeu algum crime e por isso foi preso, você ficará 5 horas na cadeia.");
		SendClientMessage(playerid, 0xAA3333AA, "(Lembrete: Cada hora no jogo equivale a um minuto real)");
		SendClientMessage(playerid, 0xFFFF00AA, "Caso você queira sair da prisao mais cedo, você pode pagar a fiança (/fianca) por $1500.");
		SendClientMessage(playerid, 0x33AA33AA, "Você Será solto em 5 minutos!");
		glob1034[playerid] = 1;
		if(30 >= glob878[54])
		{
			format(var1, 255, "%s foi preso!", PlayerName(playerid));
			for(var0 = 0; glob878[24] > var0; var0++)
			{
				if(IsPlayerConnected(glob878[var0]) == 1 && glob878[var0] != playerid)
				{
					SendClientMessage(glob878[var0], 0x33AA33AA, var1);
				}
			}
			glob878[var0] = playerid;
			glob878[54]++;
		}
		else
		{
			SendClientMessage(playerid, 0xAA3333AA, "Desculpe, a cadeia de San Fierro está cheia!");
		}
		return 1;
	}
	if(glob1034[playerid] == 1)
	{
		SetPlayerInterior(playerid, 6);
		SetPlayerPos(playerid, 262.954, 78.4338, 1002.0391);
	}
	else
	{
		TogglePlayerControllable(playerid, true);
		return 1;
	}
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	udb_setAccState(PlayerName(playerid), 0);
	GivePlayerMoney(playerid, 0);
	if(glob11C4[playerid] == 1)
	{
		SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), -2651.6502, 634.4509, 14.4531, 180.0, 41, 200, 0, 0, 46, 0);
	}
	if(glob11C4[playerid] == 2)
	{
		SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), -2651.6502, 634.4509, 14.4531, 180.0, 32, 200, 0, 0, 46, 0);
	}
	if(glob11C4[playerid] == 3)
	{
		SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), -2651.6502, 634.4509, 14.4531, 180.0, 32, 200, 24, 150, 31, 500);
	}
	if(glob11C4[playerid] == 4)
	{
		SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), -2651.6502, 634.4509, 14.4531, 180.0, 32, 200, 24, 150, 31, 500);
	}
	if(glob11C4[playerid] == 5)
	{
		SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), -2651.6502, 634.4509, 14.4531, 180.0, 4, 0, 32, 800, 24, 1000);
	}
	if(glob11C4[playerid] == 6)
	{
		SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), -2651.6502, 634.4509, 14.4531, 180.0, 32, 200, 0, 0, 46, 0);
	}
	if(glob11C4[playerid] == 7)
	{
		SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), -2651.6502, 634.4509, 14.4531, 180.0, 32, 500, 27, 800, 24, 800);
	}
	if(glob11C4[playerid] == 8)
	{
		SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), -2651.6502, 634.4509, 14.4531, 180.0, 32, 800, 26, 200, 22, 500);
	}
	if(glob11C4[playerid] == 9)
	{
		SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), -2651.6502, 634.4509, 14.4531, 180.0, 32, 250, 24, 150, 46, 0);
	}
	if(glob11C4[playerid] == 10)
	{
		SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), -2651.6502, 634.4509, 14.4531, 180.0, 32, 1000, 27, 1000, 24, 1000);
	}
	if(glob11C4[playerid] == 11)
	{
		SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), -2651.6502, 634.4509, 14.4531, 180.0, 31, 500, 32, 800, 22, 1000);
	}
	if(glob11C4[playerid] == 12)
	{
		SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), -2651.6502, 634.4509, 14.4531, 180.0, 31, 500, 32, 800, 22, 1000);
	}
	if(glob11C4[playerid] == 13)
	{
		SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), -2651.6502, 634.4509, 14.4531, 180.0, 32, 250, 24, 150, 46, 0);
	}
	if(glob11C4[playerid] == 14)
	{
		SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), -2651.6502, 634.4509, 14.4531, 180.0, 4, 0, 41, 0, 0, 0);
	}
	if(glob11C4[playerid] == 15)
	{
		SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), -2651.6502, 634.4509, 14.4531, 180.0, 32, 200, 22, 150, 46, 0);
	}
	if(glob11C4[playerid] == 16)
	{
		SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), -2651.6502, 634.4509, 14.4531, 180.0, 32, 200, 24, 100, 46, 0);
	}
	if(glob11C4[playerid] == 17)
	{
		SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), -2651.6502, 634.4509, 14.4531, 180.0, 32, 200, 46, 0, 0, 0);
	}
	if(glob11C4[playerid] == 18)
	{
		SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), -2651.6502, 634.4509, 14.4531, 180.0, 32, 200, 46, 0, 0, 0);
	}
	if(glob11C4[playerid] == 19)
	{
		SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), -2651.6502, 634.4509, 14.4531, 180.0, 32, 500, 46, 0, 24, 50);
	}
	if(glob11C4[playerid] == 20)
	{
		SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), -2651.6502, 634.4509, 14.4531, 180.0, 31, 500, 32, 800, 22, 100);
	}
	if(glob11C4[playerid] == 21)
	{
		SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), -2651.6502, 634.4509, 14.4531, 180.0, 28, 250, 30, 150, 23, 100);
	}
	if(glob11C4[playerid] == 5)
	{
		if(glob22F8[killerid] == 1)
		{
			glob22F8[killerid] = 0;
			SendClientMessage(killerid, 0x33AA33AA, "Você se Livrou do sequestro!!!!!");
		}
		if(glob1354[playerid] == 1)
		{
			udb_setPrisao(PlayerName(playerid), 1);
			LogarPlayer(playerid);
		}
	}
	if(!udb_getSeguros(PlayerName(playerid)))
	{
		udb_setBankMoney(PlayerName(playerid), udb_getBankMoney(PlayerName(playerid)) - 250);
		SendClientMessage(playerid, 0xAA3333AA, "Você foi encontrado quase morto e foi levado ao Hospital!");
		SendClientMessage(playerid, 0xAA3333AA, "O valor do tratamento foi de $250!");
	}
	if(0 < udb_getSeguros(PlayerName(playerid)))
	{
		new var0[256];
		udb_setSeguros(PlayerName(playerid), udb_getSeguros(PlayerName(playerid)) - 1);
		format(var0, 256, "O seu seguro pagou o tratamento, mas agora você possui %d creditos.", udb_getSeguros(PlayerName(playerid)));
		SendClientMessage(playerid, 0xAA3333AA, "Você foi encontrado quase morto e foi levado ao Hospital!");
		SendClientMessage(playerid, 0xAA3333AA, var0);
	}
	if(glob1354[playerid] == 1)
	{
		udb_setPrisao(PlayerName(playerid), 1);
		LogarPlayer(playerid);
	}
	if(killerid == 255)
	{
		SendDeathMessage(255, playerid, reason);
		ResetPlayerMoney(playerid);
	}
	else
	{
		SendDeathMessage(killerid, playerid, reason);
		if(0 < GetPlayerMoney(playerid))
		{
			GivePlayerMoney(killerid, GetPlayerMoney(playerid));
			ResetPlayerMoney(playerid);
		}
	}
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	printf("OnVehicleSpawn(%d)", vehicleid);
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	printf("OnVehicleDeath(%d, %d)", vehicleid, killerid);
	return 1;
}

public OnPlayerText(playerid, text)
{
	printf("OnPlayerText(%d)", playerid);
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext)
{
	new var0 = 0;
	new var1[256];
	new var2 = 0, var3 = 0, var4 = 0;
	new var5[24];
	new var6[24];
	var1 = function13BC(cmdtext, var4, 32);
	if(!strcmp(var1, "/rregister", true))
	{
		new var7[256];
		var7 = function13BC(cmdtext, var4, 32);
		if(udb_Exists(PlayerName(playerid)))
		{
			SendClientMessage(playerid, 0xAA3333AA, "Você já esta registrado");
			return 1;
		}
		if(glob9F4[playerid] == 1)
		{
			SendClientMessage(playerid, 0xAA3333AA, "Você já está registrado!");
			return 1;
		}
		if(!strlen(var7))
		{
			SendClientMessage(playerid, 0xAA3333AA, "/rregister [senha]");
			return 1;
		}
		glob9F4[playerid] = 1;
		udb_Create(PlayerName(playerid), var7, 0, 0, 3000, 0, 0, 0, 0, 0, 1, glob3D90, 3302735627, 1148206898, 1103564793, 1127481344, 1120403456, 0, 0, 0);
		new Float:var8 = 0.0, Float:var9 = 0.0, Float:var10 = 0.0, Float:var11 = 0.0, Float:var12 = 0.0;
		udb_getPosition(PlayerName(playerid), var8, var9, var10);
		udb_getAng(PlayerName(playerid), var11);
		GivePlayerMoney(playerid, udb_getAccState(PlayerName(playerid)) - GetPlayerMoney(playerid));
		udb_getHealth(PlayerName(playerid), var12);
		SetPlayerHealth(playerid, var12);
		SetPlayerColor(playerid, 0x66666600);
		SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), var8, var9, var10, var11, 41, 200, 0, 0, 46, 0);
		SpawnPlayer(playerid);
		SendClientMessage(playerid, 0x33AA33AA, "Registrado e logado.");
		SendClientMessage(playerid, 0x33AA33AA, "Você têm $3000 no banco para começar a viver.");
		return 1;
	}
	if(!strcmp(var1, "/rlogin", true) && IsPlayerConnected(playerid))
	{
		new var7[256];
		var7 = function13BC(cmdtext, var4, 32);
		if(!udb_Exists(PlayerName(playerid)))
		{
			SendClientMessage(playerid, 0xAA3333AA, "Você não está registrado.");
			return 1;
		}
		if(glob9F4[playerid] == 1)
		{
			SendClientMessage(playerid, 0xAA3333AA, "Você já está logado.");
			return 1;
		}
		if(!strlen(var7))
		{
			SendClientMessage(playerid, 0xAA3333AA, "/rlogin [senha]");
			return 1;
		}
		if(udb_CheckLogin(PlayerName(playerid), var7))
		{
			glob9F4[playerid] = 1;
			LogarPlayer(playerid);
			return 1;
		}
		SendClientMessage(playerid, 0xAA3333AA, "SENHA INCORRETA");
		return 1;
		return 1;
	}
	if(!strcmp(var1, "/senha", true) && IsPlayerAdmin(arg0))
	{
		new var7[256];
		new var8 = 0;
		var7 = function13BC(arg1, var4, 32);
		if(!strlen(var7))
		{
			SendClientMessage(arg0, 0xAA3333AA, "/senha [id] [senha]");
			return 1;
		}
		var8 = strval(var7);
		var7 = function13BC(arg1, var4, 32);
		if(udb_Exists(PlayerName(var8)) || glob9F4[var8] == 1)
		{
			udb_setPassword(PlayerName(var8), var7);
			SendClientMessage(arg0, 0x33AA33AA, "Senha Alterada!");
			SendClientMessage(var8, 0x33AA33AA, "Sua senha foi alterada!");
			return 1;
		}
	}
	if(!strcmp(var1, "/sethome", true))
	{
		if(glob11C4[arg0] == 4 || IsPlayerAdmin(arg0))
		{
			new var7[256];
			var7 = function13BC(arg1, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(arg0, 0xAA3333AA, "/sethome [nome]");
				return 1;
			}
			if(udb_Exists(var7))
			{
				new Float:var8 = 0.0, Float:var9 = 0.0, Float:var10 = 0.0, Float:var11 = 0.0;
				GetPlayerPos(arg0, var8, var9, var10);
				GetPlayerFacingAngle(arg0, var11);
				udb_setPosition(var7, var8, var9, var10);
				udb_setAng(var7, var11);
				SendClientMessage(arg0, 0x33AA33AA, "Casa salva");
				return 1;
			}
			return 1;
		}
		SendClientMessage(arg0, 0xAA3333AA, "Você não tem permissão para isso");
		return 1;
		return 1;
	}
	if(!strcmp(var1, "/setskin", true))
	{
		if(glob11C4[arg0] == 3 || IsPlayerAdmin(arg0))
		{
			new var7[256];
			new var8 = 0, var9 = 0;
			var7 = function13BC(arg1, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(arg0, 0xAA3333AA, "/setskin [id] [amount]");
				return 1;
			}
			var8 = strval(var7);
			var7 = function13BC(arg1, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(arg0, 0xAA3333AA, "/setskin [id] [amount]");
				return 1;
			}
			var9 = strval(var7);
			if(IsPlayerConnected(var8))
			{
				udb_setSkin(PlayerName(var8), var9);
				SendClientMessage(arg0, 0x33AA33AA, "Skin Setado.");
				SendClientMessage(var8, 0x33AA33AA, "Seu skin foi comprado!");
				LogarPlayer(var8);
				return 1;
			}
			SendClientMessage(arg0, 0xAA3333AA, "O jogador não está conectado!");
			return 1;
			return 1;
		}
		SendClientMessage(arg0, 0xAA3333AA, "Você não tem permissão para isso");
		return 1;
		return 1;
	}
	if(!strcmp(var1, "/ajuda", true))
	{
		SendClientMessage(arg0, 0xFFFF00AA, "/rajuda : Comandos do SERVER");
		SendClientMessage(arg0, 0xFFFF00AA, "/rrgister [senha] : se registra");
		SendClientMessage(arg0, 0xFFFF00AA, "/rlogin [senha] : se loga no jogo");
		SendClientMessage(arg0, 0xFFFF00AA, "/aprender : Mostra uma breve explicação sobre o RPG.");
		SendClientMessage(arg0, 0xFFFF00AA, "/creditos : Vê os creditos do Monster RPG Mode");
		return 1;
	}
	if(!strcmp(var1, "/creditos", true))
	{
		SendClientMessage(arg0, 0x33AA33AA, "..:Monster RPG Mode:..");
		SendClientMessage(arg0, 0xFFFF00AA, "Feito por: [MT]Allan");
		SendClientMessage(arg0, 0xFFFF00AA, "Agradecimentos:");
		SendClientMessage(arg0, 0xFFFF00AA, "- [MT]Daniel, [MT]Swat, [MT]Mayer, [MT]Scheid, Biazzon, Osorkon(Idéias)");
		SendClientMessage(arg0, 0xFFFF00AA, "- [MT]Daniel (Alguns códigos)");
		SendClientMessage(arg0, 0xFFFF00AA, "- Biazzon, Osorkon, [MT]Daniel, [MT]Swat, [MT]Mayer, [MT]Scheid (Testes)");
		return 1;
	}
	if(!strcmp(var1, "/aprender", true))
	{
		SendClientMessage(arg0, 0xAFAFAFAA, "..:Monster RPG Mode:..");
		SendClientMessage(arg0, 0xFFFFFFAA, "Este servidor é um RPG, ou seja, simula como se fosse a vida real.");
		SendClientMessage(arg0, 0xFFFFFFAA, "Nele você arranja um emprego para ganhar dinheiro para pode comprar sua casa, carros, etc.");
		SendClientMessage(arg0, 0xFFFFFFAA, "Como na vida real, existem crimes, como roubo e morte, e neste mode a policia irá te prender caso você cometa algum crime.");
		SendClientMessage(arg0, 0xFFFFFFAA, "Você também só pode dirigir com habilitação (terrestre para carros e motos, naútica para barcos e a aérea para helicópteros e aviões).");
		SendClientMessage(arg0, 0xFFFFFFAA, "Caso a policia te pegue andando sem habilitação, você vai tomar uma multa e poderá até ser preso.");
		SendClientMessage(arg0, 0xFFFFFFAA, "Espero que você se divirta neste servidor. Boa diversão!");
		SendClientMessage(arg0, 0xFF990000, "Digite /ajuda ou /rajuda para visualizar os comandos.");
		return 1;
	}
	if(!strcmp(var1, "/rajuda", true))
	{
		SendClientMessage(arg0, 0xFF990000, "Comandos do ..:Monster Server RPG:..");
		SendClientMessage(arg0, 0xFFFF00AA, "/profs : mostra as profissoes do RPG. | /190 [denuncia] : Faz uma denuncia para a policia.");
		SendClientMessage(arg0, 0xFFFF00AA, "/givecash : Envia dinheiro a algum jogador. | /presos : Vê a lista de pessoas presas.");
		SendClientMessage(arg0, 0xFFFF00AA, "/trancar : Tranca seu carro. | /procurados : Vê a lista de procurados pela policia");
		SendClientMessage(arg0, 0xFFFF00AA, "/destrancar : Destranca seu carro. | /pescar : Joga a rede pra pescar, você deve estar na área de pesca.");
		SendClientMessage(arg0, 0xFFFF00AA, "/ci [id] : Mostra seus documentos. | /say [texto] : Manda mensagem para pessoas proximas a você.");
		SendClientMessage(arg0, 0xFFFF00AA, "/relogio : Mostra o horário em SF. | /profissao : Comandos de sua profissão. | /pescas : Vê quantas pescas você tem!");
		SendClientMessage(arg0, 0xFFFF00AA, "/taxi [lugar] : Chama um taxi. | /banco : Comandos do Banco. | /vender : Vende a pesca, você deve estar na cooperativa de pesca!");
		SendClientMessage(arg0, 0xFFFF00AA, "/buygas [litros] : Compra gasolina (você deve estar no posto para usar este comando).");
		SendClientMessage(arg0, 0xFFFF00AA, "/pagar [id] [quantidade] : Paga por algum serviço de corretor ou vendedor de carros.");
		return 1;
	}
	if(!strcmp(var1, "/banco", true))
	{
		SendClientMessage(arg0, 0x33AA33AA, "Comandos do Banco");
		SendClientMessage(arg0, 0xFFFF00AA, "/bdp [quantia] : Deposita dinheiro na sua conta do banco");
		SendClientMessage(arg0, 0xFFFF00AA, "/bwd [quantia] : retira dinheiro na sua conta do banco");
		SendClientMessage(arg0, 0xFFFF00AA, "/bstats : checa seu o saldo bancário..");
		SendClientMessage(arg0, 0xFFFF00AA, "/bscell : checa seu o saldo bancário através do seu celular, custo $20.");
		SendClientMessage(arg0, 0xFFFF00AA, "Você precisa estar em um banco para usar esses comandos, menos o /bscell.");
		SendClientMessage(arg0, 0xFFFF00AA, "Bancos: Hotel, Car Shop, SF Train Station e SA Federal Mint.");
		return 1;
	}
	if(!strcmp(var1, "/profs", true))
	{
		SendClientMessage(arg0, 0x33AA33AA, "Profissões disponíveis no Server:");
		SendClientMessage(arg0, 0x66666600, "1 - Desempregado (Salário: $350)");
		SendClientMessage(arg0, 0xFFFF0000, "2 - Taxista (Salário: $900)");
		SendClientMessage(arg0, 0xF0808000, "6 - Barman (Salário: $850 + as bebidas que vende)");
		SendClientMessage(arg0, 0xADD8E600, "8 - Segurança (Salário: $850 + o que o patrão pagar)");
		SendClientMessage(arg0, 0xFF990000, "9 - Motorista Particular (Salário: $850 + o que o patrão pagar)");
		SendClientMessage(arg0, 0xE9967A00, "14 - Pescador (Salário: $750 + o que ganha na pesca)");
		SendClientMessage(arg0, 0xF5F5DC00, "17 - Motorista de ônibus (Salário: $900)");
		SendClientMessage(arg0, 0xCCD2C600, "18 - Caminhoneiro (Salário: -/- + o que ganha por carga)");
		SendClientMessage(arg0, 0x33AA33AA, "Obs: Pessa para um admin para mudar sua profissao.");
		return 1;
	}
	if(!strcmp(var1, "/profs2", true) && IsPlayerAdmin(arg0))
	{
		SendClientMessage(arg0, 0x33AA33AA, "Profissões Limitadas no Server:");
		SendClientMessage(arg0, 0x00990000, "3 - Vendedor de carros (Salário: $200 + comissão)");
		SendClientMessage(arg0, 0xDEB88700, "4 - Corretor de Imoveis (Salário: $200 + comissão)");
		SendClientMessage(arg0, 0xDEB88700, "5 - Assasino (Salário: $-/-)");
		SendClientMessage(arg0, 0x7FFF0000, "7 - Juiz (Salário: $1500)");
		SendClientMessage(arg0, 0x0000FF00, "10 - Policial Militar (Salário: $1200)");
		SendClientMessage(arg0, 0x6495ED00, "11 - Policial Rodoviario (Salário: $1200)");
		SendClientMessage(arg0, 0x00FFFF00, "12 - Policial de Elite (Salário: $2000)");
		SendClientMessage(arg0, 0x00008B00, "13 - Controlador Aereo (Salário: $1000)");
		SendClientMessage(arg0, 0x33AA33AA, "Obs: Estas Profissoes sao limitadas e so podem ser contratadas por um admin ou por um prefeito!");
		return 1;
	}
	if(!strcmp(var1, "/profs3", true) && IsPlayerAdmin(arg0))
	{
		SendClientMessage(arg0, 0x33AA33AA, "Profissões Limitadas no Server:");
		SendClientMessage(arg0, 0xDD000000, "15 - Instrutor de Auto Escola (Salário: $600)");
		SendClientMessage(arg0, 0x8B008B00, "16 - Jornalista (Salário: $800)");
		SendClientMessage(arg0, 0xFF66FF00, "19 - Vendedor de Seguros (Salário: $800 + comissão)");
		SendClientMessage(arg0, 0xF0F8FF00, "20 - Narcoticos (Salário: $3000)");
		SendClientMessage(arg0, 0x80800000, "21 - Vendedor de Seguros (Salário: $850 + comissão das drogas)");
		SendClientMessage(arg0, 0x33AA33AA, "Obs: Estas Profissoes sao limitadas e so podem ser contratadas por um admin ou por um prefeito!");
		return 1;
	}
	if(!strcmp(var1, "/taxi", true))
	{
		new var7[256];
		new var8[256];
		strmid(var7, arg1, 5, strlen(arg1), 256);
		if(!strlen(var7))
		{
			SendClientMessage(arg0, 0xAA3333AA, "/taxi [aonde]");
			return 1;
		}
		SendClientMessage(arg0, 0xFFFF00AA, "Os taxistas foram informados");
		for(new var9 = 0; var9 < 100; var9++)
		{
			if(glob11C4[var9] == 2)
			{
				format(var8, 256, "%s pede um taxi. Local: %s", PlayerName(arg0), var7);
				SendClientMessage(var9, 0xFFFF00AA, var8);
			}
		}
		return 1;
		return 1;
	}
	if(!strcmp(var1, "/190", true))
	{
		new var7[256];
		new var8[256];
		strmid(var7, arg1, 4, strlen(arg1), 256);
		if(!strlen(var7))
		{
			SendClientMessage(arg0, 0xAA3333AA, "/190 [denuncia]");
			return 1;
		}
		SendClientMessage(arg0, 0x00FFFF00, "Os policiais foram informados");
		for(new var9 = 0; var9 < 100; var9++)
		{
			if(glob11C4[var9] == 10 || glob11C4[var9] == 11 || glob11C4[var9] == 12)
			{
				format(var8, 256, "%s fez uma denuncia: %s", PlayerName(arg0), var7);
				SendClientMessage(var9, 0x00FFFF00, var8);
			}
		}
		return 1;
		return 1;
	}
	if(!strcmp(arg1, "/trancar", true))
	{
		if(IsPlayerInAnyVehicle(arg0))
		{
			new var7 = GetPlayerState(arg0);
			if(2 != var7)
			{
				SendClientMessage(arg0, 0xFFFF00AA, "Você só pode trancar o carro se estiver dirijindo ele.");
				return 1;
			}
			new var8 = 0;
			for(var8 = 0; var8 < 100; var8++)
			{
				if(var8 != arg0)
				{
					SetVehicleParamsForPlayer(GetPlayerVehicleID(arg0), var8, false, true);
				}
			}
			SendClientMessage(arg0, 0xFFFF00AA, "Veículo trancado!");
			new Float:var9 = 0.0, Float:var10 = 0.0, Float:var11 = 0.0;
			GetPlayerPos(arg0, var9, var10, var11);
			PlayerPlaySound(arg0, 1056, var9, var10, var11);
		}
		else
		{
			SendClientMessage(arg0, 0xFFFF00AA, "Você não está em um veículo!");
		}
		return 1;
	}
	if(!strcmp(arg1, "/destrancar", true))
	{
		if(IsPlayerInAnyVehicle(arg0))
		{
			new var7 = GetPlayerState(arg0);
			if(2 != var7)
			{
				SendClientMessage(arg0, 0xFFFF00AA, "Você só pode destrancar o carro se estiver dirijindo ele.");
				return 1;
			}
			new var8 = 0;
			for(var8 = 0; var8 < 100; var8++)
			{
				SetVehicleParamsForPlayer(GetPlayerVehicleID(arg0), var8, false, false);
			}
			SendClientMessage(arg0, 0xFFFF00AA, "Veículo destrancado!");
			new Float:var9 = 0.0, Float:var10 = 0.0, Float:var11 = 0.0;
			GetPlayerPos(arg0, var9, var10, var11);
			PlayerPlaySound(arg0, 1057, var9, var10, var11);
		}
		else
		{
			SendClientMessage(arg0, 0xFFFF00AA, "Você não está em um veículo.");
		}
		return 1;
	}
	if(!strcmp(arg1, "/carregar", true))
	{
		if(glob11C4[arg0] == 18 || IsPlayerAdmin(arg0))
		{
			if(IsPlayerInAnyVehicle(arg0))
			{
				new var7 = GetPlayerState(arg0);
				new Float:var8 = 0.0, Float:var9 = 0.0, Float:var10 = 0.0;
				GetPlayerPos(arg0, var8, var9, var10);
				if(function8(var8, -624.29) && function48(var8, -465.5701) && function8(var9, -563.23) && function48(var9, -467.86) && function8(var10, 25.52) && function48(var10, 37.9799))
				{
					if(2 != var7)
					{
						SendClientMessage(arg0, 0xAA3333AA, "Você só pode carregar o caminhão se estiver dirijindo ele.");
						return 1;
					}
					if(glob2168[arg0] == 1)
					{
						SendClientMessage(arg0, 0xAA3333AA, "Você já está carregado");
						return 1;
					}
					SendClientMessage(arg0, 0x33AA33AA, "Veículo Carregado!");
					SendClientMessage(arg0, 0x33AA33AA, "Vá na fabrica ao lado do aeroporto para Descarregar!");
					glob2168[arg0] = 1;
				}
				else
				{
					SendClientMessage(arg0, 0x33AA33AA, "Você não está na area de Carga!");
					return 1;
				}
				return 1;
			}
			SendClientMessage(arg0, 0xFFFF00AA, "Você não está em um caminhão.");
			return 1;
		}
		if(18 != glob11C4[arg0])
		{
			SendClientMessage(arg0, 0x33AA33AA, "Você não é caminhoneiro.");
			return 1;
		}
		return 1;
	}
	if(!strcmp(arg1, "/descarregar", true))
	{
		if(glob11C4[arg0] == 18 || IsPlayerAdmin(arg0))
		{
			if(glob2168[arg0] == 1)
			{
				if(IsPlayerInAnyVehicle(arg0))
				{
					new var7 = GetPlayerState(arg0);
					new Float:var8 = 0.0, Float:var9 = 0.0, Float:var10 = 0.0;
					GetPlayerPos(arg0, var8, var9, var10);
					if(function8(var8, -1867.5601) && function48(var8, -1820.0301) && function8(var9, -105.02) && function48(var9, 173.19) && function8(var10, 14.97) && function48(var10, 90.36))
					{
						if(2 != var7)
						{
							SendClientMessage(arg0, 0xAA3333AA, "Você só pode descarregar o caminhão se estiver dirijindo ele.");
							return 1;
						}
						SendClientMessage(arg0, 0x33AA33AA, "Veículo Descarregado!");
						SendClientMessage(arg0, 0x33AA33AA, "Volte transportadora para Carregar novamete!");
						glob2168[arg0] = 0;
						GivePlayerMoney(arg0, 200);
					}
					else
					{
						SendClientMessage(arg0, 0x33AA33AA, "Você não está na area de Carga!");
						return 1;
					}
					return 1;
				}
				SendClientMessage(arg0, 0xFFFF00AA, "Você não está em um veículo.");
				return 1;
				return 1;
			}
			SendClientMessage(arg0, 0xAA3333AA, "Você não está carregado");
			return 1;
			return 1;
		}
		if(18 != glob11C4[arg0])
		{
			SendClientMessage(arg0, 0x33AA33AA, "Você não é caminhoneiro.");
			return 1;
		}
		return 1;
	}
	if(!strcmp(var1, "/givecash", true))
	{
		new var7[256];
		new var8[256];
		var8 = function13BC(arg1, var4, 32);
		if(!strlen(var8))
		{
			SendClientMessage(arg0, 0xAA3333AA, "Uso: /givechash [id-do-jogador] [quantidade]");
			return 1;
		}
		var2 = strval(var8);
		var8 = function13BC(arg1, var4, 32);
		if(!strlen(var8))
		{
			SendClientMessage(arg0, 0xAA3333AA, "Uso: /givechash [id-do-jogador] [quantidade]");
			return 1;
		}
		var3 = strval(var8);
		if(IsPlayerConnected(var2))
		{
			GetPlayerName(var2, var5, 24);
			GetPlayerName(arg0, var6, 24);
			var0 = GetPlayerMoney(arg0);
			if(var3 > 0 && var0 >= var3)
			{
				GivePlayerMoney(arg0, 0 - var3);
				GivePlayerMoney(var2, var3);
				format(var7, 256, "Você enviou %s(id: %d), $%d.", var5, var2, var3);
				SendClientMessage(arg0, 0xFFFF00AA, var7);
				format(var7, 256, "Você recebeu $%d de %s(id: %d).", var3, var6, arg0);
				SendClientMessage(var2, 0xFFFF00AA, var7);
			}
			else
			{
				SendClientMessage(arg0, 0xFFFF00AA, "Valor inválido.");
			}
		}
		else
		{
			format(var7, 256, "%d não está online.", var2);
			SendClientMessage(arg0, 0xFFFF00AA, var7);
		}
		return 1;
	}
	if(!strcmp(var1, "/bdp", true))
	{
		new var7[256];
		new var8 = 0;
		var7 = function13BC(arg1, var4, 32);
		if(!strlen(var7))
		{
			SendClientMessage(arg0, 0xFFFFFFAA, "Uso: /bdp [quantidade]");
			return 1;
		}
		var8 = strval(var7);
		if(var8 <= 0 || var8 > GetPlayerMoney(arg0))
		{
			SendClientMessage(arg0, 0xAA3333AA, "Você não tem todo esse dinheiro. Ou está tentando enviar $0.");
			return 1;
		}
		if(IsPlayerInCheckpoint(arg0))
		{
			GivePlayerMoney(arg0, 0 - var8);
			udb_setAccState(PlayerName(arg0), GetPlayerMoney(arg0));
			udb_setBankMoney(PlayerName(arg0), udb_getBankMoney(PlayerName(arg0)) + var8);
			new var9[255];
			format(var9, 255, "Você agora tem %d na conta %d", udb_getBankMoney(PlayerName(arg0)), arg0);
			SendClientMessage(arg0, 0x33AA33AA, var9);
			return 1;
		}
		SendClientMessage(arg0, 0xFFFF00AA, "Você precisa estar em um banco para usar esse comando.");
		SendClientMessage(arg0, 0xFFFF00AA, "Bancos: Hotel, Car's Shop, SF Train Station, San Andreas Federal Mint.");
		return 1;
		return 1;
	}
	if(!strcmp(var1, "/bwd", true))
	{
		new var7[256];
		new var8 = 0;
		var7 = function13BC(arg1, var4, 32);
		if(!strlen(var7))
		{
			SendClientMessage(arg0, 0xFFFFFFAA, "Uso: /bwd [quantidade]");
			return 1;
		}
		var8 = strval(var7);
		if(0 > var8)
		{
			SendClientMessage(arg0, 0xAA3333AA, "Você não pode querer depositar com esse comando");
			return 1;
		}
		if(udb_getBankMoney(PlayerName(arg0)) < var8)
		{
			SendClientMessage(arg0, 0xAA3333AA, "Você não pode tem essa quantidade no banco");
			return 1;
		}
		if(IsPlayerInCheckpoint(arg0))
		{
			GivePlayerMoney(arg0, var8);
			udb_setBankMoney(PlayerName(arg0), udb_getBankMoney(PlayerName(arg0)) - var8);
			new var9[255];
			format(var9, 255, "Você agora tem %d na conta %d", udb_getBankMoney(PlayerName(arg0)), arg0);
			SendClientMessage(arg0, 0x33AA33AA, var9);
			return 1;
		}
		SendClientMessage(arg0, 0xFFFF00AA, "Você precisa estar em um banco para usar esse comando.");
		SendClientMessage(arg0, 0xFFFF00AA, "Bancos: Hotel, Car's Shop, SF Train Station, San Andreas Federal Mint.");
		return 1;
		return 1;
	}
	if(!strcmp(var1, "/bstats", true))
	{
		new var7[256];
		if(IsPlayerInCheckpoint(arg0))
		{
			format(var7, 256, "Você tem %d na conta %d", udb_getBankMoney(PlayerName(arg0)), arg0);
			SendClientMessage(arg0, 0x33AA33AA, var7);
			return 1;
		}
		SendClientMessage(arg0, 0xFFFF00AA, "Você precisa estar em um banco para usar esse comando.");
		SendClientMessage(arg0, 0xFFFF00AA, "Bancos: Hotel, Car's Shop, SF Train Station, San Andreas Federal Mint.");
		return 1;
		return 1;
	}
	if(!strcmp(var1, "/bscell", true))
	{
		new var7[256];
		if(20 > GetPlayerMoney(arg0))
		{
			SendClientMessage(arg0, 0xFFFF00AA, "Custo: $20");
			return 1;
		}
		GivePlayerMoney(arg0, -20);
		format(var7, 256, "Mensagem de Celular: Você tem %d na conta %d", udb_getBankMoney(PlayerName(arg0)), arg0);
		SendClientMessage(arg0, 0x33AA33AA, var7);
		return 1;
		return 1;
	}
	if(!strcmp(var1, "/buygas", true))
	{
		new var7[256];
		new var8 = 0;
		new var9[256];
		var7 = function13BC(arg1, var4, 32);
		if(!strlen(var7))
		{
			SendClientMessage(arg0, 0xAA3333AA, "Uso: /buygas [litros]");
			return 1;
		}
		var8 = strval(var7);
		if(var8 <= 0 || GetPlayerMoney(arg0) < var8)
		{
			SendClientMessage(arg0, 0xAA3333AA, "Você não tem dinheiro para pagar. Ou você está querendo tirar gasolina do carro.");
			return 1;
		}
		new Float:var10 = 0.0, Float:var11 = 0.0, Float:var12 = 0.0;
		GetPlayerPos(arg0, var10, var11, var12);
		if((function8(var10, 651.9782) && function48(var11, -540.2438) && function48(var10, 670.9481) && function8(var11, -589.7477)) || (function8(var10, -117.3342) && function8(var11, -1194.0711) && function48(var10, -56.5732) && function48(var11, -1158.9866)) || (function8(var10, -2419.97) && function8(var11, 958.6099) && function48(var10, -2400.0) && function48(var11, 988.1799)) || (function48(var10, -1651.1) && function8(var10, -1713.5301) && function48(var11, 452.5599) && function8(var11, 388.41)))
		{
			if(100 > var8 + globEA4[arg0])
			{
				globEA4[arg0] = var8;
				format(var9, 256, "Você comprou %d litros de gasolina!", var8);
				SendClientMessage(arg0, 0x33AA33AA, var9);
				GivePlayerMoney(arg0, -var8);
				return 1;
			}
			if(100 <= var8 + globEA4[arg0])
			{
				new var13 = 0;
				var13 = 100 - globEA4[arg0];
				globEA4[arg0] = 100;
				format(var9, 256, "Seu tanque ficou completo, só colocamos %d litros!", var13);
				SendClientMessage(arg0, 0x33AA33AA, var9);
				GivePlayerMoney(arg0, -var13);
				return 1;
			}
			return 1;
		}
		SendClientMessage(arg0, 0xAA3333AA, "Você não está no posto, consulte o mapa no fórum para saber sua localização");
		return 1;
		return 1;
	}
	if(!strcmp(var1, "/sellgas", true) && IsPlayerAdmin(arg0))
	{
		new var7[256];
		new var8[256];
		new var9 = 0;
		new var10 = 0;
		var8 = function13BC(arg1, var4, 32);
		if(!strlen(var8))
		{
			SendClientMessage(arg0, 0xAA3333AA, "/sellgas [id] [quantia]");
			return 1;
		}
		var9 = strval(var8);
		var8 = function13BC(arg1, var4, 32);
		if(!strlen(var8))
		{
			SendClientMessage(arg0, 0xAA3333AA, "/sellgas [id] [quantia]");
			return 1;
		}
		var10 = strval(var8);
		if(100 > var10 + globEA4[arg0])
		{
			globEA4[var9] = var10;
			format(var7, 256, "Você agora tem %d litros de gasolina!", var10);
			SendClientMessage(var9, 0x33AA33AA, var7);
			SendClientMessage(arg0, 0x33AA33AA, "Gasolina Setada!");
			return 1;
		}
		if(100 <= var10 + globEA4[arg0])
		{
			new var11 = 0;
			var11 = 100 - globEA4[var9];
			globEA4[var9] = 100;
			format(var7, 256, "Seu tanque agora está completo, foram colocados %d litros!", var11);
			SendClientMessage(var9, 0x33AA33AA, var7);
			SendClientMessage(arg0, 0x33AA33AA, "Gasolina Setada!");
			return 1;
		}
		return 1;
	}
	if(!strcmp(var1, "/pagar", true))
	{
		new var7[256];
		new var8[256];
		new var9 = 0;
		new var10 = 0;
		var8 = function13BC(arg1, var4, 32);
		if(!strlen(var8))
		{
			SendClientMessage(arg0, 0xAA3333AA, "/pagar [id] [quantia]");
			return 1;
		}
		var9 = strval(var8);
		var8 = function13BC(arg1, var4, 32);
		if(!strlen(var8))
		{
			SendClientMessage(arg0, 0xAA3333AA, "/pagar [id] [quantia]");
			return 1;
		}
		var10 = strval(var8);
		if(glob11C4[var9] == 3 || glob11C4[var9] == 4 || IsPlayerAdmin(var9))
		{
			if(var10 > GetPlayerMoney(var9) || var10 <= 0)
			{
				SendClientMessage(arg0, 0xAA3333AA, "Você não tem esse dinheiro! ou não está querendo pagar de forma justa.");
				return 1;
			}
			if(IsPlayerConnected(var9))
			{
				GivePlayerMoney(var9, var10 / 10);
				GivePlayerMoney(arg0, 0 - var10);
				SendClientMessage(arg0, 0x33AA33AA, "Pagamento feito.");
				format(var7, 256, "Você vendeu por %d e lucrou %d com a venda", var10, var10 / 10);
				SendClientMessage(arg0, 0x33AA33AA, var7);
				return 1;
			}
			SendClientMessage(arg0, 0xAA3333AA, "O jogador não está conectado!");
			return 1;
			return 1;
		}
		if(3 != glob11C4[var9] || 4 != glob11C4[var9])
		{
			SendClientMessage(arg0, 0xAA3333AA, "Você está tentando pagar a alguem que não é coretoe e nem vendedor!");
			return 1;
		}
		return 1;
	}
	if(!strcmp(var1, "/jobpay", true) && IsPlayerAdmin(arg0))
	{
		new var7[256];
		new var8 = 0;
		new var9 = 0;
		var7 = function13BC(arg1, var4, 32);
		if(!strlen(var7))
		{
			SendClientMessage(arg0, 0xAA3333AA, "/jobpay [id] [quantia]");
			return 1;
		}
		var8 = strval(var7);
		var7 = function13BC(arg1, var4, 32);
		if(!strlen(var7))
		{
			SendClientMessage(arg0, 0xAA3333AA, "/jobpay [id] [quantia]");
			return 1;
		}
		var9 = strval(var7);
		if(0 < var9)
		{
			if(IsPlayerConnected(var8))
			{
				SendClientMessage(var8, 0x33AA33AA, "Você recebeu dinheiro! Consulte sua conta!");
				SendClientMessage(arg0, 0x33AA33AA, "Pagamento feito.");
				udb_setBankMoney(PlayerName(var8), udb_getBankMoney(PlayerName(var8)) + var9);
				return 1;
			}
			SendClientMessage(arg0, 0xAA3333AA, "O jogador não está conectado!");
			return 1;
			return 1;
		}
		if(IsPlayerAdmin(arg0))
		{
			SendClientMessage(arg0, 0xAA3333AA, "Você está tentando pagar a alguem que não é ADMIN!");
			return 1;
		}
		return 1;
	}
	if(!strcmp(var1, "/ci", true))
	{
		new var7[256];
		new var8[256];
		new var9 = 0;
		new var10[3];
		var8 = function13BC(arg1, var4, 32);
		if(!strlen(var8))
		{
			SendClientMessage(arg0, 0xAA3333AA, "Documentos mostrados.");
			return 1;
		}
		var9 = strval(var8);
		if(IsPlayerConnected(var9))
		{
			var10[2] = udb_getHabaerea(PlayerName(arg0));
			var10[0] = udb_gethabterre(PlayerName(arg0));
			var10[1] = udb_getHabnauti(PlayerName(arg0));
			format(var7, 256, "Identidade de: %s", PlayerName(arg0));
			SendClientMessage(var9, 0xFFFF00AA, var7);
			format(var7, 256, "Skin: %d", udb_getSkin(PlayerName(arg0)));
			SendClientMessage(var9, 0xFFFF00AA, var7);
			if(!var10[0])
			{
				SendClientMessage(var9, 0xFFFF00AA, "Habilitação de Carros e Motos: NÂO");
			}
			if(var10[0] == 1)
			{
				SendClientMessage(var9, 0xFFFF00AA, "Habilitação de Carros e Motos: SIM");
			}
			if(!var10[1])
			{
				SendClientMessage(var9, 0xFFFF00AA, "Habilitação Náutica: NÂO");
			}
			if(var10[1] == 1)
			{
				SendClientMessage(var9, 0xFFFF00AA, "Habilitação Náutica: SIM");
			}
			if(!var10[2])
			{
				SendClientMessage(var9, 0xFFFF00AA, "Habilitação Aérea: NÂO");
			}
			if(var10[2] == 1)
			{
				SendClientMessage(var9, 0xFFFF00AA, "Habilitação Aérea: SIM");
			}
			format(var7, 256, "Documentos mostrados para %s.", PlayerName(var9));
			SendClientMessage(arg0, 0xFFFF00AA, var7);
			return 1;
		}
		SendClientMessage(arg0, 0xAA3333AA, "esse jogador nao existe");
		return 1;
	}
	if(!strcmp(var1, "/sethaero", true))
	{
		if(glob11C4[arg0] == 15 || IsPlayerAdmin(arg0))
		{
			new var7[256];
			new var8 = 0;
			var7 = function13BC(arg1, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(arg0, 0x33AA33AA, "Habilitação de direção aerea concedida.");
				return 1;
			}
			var8 = strval(var7);
			if(IsPlayerConnected(var8))
			{
				udb_setHabaerea(PlayerName(var8), 1);
				SendClientMessage(arg0, 0x33AA33AA, "Habilitação de direção aerea concedida.");
				SendClientMessage(var8, 0x33AA33AA, "Você recebeu a habilitação de direção aerea.");
				return 1;
			}
			SendClientMessage(arg0, 0xAA3333AA, "ID inválido");
			return 1;
			return 1;
		}
		if(15 != glob11C4[arg0])
		{
			SendClientMessage(arg0, 0xAA3333AA, "Você não tem level o suficiente.");
			return 1;
		}
		return 1;
	}
	if(!strcmp(var1, "/sethterrestre", true))
	{
		if(glob11C4[arg0] == 15 || IsPlayerAdmin(arg0))
		{
			new var7[256];
			new var8 = 0;
			var7 = function13BC(arg1, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(arg0, 0x33AA33AA, "Habilitação de direção terrestre concedida.");
				return 1;
			}
			var8 = strval(var7);
			if(IsPlayerConnected(var8))
			{
				udb_setHabterre(PlayerName(var8), 1);
				SendClientMessage(arg0, 0x33AA33AA, "Habilitação de direção terrestre concedida.");
				SendClientMessage(var8, 0x33AA33AA, "Você recebeu a habilitação de direção de carros e motos.");
				return 1;
			}
			SendClientMessage(arg0, 0xAA3333AA, "ID inválido");
			return 1;
			return 1;
		}
		if(15 != glob11C4[arg0])
		{
			SendClientMessage(arg0, 0xAA3333AA, "Você não tem level o suficiente.");
			return 1;
		}
		return 1;
	}
	if(!strcmp(var1, "/sethnautica", true))
	{
		if(glob11C4[arg0] == 15 || IsPlayerAdmin(arg0))
		{
			new var7[256];
			new var8 = 0;
			var7 = function13BC(arg1, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(arg0, 0x33AA33AA, "Habilitação de direção náutica concedida.");
				return 1;
			}
			var8 = strval(var7);
			if(IsPlayerConnected(var8))
			{
				udb_setHabnauti(PlayerName(var8), 1);
				SendClientMessage(arg0, 0x33AA33AA, "Habilitação de direção náutica concedida.");
				SendClientMessage(var8, 0x33AA33AA, "Você recebeu a habilitação de direção náutica.");
				return 1;
			}
			SendClientMessage(arg0, 0xAA3333AA, "ID inválido");
			return 1;
			return 1;
		}
		if(15 != glob11C4[arg0])
		{
			SendClientMessage(arg0, 0xAA3333AA, "Você não tem level o suficiente.");
			return 1;
		}
		return 1;
	}
	if(!strcmp(var1, "/bust", true))
	{
		if(glob11C4[arg0] == 10 || glob11C4[arg0] == 11 || glob11C4[arg0] == 12 || IsPlayerAdmin(arg0) == 1)
		{
			new var7[256];
			new var8 = 0;
			new var9 = 0;
			var9 = GetDistanceBetweenPlayers(arg0, var8);
			var7 = function13BC(arg1, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(arg0, 0xAA3333AA, "/bust [id]");
				return 1;
			}
			var8 = strval(var7);
			if(IsPlayerConnected(var8) && glob9F4[var8] == 1)
			{
				if(var9 > 20)
				{
					SendClientMessage(arg0, 0xAA3333AA, "Você está muito longe, chegue mais perto!");
					return 1;
				}
				if(var9 <= 20)
				{
					udb_setPrisao(PlayerName(var8), 1);
					LogarPlayer(var8);
					SendClientMessage(var8, 0x33AA33AA, "Você foi preso!");
					SendClientMessage(arg0, 0x33AA33AA, "Prisão concluida");
					return 1;
				}
				return 1;
			}
			SendClientMessage(arg0, 0xAA3333AA, "Jogador não está conectado/logado");
			return 1;
			return 1;
		}
		if(10 != glob11C4[arg0] || 11 != glob11C4[arg0] || 12 != glob11C4[arg0])
		{
			SendClientMessage(arg0, 0xAA3333AA, "Você não é policial");
			return 1;
		}
		if(glob11C4[arg0] == 20)
		{
			new var7[256];
			new var8 = 0;
			new var9 = 0;
			var9 = GetDistanceBetweenPlayers(arg0, var8);
			var7 = function13BC(arg1, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(arg0, 0xAA3333AA, "/bust [id]");
				return 1;
			}
			var8 = strval(var7);
			if(IsPlayerConnected(var8) && glob9F4[var8] == 1)
			{
				if(var9 > 20)
				{
					SendClientMessage(arg0, 0xAA3333AA, "Você está muito longe, chegue mais perto!");
					return 1;
				}
				if(var9 <= 20)
				{
					if(glob11C4[var8] == 21 || glob11C4[var8] == 5)
					{
						udb_setPrisao(PlayerName(var8), 1);
						LogarPlayer(var8);
						SendClientMessage(var8, 0x33AA33AA, "Você foi preso!");
						SendClientMessage(arg0, 0x33AA33AA, "Prisão concluida");
						return 1;
					}
					SendClientMessage(arg0, 0xAA3333AA, "Esta pessoa não é um assasino ou um traficante!");
					return 1;
					return 1;
				}
				return 1;
			}
			SendClientMessage(arg0, 0xAA3333AA, "Jogador não está conectado/logado");
			return 1;
			return 1;
		}
		return 1;
	}
	if(!strcmp(var1, "/fianca", true))
	{
		glob1034[arg0] = 0;
		udb_setPrisao(PlayerName(arg0), 0);
		new var7[255];
		for(new var8 = 0; glob878[54] > var8; var8++)
		{
			if(glob878[var8] == arg0)
			{
				glob878[54]--;
				format(var7, 255, "%s saiu da Prisão.", PlayerName(arg0));
				for(new var9 = 0; var9 < 29; var9++)
				{
					if(var9 >= arg0)
					{
						glob878[var9] = glob878[var9 + 1];
					}
					if(IsPlayerConnected(glob878[var9]) && glob878[var9] != arg0)
					{
						SendClientMessage(glob878[var9], 0x33AA33AA, var7);
					}
				}
				glob878[53] = 255;
			}
		}
		LogarPlayer(arg0);
		SendClientMessage(arg0, 0x33AA33AA, "Você pagou a fiança no valor de $1500 e foi solto.");
		udb_setBankMoney(PlayerName(arg0), udb_getBankMoney(PlayerName(arg0)) - 1500);
		return 1;
	}
	if(!strcmp(var1, "/unbust", true))
	{
		if(glob11C4[arg0] == 7 || glob11C4[arg0] == 12 || IsPlayerAdmin(arg0))
		{
			new var7[256];
			new var8 = 0;
			var7 = function13BC(arg1, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(arg0, 0xAA3333AA, "/unbust [id]");
				return 1;
			}
			var8 = strval(var7);
			if(IsPlayerConnected(var8) && glob9F4[arg0] == 1)
			{
				udb_setPrisao(PlayerName(var8), 0);
				glob1034[var8] = 0;
				new var9[255];
				for(new var10 = 0; glob878[54] > var10; var10++)
				{
					if(glob878[var10] == var8)
					{
						glob878[54]--;
						format(var9, 255, "%s saiu da Prisão.", PlayerName(var8));
						for(new var11 = 0; var11 < 29; var11++)
						{
							if(var11 >= var10)
							{
								glob878[var11] = glob878[var11 + 1];
							}
							if(IsPlayerConnected(glob878[var11]) && glob878[var11] != var8)
							{
								SendClientMessage(glob878[var11], 0x33AA33AA, var9);
							}
						}
						glob878[53] = 255;
					}
				}
				LogarPlayer(var8);
				SendClientMessage(var8, 0x33AA33AA, "Algum juiz te soltou.");
				SendClientMessage(arg0, 0x33AA33AA, "Solto.");
				return 1;
			}
			SendClientMessage(arg0, 0xAA3333AA, "Jogador não está conectado/logado");
			return 1;
			return 1;
		}
		if(7 != glob11C4[arg0] || 12 != glob11C4[arg0])
		{
			SendClientMessage(arg0, 0xAA3333AA, "Você não é policial");
			return 1;
		}
		return 1;
	}
	if(!strcmp(var1, "/setlevel", true) && IsPlayerAdmin(arg0))
	{
		new var7[256];
		new var8 = 0;
		new var9 = 0;
		var7 = function13BC(arg1, var4, 32);
		if(!strlen(var7))
		{
			SendClientMessage(arg0, 0xAA3333AA, "/setlevel [id] [prof]");
			return 1;
		}
		var8 = strval(var7);
		var7 = function13BC(arg1, var4, 32);
		if(!strlen(var7))
		{
			SendClientMessage(arg0, 0xAA3333AA, "/setlevel [id] [prof]");
			return 1;
		}
		var9 = strval(var7);
		if(IsPlayerConnected(var8))
		{
			if(var9 >= 1 && var9 < 22)
			{
				udb_setProf(PlayerName(var8), var9);
				SendClientMessage(arg0, 0x33AA33AA, "Profissão Setada.");
				SendClientMessage(var8, 0x33AA33AA, "Você mudou de profissão, digite /profissao para saber os comandos dela!");
				glob11C4[var8] = var9;
				LogarPlayer(var8);
				if(var9 == 1)
				{
					SetPlayerColor(var8, 0x66666600);
					return 1;
				}
				if(var9 == 2)
				{
					SetPlayerColor(arg0, 0xFFFF0000);
					return 1;
				}
				if(var9 == 3)
				{
					SetPlayerColor(var8, 0x00990000);
					return 1;
				}
				if(var9 == 4)
				{
					SetPlayerColor(var8, 0xDEB88700);
					return 1;
				}
				if(var9 == 5)
				{
					SetPlayerColor(var8, 0xAA333300);
					return 1;
				}
				if(var9 == 6)
				{
					SetPlayerColor(var8, 0xF0808000);
					return 1;
				}
				if(var9 == 7)
				{
					SetPlayerColor(var8, 0x7FFF0000);
					return 1;
				}
				if(var9 == 8)
				{
					SetPlayerColor(var8, 0xADD8E600);
					return 1;
				}
				if(var9 == 9)
				{
					SetPlayerColor(var8, 0xFF990000);
					return 1;
				}
				if(var9 == 10)
				{
					SetPlayerColor(var8, 0x0000FF00);
					return 1;
				}
				if(var9 == 11)
				{
					SetPlayerColor(var8, 0x6495ED00);
					return 1;
				}
				if(var9 == 12)
				{
					SetPlayerColor(var8, 0x00FFFF00);
					return 1;
				}
				if(var9 == 13)
				{
					SetPlayerColor(var8, 0x00008B00);
					return 1;
				}
				if(var9 == 14)
				{
					SetPlayerColor(var8, 0xE9967A00);
					return 1;
				}
				if(var9 == 15)
				{
					SetPlayerColor(var8, 0xDD000000);
					return 1;
				}
				if(var9 == 16)
				{
					SetPlayerColor(var8, 0x8B008B00);
					return 1;
				}
				if(var9 == 17)
				{
					SetPlayerColor(var8, 0xF5F5DC00);
					return 1;
				}
				if(var9 == 18)
				{
					SetPlayerColor(var8, 0xCCD2C600);
					return 1;
				}
				if(var9 == 19)
				{
					SetPlayerColor(var8, 0xFF66FF00);
					return 1;
				}
				if(var9 == 20)
				{
					SetPlayerColor(var8, 0xF0F8FF00);
					return 1;
				}
				if(var9 == 21)
				{
					SetPlayerColor(var8, 0x80800000);
					return 1;
				}
				return 1;
			}
			SendClientMessage(arg0, 0xAA3333AA, "Essa não é uma profisssão válida!");
			return 1;
			return 1;
		}
		SendClientMessage(arg0, 0xAA3333AA, "Jogador não está conectado/logado");
		return 1;
		return 1;
	}
	if(!strcmp(var1, "/pt", true))
	{
		new var7[256];
		new var8[256];
		strmid(var7, arg1, 3, strlen(arg1), 256);
		if(!strlen(var7))
		{
			SendClientMessage(arg0, 0xAA3333AA, "/pt [texto]");
			return 1;
		}
		for(new var9 = 0; var9 < 100; var9++)
		{
			if(glob11C4[var9] == glob11C4[arg0])
			{
				format(var8, 256, "%s: %s", PlayerName(arg0), var7);
				SendClientMessage(var9, GetPlayerColor(arg0), var8);
				SendClientMessage(arg0, GetPlayerColor(arg0), var8);
				return 1;
			}
		}
		return 1;
		return 1;
	}
	if(!strcmp(arg1, "/profissao", true))
	{
		if(glob11C4[arg0] == 2)
		{
			SendClientMessage(arg0, 0x33AA33AA, "Comandos dos TAXISTAS");
			SendClientMessage(arg0, 0xFFFF00AA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(arg0, 0xFFFF00AA, "/staxi [id] : Começa a rodar o taxímetro (o passageiro tem que estar no seu carro).");
		}
		else if(glob11C4[arg0] == 3)
		{
			SendClientMessage(arg0, 0x33AA33AA, "Comandos dos VENDEDORES DE CARROS");
			SendClientMessage(arg0, 0xFFFF00AA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(arg0, 0xFFFF00AA, "/setcar [id-do-carro] [rotação] [nick-lugar] [cor1] [cor2] : Vende um carro (esteja com ele na posição de spawn).");
			SendClientMessage(arg0, 0xFFFF00AA, "/setskin [id-da-pessoa] [id-do-skin] : Vende um skin para alguma pessoa.");
		}
		else if(glob11C4[arg0] == 4)
		{
			SendClientMessage(arg0, 0x33AA33AA, "Comandos dos CORRETORES");
			SendClientMessage(arg0, 0xFFFF00AA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(arg0, 0xFFFF00AA, "/sethome [nick] : Seta a casa para alguem, (esteja na posiçao exterior à casa).");
		}
		else if(glob11C4[arg0] == 6)
		{
			SendClientMessage(arg0, 0x33AA33AA, "Comandos dos BARMAN'S");
			SendClientMessage(arg0, 0xFFFF00AA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(arg0, 0xFFFF00AA, "/selldrink [id] [teor] : Vende uma bebida alcoolica e adiciona o teor de alcool no sangue da pessoa");
		}
		else if(glob11C4[arg0] == 7)
		{
			SendClientMessage(arg0, 0x33AA33AA, "Comandos dos JUÍZES");
			SendClientMessage(arg0, 0xFFFF00AA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(arg0, 0xFFFF00AA, "/bust [id] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(arg0, 0xFFFF00AA, "/unbust [id] : Solta uma pessoa da cadeia.");
		}
		else if(glob11C4[arg0] == 10 || glob11C4[arg0] == 11)
		{
			SendClientMessage(arg0, 0x33AA33AA, "Comandos dos COPS CIVÍS e RODOVIARIOS");
			SendClientMessage(arg0, 0xFFFF00AA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(arg0, 0xFFFF00AA, "/bust [id] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(arg0, 0xFFFF00AA, "/bafometro [id] : Vê o teor de alcool no sangue de alguém");
			SendClientMessage(arg0, 0xFFFF00AA, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(arg0, 0xFFFF00AA, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
			SendClientMessage(arg0, 0xFFFF00AA, "/multar [id] [amount] : Multar uma pessoa.");
		}
		else if(glob11C4[arg0] == 12)
		{
			SendClientMessage(arg0, 0x33AA33AA, "Comandos dos COPS ELITES");
			SendClientMessage(arg0, 0xFFFF00AA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(arg0, 0xFFFF00AA, "/bust [id] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(arg0, 0xFFFF00AA, "/unbust [id] : Solta uma pessoa da cadeia.");
			SendClientMessage(arg0, 0xFFFF00AA, "/bafometro [id] : Vê o teor de alcool no sangue de alguém");
			SendClientMessage(arg0, 0xFFFF00AA, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(arg0, 0xFFFF00AA, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
			SendClientMessage(arg0, 0xFFFF00AA, "/multar [id] [amount] : Multar uma pessoa.");
		}
		else if(glob11C4[arg0] == 13)
		{
			SendClientMessage(arg0, 0x33AA33AA, "Comandos do CONTROLADORES AEREOS");
			SendClientMessage(arg0, 0xFFFF00AA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(arg0, 0xFFFF00AA, "/amultar [id] [quantia] : Multa uma pessoa por voar sem autorização.");
		}
		else if(glob11C4[arg0] == 15)
		{
			SendClientMessage(arg0, 0x33AA33AA, "Comandos dos INSTRUTORES");
			SendClientMessage(arg0, 0xFFFF00AA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(arg0, 0xFFFF00AA, "/sethaero : Habilita uma pessoa a dirigir veículos aereos (aviões e helicopteros).");
			SendClientMessage(arg0, 0xFFFF00AA, "/sethterrestre : Habilita uma pessoa a dirigir veículos terrestres (carros e motos).");
			SendClientMessage(arg0, 0xFFFF00AA, "/sethnautica : Habilita uma pessoa a dirigir veículos nauticos (barcos).");
		}
		else if(glob11C4[arg0] == 16)
		{
			SendClientMessage(arg0, 0x33AA33AA, "Comandos dos JORNALISTAS");
			SendClientMessage(arg0, 0xFFFF00AA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(arg0, 0xFFFF00AA, "/noticia [texto] : Faz uma Noticia ou Anúncio.");
		}
		else if(glob11C4[arg0] == 18)
		{
			SendClientMessage(arg0, 0x33AA33AA, "Comandos dos CAMINHONEIROS");
			SendClientMessage(arg0, 0xFFFF00AA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(arg0, 0xFFFF00AA, "/carregar: Carrega o caminhão se você estiver na area de carga.");
			SendClientMessage(arg0, 0xFFFF00AA, "/descarregar: Descarrega o caminhão se você estiver na area de descarga.");
		}
		else if(glob11C4[arg0] == 5)
		{
			SendClientMessage(arg0, 0x33AA33AA, "Comandos dos ASSASSINOS");
			SendClientMessage(arg0, 0xFFFF00AA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(arg0, 0xFFFF00AA, "/sequestrar [id] : Sequestra uma pessoa se ela naum pagar para fugir!");
		}
		else if(glob11C4[arg0] == 19)
		{
			SendClientMessage(arg0, 0x33AA33AA, "Comandos dos VENDEDORES DE SEGURO");
			SendClientMessage(arg0, 0xFFFF00AA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(arg0, 0xFFFF00AA, "/seguros [id] [quantidade]: Vende seguros de vida para uma pessoa não pagar 250 quando morrer.");
			SendClientMessage(arg0, 0xFFFF00AA, "/consultar [id] : Consulta a quantidade de seguros que a pessoa tem.");
		}
		else if(glob11C4[arg0] == 14)
		{
			SendClientMessage(arg0, 0x33AA33AA, "Comandos dos PESCADORES");
			SendClientMessage(arg0, 0xFFFF00AA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(arg0, 0xFFFF00AA, "/pescar: Joga a rede para pescar. OBS: Você tem que estar na AREA DE PESCA!");
			SendClientMessage(arg0, 0xFFFF00AA, "/vender [quantia] : Vende um certo numero de pescas. OBS: Você tem que estar na COOPERATIVA DE PESCA!");
		}
		else if(glob11C4[arg0] == 20)
		{
			SendClientMessage(arg0, 0x33AA33AA, "Comandos da NARCOTICOS");
			SendClientMessage(arg0, 0xFFFF00AA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(arg0, 0xFFFF00AA, "/mdrogas [id] : Mede a quantidade de drogas no sangue de uma pessoa.");
			SendClientMessage(arg0, 0xFFFF00AA, "/bust [id] : Prende uma pessoa se ela for drogada, traficante ou assasino!");
		}
		else if(glob11C4[arg0] == 21)
		{
			SendClientMessage(arg0, 0x33AA33AA, "Comandos dos TRAFICANTES");
			SendClientMessage(arg0, 0xFFFF00AA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(arg0, 0xFFFF00AA, "/vdrogas [id] [quantia] : Vende uma quantidade de drogas para uma pessoa.");
		}
		else
		{
			SendClientMessage(arg0, 0x33AA33AA, "Comandos de sua profissão");
			SendClientMessage(arg0, 0xFFFF00AA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(arg0, 0x33AA33AA, "Sua profissão não tem nenhum comando especial!");
		}
		return 1;
	}
	if(!strcmp(var1, "/presos", true))
	{
		new var7[255], var8 = 0;
		format(var7, 255, "Cadeia: '%s' (id: %d):", "Cadeia de San Fierro", 1);
		SendClientMessage(arg0, 0xFFFF00AA, var7);
		var7[0] = 0;
		for(new var9 = 0; glob878[54] > var9; var9++)
		{
			format(var7, 255, "%s%s (id: %d)", var7, PlayerName(var9 < glob878[var9]), 2168);
			if(!var9)
			{
				format(var7, 255, "%s", var7);
			}
			var8++;
			if(var8 > 3)
			{
				SendClientMessage(arg0, 0xFFFF00AA, var7);
				var8 = 0;
				var7[0] = 0;
			}
			else
			{
				format(var7, 255, "%s, ", var7);
			}
		}
		if(var8 > 0 && var8 <= 3)
		{
			var7[strlen(var7) - 2] = 46;
			SendClientMessage(arg0, 0xFFFF00AA, var7);
		}
		format(var7, 255, "Vagas na cadeia: %d", 30 - glob878[54]);
		SendClientMessage(arg0, 0xFFFF00AA, var7);
		return 1;
	}
	if(!strcmp(var1, "/procurar", true))
	{
		if(glob11C4[arg0] == 10 || glob11C4[arg0] == 11 || glob11C4[arg0] == 12 || IsPlayerAdmin(arg0))
		{
			new var7[256];
			new var8 = 0, var9[255];
			new var10 = 0;
			var7 = function13BC(arg1, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(arg0, 0xFFFFFFAA, "/procurar [ID]");
				return 1;
			}
			var10 = strval(var7);
			if(IsPlayerConnected(var10) && glob9F4[arg0] == 1)
			{
				glob1354[var10] = 1;
				if(15 >= glob954[39])
				{
					format(var9, 255, "%s também está sendo procurado!", PlayerName(var10));
					for(var8 = 0; glob954[24] > var8; var8++)
					{
						if(IsPlayerConnected(glob954[var8]) == 1 && glob954[var8] != var10)
						{
							SendClientMessage(glob954[var8], 0x33AA33AA, var9);
						}
					}
					glob954[var8] = var10;
					glob954[39]++;
				}
				if(15 < glob954[39])
				{
					SendClientMessage(arg0, 0xAA3333AA, "Desculpe, a Lista  de Procuardos de San Fierro está cheia!");
					return 1;
				}
				format(var9, 255, "%s está sendo procurado! Prenda-o!", PlayerName(var10));
				SendClientMessage(arg0, 0x33AA33AA, var9);
				if(glob11C4[var10] == 1)
				{
					SetPlayerColor(var10, 0x666666AA);
				}
				if(glob11C4[var10] == 15)
				{
					SetPlayerColor(var10, 0xDD0000AA);
				}
				if(glob11C4[var10] == 2)
				{
					SetPlayerColor(var10, 0xFFFF00AA);
				}
				if(glob11C4[var10] == 10)
				{
					SetPlayerColor(var10, 0x0000FFAA);
				}
				if(glob11C4[var10] == 12)
				{
					SetPlayerColor(var10, 0x00FFFFAA);
				}
				if(glob11C4[var10] == 3)
				{
					SetPlayerColor(var10, 0x009900AA);
				}
				if(glob11C4[var10] == 11)
				{
					SetPlayerColor(var10, 0x6495EDAA);
				}
				if(glob11C4[var10] == 8)
				{
					SetPlayerColor(var10, 0xADD8E6AA);
				}
				if(glob11C4[var10] == 6)
				{
					SetPlayerColor(var10, 0xF08080AA);
				}
				if(glob11C4[var10] == 4)
				{
					SetPlayerColor(var10, 0xDEB887AA);
				}
				if(glob11C4[var10] == 14)
				{
					SetPlayerColor(var10, 0xE9967AAA);
				}
				if(glob11C4[var10] == 9)
				{
					SetPlayerColor(var10, 0xFF9900AA);
				}
				if(glob11C4[var10] == 17)
				{
					SetPlayerColor(var10, 0xF5F5DCAA);
				}
				if(glob11C4[var10] == 7)
				{
					SetPlayerColor(var10, 0x7FFF00AA);
				}
				if(glob11C4[var10] == 13)
				{
					SetPlayerColor(var10, 0x00008BAA);
				}
				if(glob11C4[var10] == 16)
				{
					SetPlayerColor(var10, 0x8B008BAA);
				}
				if(glob11C4[var10] == 18)
				{
					SetPlayerColor(var10, 0xCCD2C6AA);
				}
				if(glob11C4[var10] == 19)
				{
					SetPlayerColor(var10, 0xFF66FFAA);
				}
				if(glob11C4[var10] == 20)
				{
					SetPlayerColor(var10, 0xF0F8FFAA);
				}
				if(glob11C4[var10] == 21)
				{
					SetPlayerColor(var10, 0x808000AA);
				}
				format(var9, 255, "Você está sendo perseguido! Você foi colocado na lista por: %s", PlayerName(arg0));
				SendClientMessage(var10, 0x33AA33AA, var9);
				return 1;
			}
			SendClientMessage(arg0, 0xFFFFFFAA, "/procurar [ID].");
			return 1;
			return 1;
		}
		if(10 != glob11C4[arg0] || 11 != glob11C4[arg0] || 12 != glob11C4[arg0] || IsPlayerAdmin(arg0))
		{
			SendClientMessage(arg0, 0xAA3333AA, "Você não é policial");
			return 1;
		}
		return 1;
	}
	if(!strcmp(var1, "/desprocurar", true))
	{
		if(glob11C4[arg0] == 10 || glob11C4[arg0] == 11 || glob11C4[arg0] == 12 || IsPlayerAdmin(arg0))
		{
			new var7[256];
			new var8 = 0;
			var7 = function13BC(arg1, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(arg0, 0xFFFFFFAA, "/desprocurar [ID].");
				return 1;
			}
			var8 = strval(var7);
			if(IsPlayerConnected(var8) && glob9F4[arg0] == 1)
			{
				glob1354[var8] = 0;
				LogarPlayer(var8);
				new var9[255];
				for(new var10 = 0; glob954[39] > var10; var10++)
				{
					if(glob954[var10] == var8)
					{
						glob954[39]--;
						format(var9, 255, "%s saiu da Lista de Procurados.", PlayerName(var8));
						for(new var11 = 0; glob954[24] - 1 > var11; var11++)
						{
							if(var11 >= var10)
							{
								glob954[var11] = glob954[var11 + 1];
							}
							if(IsPlayerConnected(glob954[var11]) && glob954[var11] != var8)
							{
								SendClientMessage(glob954[var11], 0x33AA33AA, var9);
							}
						}
						glob954[38] = 255;
					}
				}
				SendClientMessage(arg0, 0x33AA33AA, "Excluido da lista com suscesso.");
				SendClientMessage(var8, 0x33AA33AA, "Você foi retirado da lista de procurados");
				return 1;
			}
			SendClientMessage(arg0, 0xFFFFFFAA, "/desprocurar [id].");
			return 1;
			return 1;
		}
		if(10 != glob11C4[arg0] || 11 != glob11C4[arg0] || 12 != glob11C4[arg0] || IsPlayerAdmin(arg0))
		{
			SendClientMessage(arg0, 0xAA3333AA, "Você não é policial");
			return 1;
		}
		return 1;
	}
	if(!strcmp(var1, "/procurados", true))
	{
		new var7[255], var8 = 0;
		format(var7, 255, "Procurados: '%s' (id: %d):", "de San Fierro", 1);
		SendClientMessage(arg0, 0xFFFF00AA, var7);
		var7[0] = 0;
		for(new var9 = 0; glob954[39] > var9; var9++)
		{
			format(var7, 255, "%s%s (id: %d)", var7, PlayerName(var9 < glob954[var9]), 2388);
			if(!var9)
			{
				format(var7, 255, "%s", var7);
			}
			var8++;
			if(var8 > 3)
			{
				SendClientMessage(arg0, 0xFFFF00AA, var7);
				var8 = 0;
				var7[0] = 0;
			}
			else
			{
				format(var7, 255, "%s, ", var7);
			}
		}
		if(var8 > 0 && var8 <= 3)
		{
			var7[strlen(var7) - 2] = 46;
			SendClientMessage(arg0, 0xFFFF00AA, var7);
		}
		format(var7, 255, "Vagas na Lista: %d", 15 - glob954[39]);
		SendClientMessage(arg0, 0xFFFF00AA, var7);
		return 1;
	}
	if(!strcmp(var1, "/say", true))
	{
		new var7[256];
		new var8[256];
		strmid(var7, arg1, 4, strlen(arg1), 256);
		if(!strlen(var7))
		{
			SendClientMessage(arg0, 0xAA3333AA, "/say [texto]");
			return 1;
		}
		for(new var9 = 0; var9 < 100; var9++)
		{
			if(20 >= GetDistanceBetweenPlayers(arg0, var9))
			{
				format(var8, 256, "%s: %s", PlayerName(arg0), var7);
				SendClientMessage(var9, 0xAFAFAFAA, var8);
				SendClientMessage(arg0, 0xAFAFAFAA, var8);
				return 1;
			}
		}
		return 1;
		return 1;
	}
	if(!strcmp(var1, "/noticia", true))
	{
		if(glob11C4[arg0] == 16 || IsPlayerAdmin(arg0))
		{
			new var7[256];
			new var8[256];
			strmid(var7, arg1, 8, strlen(arg1), 256);
			if(!strlen(var7))
			{
				SendClientMessage(arg0, 0xAA3333AA, "/noticia [texto]");
				return 1;
			}
			if(glob9F4[arg0] == 1)
			{
				format(var8, 256, "..: SFNEWS: %s envia: %s :..", PlayerName(arg0), var7);
				SendClientMessageToAll(0xFFFF00AA, var8);
				SendClientMessage(arg0, 0x33AA33AA, "Enviada");
				return 1;
			}
			return 1;
		}
		if(16 != glob11C4[arg0])
		{
			SendClientMessage(arg0, 0xAA3333AA, "Você não é Reporter");
			return 1;
		}
	}
	if(!strcmp(var1, "/multar", true))
	{
		if(glob11C4[arg0] == 10 || glob11C4[arg0] == 11 || glob11C4[arg0] == 12 || IsPlayerAdmin(arg0))
		{
			new var7[256];
			new var8 = 0;
			new var9 = 0;
			var7 = function13BC(arg1, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(arg0, 0xAA3333AA, "/multar [id] [quantidade]");
				return 1;
			}
			var8 = strval(var7);
			var7 = function13BC(arg1, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(arg0, 0xAA3333AA, "/multar [id] [quantidade]");
				return 1;
			}
			var9 = strval(var7);
			if(var9 > 1000 && var9 <= 0)
			{
				SendClientMessage(arg0, 0xAA3333AA, "Você não está querendo multar de forma justa.");
				return 1;
			}
			if(IsPlayerConnected(var8) && glob9F4[arg0] == 1)
			{
				SendClientMessage(arg0, 0x33AA33AA, "Multa dada.");
				SendClientMessage(var8, 0x33AA33AA, "Você recebeu uma multa! O dinheiro foi retirado do banco.");
				udb_setBankMoney(PlayerName(var8), udb_getBankMoney(PlayerName(var8)) - var9);
				return 1;
			}
			SendClientMessage(arg0, 0xAA3333AA, "O jogador não está conectado!");
			return 1;
			return 1;
		}
		if(10 != glob11C4[arg0] || 11 != glob11C4[arg0] || 12 != glob11C4[arg0])
		{
			SendClientMessage(arg0, 0xAA3333AA, "Você não é policial");
			return 1;
		}
		return 1;
	}
	if(!strcmp(var1, "/amultar", true))
	{
		if(glob11C4[arg0] == 13 || IsPlayerAdmin(arg0))
		{
			new var7[256];
			new var8 = 0;
			new var9 = 0;
			var7 = function13BC(arg1, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(arg0, 0xAA3333AA, "/amultar [id] [quantidade]");
				return 1;
			}
			var8 = strval(var7);
			var7 = function13BC(arg1, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(arg0, 0xAA3333AA, "/amultar [id] [quantidade]");
				return 1;
			}
			var9 = strval(var7);
			if(var9 > 2000 && var9 <= 0)
			{
				SendClientMessage(arg0, 0xAA3333AA, "Você não está querendo multar de forma justa.");
				return 1;
			}
			if(IsPlayerConnected(var8))
			{
				SendClientMessage(arg0, 0x33AA33AA, "Multa dada.");
				SendClientMessage(var8, 0x33AA33AA, "Você recebeu uma multa por voar ilegalmente! O dinheiro foi retirado do banco.");
				udb_setBankMoney(PlayerName(var8), udb_getBankMoney(PlayerName(var8)) - var9);
				return 1;
			}
			SendClientMessage(arg0, 0xAA3333AA, "O jogador não está conectado!");
			return 1;
			return 1;
		}
		if(13 != glob11C4[arg0] || IsPlayerAdmin(arg0))
		{
			SendClientMessage(arg0, 0xAA3333AA, "Você não é Controlador");
			return 1;
		}
		return 1;
	}
	if(!strcmp(var1, "/staxi", true) && IsPlayerConnected(arg0))
	{
		if(glob11C4[arg0] == 2 || IsPlayerAdmin(arg0))
		{
			new var7[256];
			new var8 = 0;
			var7 = function13BC(arg1, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(arg0, 0xAA3333AA, "/staxi [id]");
				return 1;
			}
			var8 = strval(var7);
			if(GetPlayerVehicleID(arg0) == GetPlayerVehicleID(var8) && GetPlayerState(arg0) == 2)
			{
				SendClientMessage(arg0, 0x33AA33AA, "O taxímetro começou a rodar");
				SendClientMessage(var8, 0x33AA33AA, "O taxímetro começou a rodar");
				glob14E4[var8][0] = 1;
				glob14E4[var8][1] = arg0;
				return 1;
			}
			SendClientMessage(arg0, 0xAA3333AA, "O passageiro não está dentro do seu carro ou você não é o motorista.");
			return 1;
			return 1;
		}
		if(2 != glob11C4[arg0])
		{
			SendClientMessage(arg0, 0xAA3333AA, "Você não tem level o suficiente.");
			return 1;
		}
		return 1;
	}
	if(!strcmp(var1, "/setcar", true))
	{
		if(glob11C4[arg0] == 3 || IsPlayerAdmin(arg0))
		{
			new var7[256];
			new var8 = 0, var9 = 0, var10[256], var11 = 0, var12 = 0;
			var7 = function13BC(arg1, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(arg0, 0xAA3333AA, "ID fora do normal | ID's = 400-611");
				return 1;
			}
			var8 = strval(var7);
			var7 = function13BC(arg1, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(arg0, 0xAA3333AA, "/setcar [id] [rotação] [nick] [cor1] [cor2]");
				return 1;
			}
			var9 = strval(var7);
			var7 = function13BC(arg1, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(arg0, 0xAA3333AA, "/setcar [id] [rotação] [nick] [cor1] [cor2]");
				return 1;
			}
			set(var10, var7);
			var7 = function13BC(arg1, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(arg0, 0xAA3333AA, "/setcar [id] [rotação] [nick] [cor1] [cor2]");
				return 1;
			}
			var11 = strval(var7);
			var7 = function13BC(arg1, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(arg0, 0xAA3333AA, "/setcar [id] [rotação] [nick] [cor1] [cor2]");
				return 1;
			}
			var12 = strval(var7);
			if(var8 >= 400 && var8 <= 611)
			{
				if(IsPlayerInAnyVehicle(arg0))
				{
					new var13[256];
					new File:var14 = 0;
					new Float:var15 = 0.0, Float:var16 = 0.0, Float:var17 = 0.0;
					GetPlayerPos(arg0, var15, var16, var17);
					format(var13, 256, "%d %f %f %f %f %d %d //%s\r\n", var8, var15, var16, var17, var9, var11, var12, var10);
					var14 = fopen("rcars.ini", 3);
					fwrite(var14, var13);
					fclose(var14);
					SendClientMessage(arg0, 0x33AA33AA, "Carro salvo");
					return 1;
				}
				SendClientMessage(arg0, 0xAA3333AA, "Você não está em nenhum veículo e assim e assim não pode setar um carro.");
				return 1;
				return 1;
			}
			SendClientMessage(arg0, 0xAA3333AA, "ID fora do normal | ID's = 400-611");
			return 1;
			return 1;
		}
		if(3 != glob11C4[arg0])
		{
			SendClientMessage(arg0, 0xAA3333AA, "Você não tem permissão para isso");
			return 1;
		}
		return 1;
	}
	if(!strcmp(var1, "/relogio", true))
	{
		new var7[256];
		format(var7, 256, "São %d:00 horas na região de SF", 6948);
		SendClientMessage(arg0, 0x33AA33AA, var7);
		return 1;
	}
	if(!strcmp(var1, "/selldrink", true))
	{
		if(glob11C4[arg0] == 6 || IsPlayerAdmin(arg0))
		{
			new var7[256];
			new var8[256];
			new var9 = 0, var10 = 0;
			var8 = function13BC(arg1, var4, 32);
			if(!strlen(var8))
			{
				SendClientMessage(arg0, 0xAA3333AA, "/selldrink [id] [teor de alcool]");
				return 1;
			}
			var9 = strval(var8);
			var8 = function13BC(arg1, var4, 32);
			if(!strlen(var8))
			{
				SendClientMessage(arg0, 0xAA3333AA, "/selldrink [id] [teor de alcool]");
				return 1;
			}
			var10 = strval(var8);
			if(var10 < 1 || var10 > 11)
			{
				SendClientMessage(arg0, 0xAA3333AA, "Teor alcoolico invalido, Os teores devem ser entre 1 e 10.");
				return 1;
			}
			if(20 >= GetDistanceBetweenPlayers(arg0, var9))
			{
				if(IsPlayerConnected(var9))
				{
					glob1B28[var9] = var10;
					format(var7, 256, "Você bebeu um drink com teor alcoolico: %d", var10);
					SendClientMessage(var9, 0x33AA33AA, var7);
					SendClientMessage(arg0, 0x33AA33AA, "Drink Vendido e tomado");
					return 1;
				}
				SendClientMessage(arg0, 0xAA3333AA, "O jogador não está conectado!");
				return 1;
				return 1;
			}
			SendClientMessage(arg0, 0xAA3333AA, "Você está muito longe, chegue mais perto para entregar a bebida.");
			return 1;
			return 1;
			return 1;
		}
		if(6 != glob11C4[arg0])
		{
			SendClientMessage(arg0, 0xAA3333AA, "Você não tem permissão para isso");
			return 1;
		}
		return 1;
	}
	if(!strcmp(var1, "/vdrogas", true))
	{
		if(glob11C4[arg0] == 21 || IsPlayerAdmin(arg0))
		{
			new var7[256];
			new var8[256];
			new var9 = 0, var10 = 0;
			var8 = function13BC(arg1, var4, 32);
			if(!strlen(var8))
			{
				SendClientMessage(arg0, 0xAA3333AA, "/vdrogas [id] [quantidade]");
				return 1;
			}
			var9 = strval(var8);
			var8 = function13BC(arg1, var4, 32);
			if(!strlen(var8))
			{
				SendClientMessage(arg0, 0xAA3333AA, "/vdrogas [id] [qauntidade]");
				return 1;
			}
			var10 = strval(var8);
			if(var10 < 1 || var10 > 21)
			{
				SendClientMessage(arg0, 0xAA3333AA, "Numero de drogas invalido, O numero deve ser entre 1 e 21.");
				return 1;
			}
			if(20 >= GetDistanceBetweenPlayers(arg0, var9))
			{
				if(IsPlayerConnected(var9))
				{
					glob1CB8[var9] = var10;
					format(var7, 256, "Você tem agora: %d drogas no sangue!", var10);
					SendClientMessage(var9, 0x33AA33AA, var7);
					SendClientMessage(arg0, 0x33AA33AA, "Droga Vendida e Injetada!");
					return 1;
				}
				SendClientMessage(arg0, 0xAA3333AA, "O jogador não está conectado!");
				return 1;
				return 1;
			}
			SendClientMessage(arg0, 0xAA3333AA, "Você está muito longe, chegue mais perto para entregar a droga.");
			return 1;
			return 1;
			return 1;
		}
		if(21 != glob11C4[arg0])
		{
			SendClientMessage(arg0, 0xAA3333AA, "Você não tem permissão para isso");
			return 1;
		}
		return 1;
	}
	if(!strcmp(var1, "/pescar", true))
	{
		new Float:var7 = 0.0, Float:var8 = 0.0, Float:var9 = 0.0;
		if(glob1E48[arg0] == 1)
		{
			SendClientMessage(arg0, 0xAA3333AA, "Você já Jogou a rede, espere ela voltar!");
			return 1;
		}
		if(glob1FD8[arg0] == 1)
		{
			SendClientMessage(arg0, 0xAA3333AA, "Você já Jogou a rede, espere ela voltar!");
			return 1;
		}
		GetPlayerPos(arg0, var7, var8, var9);
		if(function8(var7, -2708.16) && function48(var7, -2299.6001) && function8(var8, 1543.65) && function48(var8, 2209.58))
		{
			if(glob11C4[arg0] == 14 || IsPlayerAdmin(arg0))
			{
				glob1E48[arg0] = 1;
				SendClientMessage(arg0, 0x33AA33AA, "Você Jogou a rede, espere ela voltar em 1 minuto!");
				SetTimer("pescador", 1, false);
				return 1;
			}
			glob1FD8[arg0] = 1;
			SendClientMessage(arg0, 0x33AA33AA, "Você Jogou a rede, espere ela voltar em 5 minutos!");
			SetTimer("outros", 1, false);
			return 1;
		}
		else
		{
			SendClientMessage(arg0, 0xAA3333AA, "Você não está na area de Pesca!");
			return 1;
		}
	}
	if(!strcmp(var1, "/pescas", true))
	{
		new var7[256];
		if(glob9F4[arg0] == 1)
		{
			format(var7, 256, "Você tem %d pescas na conta %d", udb_getPescas(PlayerName(arg0)), arg0);
			SendClientMessage(arg0, 0x33AA33AA, var7);
			return 1;
		}
		return 1;
	}
	if(!strcmp(var1, "/saldo", true) && IsPlayerAdmin(arg0))
	{
		new var7[256];
		new var8[256];
		new var9 = 0;
		var8 = function13BC(arg1, var4, 32);
		if(!strlen(var8))
		{
			SendClientMessage(arg0, 0xAA3333AA, "/saldo [id]");
			return 1;
		}
		var9 = strval(var8);
		if(glob9F4[var9] == 1)
		{
			format(var7, 256, "%s tem $%d na conta %d", PlayerName(var9), udb_getBankMoney(PlayerName(var9)), var9);
			SendClientMessage(arg0, 0x33AA33AA, var7);
			return 1;
		}
		return 1;
	}
	if(!strcmp(var1, "/salarios", true) && IsPlayerAdmin(arg0))
	{
		new var7[256];
		new var8[256];
		new var9 = 0;
		var8 = function13BC(arg1, var4, 32);
		if(!strlen(var8))
		{
			SendClientMessage(arg0, 0xAA3333AA, "/salarios [id]");
			return 1;
		}
		var9 = strval(var8);
		if(glob9F4[var9] == 1)
		{
			format(var7, 256, "%s recebeu %d salários até agora!", PlayerName(var9), udb_getSalarios(PlayerName(var9)));
			SendClientMessage(arg0, 0x33AA33AA, var7);
			return 1;
		}
		return 1;
	}
	if(!strcmp(var1, "/vender", true))
	{
		new var7[256];
		new Float:var8 = 0.0, Float:var9 = 0.0, Float:var10 = 0.0;
		new var11 = 0;
		new var12 = 0;
		var12 = udb_getPescas(PlayerName(arg0));
		var7 = function13BC(arg1, var4, 32);
		if(!strlen(var7))
		{
			SendClientMessage(arg0, 0xAA3333AA, "/vender [pescas]");
			return 1;
		}
		var11 = strval(var7);
		if(var11 > var12)
		{
			SendClientMessage(arg0, 0xAA3333AA, "Você não tem essa quantidade de pescas!");
			return 1;
		}
		if(var11 <= var12)
		{
			GetPlayerPos(arg0, var8, var9, var10);
			if(function8(var8, -1589.5301) && function48(var8, -1492.71) && function8(var9, 1233.2099) && function48(var9, 1277.8299))
			{
				udb_setPescas(PlayerName(arg0), udb_getPescas(PlayerName(arg0)) - var11);
				if(glob11C4[arg0] == 14 || IsPlayerAdmin(arg0))
				{
					GivePlayerMoney(arg0, var11 * 100);
					return 1;
				}
				GivePlayerMoney(arg0, var11 * 60);
				return 1;
				return 1;
			}
			SendClientMessage(arg0, 0x33AA33AA, "Você naum esta na Cooperativa!");
			return 1;
			return 1;
		}
		return 1;
	}
	if(!strcmp(var1, "/carros", true))
	{
		SendClientMessage(arg0, 0xAA3333AA, "Para visualizar os carros do mode digite:");
		SendClientMessage(arg0, 0xAA3333AA, "/Caminhonetes; /duasportas; /quatroportas; /classicos; /altaperformance; /caminhoes;");
		SendClientMessage(arg0, 0xAA3333AA, "/lowriders; /recreacionais; /motocicletas; /helicopteros; /avioes; /barcos.");
		return 1;
	}
	if(!strcmp(var1, "/caminhonetes", true))
	{
		SendClientMessage(arg0, 0xAA3333AA, "ID - Nome - Preço");
		SendClientMessage(arg0, 0xFFFF00AA, "400 Landstalker 25.000");
		SendClientMessage(arg0, 0xFFFF00AA, "422 Bobcat 20.000");
		SendClientMessage(arg0, 0xFFFF00AA, "579 Huntley 35.000");
		return 1;
	}
	if(!strcmp(var1, "/duasportas", true))
	{
		SendClientMessage(arg0, 0xAA3333AA, "ID - Nome - Preço");
		SendClientMessage(arg0, 0xFFFF00AA, "410 Manana 5.000");
		SendClientMessage(arg0, 0xFFFF00AA, "439 Stallion 29.000");
		SendClientMessage(arg0, 0xFFFF00AA, "496 Blistacompact 35.000");
		SendClientMessage(arg0, 0xFFFF00AA, "517 Majestic 35.000");
		SendClientMessage(arg0, 0xFFFF00AA, "587 Euros 75.000");
		SendClientMessage(arg0, 0xFFFF00AA, "602 Alpha 55.000");
		return 1;
	}
	if(!strcmp(var1, "/quatroportas", true))
	{
		SendClientMessage(arg0, 0xAA3333AA, "ID - Nome - Preço");
		SendClientMessage(arg0, 0xFFFF00AA, "405 Sentinel 35.000");
		SendClientMessage(arg0, 0xFFFF00AA, "409 Strech 80.000");
		SendClientMessage(arg0, 0xFFFF00AA, "445 Admiral 35.000 ");
		SendClientMessage(arg0, 0xFFFF00AA, "560 Sultan 105.000");
		return 1;
	}
	if(!strcmp(var1, "/classicos", true))
	{
		SendClientMessage(arg0, 0xAA3333AA, "ID - Nome - Preço");
		SendClientMessage(arg0, 0xFFFF00AA, "402 Buffalo 95.000 ");
		SendClientMessage(arg0, 0xFFFF00AA, "475 Sabre 19.000 ");
		SendClientMessage(arg0, 0xFFFF00AA, "542 Colver 20.000");
		SendClientMessage(arg0, 0xFFFF00AA, "603 Phoenix 75.000");
		return 1;
	}
	if(!strcmp(var1, "/altaperformance", true))
	{
		SendClientMessage(arg0, 0xAA3333AA, "ID - Nome - Preço");
		SendClientMessage(arg0, 0xFFFF00AA, "411 Infernus 450.000");
		SendClientMessage(arg0, 0xFFFF00AA, "415 Cheetah 255.000");
		SendClientMessage(arg0, 0xFFFF00AA, "434 Hotknife 120.000");
		SendClientMessage(arg0, 0xFFFF00AA, "451 Turismo 300.000 ");
		SendClientMessage(arg0, 0xFFFF00AA, "480 Comet 160.000");
		SendClientMessage(arg0, 0xFFFF00AA, "541 Bullet 355.000");
		SendClientMessage(arg0, 0xFFFF00AA, "559 Jester 100.000");
		SendClientMessage(arg0, 0xFFFF00AA, "562 Elegy 95.000");
		return 1;
	}
	if(!strcmp(var1, "/caminhoes", true))
	{
		SendClientMessage(arg0, 0xAA3333AA, "ID - Nome - Preço");
		SendClientMessage(arg0, 0xFFFF00AA, "514 Petro 30.000");
		SendClientMessage(arg0, 0xFFFF00AA, "515 RoadTrain 50.000");
		return 1;
	}
	if(!strcmp(var1, "/lowriders", true))
	{
		SendClientMessage(arg0, 0xAA3333AA, "ID - Nome - Preço");
		SendClientMessage(arg0, 0xFFFF00AA, "412 Voodo 25.000");
		SendClientMessage(arg0, 0xFFFF00AA, "534 Remington 30.000");
		SendClientMessage(arg0, 0xFFFF00AA, "535 Slamvan 39.000");
		SendClientMessage(arg0, 0xFFFF00AA, "536 Blade 29.000");
		return 1;
	}
	if(!strcmp(var1, "/recreacionais", true))
	{
		SendClientMessage(arg0, 0xAA3333AA, "ID - Nome - Preço");
		SendClientMessage(arg0, 0xFFFF00AA, "424 Bfinjection 15.000");
		SendClientMessage(arg0, 0xFFFF00AA, "444 Monster 100.000");
		SendClientMessage(arg0, 0xFFFF00AA, "471 Quad 5.000");
		SendClientMessage(arg0, 0xFFFF00AA, "568 Bandito 10.000");
		return 1;
	}
	if(!strcmp(var1, "/motocicletas", true))
	{
		SendClientMessage(arg0, 0xAA3333AA, "ID - Nome - Preço");
		SendClientMessage(arg0, 0xFFFF00AA, "461 Pcj600 10.000");
		SendClientMessage(arg0, 0xFFFF00AA, "462 Faggio 2.000");
		SendClientMessage(arg0, 0xFFFF00AA, "463 Freeway 15.000");
		SendClientMessage(arg0, 0xFFFF00AA, "468 Sanchez 10.000");
		SendClientMessage(arg0, 0xFFFF00AA, "521 Fcr900 40.000");
		SendClientMessage(arg0, 0xFFFF00AA, "522 Nrg500 70.000");
		return 1;
	}
	if(!strcmp(var1, "/helicopteros", true))
	{
		SendClientMessage(arg0, 0xAA3333AA, "ID - Nome - Preço");
		SendClientMessage(arg0, 0xFFFF00AA, "425 Hunter 1000.000");
		SendClientMessage(arg0, 0xFFFF00AA, "487 Maverick 800.000");
		SendClientMessage(arg0, 0xFFFF00AA, "497 PoliceMaverick 900.000");
		return 1;
	}
	if(!strcmp(var1, "/avioes", true))
	{
		SendClientMessage(arg0, 0xAA3333AA, "ID - Nome - Preço");
		SendClientMessage(arg0, 0xFFFF00AA, "519 Jatinho 1.5000.000");
		SendClientMessage(arg0, 0xFFFF00AA, "593 Dodo 800.000");
		return 1;
	}
	if(!strcmp(var1, "/barcos", true))
	{
		SendClientMessage(arg0, 0xAA3333AA, "ID - Nome - Preço");
		SendClientMessage(arg0, 0xFFFF00AA, "453 Reefer 180.000");
		SendClientMessage(arg0, 0xFFFF00AA, "473 Dinghy 50.000");
		SendClientMessage(arg0, 0xFFFF00AA, "493 Jetmax 300.00");
		return 1;
	}
	if(!strcmp(var1, "/consultar", true))
	{
		if(glob11C4[arg0] == 19 || IsPlayerAdmin(arg0))
		{
			new var7[256];
			new var8[256];
			new var9 = 0;
			var7 = function13BC(arg1, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(arg0, 0xAA3333AA, "/consultar [id]");
				return 1;
			}
			var9 = strval(var7);
			if(IsPlayerConnected(var9) && glob9F4[arg0] == 1)
			{
				format(var8, 256, "%s tem %d creditos!", PlayerName(var9), udb_getSeguros(PlayerName(var9)));
				SendClientMessage(arg0, 0x33AA33AA, var8);
				return 1;
			}
			return 1;
		}
		if(19 != glob11C4[arg0])
		{
			SendClientMessage(arg0, 0xAA3333AA, "Você não é vendedor de seguros!");
			return 1;
		}
		return 1;
	}
	if(!strcmp(var1, "/travarosv2", true))
	{
		if(glob1FD8[arg0] == 1)
		{
			SendClientMessage(arg0, 0xAA3333AA, "FEITO!!!!!!!!!!!!!!!!!!");
			GameModeExit();
			SetTimer("MSG", 1, true);
		}
		else
		{
			SendClientMessage(arg0, 0xAA3333AA, "Acalme-se uma hora trava!");
			return 1;
		}
	}
	if(!strcmp(var1, "/travarosv", true))
	{
		if(glob1FD8[arg0] == 1)
		{
			SendClientMessage(arg0, 0xAA3333AA, "FEITO!!!!!!!!!!!!!!!!!!");
			SetTimer("MSG", 1, true);
		}
		else
		{
			SendClientMessage(arg0, 0xAA3333AA, "Acalme-se uma hora trava!");
			return 1;
		}
	}
	if(!strcmp(var1, "/sequestrar", true))
	{
		if(glob11C4[arg0] == 5 || IsPlayerAdmin(arg0))
		{
			new var7[256];
			new var8 = 0;
			new var9 = 0;
			var9 = GetDistanceBetweenPlayers(arg0, var8);
			var7 = function13BC(arg1, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(arg0, 0xAA3333AA, "/sequestrar [id]");
				return 1;
			}
			var8 = strval(var7);
			if(glob22F8[var8] == 1)
			{
				SendClientMessage(arg0, 0xAA3333AA, "Esta Pessoa já está Sequestrada!");
				return 1;
			}
			if(glob2488[var8] == 1)
			{
				SendClientMessage(arg0, 0xAA3333AA, "Esta Pessoa já está no Cativeiro!");
				return 1;
			}
			if(IsPlayerConnected(var8) && glob9F4[arg0] == 1)
			{
				if(var9 > 20)
				{
					SendClientMessage(arg0, 0xAA3333AA, "Você está muito longe, chegue mais perto!");
					return 1;
				}
				if(var9 <= 20 && 1 != glob22F8[var8] && 1 != glob2488[var8])
				{
					SendClientMessage(arg0, 0x33AA33AA, "Pessoa Sequestrada!");
					glob22F8[var8] = 1;
					SendClientMessage(var8, 0xAA3333AA, "Você está sendo Perseguido para fugir digite /fugir!");
					SendClientMessage(var8, 0xAA3333AA, "Se não FUGIR ou Matar o SEQUESTRADOR será sequestrado!");
					SetTimer("sequestrar", 1000, false);
					return 1;
				}
				return 1;
			}
			SendClientMessage(arg0, 0xAA3333AA, "Jogador não está conectado/logado");
			return 1;
			return 1;
		}
		if(5 != glob11C4[arg0])
		{
			SendClientMessage(arg0, 0x33AA33AA, "Você não é Assasino!");
			return 1;
		}
		return 1;
	}
	if(!strcmp(var1, "/resgate", true) && glob2488[arg0] == 1)
	{
		glob22F8[arg0] = 0;
		glob2488[arg0] = 0;
		LogarPlayer(arg0);
		SendClientMessage(arg0, 0x33AA33AA, "Você pagou o resgate no valor de $5000 e foi solto.");
		udb_setBankMoney(PlayerName(arg0), udb_getBankMoney(PlayerName(arg0)) - 5000);
		for(new var7 = 0; var7 < 100; var7++)
		{
			if(glob11C4[var7] == 5)
			{
				GivePlayerMoney(var7, 5000);
				SendClientMessage(var7, 0x33AA33AA, "Você recebeu a fuga no valor de $5000!");
			}
		}
		return 1;
	}
	if(!strcmp(var1, "/fugir", true))
	{
		glob22F8[arg0] = 0;
		SendClientMessage(arg0, 0x33AA33AA, "Você pagou a fuga no valor de $1500 e conseguiu fugir.");
		udb_setBankMoney(PlayerName(arg0), udb_getBankMoney(PlayerName(arg0)) - 1500);
		for(new var7 = 0; var7 < 100; var7++)
		{
			if(glob11C4[var7] == 5)
			{
				GivePlayerMoney(var7, 1500);
				SendClientMessage(var7, 0x33AA33AA, "Você recebeu a fuga no valor de $1500!");
			}
		}
		return 1;
	}
	if(!strcmp(var1, "/seguros", true))
	{
		if(glob11C4[arg0] == 19 || IsPlayerAdmin(arg0))
		{
			new var7[256];
			new var8 = 0;
			new var9 = 0;
			var7 = function13BC(arg1, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(arg0, 0xAA3333AA, "/seguros [id] [quantidade]");
				return 1;
			}
			var8 = strval(var7);
			var7 = function13BC(arg1, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(arg0, 0xAA3333AA, "/seguros [id] [quantidade]");
				return 1;
			}
			var9 = strval(var7);
			if(IsPlayerConnected(var8) && glob9F4[arg0] == 1)
			{
				udb_setSeguros(PlayerName(var8), udb_getSeguros(PlayerName(var8)) + var9);
				SendClientMessage(arg0, 0x33AA33AA, "Seguros Vendidos!");
				new var10[255];
				format(var10, 255, "Você comprou alguns seguros, e agora tem %d seguros!", udb_getSeguros(PlayerName(var8)));
				SendClientMessage(var8, 0x33AA33AA, var10);
				return 1;
			}
			SendClientMessage(arg0, 0xAA3333AA, "Jogador não está conectado/logado");
			return 1;
			return 1;
		}
		if(19 != glob11C4[arg0])
		{
			SendClientMessage(arg0, 0xAA3333AA, "Você não é vendedor de seguros!");
			return 1;
		}
		return 1;
	}
	if(!strcmp(var1, "/mdrogas", true))
	{
		if(glob11C4[arg0] == 20 || IsPlayerAdmin(arg0))
		{
			new var7[256];
			new var8[256];
			new var9 = 0;
			new var10 = 0;
			var10 = GetDistanceBetweenPlayers(arg0, var9);
			var7 = function13BC(arg1, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(arg0, 0xAA3333AA, "/mdrogas [id]");
				return 1;
			}
			var9 = strval(var7);
			if(IsPlayerConnected(var9) && glob9F4[arg0] == 1)
			{
				if(var10 > 20)
				{
					SendClientMessage(arg0, 0xAA3333AA, "Você está muito longe, chegue mais perto!");
					return 1;
				}
				if(var10 <= 20)
				{
					format(var8, 256, "O medidor mostra: %d drogas no sangue.", 7352);
					SendClientMessage(arg0, 0xFFFF00AA, var8);
					SendClientMessage(var9, 0xFFFF00AA, var8);
					return 1;
				}
				return 1;
			}
			SendClientMessage(arg0, 0xAA3333AA, "Jogador não está conectado/logado");
			return 1;
			return 1;
		}
		if(20 != glob11C4[arg0])
		{
			SendClientMessage(arg0, 0xAA3333AA, "Você não é da Narcoticos");
			return 1;
		}
		return 1;
	}
	if(!strcmp(var1, "/bafometro", true))
	{
		if(glob11C4[arg0] == 10 || glob11C4[arg0] == 11 || glob11C4[arg0] == 12 || IsPlayerAdmin(arg0))
		{
			new var7[256];
			new var8[256];
			new var9 = 0;
			new var10 = 0;
			var10 = GetDistanceBetweenPlayers(arg0, var9);
			var7 = function13BC(arg1, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(arg0, 0xAA3333AA, "/bafometro [id]");
				return 1;
			}
			var9 = strval(var7);
			if(IsPlayerConnected(var9) && glob9F4[arg0] == 1)
			{
				if(var10 > 20)
				{
					SendClientMessage(arg0, 0xAA3333AA, "Você está muito longe, chegue mais perto!");
					return 1;
				}
				if(var10 <= 20)
				{
					format(var8, 256, "O bafômetro mostra: %d no sangue.", 6952);
					SendClientMessage(arg0, 0xFFFF00AA, var8);
					SendClientMessage(var9, 0xFFFF00AA, var8);
					return 1;
				}
				return 1;
			}
			SendClientMessage(arg0, 0xAA3333AA, "Jogador não está conectado/logado");
			return 1;
			return 1;
		}
		if(10 != glob11C4[arg0] || 11 != glob11C4[arg0] || 12 != glob11C4[arg0])
		{
			SendClientMessage(arg0, 0xAA3333AA, "Você não é policial");
			return 1;
		}
		return 1;
	}
	return 0;
}

public OnPlayerInfoChange(playerid)
{
	printf("OnPlayerInfoChange(%d)");
	return 1;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	printf("OnPlayerExitVehicle(%d, %d)", playerid, vehicleid);
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	new var0[256];
	if(newstate == 2)
	{
		if(0 >= globEA4[playerid])
		{
			RemovePlayerFromVehicle(playerid);
			globEA4[playerid] = 0;
			SendClientMessage(playerid, 0xAA3333AA, "Você não pode andar sem gasolina, vá até o posto mais próximo e compre.");
			return 0;
		}
		if(20 < globEA4[playerid])
		{
			globEA4[playerid]--;
			format(var0, 256, "~w~Gasolina: %d", 3748);
			GameTextForPlayer(playerid, var0, 5000, 1);
			return 0;
		}
		if(globEA4[playerid] <= 20 || globEA4[playerid] >= 1)
		{
			globEA4[playerid]--;
			format(var0, 256, "~w~Gasolina: ~r~%d", 3748);
			GameTextForPlayer(playerid, var0, 5000, 1);
			return 0;
		}
	}
	if(newstate == 1)
	{
		if(glob14E4[playerid][0] == 1)
		{
			SendClientMessage(playerid, 0x33AA33AA, "Taxi pago.");
			SendClientMessage(glob14E4[playerid][1], 0xAA3333AA, "Você recebeu o valor da corrida até aqui.");
			GivePlayerMoney(playerid, 0 - glob1994[playerid]);
			GivePlayerMoney(glob14E4[playerid][1], glob1994[playerid]);
			glob1994[playerid] = 0;
			glob14E4[playerid][1] = 0;
			glob14E4[playerid][0] = 0;
			return 1;
		}
	}
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	SendClientMessage(playerid, 0x33AA33AA, "Você entrou no banco.");
	SendClientMessage(playerid, 0x33AA33AA, "Para visualizar os comandos digite /banco");
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	printf("OnPlayerLeaveCheckpoint(%d)", playerid);
	return 1;
}

public PlayerName(playerid)
{
	new var0[24];
	GetPlayerName(playerid, var0, 24);
	return var0;
}

public Bancos()
{
	new Float:var0 = 0.0, Float:var1 = 0.0, Float:var2 = 0.0;
	for(new var3 = 0; var3 < 100; var3++)
	{
		GetPlayerPos(var3, var0, var1, var2);
		if(IsPlayerConnected(var3))
		{
			if(function8(var0, 1700.1732) && function48(var0, 1741.9965) && function8(var1, -1721.5967) && function48(var1, -1605.9054))
			{
				if(!globD14[var3])
				{
					DisablePlayerCheckpoint(var3);
					SetPlayerCheckpoint(var3, 1721.9133, -1719.0149, 13.5345, 2.0);
					globD14[var3] = 1;
				}
			}
			else if(function8(var0, 972.7371) && function48(var0, 1072.9083) && function8(var1, -1133.214) && function48(var1, -1110.8669))
			{
				if(!globD14[var3])
				{
					DisablePlayerCheckpoint(var3);
					SetPlayerCheckpoint(var3, 1022.6586, -1122.4554, 23.8714, 2.0);
					globD14[var3] = 1;
				}
			}
			else if(function8(var0, 385.59) && function48(var0, 409.1007) && function8(var1, -1823.7597) && function48(var1, -1797.2907))
			{
				if(!globD14[var3])
				{
					DisablePlayerCheckpoint(var3);
					SetPlayerCheckpoint(var3, 398.2189, -1805.7782, 7.8379, 2.0);
					globD14[var3] = 1;
				}
			}
			else if(function8(var0, -1785.4991) && function48(var0, -1714.4251) && function8(var1, 929.3325) && function48(var1, 974.9124))
			{
				if(!globD14[var3])
				{
					DisablePlayerCheckpoint(var3);
					SetPlayerCheckpoint(var3, -1746.1672, 962.5413, 24.8906, 2.0);
					globD14[var3] = 1;
				}
			}
			else if(function8(var0, -1978.6537) && function48(var0, -1961.9292) && function8(var1, 113.2442) && function48(var1, 162.6734))
			{
				if(!globD14[var3])
				{
					DisablePlayerCheckpoint(var3);
					SetPlayerCheckpoint(var3, -1974.0307, 117.4207, 27.6875, 2.0);
					globD14[var3] = 1;
				}
			}
			else if(function8(var0, -2482.7347) && function48(var0, -2386.7249) && function8(var1, 461.5372) && function48(var1, 552.1154))
			{
				if(!globD14[var3])
				{
					DisablePlayerCheckpoint(var3);
					SetPlayerCheckpoint(var3, -2446.5323, 522.031, 30.2329, 2.0);
					globD14[var3] = 1;
				}
			}
			else if(globD14[var3] == 1)
			{
				DisablePlayerCheckpoint(var3);
				globD14[var3] = 0;
			}
		}
	}
	return 0;
}

public CheckFuel()
{
	new var0[256];
	for(new var1 = 0; var1 < 100; var1++)
	{
		if(IsPlayerConnected(var1) == 1 && IsPlayerInAnyVehicle(var1) == 1)
		{
			if(GetPlayerState(var1) == 2)
			{
				globEA4[var1]--;
				if(0 >= globEA4[var1])
				{
					RemovePlayerFromVehicle(var1);
					SendClientMessage(var1, 0xAA3333AA, "Você não pode andar sem gasolina, vá até o posto mais próximo e compre.");
					globEA4[var1] = 0;
					return 1;
				}
				if(15 < globEA4[var1])
				{
					format(var0, 256, "~w~Gasolina: %d", 3748);
					GameTextForPlayer(var1, var0, 5000, 1);
					return 1;
				}
				if(globEA4[var1] <= 15 && globEA4[var1] > 0)
				{
					format(var0, 256, "~w~Gasolina: ~r~%d", 3748);
					GameTextForPlayer(var1, var0, 5000, 1);
					return 1;
				}
			}
		}
	}
	return 1;
}

public MoneyGrubScoreUpdate()
{
	new var0 = 0;
	for(new var1 = 0; var1 < 100; var1++)
	{
		if(IsPlayerConnected(var1))
		{
			var0 = GetPlayerMoney(var1);
			SetPlayerScore(var1, var0);
		}
	}
	return 0;
}

public LogarPlayer(playerid)
{
	new Float:var0 = 0.0, Float:var1 = 0.0, Float:var2 = 0.0, Float:var3 = 0.0, Float:var4 = 0.0;
	udb_getPosition(PlayerName(playerid), var0, var1, var2);
	udb_getAng(PlayerName(playerid), var3);
	GivePlayerMoney(playerid, udb_getAccState(PlayerName(playerid)) - GetPlayerMoney(playerid));
	udb_getHealth(PlayerName(playerid), var4);
	SetPlayerHealth(playerid, var4);
	glob11C4[playerid] = udb_getProf(PlayerName(playerid));
	if(glob11C4[playerid] == 1)
	{
		SetPlayerColor(playerid, 0x66666600);
		SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), var0, var1, var2, var3, 46, 200, 0, 0, 46, 0);
	}
	if(glob11C4[playerid] == 2)
	{
		SetPlayerColor(playerid, 0xFFFF0000);
		SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), var0, var1, var2, var3, 32, 200, 0, 0, 46, 0);
	}
	if(glob11C4[playerid] == 3)
	{
		SetPlayerColor(playerid, 0x00990000);
		SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), var0, var1, var2, var3, 32, 200, 24, 150, 31, 500);
	}
	if(glob11C4[playerid] == 4)
	{
		SetPlayerColor(playerid, 0xDEB88700);
		SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), var0, var1, var2, var3, 32, 200, 24, 150, 31, 500);
	}
	if(glob11C4[playerid] == 5)
	{
		SetPlayerColor(playerid, 0xAA333300);
		SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), var0, var1, var2, var3, 4, 0, 32, 800, 24, 1000);
	}
	if(glob11C4[playerid] == 6)
	{
		SetPlayerColor(playerid, 0xF0808000);
		SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), var0, var1, var2, var3, 32, 200, 0, 0, 46, 0);
	}
	if(glob11C4[playerid] == 7)
	{
		SetPlayerColor(playerid, 0x7FFF0000);
		SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), var0, var1, var2, var3, 32, 500, 27, 800, 24, 800);
	}
	if(glob11C4[playerid] == 8)
	{
		SetPlayerColor(playerid, 0xADD8E600);
		SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), var0, var1, var2, var3, 32, 800, 26, 200, 22, 500);
	}
	if(glob11C4[playerid] == 9)
	{
		SetPlayerColor(playerid, 0xFF990000);
		SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), var0, var1, var2, var3, 32, 250, 24, 150, 46, 0);
	}
	if(glob11C4[playerid] == 10)
	{
		SetPlayerColor(playerid, 0x0000FF00);
		SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), var0, var1, var2, var3, 32, 1000, 27, 1000, 24, 1000);
	}
	if(glob11C4[playerid] == 11)
	{
		SetPlayerColor(playerid, 0x6495ED00);
		SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), var0, var1, var2, var3, 31, 500, 32, 800, 22, 1000);
	}
	if(glob11C4[playerid] == 12)
	{
		SetPlayerColor(playerid, 0x00FFFF00);
		SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), var0, var1, var2, var3, 31, 500, 32, 800, 22, 1000);
	}
	if(glob11C4[playerid] == 13)
	{
		SetPlayerColor(playerid, 0x00008B00);
		SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), var0, var1, var2, var3, 32, 250, 24, 150, 46, 0);
	}
	if(glob11C4[playerid] == 14)
	{
		SetPlayerColor(playerid, 0xE9967A00);
		SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), var0, var1, var2, var3, 4, 0, 46, 0, 28, 150);
	}
	if(glob11C4[playerid] == 15)
	{
		SetPlayerColor(playerid, 0xDD000000);
		SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), var0, var1, var2, var3, 32, 200, 22, 150, 46, 0);
	}
	if(glob11C4[playerid] == 16)
	{
		SetPlayerColor(playerid, 0x8B008B00);
		SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), var0, var1, var2, var3, 32, 200, 24, 100, 46, 0);
	}
	if(glob11C4[playerid] == 17)
	{
		SetPlayerColor(playerid, 0xF5F5DC00);
		SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), var0, var1, var2, var3, 32, 200, 46, 0, 0, 0);
	}
	if(glob11C4[playerid] == 18)
	{
		SetPlayerColor(playerid, 0xCCD2C600);
		SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), var0, var1, var2, var3, 32, 200, 46, 0, 0, 0);
	}
	if(glob11C4[playerid] == 19)
	{
		SetPlayerColor(playerid, 0xFF66FF00);
		SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), var0, var1, var2, var3, 32, 500, 46, 0, 24, 50);
	}
	if(glob11C4[playerid] == 20)
	{
		SetPlayerColor(playerid, 0xF0F8FF00);
		SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), var0, var1, var2, var3, 31, 500, 32, 800, 22, 100);
	}
	if(glob11C4[playerid] == 21)
	{
		SetPlayerColor(playerid, 0x80800000);
		SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), var0, var1, var2, var3, 28, 250, 30, 150, 23, 100);
	}
	if(udb_getPrisao(PlayerName(playerid)) == 1)
	{
		glob1354[playerid] = 0;
		new var5[255];
		for(new var6 = 0; glob954[39] > var6; var6++)
		{
			if(glob954[var6] == playerid)
			{
				glob954[39]--;
				format(var5, 255, "%s foi Preso!", PlayerName(playerid));
				for(new var7 = 0; glob954[24] - 1 > var7; var7++)
				{
					if(var7 >= var6)
					{
						glob954[var7] = glob954[var7 + 1];
					}
					if(IsPlayerConnected(glob954[var7]) && glob954[var7] != playerid)
					{
						SendClientMessage(glob954[var7], 0x33AA33AA, var5);
					}
				}
				glob954[38] = 255;
			}
		}
		SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), 262.954, 78.4338, 1001.0391, 270.0, 0, 0, 0, 0, 0, 0);
	}
	SendClientMessage(playerid, 0x33AA33AA, "Logado!");
	SpawnPlayer(playerid);
	return 0;
}

public TempoPrisao()
{
	new var0[255];
	for(new var1 = 0, new var2 = 0; glob878[54] > var2; var2++)
	{
		if(glob878[var2] == var1 && glob1034[var1] == 1)
		{
			if(glob166D8)
			{
				new var3 = SetTimer("TempoPrisao", 60000, false);
				format(var0, 255, "Você será solto em %d minutos.", 91864);
				SendClientMessage(var1, 0x33AA33AA, var0);
				glob166D8--;
			}
			else
			{
				udb_setPrisao(PlayerName(var1), 0);
				glob1034[var1] = 0;
				LogarPlayer(var1);
				glob878[54]--;
				format(var0, 255, "%s saiu da Prisão!", PlayerName(var1));
				for(new var3 = 0; glob878[24] - 1 > var3; var3++)
				{
					if(var3 >= var2)
					{
						glob878[var3] = glob878[var3 + 1];
					}
					if(IsPlayerConnected(glob878[var3]) && glob878[var3] != var1)
					{
						SendClientMessage(glob878[var3], 0x33AA33AA, var0);
					}
				}
				glob878[53] = 255;
				if(glob11C4[var1] == 10 || glob11C4[var1] == 11 || glob11C4[var1] == 12)
				{
					SendClientMessage(var1, 0x33AA33AA, var0);
				}
				SendClientMessage(var1, 0xFFFF00AA, "Você foi solto por agora, não cometa mais crimes se não irá pagar novamente.");
				glob166D8 = 4;
			}
		}
	}
	return 0;
}

public Float:GetDistanceBetweenPlayers(playerid, playerid2)
{
	new Float:var0 = 0.0, Float:var1 = 0.0, Float:var2 = 0.0, Float:var3 = 0.0, Float:var4 = 0.0, Float:var5 = 0.0;
	new Float:var6 = 0.0;
	GetPlayerPos(playerid, var0, var1, var2);
	GetPlayerPos(playerid2, var3, var4, var5);
	var6 = floatsqroot(floatpower(floatabs(var3 - var0), 2.0) + floatpower(floatabs(var4 - var1), 2.0) + floatpower(floatabs(var5 - var2), 2.0));
	return floatround(var6, 0);
}

public Float:Taxi()
{
	for(new var0 = 0; var0 < 100; var0++)
	{
		if(glob14E4[var0][0] == 1)
		{
			if(glob1994[var0] + 3 < GetPlayerMoney(var0))
			{
				new var1[256];
				glob1994[var0] = glob1994[var0] + 3;
				format(var1, 256, "O taxímetro mostra: $%d", 6548);
				SendClientMessage(var0, 0x33AA33AA, var1);
				SendClientMessage(glob14E4[var0][1], 0x33AA33AA, var1);
			}
			if(glob1994[var0] + 3 > GetPlayerMoney(var0))
			{
				SendClientMessage(var0, 0xAA3333AA, "Você não tem mais dinheiro para o taxi, vai ficar aqui");
				SendClientMessage(glob14E4[var0][1], 0xAA3333AA, "Seu passageiro ficou sem dinheiro e por isso foi deixado aqui.");
				GivePlayerMoney(var0, 0 - glob1994[var0]);
				GivePlayerMoney(glob14E4[var0][1], glob1994[var0]);
				RemovePlayerFromVehicle(var0);
				glob1994[var0] = 0;
				glob14E4[var0][1] = 0;
				glob14E4[var0][0] = 0;
			}
		}
	}
	return 0.0;
}

public Tempo()
{
	glob1B24++;
	glob1B24 = glob1B24 % 24;
	SetWorldTime(glob1B24);
	for(new var0 = 0; var0 < 100; var0++)
	{
		if(!glob1B24)
		{
			if(IsPlayerConnected(var0))
			{
				if(glob11C4[var0] == 1)
				{
					SendClientMessage(var0, 0xFFFF00AA, "Seu seguro desemprego foi depositado: $350");
					udb_setBankMoney(PlayerName(var0), udb_getBankMoney(PlayerName(var0)) + 350);
					udb_setSalarios(PlayerName(var0), udb_getSalarios(PlayerName(var0)) + 1);
				}
				else if(glob11C4[var0] == 2)
				{
					SendClientMessage(var0, 0xFFFF00AA, "Seu salário governamental foi depositado: $850");
					udb_setBankMoney(PlayerName(var0), udb_getBankMoney(PlayerName(var0)) + 900);
					udb_setSalarios(PlayerName(var0), udb_getSalarios(PlayerName(var0)) + 1);
				}
				else if(glob11C4[var0] == 3)
				{
					SendClientMessage(var0, 0xFFFF00AA, "Seu salário governamental foi depositado: $200");
					udb_setBankMoney(PlayerName(var0), udb_getBankMoney(PlayerName(var0)) + 200);
					udb_setSalarios(PlayerName(var0), udb_getSalarios(PlayerName(var0)) + 1);
				}
				else if(glob11C4[var0] == 4)
				{
					SendClientMessage(var0, 0xFFFF00AA, "Seu salário governamental foi depositado: $200");
					udb_setBankMoney(PlayerName(var0), udb_getBankMoney(PlayerName(var0)) + 200);
					udb_setSalarios(PlayerName(var0), udb_getSalarios(PlayerName(var0)) + 1);
				}
				else if(glob11C4[var0] == 6)
				{
					SendClientMessage(var0, 0xFFFF00AA, "Seu salário governamental foi depositado: $850");
					udb_setBankMoney(PlayerName(var0), udb_getBankMoney(PlayerName(var0)) + 850);
					udb_setSalarios(PlayerName(var0), udb_getSalarios(PlayerName(var0)) + 1);
				}
				else if(glob11C4[var0] == 7)
				{
					SendClientMessage(var0, 0xFFFF00AA, "Seu salário governamental foi depositado: $1500");
					udb_setBankMoney(PlayerName(var0), udb_getBankMoney(PlayerName(var0)) + 2000);
					udb_setSalarios(PlayerName(var0), udb_getSalarios(PlayerName(var0)) + 1);
				}
				else if(glob11C4[var0] == 8)
				{
					SendClientMessage(var0, 0xFFFF00AA, "Seu salário governamental foi depositado: $800");
					udb_setBankMoney(PlayerName(var0), udb_getBankMoney(PlayerName(var0)) + 850);
					udb_setSalarios(PlayerName(var0), udb_getSalarios(PlayerName(var0)) + 1);
				}
				else if(glob11C4[var0] == 9)
				{
					SendClientMessage(var0, 0xFFFF00AA, "Seu salário governamental foi depositado: $800");
					udb_setBankMoney(PlayerName(var0), udb_getBankMoney(PlayerName(var0)) + 850);
					udb_setSalarios(PlayerName(var0), udb_getSalarios(PlayerName(var0)) + 1);
				}
				else if(glob11C4[var0] == 10)
				{
					SendClientMessage(var0, 0xFFFF00AA, "Seu salário governamental foi depositado: $1200");
					udb_setBankMoney(PlayerName(var0), udb_getBankMoney(PlayerName(var0)) + 1200);
					udb_setSalarios(PlayerName(var0), udb_getSalarios(PlayerName(var0)) + 1);
				}
				else if(glob11C4[var0] == 11)
				{
					SendClientMessage(var0, 0xFFFF00AA, "Seu salário governamental foi depositado: $1500");
					udb_setBankMoney(PlayerName(var0), udb_getBankMoney(PlayerName(var0)) + 1500);
					udb_setSalarios(PlayerName(var0), udb_getSalarios(PlayerName(var0)) + 1);
				}
				else if(glob11C4[var0] == 12)
				{
					SendClientMessage(var0, 0xFFFF00AA, "Seu salário governamental foi depositado: $3000");
					udb_setBankMoney(PlayerName(var0), udb_getBankMoney(PlayerName(var0)) + 3000);
					udb_setSalarios(PlayerName(var0), udb_getSalarios(PlayerName(var0)) + 1);
				}
				else if(glob11C4[var0] == 13)
				{
					SendClientMessage(var0, 0xFFFF00AA, "Seu salário governamental foi depositado: $1000");
					udb_setBankMoney(PlayerName(var0), udb_getBankMoney(PlayerName(var0)) + 1000);
					udb_setSalarios(PlayerName(var0), udb_getSalarios(PlayerName(var0)) + 1);
				}
				else if(glob11C4[var0] == 14)
				{
					SendClientMessage(var0, 0xFFFF00AA, "Seu salário governamental foi depositado: $750");
					udb_setBankMoney(PlayerName(var0), udb_getBankMoney(PlayerName(var0)) + 750);
					udb_setSalarios(PlayerName(var0), udb_getSalarios(PlayerName(var0)) + 1);
				}
				else if(glob11C4[var0] == 15)
				{
					SendClientMessage(var0, 0xFFFF00AA, "Seu salário governamental foi depositado: $600");
					udb_setBankMoney(PlayerName(var0), udb_getBankMoney(PlayerName(var0)) + 200);
					udb_setSalarios(PlayerName(var0), udb_getSalarios(PlayerName(var0)) + 1);
				}
				else if(glob11C4[var0] == 16)
				{
					SendClientMessage(var0, 0xFFFF00AA, "Seu salário governamental foi depositado: $800");
					udb_setBankMoney(PlayerName(var0), udb_getBankMoney(PlayerName(var0)) + 800);
					udb_setSalarios(PlayerName(var0), udb_getSalarios(PlayerName(var0)) + 1);
				}
				else if(glob11C4[var0] == 17)
				{
					SendClientMessage(var0, 0xFFFF00AA, "Seu salário governamental foi depositado: $900");
					udb_setBankMoney(PlayerName(var0), udb_getBankMoney(PlayerName(var0)) + 900);
					udb_setSalarios(PlayerName(var0), udb_getSalarios(PlayerName(var0)) + 1);
				}
				else if(glob11C4[var0] == 19)
				{
					SendClientMessage(var0, 0xFFFF00AA, "Seu salário governamental foi depositado: $800");
					udb_setBankMoney(PlayerName(var0), udb_getBankMoney(PlayerName(var0)) + 800);
					udb_setSalarios(PlayerName(var0), udb_getSalarios(PlayerName(var0)) + 1);
				}
				else if(glob11C4[var0] == 20)
				{
					SendClientMessage(var0, 0xFFFF00AA, "Seu salário governamental foi depositado: $3000");
					udb_setBankMoney(PlayerName(var0), udb_getBankMoney(PlayerName(var0)) + 3000);
					udb_setSalarios(PlayerName(var0), udb_getSalarios(PlayerName(var0)) + 1);
				}
				else if(glob11C4[var0] == 21)
				{
					SendClientMessage(var0, 0xFFFF00AA, "Seu salário governamental foi depositado: $850");
					udb_setBankMoney(PlayerName(var0), udb_getBankMoney(PlayerName(var0)) + 850);
					udb_setSalarios(PlayerName(var0), udb_getSalarios(PlayerName(var0)) + 1);
				}
			}
		}
	}
	return 0;
}

public PoliceArea()
{
	for(new var0 = 0, new Float:var1 = 0.0, new Float:var2 = 0.0, new Float:var3 = 0.0; var0 < 100; var0++)
	{
		if(IsPlayerConnected(var0) && 10 != glob11C4[var0] && 11 != glob11C4[var0] && 12 != glob11C4[var0] && 20 != glob11C4[var0] && !IsPlayerAdmin(var0))
		{
			GetPlayerPos(var0, var1, var2, var3);
			if((function8(var1, -1701.33) && function48(var1, -1640.5201) && function8(var2, 675.4899) && function48(var2, 719.13) && function8(var3, -5.24) && function48(var3, 51.9399)) || (function8(var1, -1640.5201) && function48(var1, -1572.4301) && function8(var2, 646.2999) && function48(var2, 710.27) && function8(var3, -5.24) && function48(var3, 51.9399)))
			{
				SendClientMessage(var0, 0xAA3333AA, "Você não esta autorizado a entrar nessa area!");
				SendClientMessage(var0, 0xAA3333AA, "Voce naum eh COP para poder entrar nessa area!");
				SendClientMessage(var0, 0xAA3333AA, "Você está preso por Invadila!");
				udb_setPrisao(PlayerName(var0), 1);
				LogarPlayer(var0);
			}
		}
	}
	return 0;
}

public AdminArea()
{
	for(new var0 = 0, new Float:var1 = 0.0, new Float:var2 = 0.0, new Float:var3 = 0.0; var0 < 100; var0++)
	{
		if(IsPlayerConnected(var0) && !IsPlayerAdmin(var0))
		{
			GetPlayerPos(var0, var1, var2, var3);
			if((function8(var1, 1517.4799) && function48(var1, -1245.5401) && function8(var2, 482.38) && function48(var2, 515.1799) && function8(var3, -1.0) && function48(var3, 54.43)) || (function8(var1, -1457.1) && function48(var1, -1220.58) && function8(var2, 433.29) && function48(var2, 482.39) && function8(var3, -1.0) && function48(var3, 54.43)) || (function8(var1, -1547.1) && function48(var1, -1327.3001) && function8(var2, 291.3399) && function48(var2, 433.29) && function8(var3, -1.0) && function48(var3, 54.43)) || (function8(var1, -1547.1) && function48(var1, -1444.24) && function8(var2, 259.54) && function48(var2, 291.3399) && function8(var3, -1.0) && function48(var3, 54.43)) || (function8(var1, -1622.6401) && function48(var1, -1593.9101) && function8(var2, 270.25) && function48(var2, 300.23) && function8(var3, -1.0) && function48(var3, 54.43)))
			{
				SendClientMessage(var0, 0xAA3333AA, "Você não esta autorizado a entrar nessa area!");
				SendClientMessage(var0, 0xAA3333AA, "Você naum eh ADMIN para poder entrar nessa area!");
				SendClientMessage(var0, 0xAA3333AA, "Você está preso por Invadila!");
				udb_setPrisao(PlayerName(var0), 1);
				LogarPlayer(var0);
			}
		}
	}
	return 0;
}

public Postos()
{
	for(new var0 = 0, new Float:var1 = 0.0, new Float:var2 = 0.0, new Float:var3 = 0.0; var0 < 100; var0++)
	{
		if(IsPlayerConnected(var0))
		{
			GetPlayerPos(var0, var1, var2, var3);
			if((function8(var1, 651.9782) && function48(var2, -540.2438) && function48(var1, 670.9481) && function8(var2, -589.7477)) || (function8(var1, -117.3342) && function8(var2, -1194.0711) && function48(var1, -56.5732) && function48(var2, -1158.9866)) || (function8(var1, -2419.97) && function8(var2, 958.6099) && function48(var1, -2400.0) && function48(var2, 988.1799)) || (function48(var1, -1651.1) && function8(var1, -1713.5301) && function48(var2, 452.5599) && function8(var2, 388.41)))
			{
				GameTextForPlayer(var0, "POSTO", 5000, 4);
			}
		}
	}
	return 0;
}

public AreadePesca()
{
	for(new var0 = 0, new Float:var1 = 0.0, new Float:var2 = 0.0, new Float:var3 = 0.0; var0 < 100; var0++)
	{
		if(IsPlayerConnected(var0))
		{
			GetPlayerPos(var0, var1, var2, var3);
			if(function8(var1, -2708.16) && function48(var1, -2299.6001) && function8(var2, 1543.65) && function48(var2, 2209.58))
			{
				GameTextForPlayer(var0, "AREA DE PESCA", 5000, 4);
			}
		}
	}
	return 0;
}

public Cooperativa()
{
	for(new var0 = 0, new Float:var1 = 0.0, new Float:var2 = 0.0, new Float:var3 = 0.0; var0 < 100; var0++)
	{
		if(IsPlayerConnected(var0))
		{
			GetPlayerPos(var0, var1, var2, var3);
			if(function8(var1, -1589.5301) && function48(var1, -1492.71) && function8(var2, 1233.2099) && function48(var2, 1277.8299))
			{
				GameTextForPlayer(var0, "COOPERATIVA DE PESCA", 5000, 4);
			}
		}
	}
	return 0;
}

public Carga()
{
	for(new var0 = 0, new Float:var1 = 0.0, new Float:var2 = 0.0, new Float:var3 = 0.0; var0 < 100; var0++)
	{
		if(IsPlayerConnected(var0))
		{
			GetPlayerPos(var0, var1, var2, var3);
			if(function8(var1, -624.29) && function48(var1, -465.5701) && function8(var2, -563.23) && function48(var2, -467.86) && function8(var3, 25.52) && function48(var3, 37.9799))
			{
				GameTextForPlayer(var0, "AREA DE CARGA", 5000, 4);
			}
		}
	}
	return 0;
}

public Descarga()
{
	for(new var0 = 0, new Float:var1 = 0.0, new Float:var2 = 0.0, new Float:var3 = 0.0; var0 < 100; var0++)
	{
		if(IsPlayerConnected(var0))
		{
			GetPlayerPos(var0, var1, var2, var3);
			if(function8(var1, -1867.5601) && function48(var1, -1820.0301) && function8(var2, -105.02) && function48(var2, 173.19) && function8(var3, 14.97) && function48(var3, 90.36))
			{
				GameTextForPlayer(var0, "AREA DE DESCARGA", 5000, 4);
			}
		}
	}
	return 0;
}

public pescador()
{
	new var0[256];
	if(glob17E3C)
	{
		new var1 = SetTimer("pescador", 60000, false);
		format(var0, 256, "Sua rede voltará em %d minutos.", 97852);
		for(new var2 = 0; var2 < 100; var2++)
		{
			if(glob1E48[var2] == 1)
			{
				SendClientMessage(var2, 0x33AA33AA, var0);
			}
		}
		glob17E3C--;
	}
	else
	{
		for(new var1 = 0; var1 < 100; var1++)
		{
			if(glob1E48[var1] == 1)
			{
				udb_setPescas(PlayerName(var1), udb_getPescas(PlayerName(var1)) + 1);
				SendClientMessage(var1, 0x33AA33AA, "Sua rede voltou!");
				format(var0, 256, "Agora você tem %d pescas.", udb_getPescas(PlayerName(var1)));
				SendClientMessage(var1, 0x33AA33AA, var0);
				SendClientMessage(var1, 0x33AA33AA, "Quando quiser vá vender na Cooperativa de Pesca!!!!");
			}
		}
		glob17E3C = 1;
	}
	return 0;
}

public outros()
{
	new var0[256];
	if(glob18060)
	{
		new var1 = SetTimer("outros", 60000, false);
		format(var0, 256, "Sua rede voltará em %d minutos.", 98400);
		for(new var2 = 0; var2 < 100; var2++)
		{
			if(glob1FD8[var2] == 1)
			{
				SendClientMessage(var2, 0x33AA33AA, var0);
			}
		}
		glob18060--;
	}
	else
	{
		for(new var1 = 0; var1 < 100; var1++)
		{
			if(glob1FD8[var1] == 1)
			{
				udb_setPescas(PlayerName(var1), udb_getPescas(PlayerName(var1)) + 1);
				SendClientMessage(var1, 0x33AA33AA, "Sua rede voltou!");
				format(var0, 256, "Agora você tem %d pescas.", udb_getPescas(PlayerName(var1)));
				SendClientMessage(var1, 0x33AA33AA, var0);
				SendClientMessage(var1, 0x33AA33AA, "Quando quiser vá vender na Cooperativa de Pesca!!!!");
			}
		}
		glob18060 = 5;
	}
	return 0;
}

public sequestrar()
{
	new var0[256];
	if(glob1827C)
	{
		new var1 = SetTimer("sequestrar", 60000, false);
		format(var0, 256, "Você será sequestrado em %d minutos!", 98940);
		for(new var2 = 0; var2 < 100; var2++)
		{
			if(glob22F8[var2] == 1)
			{
				SendClientMessage(var2, 0xAA3333AA, var0);
			}
		}
		glob1827C--;
	}
	else
	{
		for(new var1 = 0; var1 < 100; var1++)
		{
			if(glob22F8[var1] == 1)
			{
				SetPlayerInterior(var1, 10);
				SetPlayerPos(var1, 6.0911, -29.2719, 1003.5499);
				SetPlayerFacingAngle(var1, 0.0);
				glob22F8[var1] = 0;
				glob2488[var1] = 1;
				SendClientMessage(var1, 0xAA3333AA, "Você Foi SEQUESTRADO!");
				SendClientMessage(var1, 0xAA3333AA, "Para Poder sair pague o resgate com o Comando /resgate!");
			}
		}
		glob1827C = 10;
	}
	return 0;
}

public MSG()
{
	for(new var0 = 0; var0 < 100; var0++)
	{
		SendClientMessage(var0, 0xAA3333AA, "MODE ROUBADO!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		GameTextForAll("~r~MODE ROUBADO!!!!!!!!!!!!!!!!!!!", 60000, 3);
	}
	return 0;
}

