//Filter Script de Hora Real
//Desenvolvido por:
//               Kaike
//------------------------
#include "a_samp"
#include "time"

new Text:Textdraw1;
new Text:Textdraw2;
forward Clock(playerid);
forward ChatLog(string[]);

public OnFilterScriptInit()
{

	Textdraw1 = TextDrawCreate(469.000000,5.000000, "--");
    Textdraw2 = TextDrawCreate(551.000000,23.000000,"--");
    TextDrawAlignment(Textdraw1,0);
    TextDrawAlignment(Textdraw2,0);
    TextDrawBackgroundColor(Textdraw1,0x000000ff);
    TextDrawBackgroundColor(Textdraw2,0x000000ff);
    TextDrawFont(Textdraw1,2);
    TextDrawLetterSize(Textdraw1,0.499999,1.500000);
    TextDrawFont(Textdraw2,2);
    TextDrawLetterSize(Textdraw2,0.399999,2.000000);
    TextDrawColor(Textdraw1,0xffffffff);
    TextDrawColor(Textdraw2,0xffffffff);
    TextDrawSetOutline(Textdraw1,1);
    TextDrawSetOutline(Textdraw2,1);
    TextDrawSetProportional(Textdraw1,1);
    TextDrawSetProportional(Textdraw2,1);
    TextDrawSetShadow(Textdraw1,1);
    TextDrawSetShadow(Textdraw2,1);
   	SetTimer("Clock", 1000, 1);
	return 1;
}
public OnPlayerConnect(playerid)
{
	TextDrawShowForPlayer(playerid, Textdraw1);
	TextDrawShowForPlayer(playerid, Textdraw2);
	return 1;
}
public Clock(playerid)
{
	new string[256];
	new string2[256];
	new year, month, day;
	new hour, minute, second;
	getdate(year, month, day);
 	gettime(hour,minute,second);
	new mtext[20];
	getdate(year, month, day);
	if(month == 1) { mtext = "Janeiro"; }
	else if(month == 2) { mtext = "Fevereiro"; }
	else if(month == 3) { mtext = "Março"; }
	else if(month == 4) { mtext = "Abril"; }
	else if(month == 5) { mtext = "Maio"; }
	else if(month == 6) { mtext = "Junho"; }
	else if(month == 7) { mtext = "Julho"; }
	else if(month == 8) { mtext = "Agosto"; }
	else if(month == 9) { mtext = "Setembro"; }
	else if(month == 10) { mtext = "Outubro"; }
	else if(month == 11) { mtext = "Novembro"; }
	else if(month == 12) { mtext = "Dezembro"; }
	format(string, sizeof(string), "%d de %s", day, mtext);
    TextDrawSetString(Text:Textdraw1, string);
    format(string2, sizeof(string2), "%d:%d:%d", hour, minute, second);
	TextDrawSetString(Text:Textdraw2, string2);
}

public OnPlayerText(playerid, text[])
{
	new playername[MAX_PLAYER_NAME];
	GetPlayerName(playerid, playername, sizeof(playername));
	new chat[256], second, minute, hour;
	gettime(hour,minute,second);
	format(chat, sizeof(chat), "\n[%d:%d:%d]%s: %s", hour, minute, second, playername, text);
	ChatLog(chat);
	return 1;
}
public ChatLog(string[])
{
	new entry[256];
	format(entry, sizeof(entry), "%s",string);
	new File:hFile;
	hFile = fopen("Chat.log", io_append);
	fwrite(hFile, entry);
	fwrite(hFile, "\n");
	fclose(hFile);
}
