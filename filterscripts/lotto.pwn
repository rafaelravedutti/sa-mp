//##########################################
//"FilterScript Modificado por [Rockstar]Rell
//FilterScript Loteria.
//MSN:guerra_mortal@hotmail.com"
//##########################################


#define MAX_NO 60 //Max numeros da loteria
#define LOTTO_PRICE 1000 //Valor para aposta
#define HOW_LONG 270 //Tempo da loteria
#define MAX_JACKPOT 100000 //Maximo pagamento.
#define MIN_JACKPOT 10000 //Minimo pagamento.


//#define STATIC_JACKPOT

//Uncomment This If you would like the Jackpot
//To be a Permant Jackpot and not random.

//NOTE: If You Uncomment #define STATIC_JACKPOT You MUST Uncomment The winnings
//And set a Price, Otherwise It will NOT compile.


//#define STATIC_JACKPOT_WINNINGS 100

//Uncomment This to set your Static Jackpot Winnings.


//==============================================================================
//NOTE: There is no need to edit under this line.









new Lottery;
new LottoEnabled;

#include <a_samp>
public OnFilterScriptInit( )
{
	print("-------------------------------------------------------------");
	print("------------Loteria [Rockstar] Filter------------------------");
	print("-------------Created By Grove/Jay----------------------------");
	print("-------------------Loaded!-----------------------------------");
	print("-------------------------------------------------------------");
	Lottery = SetTimer("lottery",HOW_LONG*1000, 1);
	LottoEnabled = 1;
}

public OnFilterScriptExit( )
{
	print("-------------------------------------------------------------");
	print("------------Loteria [Rockstar] Filter------------------------");
	print("-------------Created By Grove/Jay----------------------------");
	print("-------------------Unloaded!-----------------------------------");
	print("-------------------------------------------------------------");
}

forward lottery();
new string[256];
new playername[MAX_PLAYER_NAME];
new wonlotto[MAX_PLAYERS],donelotto[MAX_PLAYERS];
new jackpot,lotto,lotto2,lotto3,lotto4,lotto5,lotto6;
new price = LOTTO_PRICE;
new time = HOW_LONG;
#define dcmd(%1,%2,%3) if ((strcmp((%3)[1], #%1, true, (%2)) == 0) && ((((%3)[(%2) + 1] == 0) && (dcmd_%1(playerid, "")))||(((%3)[(%2) + 1] == 32) && (dcmd_%1(playerid, (%3)[(%2) + 2]))))) return 1
#define COLOR_GREEN 0x33AA33AA
#define COLOR_RED 0xAA3333AA
#define COLOR_WHITE 0xFFFFFFAA
#define COLOR_ORANGE 0xFF8040FF
#define PURPLE 0x7E00FDFF
#define RED 0xFF0000FF
#define GREEN 0x008000FF
//================================================================================
public OnPlayerCommandText(playerid, cmdtext[])
{
	dcmd(lotto,5, cmdtext);
	dcmd(lottohelp,9, cmdtext);
	dcmd(lottoon,7, cmdtext);
	dcmd(lottooff,8, cmdtext);
	dcmd(lottoprice,10, cmdtext);
	dcmd(lottery,7, cmdtext);
	dcmd(winlotto,8, cmdtext);
	dcmd(lottotime,9, cmdtext);
	return 0;
}
//================================================================================
public lottery()
{
	for(new i=0;i<MAX_PLAYERS;i++)
	{
		format(string, sizeof(string),"Loterias Servidor BRASIL: Numeros da Sorteados: %d, %d, %d, %d, %d, %d!",lotto,lotto2,lotto3,lotto4,lotto5,lotto6);
		SendClientMessage(i,PURPLE,string);
		SendClientMessage(i,COLOR_GREEN,"Quer jogar na loteria? escolha um numero e digite /lotto [NUMERO]!");
		jackpot = JackpotTotal();
		lotto = random(MAX_NO+1);
		lotto2 = random(MAX_NO+1);
		lotto3 = random(MAX_NO+1);
		lotto4 = random(MAX_NO+1);
		lotto5 = random(MAX_NO+1);
		lotto6 = random(MAX_NO+1);
		#if defined STATIC_JACKPOT
			format(string, sizeof(string),"Loterias Servidor BRASIL: O premio é de %d para quem acertar!",STATIC_JACKPOT_WINNINGS);
			SendClientMessage(i,COLOR_GREEN,string);
		#else
			format(string, sizeof(string),"Loterias Servidor BRASIL: O premio de hoje é $%d!",jackpot);
			SendClientMessage(i,COLOR_GREEN,string);
		#endif

		if (wonlotto[i] ==1)
		{

			#if defined STATIC_JACKPOT
				GetPlayerName(i, playername, MAX_PLAYER_NAME);
				format(string, sizeof(string),"Loterias Servidor BRASIL: %s (ID:%d) Ganhou o premio da loteria de $%d!",playername,i,STATIC_JACKPOT_WINNINGS);
				SendClientMessageToAll(COLOR_ORANGE,string);
				GivePlayerMoney(i,STATIC_JACKPOT_WINNINGS);
				GameTextForPlayer(i,"~g~$$$ !!!! Ganhador !!!! $$$",5000,5);
			#else
				GetPlayerName(i, playername, MAX_PLAYER_NAME);
				format(string, sizeof(string),"Loterias Servidor BRASIL: %s (ID:%d) Ganhou a loteria!uma aposta de $%d",playername,i,jackpot);
				SendClientMessageToAll(COLOR_ORANGE,string);
				GameTextForPlayer(i,"~g~$$$ !!!! Ganhador !!!! $$$",5000,5);
			#endif

			GivePlayerMoney(i,jackpot);
			donelotto[i] =0;
			wonlotto[i] =0;
			return 1;
		}

		if(wonlotto[i] == 0 && donelotto[i] == 1)
		{
			SendClientMessage(i,COLOR_RED,"Loterias Servidor BRASIL: Você não ganhou! tente outra vez!");
			donelotto[i] =0;
			wonlotto[i] =0;
			return 1;
		}
	}
	return 1;
}



dcmd_lotto(playerid, params[])
{
	new cmd[256];
	new idx;
	cmd = strtok(params, idx);
	if(!strlen(params)) return SendClientMessage(playerid,COLOR_WHITE,"Use: /lotto [numero]");
	if(!LottoEnabled) return SendClientMessage(playerid,RED,"Nenhuma loteria foi aberta!");
	new number = strval(params);

	if(number > MAX_NO)
	{
		format(string, sizeof(string),"Você não pode escolher um numero mais alto que %d!",MAX_NO);
		SendClientMessage(playerid,COLOR_RED,string);
		return 1;
	}

	if(GetPlayerMoney(playerid) < price )
	{
		format(string, sizeof(string),"Você não tem dinheiro para a aposta você precisa pelo menos $%d",price);
		SendClientMessage(playerid,COLOR_RED,string);
		SendClientMessage(playerid,COLOR_RED,"Comprar um bilhete de lotto!");
		return 1;
	}

	if(donelotto[playerid]) return SendClientMessage(playerid,RED,"A loto tem que estar on!");
	if(number == lotto || number == lotto2 || number == lotto3 || number == lotto4 || number == lotto5 || number == lotto6)
	{
		wonlotto[playerid] =1;
		format(string, sizeof(string),"Você escolheu um numero com sucesso %d on.",number);
		SendClientMessage(playerid,GREEN,string);
		donelotto[playerid] =1;
		GivePlayerMoney(playerid,-price);
	}else{
		format(string, sizeof(string),"Você escolheu um numero com sucesso %d on.",number);
		SendClientMessage(playerid,GREEN,string);
		donelotto[playerid] =1;
		GivePlayerMoney(playerid,-price);
	}
	return 1;
}

dcmd_lottohelp(playerid, params[])
{
	SendClientMessage(playerid,GREEN,"O lotto é um jogo que você ganha, Dinheiro");
	SendClientMessage(playerid,GREEN,"Jogue e se divirta.");
	SendClientMessage(playerid,GREEN,"Os resultados são divulgados e etc...");
	SendClientMessage(playerid,GREEN,"O premio sempre muda.");
	format(string, sizeof(string),"Para apostar na lotto custa $%d!",price);
	SendClientMessage(playerid,COLOR_RED,string);
	format(string, sizeof(string),"E você deve escolhe um número entre 0 e %d.",MAX_NO);
	SendClientMessage(playerid,COLOR_RED,string);
	#pragma unused params
	return 1;
}

dcmd_lottoon(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return false;
	if(LottoEnabled) return SendClientMessage(playerid,RED,"Loteria ligada!");
	SendClientMessageToAll(COLOR_ORANGE,"Loteria foi ativada.");
	Lottery = SetTimer("lottery",time*1000, 1);
	SendClientMessage(playerid,GREEN,"Loteria ativa com sucesso.");
	LottoEnabled = 1;
	#pragma unused params
	return 1;
}

dcmd_lottooff(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return false;
	if(!LottoEnabled) return SendClientMessage(playerid,RED,"Loteria desligada!");
	SendClientMessageToAll(COLOR_ORANGE,"Loteria desabilitada!");
	KillTimer(Lottery);
	SendClientMessage(playerid,GREEN,"Loteria desativada com sucesso.");
	LottoEnabled = 0;
	#pragma unused params
	return 1;
}

dcmd_lottoprice(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return false;
	new no = strval(params);
	if(!strlen(params)) return SendClientMessage(playerid,COLOR_WHITE,"Usage: /lottoprice [price]");
	if(no == price) return SendClientMessage(playerid,RED,"Os bilhetes ja estão com este preço!");
	price = no;
	format(string,256,"Bilhete agora custa $%d para comprar um bilhete da lotto.",price);
	SendClientMessageToAll(COLOR_ORANGE,string);
	return 1;
}

dcmd_lottery(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return false;
	lottery();
	SendClientMessage(playerid,GREEN,"Você esta na loteria.");
	#pragma unused params
	return 1;
}
dcmd_winlotto(playerid, params[])
{
	if(!strlen(params)) return SendClientMessage(playerid,COLOR_WHITE,"Usage: /winlotto [id]");
	new endid = strval(params);
	if(!IsPlayerConnected(endid)) return SendClientMessage(playerid,RED,"Invalid Player ID!");
	if(!IsPlayerAdmin(playerid)) return false;
	new name[MAX_PLAYER_NAME];
	GetPlayerName(endid, name, MAX_PLAYER_NAME);
	format(string,256,"You have forced %s (ID: %d) To Win the Next Lotto Draw!",name,endid);
	SendClientMessage(playerid,COLOR_GREEN,string);
	wonlotto[endid] =1;
	donelotto[endid] =1;
	return 1;
}

dcmd_lottotime(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return false;
	new newtime = strval(params);
	if(!strlen(params)) return SendClientMessage(playerid,COLOR_WHITE,"Usage: /lottotime [seconds]");
	if(newtime == time) return SendClientMessage(playerid,RED,"The Lottery already Draws that Often!");
	time = newtime;
	format(string,256,"The Lotto will now be drawn every %d Seconds!",time);
	SendClientMessageToAll(COLOR_ORANGE,string);
	KillTimer(Lottery);
	Lottery = SetTimer("lottery",time*1000, 1);
	return true;
}


public OnPlayerConnect(playerid)
{
	donelotto[playerid] =0;
	wonlotto[playerid] =0;
	return 1;
}


stock JackpotTotal()
{
	new randnum = random(MAX_JACKPOT-MIN_JACKPOT);
	return randnum+MIN_JACKPOT;
}

strtok(const str1[], &index)
{
	new length = strlen(str1);
	while ((index < length) && (str1[index] <= ' '))
	{
		index++;
	}

	new offset = index;
	new result[20];
	while ((index < length) && (str1[index] > ' ') && ((index - offset) < (sizeof(result) - 1)))
	{
		result[index - offset] = str1[index];
		index++;
	}
	result[index - offset] = EOS;
	return result;
}


//ENDOF
//Next Update v0.6 Coming Soon!
//Features:
//Choose up to 6 numbers - Confgurable!
//Choose your own Prize! Weapons? Money? Armour? Health?

