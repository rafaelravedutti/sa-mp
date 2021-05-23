#include <a_samp>
#include <a_objects>
#include <a_players>
#include <dudbreload>
#include <c_vehicleinfo>
#include <string>
#include <dini>

//cores
#define COR_INVISIVEL           0xFFFFFF00
#define COR_VERDEC              0x00FDA1AA
#define COR_VERDED              0x55EfA8AA
#define COR_NADA                0xAAAAAAAA
#define COR_GARI                0x1F4B2BAA
#define COR_AMARELOB            0xF0E68CAA
#define COR_AZULB               0x057ABDAA
#define COR_VERDEB              0x45804FAA
#define COR_VERDE               0x33AA33AA
#define COR_AMARELO             0xFFFF00AA
#define COR_CINZA               0xAFAFAFAA
#define COR_VERDE_ESCURO        0x336600AA
#define COR_VERMELHO            0xDD0000FF
#define COR_AMARELO_CLARO       0xF0E68CAA
#define COR_AMARELO_SCLARO      0xFFFFCCAA
#define COR_AMARELO             0xFFFF00AA
#define COR_BRANCO              0xFFFFFFAA
#define COR_CINZA               0xAFAFAFAA
#define COR_LARANJA             0xFF9900AA
#define COR_PRETO               0x000000AA
#define COR_ROSA                0xFF00FFAA
#define COR_AZUL                0x0099FFAA
#define COR_AZUL_ESCURO         0x6600CCAA
#define COR_AZUL_CLARO          0x56EADAAA

//cores das profissões
#define COR_DESEMPREGADO        0xCBCBCBAA
#define COR_ENTREGADOR_PIZZA    0xFFF297AA
#define COR_BARMAN              0xB2FB92AA
#define COR_SORVETEIRO          0xFF91ECAA
#define COR_VENDEDOR_LANCHES    0xBDD94CFF
#define COR_PARAMEDICO          0xFF9191FF
#define COR_INSTRUTOR           0xFF7200FF
#define COR_FRENTISTA           0x662228FF
#define COR_TAXISTA             0xFFFC00AA
#define COR_MOTO_TAXI           0xC3C105AA
#define COR_TAXI_AEREO          0xC6C55EAA
#define COR_SEQUESTRADOR        0xFF5A00AA
#define COR_ASSASSINO           0xD22402AA
#define COR_ASSALTANTE          0xFE684BFF
#define COR_LADRAO_CARROS       0xCE2A2AFF
#define COR_TRAFICANTE          0xD94242FF
#define COR_VENDEDOR_ARMAS      0xAC5050FF
#define COR_CACADOR             0xAB2DCFAA
#define COR_PESCADOR            0xE89AFFAA
#define COR_AGRICULTOR          0x9AFFDDAA
#define COR_COP_CIVIL           0x9EB3FFAA
#define COR_COP_ELITE           0x4C62B3AA
#define COR_COP_RODOVIARIO      0x4970FFAA
#define COR_DELEGADO            0x0024ACAA
#define COR_JUIZ                0x7585C0AA
#define COR_NARCOTICOS          0xD7DFFFAA
#define COR_POLICIA_FLORESTAL   0x00FFEAFF
#define COR_IBAMA               0x04AB6EAA
#define COR_EXERCITO            0x1B7A01AA
#define COR_ADVOGADO            0x5CFFFDAA
#define COR_SEGURANÇA           0x81ABABAA
#define COR_MOTORISTA           0x2CCC6CAA
#define COR_MOTORISTA_ONIBUS    0x66E3DFAA
#define COR_MENDIGO             0xC19100AA
#define COR_VENDEDOR            0xADFF0EAA
#define COR_CORRETOR            0x77913AAA
#define COR_SEGURADOR           0xEEFFC4AA
#define COR_JORNALISTA          0xFEFFFAAA
#define COR_CAMINHONEIRO        0xACAC00FF
#define COR_TRANSPORTE_GAS      0x444444FF
#define COR_ALUGUEL_DE_CARROS   0xFEE765AA
#define COR_MECANICO            0x00BC6FAA
#define COR_CONFISCADOR         0xBC8F8FAA
#define COR_CONTRABANDISTA      0x34A2C6AA
#define COR_RECEITA_FEDERAL     0x34C6ACAA
#define COR_JUSTICA_FEDERAL     0xC73614AA
#define COR_LIDER_DE_TRAFICO    0x9B3B0CAA
#define COR_PREFEITO            0x00E020AA
#define COR_GOVERNADOR          0x8EE000AA
#define COR_PRESIDENTE          0xA6FEFDAA
#define COR_PROMOTER            0x25CE98AA
#define COR_SERVICO_RECICLAGEM  0xFCFE5CAA
#define COR_PEDREIRO            0xE2E2E2AA
#define COR_VENDEDOR_DE_BOMBAS  0xEFAB3FAA
#define COR_PROSTITUTA          0xFD23F0AA
#define COR_XERIFE              0x6A641EAA
#define COR_TRANSPORTE_VALORES  0x517C2EAA
//id's das Profissoes
#define DESEMPREGADO          1  // sim*
#define ENTREGADOR_PIZZA      2  // sim*
#define BARMAN                3  // sim*
#define SORVETEIRO            4  // sim*
#define VENDEDOR_LANCHE       5  // sim*
#define PARAMEDICO            6  // sim*
#define INSTRUTOR_DE_DIRECAO  7  // sim*
#define FRENTISTA             8  // sim*
#define TAXISTA               9  // sim*
#define MOTO_TAXI             10 // sim*
#define TAXI_AEREO            11 // sim*
#define SEQUESTRADOR          12 // sim*
#define ASSASSINO             13 // sim*
#define ASSALTANTE            14 // sim*
#define LADRAO_CARROS         15 // sim*
#define TRAFICANTE            16 // sim*
#define VENDEDOR_DE_ARMAS     17 // sim*
#define CACADOR               18 // sim*
#define PESCADOR              19 // sim*
#define AGRICULTOR            20 // sim*
#define COP_CIVIL             21 // sim*
#define COP_RODOVIARIO        22 // sim*
#define COP_ELITE             23 // sim*
#define DELEGADO              24 // sim*
#define JUIZ                  25 // sim*
#define NARCOTICOS            26 // sim*
#define POLICIA_FLORESTAL     27 // sim*
#define IBAMA                 28 // sim*
#define EXERCITO              29 // sim*
#define ADVOGADO              30 // sim*
#define SEGURANÇA             31 // sim*
#define MOTORISTA_PARTICULAR  32 // sim*
#define MOTORISTA_DE_ONIBUS   33 // sim*
#define MENDIGO               34 // sim*
#define VENDEDOR_DE_CARROS    35 // sim*
#define CORRETOR              36 // sim*
#define SEGURADOR             37 // sim*
#define JORNALISTA            38 // sim*
#define CAMINHONEIRO          39 // sim*
#define TRANSPORTE_GAS        40 // sim*
#define ALUGUEL_DE_CARROS     41 // sim*
#define MECANICO              42 // sim*
#define CONFISCADOR           43 // sim*
#define CONTRABANDISTA        44 // sim*
#define RECEITA_FEDERAL       45 // sim*
#define JUSTICA_FEDERAL       46 // sim*
#define LIDER_DE_TRAFICO      47 // sim*
#define PREFEITO              48 // sim*
#define GOVERNADOR            49 // sim*
#define PRESIDENTE            50 // sim*
#define PROMOTER              51 // sim*
#define SERVICO_RECICLAGEM    52 // sim*
#define PEDREIRO              53 // sim*
#define VENDEDOR_DE_BOMBAS    54 // sim*
#define PROSTITUTA            55 // sim*
#define XERIFE                56 // sim*
#define TRANSPORTE_VALORES    57 // sim*
//Veiculos
#define QTCARS        157
//Convites
#define INVITE_NONE     0
#define INVITE_FIANCA   1
#define INVITE_CARRO    2
#define INVITE_CASA     3
#define INVITE_RESGATE  4
#define INVITE_FRETE    5
//CHECKPOINTS
#define CHECKPOINT_NONE         0
#define CHECKPOINT_TERMINAL     1
#define CHECKPOINT_TERMINAL2    2
#define CHECKPOINT_TERMINAL3    3
#define CHECKPOINT_TERMINAL4    4
#define CHECKPOINT_TERMINAL5    5
#define CHECKPOINT_TERMINAL6    6
#define CHECKPOINT_TERMINAL7    7
#define CHECKPOINT_TERMINAL8    8
#define CHECKPOINT_TERMINAL9    9
#define CHECKPOINT_TERMINAL10   10
#define CHECKPOINT_TERMINAL11   11
#define CHECKPOINT_TERMINAL12   12
#define CHECKPOINT_TERMINAL13   13
#define CHECKPOINT_TERMINAL14   14
#define CHECKPOINT_TERMINAL15   15
#define CHECKPOINT_TERMINAL16   16
#define CHECKPOINT_TERMINAL17   17
#define CHECKPOINT_TERMINAL18   18
#define CHECKPOINT_VIAGEMSFLV   19
#define CHECKPOINT_VIAGEMSFLV2  20
#define CHECKPOINT_VIAGEMLVSF   21
#define CHECKPOINT_VIAGEMLVSF2  22
#define CHECKPOINT_CATANDOLATAS 23
#define CHECKPOINT_REVISAO      24
#define CHECKPOINT_REVISAO2     25
#define CHECKPOINT_REVISAO3     26
#define CHECKPOINT_EMPRESA		27
#define CHECKPOINT_POSTO		28
//Entregas
#define MAX_ENTREGASTIPE        11
#define MAX_POSTOS				4

/*

AddPlayerClass(0,-766.1925,1514.4570,26.0724,295.3321,0,0,0,0,0,0); // terminalLBFC
AddPlayerClass(0,4.6214,1143.7090,19.5938,110.4903,0,0,0,0,0,0); // terminalLBFC
AddPlayerClass(0,-255.7915,1191.5803,19.7422,199.2396,0,0,0,0,0,0); // terminalLBFC
AddPlayerClass(0,-753.2963,1496.5587,25.1493,359.8477,0,0,0,0,0,0); // terminalLBFC
AddPlayerClass(0,-843.7271,1623.9858,27.1277,64.4204,0,0,0,0,0,0); // terminalLBFC
AddPlayerClass(0,-160.3767,1233.9480,19.7422,275.4782,0,0,0,0,0,0); // terminalLBFC
*/
#define CallCost 0
#define fixchars(%1) for(new charfixloop=0;charfixloop<strlen(%1);charfixloop++)if(%1[charfixloop]<0)%1[charfixloop]+=256
#define dcmd(%1,%2,%3) if ((strcmp(%3, "/%1", true, %2+1) == 0)&&(((%3[%2+1]==0)&&(dcmd_%1(playerid,"")))||((%3[%2+1]==32)&&(dcmd_%1(playerid,%3[%2+2]))))) return 1

/*//armas
new ArmaName[][] = {
"Invalido",
"Taco de Golf.",
"NiteStick.",
"KNife.",
"Bat.",
"Shovel.",
"PoolCue.",
"Katana.",
"Chainsaw.",
"Vibrador.",
"Vibrador.",
"Vibrador.",
"Vibrador.",
"Flor.",
"Cane.",
"Colt45.",
"45 com Silenciador.",
"Desert Eagle.",
"Shotgun.",
"Sawnoff.",
"Combat Shotgun.",
"Micro UZI.",
"MP5.",
"AK47.",
"M4.",
"Tec9.",
"FlameThrower.",
"Minigun.",
"Spray.",
"Extintor.",
"Paraquedas.",
"Katana."
};*/

//cachorros quentes
new HotDogName[] ={
"Invalido",
"Você comeu um cachorro quente prensado. Bom Lanche.",
"Você comeu um cachorro quente tradicional. Bom Lanche."
};
//sorvetes
new SaborName[][] = {
"Invalido",
"Morango",
"Leite Condensado",
"Flocos",
"Creme",
"Doce de Leite",
"Coco",
"Tutti-frutti"
};

//profissoes
new ProfName[][] = {
"Invalida",
"Desempregado",
"Entregador de Pizza",
"Barman",
"Sorveteiro",
"Vendedor de Lanches",
"Paramedico",
"Instrutor de Direcao",
"Frentista",
"Taxista",
"Moto Taxista",
"Taxista Aereo",
"Sequestrador",
"Assassino",
"Assaltante",
"Ladrao de Carros",
"Traficante",
"Vendedor de Armas",
"Caçador",
"Pescador",
"Agricultor",
"Policial Civil",
"Policial Rodoviario",
"S.W.A.T",
"Delegado",
"Juiz",
"Narcoticos",
"Policia Florestal",
"Ibama",
"Exercito",
"Advogado",
"Seguranca",
"Motorista Particular",
"Motorista de Onibus",
"Mendigo",
"Vendedor de Carros",
"Corretor de Imoveis",
"Segurador",
"Jornalista",
"Caminhoneiro",
"Transportador de Combustivel",
"Aluguel de Carros",
"Mecanico",
"Fiscalizador de Veiculos",
"Contrabandista",
"Receita Federal",
"Justica Federal",
"Lider de Tráfico",
"Prefeito",
"Governador",
"Presidente",
"Promoter",
"Servico de Reciclagens",
"Pedreiro",
"Vendedor de bombas",
"Prostituta",
"Xerife",
"Transporte de Valores"
};



new ValorSalarios[] ={
0,
350,
850,
850,
350,
650,
650,
600,
650,
900,
650,
1050,
550,
650,
750,
550,
550,
700,
750,
650,
850,
1200,
1200,
2500,
3000,
3200,
2800,
1100,
1100,
3500,
1600,
850,
800,
900,
200,
600,
600,
600,
950,
650,
600,
1000,
800,
600,
800,
2800,
4000,
2000,
2500,
3500,
5000,
900,
800,
550,
400,
3000,
1800,
1400
};

new Salarios[] [] ={
"Invalido",//invalido
"O Governo depositou seu Seguro Desemprego: R$350",//desempregado
"A Pizzaria depositou seu salário: R$850",//entregador de pizza
"O Bar depositou seu salário: R$850",//barman
"A Sorveteria depositou seu salário: R$350",//sorveteiro
"A Lancheteria Pine depositou seu salário: R$650",//vendedor de lanches
"O Hospital depositou seu salário: R$650",//paramedio
"A Auto-Escola depositou seu salário: R$600",//instrutor
"O Posto de Gasolina depositou seu salário: R$650",//frenstista
"A Cooperativa de Taxistas de San Andreas depositou seu salário: R$900",//taxista
"A Cooperativa de Taxistas de San Andreas depositou seu salário: R$650",//mototaxi
"A Cooperativa de Taxistas de San Andreas depositou seu salário: R$1050",//taxiaereo
"O seu chefe depositou seu salário: R$550",//sequestrador
"O seu chefe depositou sua porcentagem: R$650",//assassino
"O seu chefe depositou sua porcentagem: R$750",//assaltante
"O desmanche depositou a sua porcentagem: R$550",//ladrao de caros
"O chefe da boca de fumo depositou a sua porcentagem: R$550",//traficante
"A Ammu-Nattion depositou seu salário: R$700",//vendedor de armas
"A Cooperativa de caça de San Andreas depositou seu salário: R$750",//caçador
"A Cooperativa de Pesca San Andreas depositou seu salário: R$650",//pescador
"A Fazenda depositou seu salário: R$850",//agricultor
"O Governo depositou seu salário: R$1200",//cop civil
"O Governo depositou seu salário: R$1200",//cop rodoviaro
"O Governo depositou seu salário: R$2500",//cop elite
"O Governo depositou seu salário: R$3000",//delegado
"O Governo depositou seu salário: R$3200",//juiz
"O Governo depositou seu salário: R$2800",//narcoticos
"O Governo depositou seu salário: R$1100",//policia florestal
"O Governo depositou seu salário: R$1100",//ibama
"O Governo depositou seu salário: R$3500",//exercito
"O Escritorio de Advogacia depositou seu salário: R$1600",//advogado
"A Reload Seguros depositou seu salário: R$850",//segurança
"O Sindicato dos Motorista de San Andreas depositou seu salário: R$800",//motorista
"A Angel Pine Turismo depositou seu salário: R$900",//motorista de onibus
"O Governo depositou seu seguro mendigo: R$200",//mendigo
"A Consecionaria depositou seu salário: R$600",//vendedor de carros
"A Imobiliaria depositou deu salário: R$600",//corretor de imoveis
"A Reload Seguros SA depositou deu salário: R$600",//segurador
"O Departamento de Imprensa e Propaganda depositou deu salário: R$950",//jornalista
"A Cooperativa de cargas de Angel Pine depositou seu salário: R$650",//caminhoneiro
"A Refinaria depositou seu salário: R$600",//tranportador de comb
"A Agencia de Locador de Carros lhe depositou seu salario: R$1000",//locador
"A Oficina lhe depositou seu salario: R$800",//mecanico
"A Agencia de transito lhe depositou seu salario: R$600",//confiscador
"Você recebeu o dinheiro dos contrabandos: R$800",//contrabandista
"O Governo depositou seu salário: R$2800",//receita federal
"O Governo depositou seu salário: R$4000",//justiça federal
"Você recebeu os lucros do trafico de drogas da cidade: R$2000",//lider de tráfico
"O Governo depositou seu salário: R$2500",//prefeito
"O Governo depositou seu salário: R$3500",//governador
"O Governo depositou seu salário: R$5000",//presidente
"O Governo depositou seu salário: R$900",//promoter
"A empresa de reciclagens lhe depositou seu salário: R$800",//serviço de reciclagens
"A empresa de construção de imóveis lhe depositou seu salário: R$550",//pedreiro
"A loja de dinamites lhe depositou seu salário: R$400",//vendedor de bombas
"O Clube lhe depositou seu salário: R$3000",//prostituta
"A delegacia de Angel Pine depositou seu salário: R$1800",//xerife
"O Governo depositou seu salário: R$1400"
};

new ProfCores[] ={
COR_DESEMPREGADO,
COR_ENTREGADOR_PIZZA,
COR_BARMAN,
COR_SORVETEIRO,
COR_VENDEDOR_LANCHES,
COR_PARAMEDICO,
COR_INSTRUTOR,
COR_FRENTISTA,
COR_TAXISTA,
COR_MOTO_TAXI,
COR_TAXI_AEREO,
COR_SEQUESTRADOR,
COR_ASSASSINO,
COR_ASSALTANTE,
COR_LADRAO_CARROS,
COR_TRAFICANTE,
COR_VENDEDOR_ARMAS,
COR_CACADOR,
COR_PESCADOR,
COR_AGRICULTOR,
COR_COP_CIVIL,
COR_COP_ELITE,
COR_COP_RODOVIARIO,
COR_DELEGADO,
COR_JUIZ,
COR_NARCOTICOS,
COR_POLICIA_FLORESTAL,
COR_IBAMA,
COR_EXERCITO,
COR_ADVOGADO,
COR_SEGURANÇA,
COR_MOTORISTA,
COR_MOTORISTA_ONIBUS,
COR_MENDIGO,
COR_VENDEDOR,
COR_CORRETOR,
COR_SEGURADOR,
COR_JORNALISTA,
COR_CAMINHONEIRO,
COR_TRANSPORTE_GAS,
COR_MECANICO,
COR_ALUGUEL_DE_CARROS,
COR_CONFISCADOR,
COR_CONTRABANDISTA,
COR_RECEITA_FEDERAL,
COR_JUSTICA_FEDERAL,
COR_LIDER_DE_TRAFICO,
COR_PREFEITO,
COR_GOVERNADOR,
COR_PRESIDENTE,
COR_PROMOTER,
COR_SERVICO_RECICLAGEM,
COR_PEDREIRO,
COR_VENDEDOR_DE_BOMBAS,
COR_PROSTITUTA,
COR_XERIFE,
COR_TRANSPORTE_VALORES
};

new Float:ProfPos[58] [3] ={
{0.0,0.0,0.0},//invalido
{0.0,0.0,0.0},//desempregado
{-1805.1130,948.6368,24.8906},//entregador de pizza
{-2244.1035,-89.8179,35.3203},//barman
{-2097.6360,-2348.1455,30.6250},//sorveteiro
{-2333.7896,-167.2186,35.5547},//vendedor de lanches
{-2620.2874,629.6313,14.4531},//paramedico
{-2026.2343,-98.7060,35.1641},//instrutor
{-1675.9708,431.7278,7.1797},//frentista
{-1754.8579,961.1520,24.8828},//taxista
{-1754.8579,961.1520,24.8828},//mototaxi
{-1754.8579,961.1520,24.8828},//taxi AEREO
{-365.7678,1166.3445,19.7422},//sequestrador
{-365.7678,1166.3445,19.7422},//assassino
{-365.7678,1166.3445,19.7422},//assaltante
{-365.7678,1166.3445,19.7422},//ladrao de carros
{-365.7678,1166.3445,19.7422},//traficante
{-365.7678,1166.3445,19.7422},//vendedor de armas
{-1605.3073,718.3339,11.9387},//cacador
{-1605.3073,718.3339,11.9387},//pescador
{-1605.3073,718.3339,11.9387},//agricultor
{-1605.3073,718.3339,11.9387},//cop civil
{-1605.3073,718.3339,11.9387},//cop rodoviario
{-1605.3073,718.3339,11.9387},//cop elite
{-1605.3073,718.3339,11.9387},//delegado
{-1605.3073,718.3339,11.9387},//juiz
{-1605.3073,718.3339,11.9387},//narcoticos
{-2163.1667,-2387.7739,30.6250},//policia florestal
{-2163.1667,-2387.7739,30.6250},//ibama
{-1310.9027,472.2223,7.1875},//exercito
{-1938.5940,569.9607,35.2899},//advogado
{-2180.6013,-2401.2395,30.6250},//segurança
{-1754.8579,961.1520,24.8828},//motorista particular
{-1938.5940,569.9607,35.2899},//motorista de onibus
{-2085.4712,-2448.2737,30.6250},//mendigo
{-1652.3525,1207.9297,7.2500},//vendedor de carros
{-1652.3525,1207.9297,7.2500},//corretor de imoveis
{-1652.3525,1207.9297,7.2500},//segurador
{-2521.2449,-624.7714,132.7831},//jornalsita
{-2097.3877,-2255.6489,30.6250},//camioneiro
{295.6498,1385.6342,10.1560},//transporte de gas
{-1652.3525,1207.9297,7.2500},//locador de carros
{-1652.3525,1207.9297,7.2500},//mecanico
{-1652.3525,1207.9297,7.2500},//fiscalizador
{-365.7678,1166.3445,19.7422},//contrabandista
{-1605.3073,718.3339,11.9387},//receita federal
{-1605.3073,718.3339,11.9387},//justiça federal
{-365.7678,1166.3445,19.7422},//lider de trafico
{-1605.3073,718.3339,11.9387},//prefeito
{-1605.3073,718.3339,11.9387},//governador
{-1605.3073,718.3339,11.9387},//presidente
{-1605.3073,718.3339,11.9387},//promoter
{-1605.3073,718.3339,11.9387},//serviço de reciclagens
{-2061.9741,266.4560,35.6283},//pedreiro
{-365.7678,1166.3445,19.7422},//vendedor de bombas
{-365.7678,1166.3445,19.7422},//prostituta
{-2163.1667,-2387.7739,30.6250},//xerife
{-2873.9321,1049.4137,33.3147}//transporte de valores
};



new ProfSkin[58] ={
0,//invalido
0,//desempregado
155,//entregador de pizza
240,//barman
188,//sorveteiro
98,//vendedor de lanches
70,//paramedico
250,//instrutor
184,//frentista
234,//taxista
234,//mototaxi
234,//taxi AEREO
66,//sequestrador
101,//assassino
28,//assaltante
22,//ladrao de carros
19,//traficante
101,//vendedor de armas
133,//caçador
35,//pescador
160,//agricultor
280,//cop civil
288,//cop rodoviario
285,//cop elite
125,//delegado
59,//juiz
46,//narcoticos
127,//policia florestal
98,//ibama
287,//exercito
147,//advogado
165,//segurança
255,//motorista particular
124,//motorista de onibus
200,//mendigo
147,//vendedor de carros
187,//corretor de imoveis
126,//segurador
186,//jornalista
124,//camioneiro
125,//transporte de gas
187,//locador de carros
50,//mecanico
71,//fiscalizador
121,//contrabandista
240,//receita federal
228,//justiça federal
28,//lider de trafico
59,//prefeito
186,//governador
17,//presidente
60,//promoter
16,//serviço de reciclagens
27,//pedreiro
230,//vendedor de bombas
246,//prostituta
34,//xerife
120//transporte de valores
};

//latinhas
new Float:Latinhas[23][3] = {
	{-2226.9998,-114.1161,35.3203},
	{-2579.2798,240.0270,9.5313},
	{-2451.9453,974.6096,45.2969},
	{-2283.1306,1220.6294,48.9928},
	{-1706.0125,1209.3611,25.1072},
	{-1678.4209,438.6348,7.1797},
	{-1981.3370,148.3874,27.6875},
	{-2289.4851,556.9442,36.5137},
	{-2718.1558,459.5445,4.3546},
	{-2759.8330,556.6086,14.5547},
	{-2520.9822,637.6674,28.2126},
	{-2535.0242,720.1595,28.1156},
	{-2535.5618,837.4432,49.9768},
	{-2534.9985,936.6038,65.0912},
	{-2536.5247,1084.7290,55.7266},
	{-2650.9133,53.4096,4.1722},
	{-2655.3955,71.6940,4.1054},
	{-2652.3042,92.5402,4.0960},
	{-2655.6499,114.9717,4.1046},
	{-2652.9666,132.9274,4.1797},
	{-2656.7048,135.3328,4.1797},
	{-2278.0525,655.8920,49.4453},
	{-2277.6912,697.3953,49.4453}
};

//vendedor de lanches
new LancheName[][] = {
"Invalido",
"Você comeu um X-Bacon. Bom Lanche!",
"Você comeu um X-Burguer. Bom Lanche!",
"Você comeu um X-Salada. Bom Lanche!",
"Você comeu um X-Tudo. Bom Lanche!"
};

new BebidaName[][] = {
"Invalida",
"Coca Cola",
"Sukita",
"Guaraná",
"Soda"
};
//ventregador pizza
new PizzaName[][] = {
"Invalido",
"4 Queijos",
"Calabresa",
"Frango Catupiry",
"Presunto e Queijo"
};

//Carteiras
new CarteiraName[][] = {
"Invalida",
"Terreste",
"Aerea",
"Nautica"
};

//Nomes das carteiras
new NameCarteira[] [] = {
"NÃO",
"SIM"
};
enum zoneinfo {
	zone_name[27],
    Float:zone_minx,
    Float:zone_miny,
    Float:zone_minz,
    Float:zone_maxx,
    Float:zone_maxy,
    Float:zone_maxz
}

new Float:zones[][zoneinfo] = {
{ "'The Big Ear'",                -410.00,  1403.30,    -3.00,  -137.90,  1681.20,   200.00},
{ "Aldea Malvada",               -1372.10,  2498.50,     0.00, -1277.50,  2615.30,   200.00},
{ "Angel Pine",                  -2324.90, -2584.20,    -6.10, -1964.20, -2212.10,   200.00},
{ "Arco del Oeste",               -901.10,  2221.80,     0.00,  -592.00,  2571.90,   200.00},
{ "Avispa Country Club",         -2646.40,  -355.40,     0.00, -2270.00,  -222.50,   200.00},
{ "Avispa Country Club",         -2831.80,  -430.20,    -6.10, -2646.40,  -222.50,   200.00},
{ "Avispa Country Club",         -2361.50,  -417.10,     0.00, -2270.00,  -355.40,   200.00},
{ "Avispa Country Club",         -2667.80,  -302.10,   -28.80, -2646.40,  -262.30,    71.10},
{ "Avispa Country Club",         -2470.00,  -355.40,     0.00, -2270.00,  -318.40,    46.10},
{ "Avispa Country Club",         -2550.00,  -355.40,     0.00, -2470.00,  -318.40,    39.70},
{ "Back o Beyond",               -1166.90, -2641.10,     0.00,  -321.70, -1856.00,   200.00},
{ "Battery Point",               -2741.00,  1268.40,    -4.50, -2533.00,  1490.40,   200.00},
{ "Bayside",                     -2741.00,  2175.10,     0.00, -2353.10,  2722.70,   200.00},
{ "Bayside Marina",              -2353.10,  2275.70,     0.00, -2153.10,  2475.70,   200.00},
{ "Beacon Hill",                  -399.60, -1075.50,    -1.40,  -319.00,  -977.50,   198.50},
{ "Blackfield",                    964.30,  1203.20,   -89.00,  1197.30,  1403.20,   110.90},
{ "Blackfield",                    964.30,  1403.20,   -89.00,  1197.30,  1726.20,   110.90},
{ "Blackfield Chapel",            1375.60,   596.30,   -89.00,  1558.00,   823.20,   110.90},
{ "Blackfield Chapel",            1325.60,   596.30,   -89.00,  1375.60,   795.00,   110.90},
{ "Blackfield Intersection",      1197.30,  1044.60,   -89.00,  1277.00,  1163.30,   110.90},
{ "Blackfield Intersection",      1166.50,   795.00,   -89.00,  1375.60,  1044.60,   110.90},
{ "Blackfield Intersection",      1277.00,  1044.60,   -89.00,  1315.30,  1087.60,   110.90},
{ "Blackfield Intersection",      1375.60,   823.20,   -89.00,  1457.30,   919.40,   110.90},
{ "Blueberry",                     104.50,  -220.10,     2.30,   349.60,   152.20,   200.00},
{ "Blueberry",                      19.60,  -404.10,     3.80,   349.60,  -220.10,   200.00},
{ "Blueberry Acres",              -319.60,  -220.10,     0.00,   104.50,   293.30,   200.00},
{ "Caligula's Palace",            2087.30,  1543.20,   -89.00,  2437.30,  1703.20,   110.90},
{ "Caligula's Palace",            2137.40,  1703.20,   -89.00,  2437.30,  1783.20,   110.90},
{ "Calton Heights",              -2274.10,   744.10,    -6.10, -1982.30,  1358.90,   200.00},
{ "Chinatown",                   -2274.10,   578.30,    -7.60, -2078.60,   744.10,   200.00},
{ "City Hall",                   -2867.80,   277.40,    -9.10, -2593.40,   458.40,   200.00},
{ "Come-A-Lot",                   2087.30,   943.20,   -89.00,  2623.10,  1203.20,   110.90},
{ "Commerce",                     1323.90, -1842.20,   -89.00,  1701.90, -1722.20,   110.90},
{ "Commerce",                     1323.90, -1722.20,   -89.00,  1440.90, -1577.50,   110.90},
{ "Commerce",                     1370.80, -1577.50,   -89.00,  1463.90, -1384.90,   110.90},
{ "Commerce",                     1463.90, -1577.50,   -89.00,  1667.90, -1430.80,   110.90},
{ "Commerce",                     1583.50, -1722.20,   -89.00,  1758.90, -1577.50,   110.90},
{ "Commerce",                     1667.90, -1577.50,   -89.00,  1812.60, -1430.80,   110.90},
{ "Conference Center",            1046.10, -1804.20,   -89.00,  1323.90, -1722.20,   110.90},
{ "Conference Center",            1073.20, -1842.20,   -89.00,  1323.90, -1804.20,   110.90},
{ "Cranberry Station",           -2007.80,    56.30,     0.00, -1922.00,   224.70,   100.00},
{ "Creek",                        2749.90,  1937.20,   -89.00,  2921.60,  2669.70,   110.90},
{ "Dillimore",                     580.70,  -674.80,    -9.50,   861.00,  -404.70,   200.00},
{ "Doherty",                     -2270.00,  -324.10,    -0.00, -1794.90,  -222.50,   200.00},
{ "Doherty",                     -2173.00,  -222.50,    -0.00, -1794.90,   265.20,   200.00},
{ "Downtown",                    -1982.30,   744.10,    -6.10, -1871.70,  1274.20,   200.00},
{ "Downtown",                    -1871.70,  1176.40,    -4.50, -1620.30,  1274.20,   200.00},
{ "Downtown",                    -1700.00,   744.20,    -6.10, -1580.00,  1176.50,   200.00},
{ "Downtown",                    -1580.00,   744.20,    -6.10, -1499.80,  1025.90,   200.00},
{ "Downtown",                    -2078.60,   578.30,    -7.60, -1499.80,   744.20,   200.00},
{ "Downtown",                    -1993.20,   265.20,    -9.10, -1794.90,   578.30,   200.00},
{ "Downtown Los Santos",          1463.90, -1430.80,   -89.00,  1724.70, -1290.80,   110.90},
{ "Downtown Los Santos",          1724.70, -1430.80,   -89.00,  1812.60, -1250.90,   110.90},
{ "Downtown Los Santos",          1463.90, -1290.80,   -89.00,  1724.70, -1150.80,   110.90},
{ "Downtown Los Santos",          1370.80, -1384.90,   -89.00,  1463.90, -1170.80,   110.90},
{ "Downtown Los Santos",          1724.70, -1250.90,   -89.00,  1812.60, -1150.80,   110.90},
{ "Downtown Los Santos",          1370.80, -1170.80,   -89.00,  1463.90, -1130.80,   110.90},
{ "Downtown Los Santos",          1378.30, -1130.80,   -89.00,  1463.90, -1026.30,   110.90},
{ "Downtown Los Santos",          1391.00, -1026.30,   -89.00,  1463.90,  -926.90,   110.90},
{ "Downtown Los Santos",          1507.50, -1385.20,   110.90,  1582.50, -1325.30,   335.90},
{ "East Beach",                   2632.80, -1852.80,   -89.00,  2959.30, -1668.10,   110.90},
{ "East Beach",                   2632.80, -1668.10,   -89.00,  2747.70, -1393.40,   110.90},
{ "East Beach",                   2747.70, -1668.10,   -89.00,  2959.30, -1498.60,   110.90},
{ "East Beach",                   2747.70, -1498.60,   -89.00,  2959.30, -1120.00,   110.90},
{ "East Los Santos",              2421.00, -1628.50,   -89.00,  2632.80, -1454.30,   110.90},
{ "East Los Santos",              2222.50, -1628.50,   -89.00,  2421.00, -1494.00,   110.90},
{ "East Los Santos",              2266.20, -1494.00,   -89.00,  2381.60, -1372.00,   110.90},
{ "East Los Santos",              2381.60, -1494.00,   -89.00,  2421.00, -1454.30,   110.90},
{ "East Los Santos",              2281.40, -1372.00,   -89.00,  2381.60, -1135.00,   110.90},
{ "East Los Santos",              2381.60, -1454.30,   -89.00,  2462.10, -1135.00,   110.90},
{ "East Los Santos",              2462.10, -1454.30,   -89.00,  2581.70, -1135.00,   110.90},
{ "Easter Basin",                -1794.90,   249.90,    -9.10, -1242.90,   578.30,   200.00},
{ "Easter Basin",                -1794.90,   -50.00,    -0.00, -1499.80,   249.90,   200.00},
{ "Easter Bay Airport",          -1499.80,   -50.00,    -0.00, -1242.90,   249.90,   200.00},
{ "Easter Bay Airport",          -1794.90,  -730.10,    -3.00, -1213.90,   -50.00,   200.00},
{ "Easter Bay Airport",          -1213.90,  -730.10,     0.00, -1132.80,   -50.00,   200.00},
{ "Easter Bay Airport",          -1242.90,   -50.00,     0.00, -1213.90,   578.30,   200.00},
{ "Easter Bay Airport",          -1213.90,   -50.00,    -4.50,  -947.90,   578.30,   200.00},
{ "Easter Bay Airport",          -1315.40,  -405.30,    15.40, -1264.40,  -209.50,    25.40},
{ "Easter Bay Airport",          -1354.30,  -287.30,    15.40, -1315.40,  -209.50,    25.40},
{ "Easter Bay Airport",          -1490.30,  -209.50,    15.40, -1264.40,  -148.30,    25.40},
{ "Easter Bay Chemicals",        -1132.80,  -768.00,     0.00,  -956.40,  -578.10,   200.00},
{ "Easter Bay Chemicals",        -1132.80,  -787.30,     0.00,  -956.40,  -768.00,   200.00},
{ "El Castillo del Diablo",       -464.50,  2217.60,     0.00,  -208.50,  2580.30,   200.00},
{ "El Castillo del Diablo",       -208.50,  2123.00,    -7.60,   114.00,  2337.10,   200.00},
{ "El Castillo del Diablo",       -208.50,  2337.10,     0.00,     8.40,  2487.10,   200.00},
{ "El Corona",                    1812.60, -2179.20,   -89.00,  1970.60, -1852.80,   110.90},
{ "El Corona",                    1692.60, -2179.20,   -89.00,  1812.60, -1842.20,   110.90},
{ "El Quebrados",                -1645.20,  2498.50,     0.00, -1372.10,  2777.80,   200.00},
{ "Esplanade East",              -1620.30,  1176.50,    -4.50, -1580.00,  1274.20,   200.00},
{ "Esplanade East",              -1580.00,  1025.90,    -6.10, -1499.80,  1274.20,   200.00},
{ "Esplanade East",              -1499.80,   578.30,   -79.60, -1339.80,  1274.20,    20.30},
{ "Esplanade North",             -2533.00,  1358.90,    -4.50, -1996.60,  1501.20,   200.00},
{ "Esplanade North",             -1996.60,  1358.90,    -4.50, -1524.20,  1592.50,   200.00},
{ "Esplanade North",             -1982.30,  1274.20,    -4.50, -1524.20,  1358.90,   200.00},
{ "Fallen Tree",                  -792.20,  -698.50,    -5.30,  -452.40,  -380.00,   200.00},
{ "Fallow Bridge",                 434.30,   366.50,     0.00,   603.00,   555.60,   200.00},
{ "Fern Ridge",                    508.10,  -139.20,     0.00,  1306.60,   119.50,   200.00},
{ "Financial",                   -1871.70,   744.10,    -6.10, -1701.30,  1176.40,   300.00},
{ "Fisher's Lagoon",              1916.90,  -233.30,  -100.00,  2131.70,    13.80,   200.00},
{ "Flint Intersection",           -187.70, -1596.70,   -89.00,    17.00, -1276.60,   110.90},
{ "Flint Range",                  -594.10, -1648.50,     0.00,  -187.70, -1276.60,   200.00},
{ "Fort Carson",                  -376.20,   826.30,    -3.00,   123.70,  1220.40,   200.00},
{ "Foster Valley",               -2270.00,  -430.20,    -0.00, -2178.60,  -324.10,   200.00},
{ "Foster Valley",               -2178.60,  -599.80,    -0.00, -1794.90,  -324.10,   200.00},
{ "Foster Valley",               -2178.60, -1115.50,     0.00, -1794.90,  -599.80,   200.00},
{ "Foster Valley",               -2178.60, -1250.90,     0.00, -1794.90, -1115.50,   200.00},
{ "Frederick Bridge",             2759.20,   296.50,     0.00,  2774.20,   594.70,   200.00},
{ "Gant Bridge",                 -2741.40,  1659.60,    -6.10, -2616.40,  2175.10,   200.00},
{ "Gant Bridge",                 -2741.00,  1490.40,    -6.10, -2616.40,  1659.60,   200.00},
{ "Ganton",                       2222.50, -1852.80,   -89.00,  2632.80, -1722.30,   110.90},
{ "Ganton",                       2222.50, -1722.30,   -89.00,  2632.80, -1628.50,   110.90},
{ "Garcia",                      -2411.20,  -222.50,    -0.00, -2173.00,   265.20,   200.00},
{ "Garcia",                      -2395.10,  -222.50,    -5.30, -2354.00,  -204.70,   200.00},
{ "Garver Bridge",               -1339.80,   828.10,   -89.00, -1213.90,  1057.00,   110.90},
{ "Garver Bridge",               -1213.90,   950.00,   -89.00, -1087.90,  1178.90,   110.90},
{ "Garver Bridge",               -1499.80,   696.40,  -179.60, -1339.80,   925.30,    20.30},
{ "Glen Park",                    1812.60, -1449.60,   -89.00,  1996.90, -1350.70,   110.90},
{ "Glen Park",                    1812.60, -1100.80,   -89.00,  1994.30,  -973.30,   110.90},
{ "Glen Park",                    1812.60, -1350.70,   -89.00,  2056.80, -1100.80,   110.90},
{ "Green Palms",                   176.50,  1305.40,    -3.00,   338.60,  1520.70,   200.00},
{ "Greenglass College",            964.30,  1044.60,   -89.00,  1197.30,  1203.20,   110.90},
{ "Greenglass College",            964.30,   930.80,   -89.00,  1166.50,  1044.60,   110.90},
{ "Hampton Barns",                 603.00,   264.30,     0.00,   761.90,   366.50,   200.00},
{ "Hankypanky Point",             2576.90,    62.10,     0.00,  2759.20,   385.50,   200.00},
{ "Harry Gold Parkway",           1777.30,   863.20,   -89.00,  1817.30,  2342.80,   110.90},
{ "Hashbury",                    -2593.40,  -222.50,    -0.00, -2411.20,    54.70,   200.00},
{ "Hilltop Farm",                  967.30,  -450.30,    -3.00,  1176.70,  -217.90,   200.00},
{ "Hunter Quarry",                 337.20,   710.80,  -115.20,   860.50,  1031.70,   203.70},
{ "Idlewood",                     1812.60, -1852.80,   -89.00,  1971.60, -1742.30,   110.90},
{ "Idlewood",                     1812.60, -1742.30,   -89.00,  1951.60, -1602.30,   110.90},
{ "Idlewood",                     1951.60, -1742.30,   -89.00,  2124.60, -1602.30,   110.90},
{ "Idlewood",                     1812.60, -1602.30,   -89.00,  2124.60, -1449.60,   110.90},
{ "Idlewood",                     2124.60, -1742.30,   -89.00,  2222.50, -1494.00,   110.90},
{ "Idlewood",                     1971.60, -1852.80,   -89.00,  2222.50, -1742.30,   110.90},
{ "Jefferson",                    1996.90, -1449.60,   -89.00,  2056.80, -1350.70,   110.90},
{ "Jefferson",                    2124.60, -1494.00,   -89.00,  2266.20, -1449.60,   110.90},
{ "Jefferson",                    2056.80, -1372.00,   -89.00,  2281.40, -1210.70,   110.90},
{ "Jefferson",                    2056.80, -1210.70,   -89.00,  2185.30, -1126.30,   110.90},
{ "Jefferson",                    2185.30, -1210.70,   -89.00,  2281.40, -1154.50,   110.90},
{ "Jefferson",                    2056.80, -1449.60,   -89.00,  2266.20, -1372.00,   110.90},
{ "Julius Thruway East",          2623.10,   943.20,   -89.00,  2749.90,  1055.90,   110.90},
{ "Julius Thruway East",          2685.10,  1055.90,   -89.00,  2749.90,  2626.50,   110.90},
{ "Julius Thruway East",          2536.40,  2442.50,   -89.00,  2685.10,  2542.50,   110.90},
{ "Julius Thruway East",          2625.10,  2202.70,   -89.00,  2685.10,  2442.50,   110.90},
{ "Julius Thruway North",         2498.20,  2542.50,   -89.00,  2685.10,  2626.50,   110.90},
{ "Julius Thruway North",         2237.40,  2542.50,   -89.00,  2498.20,  2663.10,   110.90},
{ "Julius Thruway North",         2121.40,  2508.20,   -89.00,  2237.40,  2663.10,   110.90},
{ "Julius Thruway North",         1938.80,  2508.20,   -89.00,  2121.40,  2624.20,   110.90},
{ "Julius Thruway North",         1534.50,  2433.20,   -89.00,  1848.40,  2583.20,   110.90},
{ "Julius Thruway North",         1848.40,  2478.40,   -89.00,  1938.80,  2553.40,   110.90},
{ "Julius Thruway North",         1704.50,  2342.80,   -89.00,  1848.40,  2433.20,   110.90},
{ "Julius Thruway North",         1377.30,  2433.20,   -89.00,  1534.50,  2507.20,   110.90},
{ "Julius Thruway South",         1457.30,   823.20,   -89.00,  2377.30,   863.20,   110.90},
{ "Julius Thruway South",         2377.30,   788.80,   -89.00,  2537.30,   897.90,   110.90},
{ "Julius Thruway West",          1197.30,  1163.30,   -89.00,  1236.60,  2243.20,   110.90},
{ "Julius Thruway West",          1236.60,  2142.80,   -89.00,  1297.40,  2243.20,   110.90},
{ "Juniper Hill",                -2533.00,   578.30,    -7.60, -2274.10,   968.30,   200.00},
{ "Juniper Hollow",              -2533.00,   968.30,    -6.10, -2274.10,  1358.90,   200.00},
{ "K.A.C.C. Military Fuels",      2498.20,  2626.50,   -89.00,  2749.90,  2861.50,   110.90},
{ "Kincaid Bridge",              -1339.80,   599.20,   -89.00, -1213.90,   828.10,   110.90},
{ "Kincaid Bridge",              -1213.90,   721.10,   -89.00, -1087.90,   950.00,   110.90},
{ "Kincaid Bridge",              -1087.90,   855.30,   -89.00,  -961.90,   986.20,   110.90},
{ "King's",                      -2329.30,   458.40,    -7.60, -1993.20,   578.30,   200.00},
{ "King's",                      -2411.20,   265.20,    -9.10, -1993.20,   373.50,   200.00},
{ "King's",                      -2253.50,   373.50,    -9.10, -1993.20,   458.40,   200.00},
{ "LVA Freight Depot",            1457.30,   863.20,   -89.00,  1777.40,  1143.20,   110.90},
{ "LVA Freight Depot",            1375.60,   919.40,   -89.00,  1457.30,  1203.20,   110.90},
{ "LVA Freight Depot",            1277.00,  1087.60,   -89.00,  1375.60,  1203.20,   110.90},
{ "LVA Freight Depot",            1315.30,  1044.60,   -89.00,  1375.60,  1087.60,   110.90},
{ "LVA Freight Depot",            1236.60,  1163.40,   -89.00,  1277.00,  1203.20,   110.90},
{ "Las Barrancas",                -926.10,  1398.70,    -3.00,  -719.20,  1634.60,   200.00},
{ "Las Brujas",                   -365.10,  2123.00,    -3.00,  -208.50,  2217.60,   200.00},
{ "Las Colinas",                  1994.30, -1100.80,   -89.00,  2056.80,  -920.80,   110.90},
{ "Las Colinas",                  2056.80, -1126.30,   -89.00,  2126.80,  -920.80,   110.90},
{ "Las Colinas",                  2185.30, -1154.50,   -89.00,  2281.40,  -934.40,   110.90},
{ "Las Colinas",                  2126.80, -1126.30,   -89.00,  2185.30,  -934.40,   110.90},
{ "Las Colinas",                  2747.70, -1120.00,   -89.00,  2959.30,  -945.00,   110.90},
{ "Las Colinas",                  2632.70, -1135.00,   -89.00,  2747.70,  -945.00,   110.90},
{ "Las Colinas",                  2281.40, -1135.00,   -89.00,  2632.70,  -945.00,   110.90},
{ "Las Payasadas",                -354.30,  2580.30,     2.00,  -133.60,  2816.80,   200.00},
{ "Aeroporto de Las Venturas",    1236.60,  1203.20,   -89.00,  1457.30,  1883.10,   110.90},
{ "Aeroporto de Las Venturas",    1457.30,  1203.20,   -89.00,  1777.30,  1883.10,   110.90},
{ "Aeroporto de Las Venturas",    1457.30,  1143.20,   -89.00,  1777.40,  1203.20,   110.90},
{ "Aeroporto de Las Venturas",    1515.80,  1586.40,   -12.50,  1729.90,  1714.50,    87.50},
{ "Last Dime Motel",              1823.00,   596.30,   -89.00,  1997.20,   823.20,   110.90},
{ "Leafy Hollow",                -1166.90, -1856.00,     0.00,  -815.60, -1602.00,   200.00},
{ "Lil' Probe Inn",                -90.20,  1286.80,    -3.00,   153.80,  1554.10,   200.00},
{ "Linden Side",                  2749.90,   943.20,   -89.00,  2923.30,  1198.90,   110.90},
{ "Linden Station",               2749.90,  1198.90,   -89.00,  2923.30,  1548.90,   110.90},
{ "Linden Station",               2811.20,  1229.50,   -39.50,  2861.20,  1407.50,    60.40},
{ "Little Mexico",                1701.90, -1842.20,   -89.00,  1812.60, -1722.20,   110.90},
{ "Little Mexico",                1758.90, -1722.20,   -89.00,  1812.60, -1577.50,   110.90},
{ "Los Flores",                   2581.70, -1454.30,   -89.00,  2632.80, -1393.40,   110.90},
{ "Los Flores",                   2581.70, -1393.40,   -89.00,  2747.70, -1135.00,   110.90},
{ "Aeroporto de Los Santos ",     1249.60, -2394.30,   -89.00,  1852.00, -2179.20,   110.90},
{ "Aeroporto de Los Santos ",     1852.00, -2394.30,   -89.00,  2089.00, -2179.20,   110.90},
{ "Aeroporto de Los Santos ",     1382.70, -2730.80,   -89.00,  2201.80, -2394.30,   110.90},
{ "Aeroporto de Los Santos ",     1974.60, -2394.30,   -39.00,  2089.00, -2256.50,    60.90},
{ "Aeroporto de Los Santos ",     1400.90, -2669.20,   -39.00,  2189.80, -2597.20,    60.90},
{ "Aeroporto de Los Santos ",     2051.60, -2597.20,   -39.00,  2152.40, -2394.30,    60.90},
{ "Marina",                        647.70, -1804.20,   -89.00,   851.40, -1577.50,   110.90},
{ "Marina",                        647.70, -1577.50,   -89.00,   807.90, -1416.20,   110.90},
{ "Marina",                        807.90, -1577.50,   -89.00,   926.90, -1416.20,   110.90},
{ "Market",                        787.40, -1416.20,   -89.00,  1072.60, -1310.20,   110.90},
{ "Market",                        952.60, -1310.20,   -89.00,  1072.60, -1130.80,   110.90},
{ "Market",                       1072.60, -1416.20,   -89.00,  1370.80, -1130.80,   110.90},
{ "Market",                        926.90, -1577.50,   -89.00,  1370.80, -1416.20,   110.90},
{ "Market Station",                787.40, -1410.90,   -34.10,   866.00, -1310.20,    65.80},
{ "Martin Bridge",                -222.10,   293.30,     0.00,  -122.10,   476.40,   200.00},
{ "Missionary Hill",             -2994.40,  -811.20,     0.00, -2178.60,  -430.20,   200.00},
{ "Montgomery",                   1119.50,   119.50,    -3.00,  1451.40,   493.30,   200.00},
{ "Montgomery",                   1451.40,   347.40,    -6.10,  1582.40,   420.80,   200.00},
{ "Montgomery Intersection",      1546.60,   208.10,     0.00,  1745.80,   347.40,   200.00},
{ "Montgomery Intersection",      1582.40,   347.40,     0.00,  1664.60,   401.70,   200.00},
{ "Mulholland",                   1414.00,  -768.00,   -89.00,  1667.60,  -452.40,   110.90},
{ "Mulholland",                   1281.10,  -452.40,   -89.00,  1641.10,  -290.90,   110.90},
{ "Mulholland",                   1269.10,  -768.00,   -89.00,  1414.00,  -452.40,   110.90},
{ "Mulholland",                   1357.00,  -926.90,   -89.00,  1463.90,  -768.00,   110.90},
{ "Mulholland",                   1318.10,  -910.10,   -89.00,  1357.00,  -768.00,   110.90},
{ "Mulholland",                   1169.10,  -910.10,   -89.00,  1318.10,  -768.00,   110.90},
{ "Mulholland",                    768.60,  -954.60,   -89.00,   952.60,  -860.60,   110.90},
{ "Mulholland",                    687.80,  -860.60,   -89.00,   911.80,  -768.00,   110.90},
{ "Mulholland",                    737.50,  -768.00,   -89.00,  1142.20,  -674.80,   110.90},
{ "Mulholland",                   1096.40,  -910.10,   -89.00,  1169.10,  -768.00,   110.90},
{ "Mulholland",                    952.60,  -937.10,   -89.00,  1096.40,  -860.60,   110.90},
{ "Mulholland",                    911.80,  -860.60,   -89.00,  1096.40,  -768.00,   110.90},
{ "Mulholland",                    861.00,  -674.80,   -89.00,  1156.50,  -600.80,   110.90},
{ "Mulholland Intersection",      1463.90, -1150.80,   -89.00,  1812.60,  -768.00,   110.90},
{ "North Rock",                   2285.30,  -768.00,     0.00,  2770.50,  -269.70,   200.00},
{ "Ocean Docks",                  2373.70, -2697.00,   -89.00,  2809.20, -2330.40,   110.90},
{ "Ocean Docks",                  2201.80, -2418.30,   -89.00,  2324.00, -2095.00,   110.90},
{ "Ocean Docks",                  2324.00, -2302.30,   -89.00,  2703.50, -2145.10,   110.90},
{ "Ocean Docks",                  2089.00, -2394.30,   -89.00,  2201.80, -2235.80,   110.90},
{ "Ocean Docks",                  2201.80, -2730.80,   -89.00,  2324.00, -2418.30,   110.90},
{ "Ocean Docks",                  2703.50, -2302.30,   -89.00,  2959.30, -2126.90,   110.90},
{ "Ocean Docks",                  2324.00, -2145.10,   -89.00,  2703.50, -2059.20,   110.90},
{ "Ocean Flats",                 -2994.40,   277.40,    -9.10, -2867.80,   458.40,   200.00},
{ "Ocean Flats",                 -2994.40,  -222.50,    -0.00, -2593.40,   277.40,   200.00},
{ "Ocean Flats",                 -2994.40,  -430.20,    -0.00, -2831.80,  -222.50,   200.00},
{ "Octane Springs",                338.60,  1228.50,     0.00,   664.30,  1655.00,   200.00},
{ "Old Venturas Strip",           2162.30,  2012.10,   -89.00,  2685.10,  2202.70,   110.90},
{ "Palisades",                   -2994.40,   458.40,    -6.10, -2741.00,  1339.60,   200.00},
{ "Palomino Creek",               2160.20,  -149.00,     0.00,  2576.90,   228.30,   200.00},
{ "Paradiso",                    -2741.00,   793.40,    -6.10, -2533.00,  1268.40,   200.00},
{ "Pershing Square",              1440.90, -1722.20,   -89.00,  1583.50, -1577.50,   110.90},
{ "Pilgrim",                      2437.30,  1383.20,   -89.00,  2624.40,  1783.20,   110.90},
{ "Pilgrim",                      2624.40,  1383.20,   -89.00,  2685.10,  1783.20,   110.90},
{ "Pilson Intersection",          1098.30,  2243.20,   -89.00,  1377.30,  2507.20,   110.90},
{ "Pirates in Men's Pants",       1817.30,  1469.20,   -89.00,  2027.40,  1703.20,   110.90},
{ "Playa del Seville",            2703.50, -2126.90,   -89.00,  2959.30, -1852.80,   110.90},
{ "Prickle Pine",                 1534.50,  2583.20,   -89.00,  1848.40,  2863.20,   110.90},
{ "Prickle Pine",                 1117.40,  2507.20,   -89.00,  1534.50,  2723.20,   110.90},
{ "Prickle Pine",                 1848.40,  2553.40,   -89.00,  1938.80,  2863.20,   110.90},
{ "Prickle Pine",                 1938.80,  2624.20,   -89.00,  2121.40,  2861.50,   110.90},
{ "Queens",                      -2533.00,   458.40,     0.00, -2329.30,   578.30,   200.00},
{ "Queens",                      -2593.40,    54.70,     0.00, -2411.20,   458.40,   200.00},
{ "Queens",                      -2411.20,   373.50,     0.00, -2253.50,   458.40,   200.00},
{ "Marina Tio Hitler MPA Race",   1558.00,   596.30,   -89.00,  1823.00,   823.20,   110.90},
{ "JT-R Loja de Carros",          2081.00,  1380.00,    10.00,  2239.00,  1425.00,   110.90},
{ "Redsands East",                1817.30,  2011.80,   -89.00,  2106.70,  2202.70,   110.90},
{ "Redsands East",                1817.30,  2202.70,   -89.00,  2011.90,  2342.80,   110.90},
{ "Redsands East",                1848.40,  2342.80,   -89.00,  2011.90,  2478.40,   110.90},
{ "Redsands West",                1236.60,  1883.10,   -89.00,  1777.30,  2142.80,   110.90},
{ "Redsands West",                1297.40,  2142.80,   -89.00,  1777.30,  2243.20,   110.90},
{ "Redsands West",                1377.30,  2243.20,   -89.00,  1704.50,  2433.20,   110.90},
{ "Redsands West",                1704.50,  2243.20,   -89.00,  1777.30,  2342.80,   110.90},
{ "Regular Tom",                  -405.70,  1712.80,    -3.00,  -276.70,  1892.70,   200.00},
{ "Richman",                       647.50, -1118.20,   -89.00,   787.40,  -954.60,   110.90},
{ "Richman",                       647.50,  -954.60,   -89.00,   768.60,  -860.60,   110.90},
{ "Richman",                       225.10, -1369.60,   -89.00,   334.50, -1292.00,   110.90},
{ "Richman",                       225.10, -1292.00,   -89.00,   466.20, -1235.00,   110.90},
{ "Richman",                        72.60, -1404.90,   -89.00,   225.10, -1235.00,   110.90},
{ "Richman",                        72.60, -1235.00,   -89.00,   321.30, -1008.10,   110.90},
{ "Richman",                       321.30, -1235.00,   -89.00,   647.50, -1044.00,   110.90},
{ "Richman",                       321.30, -1044.00,   -89.00,   647.50,  -860.60,   110.90},
{ "Richman",                       321.30,  -860.60,   -89.00,   687.80,  -768.00,   110.90},
{ "Richman",                       321.30,  -768.00,   -89.00,   700.70,  -674.80,   110.90},
{ "Robada Intersection",         -1119.00,  1178.90,   -89.00,  -862.00,  1351.40,   110.90},
{ "Roca Escalante",               2237.40,  2202.70,   -89.00,  2536.40,  2542.50,   110.90},
{ "Roca Escalante",               2536.40,  2202.70,   -89.00,  2625.10,  2442.50,   110.90},
{ "Rockshore East",               2537.30,   676.50,   -89.00,  2902.30,   943.20,   110.90},
{ "Rockshore West",               1997.20,   596.30,   -89.00,  2377.30,   823.20,   110.90},
{ "Rockshore West",               2377.30,   596.30,   -89.00,  2537.30,   788.80,   110.90},
{ "Rodeo",                          72.60, -1684.60,   -89.00,   225.10, -1544.10,   110.90},
{ "Rodeo",                          72.60, -1544.10,   -89.00,   225.10, -1404.90,   110.90},
{ "Rodeo",                         225.10, -1684.60,   -89.00,   312.80, -1501.90,   110.90},
{ "Rodeo",                         225.10, -1501.90,   -89.00,   334.50, -1369.60,   110.90},
{ "Rodeo",                         334.50, -1501.90,   -89.00,   422.60, -1406.00,   110.90},
{ "Rodeo",                         312.80, -1684.60,   -89.00,   422.60, -1501.90,   110.90},
{ "Rodeo",                         422.60, -1684.60,   -89.00,   558.00, -1570.20,   110.90},
{ "Rodeo",                         558.00, -1684.60,   -89.00,   647.50, -1384.90,   110.90},
{ "Rodeo",                         466.20, -1570.20,   -89.00,   558.00, -1385.00,   110.90},
{ "Rodeo",                         422.60, -1570.20,   -89.00,   466.20, -1406.00,   110.90},
{ "Rodeo",                         466.20, -1385.00,   -89.00,   647.50, -1235.00,   110.90},
{ "Rodeo",                         334.50, -1406.00,   -89.00,   466.20, -1292.00,   110.90},
{ "Royal Casino",                 2087.30,  1383.20,   -89.00,  2437.30,  1543.20,   110.90},
{ "San Andreas Sound",            2450.30,   385.50,  -100.00,  2759.20,   562.30,   200.00},
{ "Santa Flora",                 -2741.00,   458.40,    -7.60, -2533.00,   793.40,   200.00},
{ "Santa Maria Beach",             342.60, -2173.20,   -89.00,   647.70, -1684.60,   110.90},
{ "Santa Maria Beach",              72.60, -2173.20,   -89.00,   342.60, -1684.60,   110.90},
{ "Shady Cabin",                 -1632.80, -2263.40,    -3.00, -1601.30, -2231.70,   200.00},
{ "Shady Creeks",                -1820.60, -2643.60,    -8.00, -1226.70, -1771.60,   200.00},
{ "Shady Creeks",                -2030.10, -2174.80,    -6.10, -1820.60, -1771.60,   200.00},
{ "Sobell Rail Yards",            2749.90,  1548.90,   -89.00,  2923.30,  1937.20,   110.90},
{ "Spinybed",                     2121.40,  2663.10,   -89.00,  2498.20,  2861.50,   110.90},
{ "Starfish Casino",              2437.30,  1783.20,   -89.00,  2685.10,  2012.10,   110.90},
{ "Starfish Casino",              2437.30,  1858.10,   -39.00,  2495.00,  1970.80,    60.90},
{ "Starfish Casino",              2162.30,  1883.20,   -89.00,  2437.30,  2012.10,   110.90},
{ "Temple",                       1252.30, -1130.80,   -89.00,  1378.30, -1026.30,   110.90},
{ "Temple",                       1252.30, -1026.30,   -89.00,  1391.00,  -926.90,   110.90},
{ "Temple",                       1252.30,  -926.90,   -89.00,  1357.00,  -910.10,   110.90},
{ "Temple",                        952.60, -1130.80,   -89.00,  1096.40,  -937.10,   110.90},
{ "Temple",                       1096.40, -1130.80,   -89.00,  1252.30, -1026.30,   110.90},
{ "Temple",                       1096.40, -1026.30,   -89.00,  1252.30,  -910.10,   110.90},
{ "The Camel's Toe",              2087.30,  1203.20,   -89.00,  2640.40,  1383.20,   110.90},
{ "The Clown's Pocket",           2162.30,  1783.20,   -89.00,  2437.30,  1883.20,   110.90},
{ "The Emerald Isle",             2011.90,  2202.70,   -89.00,  2237.40,  2508.20,   110.90},
{ "The Farm",                    -1209.60, -1317.10,   114.90,  -908.10,  -787.30,   251.90},
{ "The Four Dragons Casino",      1817.30,   863.20,   -89.00,  2027.30,  1083.20,   110.90},
{ "The High Roller",              1817.30,  1283.20,   -89.00,  2027.30,  1469.20,   110.90},
{ "The Mako Span",                1664.60,   401.70,     0.00,  1785.10,   567.20,   200.00},
{ "The Panopticon",               -947.90,  -304.30,    -1.10,  -319.60,   327.00,   200.00},
{ "The Pink Swan",                1817.30,  1083.20,   -89.00,  2027.30,  1283.20,   110.90},
{ "The Sherman Dam",              -968.70,  1929.40,    -3.00,  -481.10,  2155.20,   200.00},
{ "The Strip",                    2027.40,   863.20,   -89.00,  2087.30,  1703.20,   110.90},
{ "The Strip",                    2106.70,  1863.20,   -89.00,  2162.30,  2202.70,   110.90},
{ "The Strip",                    2027.40,  1783.20,   -89.00,  2162.30,  1863.20,   110.90},
{ "The Strip",                    2027.40,  1703.20,   -89.00,  2137.40,  1783.20,   110.90},
{ "The Visage",                   1817.30,  1863.20,   -89.00,  2106.70,  2011.80,   110.90},
{ "The Visage",                   1817.30,  1703.20,   -89.00,  2027.40,  1863.20,   110.90},
{ "Unity Station",                1692.60, -1971.80,   -20.40,  1812.60, -1932.80,    79.50},
{ "Valle Ocultado",               -936.60,  2611.40,     2.00,  -715.90,  2847.90,   200.00},
{ "Verdant Bluffs",                930.20, -2488.40,   -89.00,  1249.60, -2006.70,   110.90},
{ "Verdant Bluffs",               1073.20, -2006.70,   -89.00,  1249.60, -1842.20,   110.90},
{ "Verdant Bluffs",               1249.60, -2179.20,   -89.00,  1692.60, -1842.20,   110.90},
{ "Verdant Meadows",                37.00,  2337.10,    -3.00,   435.90,  2677.90,   200.00},
{ "Verona Beach",                  647.70, -2173.20,   -89.00,   930.20, -1804.20,   110.90},
{ "Verona Beach",                  930.20, -2006.70,   -89.00,  1073.20, -1804.20,   110.90},
{ "Verona Beach",                  851.40, -1804.20,   -89.00,  1046.10, -1577.50,   110.90},
{ "Verona Beach",                 1161.50, -1722.20,   -89.00,  1323.90, -1577.50,   110.90},
{ "Verona Beach",                 1046.10, -1722.20,   -89.00,  1161.50, -1577.50,   110.90},
{ "Vinewood",                      787.40, -1310.20,   -89.00,   952.60, -1130.80,   110.90},
{ "Vinewood",                      787.40, -1130.80,   -89.00,   952.60,  -954.60,   110.90},
{ "Vinewood",                      647.50, -1227.20,   -89.00,   787.40, -1118.20,   110.90},
{ "Vinewood",                      647.70, -1416.20,   -89.00,   787.40, -1227.20,   110.90},
{ "Whitewood Estates",             883.30,  1726.20,   -89.00,  1098.30,  2507.20,   110.90},
{ "Whitewood Estates",            1098.30,  1726.20,   -89.00,  1197.30,  2243.20,   110.90},
{ "Willowfield",                  1970.60, -2179.20,   -89.00,  2089.00, -1852.80,   110.90},
{ "Willowfield",                  2089.00, -2235.80,   -89.00,  2201.80, -1989.90,   110.90},
{ "Willowfield",                  2089.00, -1989.90,   -89.00,  2324.00, -1852.80,   110.90},
{ "Willowfield",                  2201.80, -2095.00,   -89.00,  2324.00, -1989.90,   110.90},
{ "Willowfield",                  2541.70, -1941.40,   -89.00,  2703.50, -1852.80,   110.90},
{ "Willowfield",                  2324.00, -2059.20,   -89.00,  2541.70, -1852.80,   110.90},
{ "Willowfield",                  2541.70, -2059.20,   -89.00,  2703.50, -1941.40,   110.90},
{ "Yellow Bell Station",          1377.40,  2600.40,   -21.90,  1492.40,  2687.30,    78.00},
// Main Zones
{ "Los Santos",                     44.60, -2892.90,  -242.90,  2997.00,  -768.00,   900.00},
{ "Las Venturas",                  869.40,   596.30,  -242.90,  2997.00,  2993.80,   900.00},
{ "Bone County",                  -480.50,   596.30,  -242.90,   869.40,  2993.80,   900.00},
{ "Tierra Robada",               -2997.40,  1659.60,  -242.90,  -480.50,  2993.80,   900.00},
{ "Tierra Robada",               -1213.90,   596.30,  -242.90,  -480.50,  1659.60,   900.00},
{ "San Fierro",                  -2997.40, -1115.50,  -242.90, -1213.90,  1659.60,   900.00},
{ "Red County",                  -1213.90,  -768.00,  -242.90,  2997.00,   596.30,   900.00},
{ "Flint County",                -1213.90, -2892.90,  -242.90,    44.60,  -768.00,   900.00},
{ "Whetstone",                   -2997.40, -2892.90,  -242.90, -1213.90, -1115.50,   900.00}};

new VehicleName[212][0] = {
   "Landstalker",
   "Bravura",
   "Buffalo",
   "Linerunner",
   "Pereniel",
   "Sentinel",
   "Dumper",
   "Firetruck",
   "Trashmaster",
   "Stretch",
   "Manana",
   "Infernus",
   "Voodoo",
   "Pony",
   "Mule",
   "Cheetah",
   "Ambulance",
   "Leviathan",
   "Moonbeam",
   "Esperanto",
   "Taxi",
   "Washington",
   "Bobcat",
   "Mr Whoopee",
   "BF Injection",
   "Hunter",
   "Premier",
   "Enforcer",
   "Securicar",
   "Banshee",
   "Predator",
   "Bus",
   "Rhino",
   "Barracks",
   "Hotknife",
   "Trailer", //artict1
   "Previon",
   "Coach",
   "Cabbie",
   "Stallion",
   "Rumpo",
   "RC Bandit",
   "Romero",
   "Packer",
   "Monster Truck",
   "Admiral",
   "Squalo",
   "Seasparrow",
   "Pizzaboy",
   "Tram",
   "Trailer", //artict2
   "Turismo",
   "Speeder",
   "Reefer",
   "Tropic",
   "Flatbed",
   "Yankee",
   "Caddy",
   "Solair",
   "Berkley's RC Van",
   "Skimmer",
   "PCJ-600",
   "Faggio",
   "Freeway",
   "RC Baron",
   "RC Raider",
   "Glendale",
   "Oceanic",
   "Sanchez",
   "Sparrow",
   "Patriot",
   "Quad",
   "Coastguard",
   "Dinghy",
   "Hermes",
   "Sabre",
   "Rustler",
   "ZR-350",
   "Walton",
   "Regina",
   "Comet",
   "BMX",
   "Burrito",
   "Camper",
   "Marquis",
   "Baggage",
   "Dozer",
   "Maverick",
   "News Chopper",
   "Rancher",
   "FBI Rancher",
   "Virgo",
   "Greenwood",
   "Jetmax",
   "Hotring",
   "Sandking",
   "Blista Compact",
   "Police Maverick",
   "Boxville",
   "Benson",
   "Mesa",
   "RC Goblin",
   "Hotring Racer", //hotrina
   "Hotring Racer", //hotrinb
   "Bloodring Banger",
   "Rancher",
   "Super GT",
   "Elegant",
   "Journey",
   "Bike",
   "Mountain Bike",
   "Beagle",
   "Cropdust",
   "Stunt",
   "Tanker", //petro
   "RoadTrain",
   "Nebula",
   "Majestic",
   "Buccaneer",
   "Shamal",
   "Hydra",
   "FCR-900",
   "NRG-500",
   "HPV1000",
   "Cement Truck",
   "Tow Truck",
   "Fortune",
   "Cadrona",
   "FBI Truck",
   "Willard",
   "Forklift",
   "Tractor",
   "Combine",
   "Feltzer",
   "Remington",
   "Slamvan",
   "Blade",
   "Freight",
   "Streak",
   "Vortex",
   "Vincent",
   "Bullet",
   "Clover",
   "Sadler",
   "Firetruck", //firela
   "Hustler",
   "Intruder",
   "Primo",
   "Cargobob",
   "Tampa",
   "Sunrise",
   "Merit",
   "Utility",
   "Nevada",
   "Yosemite",
   "Windsor",
   "Monster Truck", //monstera
   "Monster Truck", //monsterb
   "Uranus",
   "Jester",
   "Sultan",
   "Stratum",
   "Elegy",
   "Raindance",
   "RC Tiger",
   "Flash",
   "Tahoma",
   "Savanna",
   "Bandito",
   "Freight", //freiflat
   "Trailer", //streakc
   "Kart",
   "Mower",
   "Duneride",
   "Sweeper",
   "Broadway",
   "Tornado",
   "AT-400",
   "DFT-30",
   "Huntley",
   "Stafford",
   "BF-400",
   "Newsvan",
   "Tug",
   "Trailer", //petrotr
   "Emperor",
   "Wayfarer",
   "Euros",
   "Hotdog",
   "Club",
   "Trailer", //freibox
   "Trailer", //artict3
   "Andromada",
   "Dodo",
   "RC Cam",
   "Launch",
   "Police Car (LSPD)",
   "Police Car (SFPD)",
   "Police Car (LVPD)",
   "Police Ranger",
   "Picador",
   "S.W.A.T. Van",
   "Alpha",
   "Phoenix",
   "Glendale",
   "Sadler",
   "Luggage Trailer", //bagboxa
   "Luggage Trailer", //bagboxb
   "Stair Trailer", //tugstair
   "Boxville",
   "Farm Plow", //farmtr1
   "Utility Trailer" //utiltr1
};

//Camioneiro
new Missao[MAX_PLAYERS];
new Empresa;
new Empresas[MAX_ENTREGASTIPE] = {
	1,
	2,
	3,
	4,
	5,
	6,
	7,
	8,
	9,
	10,
	11
};

new CargaName[MAX_ENTREGASTIPE][] = {
	"Gasolina",//refinaria
	"Diesel",//refinaria
	"Bio-Diesel",//refinaria
	"Gas-Veicular(GNV)",//refinaria
	"Moveis",//logistica
	"Equipamentos Eletrônicos",//logistica
	"Utecilios Domésticos",//logistica
	"Mamona para Bio-Diesel",//fazenda
	"Soja",//fazenda
	"Milho",//fazenda
	"Feijão"//fazenda
};

new EmpresaName[MAX_ENTREGASTIPE][] = {
	"Refinaria",
	"Refinaria",
	"Refinaria",
	"Refinaria",
	"Reload-Logistica",
	"Reload-Logistica",
	"Reload-Logistica",
	"Fazenda",
	"Fazenda",
	"Fazenda",
	"Fazenda"
};

new Float:EmpresasCheckpoints[MAX_ENTREGASTIPE][3] = {
	{ 251.5558, 1395.9694, 10.1558},//refinaria
	{ 251.5558, 1395.9694, 10.1558},//refinaria
	{ 251.5558, 1395.9694, 10.1558},//refinaria
	{ 251.5558, 1395.9694, 10.1558},//refinaria
	{-2112.7395,-2247.9727,30.2733},//logistica
	{-2112.7395,-2247.9727,30.2733},//logistica
	{-2112.7395,-2247.9727,30.2733},//logistica
	{-2112.7395,-2247.9727,30.2733},//fazenda
	{-2112.7395,-2247.9727,30.2733},//fazenda
	{-2112.7395,-2247.9727,30.2733},//fazenda
	{-2112.7395,-2247.9727,30.2733} //fazenda
};

new Float:PostosEntregas[MAX_POSTOS] [3] = {
	{626.2228,1663.3148,6.7693},//Fort Carson
	{-1660.0426,447.7220,6.9073},//San Fierro
	{-2405.0898,991.8399,45.0037},//San Fierro
	{-2242.9946,-2568.1680,31.4890}//Angel Pine
};

new Posto[MAX_PLAYERS];
new Postos[MAX_POSTOS]= {
	0,
	1,
	2,
	3
};

new ValorEntregasPostos[MAX_POSTOS] = {
	100,//Fort Carson
	320,//San Fierro
	360,//San Fierro
	520//Angel Pine
};

new CidadePosto[MAX_POSTOS] [] = {
	"Las Venturas",
	"San Fierro",
	"San Fierro",
	"Angel Pine"
};

new PostoProximidade[MAX_POSTOS] [] = {
	"Saida para Fort Carson, antes da refinaria",
	"Próximo a base do exercito",
	"Próximo ao hospital",
	"Saida"
};

new QtLitrosCarga[MAX_PLAYERS];
new LitrosCarregados[5] = {
	18000,
	27000,
	25000,
	23000,
	15000
};
	
//veiculos
static VEH_CABBIE =      438; //1
static VEH_CARCOPSF = 	 597; //2
static VEH_CARCOPCS = 	 599; //3
static VEH_SABRE = 		 475; //4
static VEH_TAXI = 		 420; //5
static VEH_MANANA = 	 410; //6
static VEH_CARROFORTE =  428; //7
static VEH_LIMOSINE = 	 409; //8
static VEH_INFERNUS = 	 411; //9
static VEH_AMBULANCIA =  416; //10
static VEH_PIZZABOY =    448; //11
static VEH_BAUTRAILER =  435; //12
static VEH_TANKTRAILER = 584; //13
static VEH_LINERUN =     403; //14
static VEH_RDTRAIN =     515; //15
static VEH_TANKER =      514; //16
static VEH_MAVERICK =    487; //17
static VEH_HOTDOG =      588; //18
static VEH_BUS =         437; //19
static VEH_MRWHOOPE =    423; //20
static VEH_REBOQUE =     525; //21
static VEH_PCJ600 =      581; //22
static VEH_DUMPER =      406; //23

//global vars
new gPlayerCheckpointStatus[MAX_PLAYERS];
new profselection[MAX_PLAYERS];
new xlnecessario[MAX_PLAYERS];
new invitestatus[MAX_PLAYERS];
new Float:ppos[MAX_PLAYERS][3];
new PLAYERLIST_authed[MAX_PLAYERS];
new Log[MAX_PLAYERS];
new AreaBanco[MAX_PLAYERS];
new dinheirofianca;
new dinheiroresgate;
new envconvite;
//pedreiro
new AreaObra[MAX_PLAYERS] = 0;
new AreaPedreira[MAX_PLAYERS] = 0;
new Pedras[MAX_VEHICLES] = 0;
new Ferramentas[MAX_PLAYERS] = 0;
new MissaoPedreira[MAX_PLAYERS] = 0;
//gas salvo
new GPV[MAX_VEHICLES];
//areas
new zoneupdates[MAX_PLAYERS];
new player_zone[MAX_PLAYERS];
new zoneupdate;
//rc's
new Veiculo[MAX_PLAYERS] = 0;
//sequestrados
new Sequestro[MAX_PLAYERS] = 0;
//radares
new Menu:radares;
new AreaRadar[MAX_PLAYERS] = 0;
new Radaron[MAX_PLAYERS];
//lanche
new Lanche[MAX_PLAYERS] = 0;
new Pizza[MAX_PLAYERS] = 0;
new fome[MAX_PLAYERS] = 0;
new tempofome;
//Motoristas de Onibus
new Menu:Terminais;
//alarme
new Alarme[MAX_VEHICLES] = 0;
//caminhoneiros
new AreaLogistica[MAX_PLAYERS] = 0;
new AreaRefinaria[MAX_PLAYERS] = 0;
new Carregamento[MAX_VEHICLES] = 0;
//Fazenda
new AreaFazenda[MAX_PLAYERS] = 0;
new AreaCoopFazenda[MAX_PLAYERS] = 0;
new MilhoInProgress[MAX_PLAYERS] = 0;
new Milho[MAX_PLAYERS] = 0;
//portoes automaticos
new AreaPortao[MAX_PLAYERS] = 0;
new AreaEstacionamento[MAX_PLAYERS] = 0;
//pesca
new Piracema = 0;
new AreaCoopPesca[MAX_PLAYERS] = 0;
new PescaInProgress[MAX_PLAYERS] = 0;
new QtPescas[MAX_PLAYERS] = 0;
//drogas
new QtMaconha[MAX_PLAYERS] = 0;
new QtCocaina[MAX_PLAYERS] = 0;
new QtCerveja[MAX_PLAYERS] = 0;
//caça
new TemporadaCaca = 0;
new AreaCoopCaca[MAX_PLAYERS] = 0;
new CacaInProgress[MAX_PLAYERS] = 0;
new QtCacas[MAX_PLAYERS] = 0;
//paralizar
new Paralize[MAX_PLAYERS] = 0;
//seguro de vida e carro
new Seguro[MAX_PLAYERS] = 0;
new segurocarro[MAX_VEHICLES] = 0;
//hotel
new AreaHotel[MAX_PLAYERS] = 0;
//bar
new AreaBar[MAX_PLAYERS] = 0;
new Menu:cardapio;
//convite de carro
new icarid;
new icor1;
new icor2;
//desmanche
new AreaDesmanche[MAX_PLAYERS] = 0;
new Desmanche[MAX_PLAYERS] = 0;
//sorveteiro
new qtsorvete[MAX_PLAYERS] = 0;
new AreaSorveteria[MAX_PLAYERS] = 0;
//delegacia
new Areacop[MAX_PLAYERS] = 0;
//balada
new AreaBalada[MAX_PLAYERS] = 0;
new tocando;
new balada[MAX_PLAYERS] = 0;
//auto-escola
new AreaEscola[MAX_PLAYERS] = 0;
//drogas
new Maconha[MAX_PLAYERS] = 0;
new Heroina[MAX_PLAYERS] = 0;
new Cocaina[MAX_PLAYERS] = 0;
new Crack[MAX_PLAYERS] = 0;
new bagulho[MAX_PLAYERS] = 0;
new portaotrafico;
//galao de combustivel
new Galao[MAX_PLAYERS] = 0;
//casa
new Casa[MAX_PLAYERS] = 0;
//carros locados
new Locado[MAX_PLAYERS] = 0;
//fuel
#define RunOutTime 60000
//postos
new AreaPosto[MAX_PLAYERS] = 0;
//gangzones
new Pesca1;
new Plantacao;
new VendaMilho;
new Caca1;
//Semana
new dias;
new segunda[MAX_PLAYERS];
new terca[MAX_PLAYERS];
new quarta[MAX_PLAYERS];
new quinta[MAX_PLAYERS];
new sexta[MAX_PLAYERS];
new sabado[MAX_PLAYERS];
new domingo[MAX_PLAYERS];
//textdraw's
new Text:Bemvindo;
new Text:Bemvindo2;
new Text:Bemvindo3;
new Text:TextAll;
new Text:velo;
//megasena
new bool:aposta[MAX_PLAYERS];
new numeroapostado[MAX_PLAYERS];
new moneyloteria;
//estacionamento do banco do hotel
new portao1;
new portao2;
//votaçoes
new temporadavotos[MAX_PLAYERS] = 0;
new votosabertos[MAX_PLAYERS] = 0;
new Qtvotos[MAX_PLAYERS] = 0;
new voto[MAX_PLAYERS] = 0;
//---
new Presos[MAX_PLAYERS] = 0;
new Mudo[MAX_PLAYERS] = 0;
new Profissao[MAX_PLAYERS] = 0;
new TempoPreso[MAX_PLAYERS] = 0;
new Procurados[MAX_PLAYERS] = 0;
new Taximetro[MAX_PLAYERS][2];
new MTaximetro[MAX_PLAYERS][2];
new ATaximetro[MAX_PLAYERS][2];
new PrecoCorrida[MAX_PLAYERS];
new Velocidade[MAX_PLAYERS];
new worldTime;
new worldMinute;
new Bebida[MAX_PLAYERS] = 0;
new Sorvete[MAX_PLAYERS] = 0;
new Calling[MAX_PLAYERS];
new Answered[MAX_PLAYERS];
new AreaAeroLS[MAX_PLAYERS] = 0;
new Callerid[MAX_PLAYERS];
new carx;
new tempoverificacao;
new Qtmortes[MAX_PLAYERS] = 0;
//aluguel de veiculo
new Aluguel[MAX_PLAYERS] = 0;
new CarroAlugado[MAX_PLAYERS] = 0;
new carroaluguel;
new carroaluguel2;
new carroaluguel3;
new carroaluguel4;
new carroaluguel5;
new carroaluguel6;
new carroaluguel7;
new carroaluguel8;
//Vendedor de Carro
new AreaVenda[MAX_PLAYERS] = 0;
//Motorista particular
new devolucao[MAX_PLAYERS];
//Assaltante
new assalto[MAX_PLAYERS] = 0;
new Roubo[MAX_PLAYERS] = 0;
//Onibus de Viagem
new Passagem[MAX_PLAYERS] = 0;
//Areas
new AreaAeroporto[MAX_PLAYERS] = 0;
new AreaMercado[MAX_PLAYERS] = 0;
new AreaHospital[MAX_PLAYERS] = 0;
new AreaDelegacia[MAX_PLAYERS] = 0;
new AreaAluguel[MAX_PLAYERS] = 0;
new AreaTrafico[MAX_PLAYERS] = 0;
new AreaLimosine[MAX_PLAYERS] = 0;
//Celular
new AreaOperadora[MAX_PLAYERS] = 0;
//Sistema de Profissoes Automaticas
new Menu:level0;
new Menu:level5;
new Menu:level10;
new Menu:level15;
new Menu:level20;
new Menu:level25;
new Menu:level30;
new Menu:level35;
new Menu:level40;
new Menu:level45;
new Menu:level50;
new Menu:level55;
new Menu:acceptprof;
//----------------------------
new alugueis[MAX_PLAYERS] = 0;
new Votacoes[MAX_PLAYERS] = 0;
new lavagem[MAX_VEHICLES] = 0;
//text draw de detonado
new Text:detonado;
//plantação de drogas em veiculos
new drogasplantadas[MAX_VEHICLES] = 0;
//latinhas para mendigos
new CatarLatinha[MAX_PLAYERS] = 0;
new Latas[MAX_PLAYERS] = 0;
//receita federal
new revisao[MAX_PLAYERS][2];
//contrabandista
new contrabando[MAX_PLAYERS] = 0;
//salvar armas
new slotw;
new weapons;
new municao;
//promoter
new convite[MAX_PLAYERS] = 0;
//sexo
new Sexo[MAX_PLAYERS] = 0;
new FazendoSexo[MAX_PLAYERS] = 0;
//explosão em carros
new dinamite[MAX_PLAYERS] = 0;
new DinamitePlantada[MAX_VEHICLES] = 0;
//transporte de valores
new bolsadevalores[MAX_PLAYERS] = 0;
new valorespegos[MAX_VEHICLES] = 0;
//servico de reciclagem
new AreaReciclagem[MAX_PLAYERS] = 0;
//justiça federal
new Tribunal[MAX_PLAYERS] = 0;
new declaracoesabertas[MAX_PLAYERS] = 0;
//motorista particular
new limorevisada[MAX_VEHICLES] = 0;
//aluguel
new stopaluguel[MAX_PLAYERS] = 0;
//forward's
forward tirandograna(playerid,plid,car); 
forward verificacao();
forward update_zones();
forward MoneyGrubScoreUpdate();
forward TempoPrisao();
forward Taxi();
forward textdestroy(playerid);
forward Pesca();
forward Caca();
forward Platacao();
forward CheckFuel();
forward LogarPlayer(playerid);
forward Bancos();
forward MTaxi();
forward ATaxi();
forward Radar();
forward GetDistanceBetweenPlayers(playerid, playerid2);
forward Tempo();
forward Speed();
forward Cheat();
forward Anuncio();
forward TimeFunction(playerid);
forward SetCar(modelid, Float:X, Float:Y, Float:Z, Float:ang, Cor1, Cor2);
forward SetCasa(Float:X, Float:Y, Float:Z);
forward SetCone(Float:X, Float:Y, Float:Z);
forward GetPlayerZone(playerid);
forward IsPlayerInArea(playerid, Float:minx, Float:maxx, Float:miny, Float:maxy);
forward CarrosTrancados(playerid);
forward Prisao(plid);
forward Balada();
forward Semana();
forward faminto();
forward quefome();
forward PhoneCut();
forward sethome(playerid);
forward pintar(veiculo,cor1,cor2);
forward votacaoon(plid1,plid2);
forward fimvotacao(plid1,plid2,vencedor);
forward Radar();
forward sacar(playerid);
forward depositar(playerid);
forward tunacao(vehicleid,componentid);
forward GetVehicleName(vehicleid);
forward Semana();
forward SetCar(modelid, Float:X, Float:Y, Float:Z, Float:ang, Cor1, Cor2);
forward dar(playerid,plid);
forward chupar(playerid,plid);
forward alugarlimo(playerid,car);
forward atraso(playerid,car);
forward camuflar(plid);
forward contagem1();
forward contagem2();
forward contagem3();
forward contagem4();
forward contagem5();
forward locar(plid,car);
forward carrostrancados();
forward setprof(plid);
forward desmanche(playerid);
forward assaltar(playerid);
forward consertar(vehicle,plid,angulo);
forward mortealarme(playerid,vehicleid);
forward Hotel(playerid);
forward relosena(playerid,numero);
forward alugarlimo(playerid,car);
forward atraso(playerid,car);
forward Megasena();
forward Fimcamuflagem(playerid,plid);
forward CreateStartupFiles();
forward Salario();
forward BUM(carid);
forward Desarme(playerid,carro);
forward InicioTribunal(plid,plid2);
forward semaluguel(playerid);
forward Entrega();
forward CarregandoComb(playerid, trailer, vehicleid);
forward DescarregandoComb(playerid, trailer, vehicleid);
forward SaveFiles();
forward LoadFiles();

main()
{
    print("\n___________________________________________________");
	print("               >>> MPA Reload RPG <<<         ");
	print("___________________________________________________");
	print(" ");
	print("  Uma Parceria entre MPA Furious e MPA Reload RPG    ");
	print("---------------------- CODDERS --------------------");
	print("[MPA]Guilherme                          [MPA]Rafael");
	print("                    [MPA]Rodrigo");
	print("____________________________________________________\n");
	worldTime = 12;
}


public Entrega() {
	for(new i;i<MAX_PLAYERS;i++){
	    if(Profissao[i] != CAMINHONEIRO) return 1;
		new string[256];
		new n = random(MAX_ENTREGASTIPE);
		format(string, sizeof(string),"Precisamos de um caminhão para entregar %s. Carregar na %s.", CargaName[n], EmpresaName[n]);
		SendClientMessage(i,COR_VERDE, string);
		SendClientMessage(i,COR_VERDE, "Digite /recusar para recusar o convite");
		Empresa = Empresas[n];
		SetPlayerCheckpoint(i,EmpresasCheckpoints[n][0],EmpresasCheckpoints[n][1],EmpresasCheckpoints[n][2],5.0);
		gPlayerCheckpointStatus[i] = CHECKPOINT_EMPRESA;
		Missao[i] = 1;
		invitestatus[i] = INVITE_FRETE;
	}
	return 1;
}

public CarregandoComb(playerid, trailer, vehicleid)
{
	new string[256];
	new p = random(MAX_POSTOS);
	new l = random(5);
	QtLitrosCarga[playerid] = LitrosCarregados[l];
	Posto[playerid] = Postos[p];
	format(string,sizeof(string),"Foram carregados %d litros de %s terá que entregar em %s no posto próximo %s. Você receberá R$%d pela viagem.",QtLitrosCarga[playerid], CargaName[Empresa], CidadePosto[p], PostoProximidade[p], ValorEntregasPostos[p]);
	SendClientMessage(playerid, COR_VERDE, string);
	gPlayerCheckpointStatus[playerid] = CHECKPOINT_POSTO;
	SetPlayerCheckpoint(playerid, PostosEntregas [p] [0], PostosEntregas [p] [1], PostosEntregas [p] [2], 5.0);
	Carregamento[GetPlayerVehicleID(trailer)] = 1;
	Missao[playerid] = 1;
	return 1;
}

public DescarregandoComb(playerid, trailer, vehicleid)
{
	new string[256];
	Missao[playerid] = 0;
	Carregamento[GetPlayerVehicleID(trailer)] = 0;
	DetachTrailerFromVehicle(vehicleid);
	SetPlayerMoney(playerid, ValorEntregasPostos[Posto[playerid]]);
	format(string,sizeof(string),"Você entregou %d litros de %s em %s. Te pagaram R$%d pela viagem.",QtLitrosCarga[playerid], CargaName[Empresa], CidadePosto[Posto[playerid]], ValorEntregasPostos[Posto[playerid]]);
	SendClientMessage(playerid, COR_VERDE, string);
	GivePlayerMoney(playerid,ValorEntregasPostos[Posto[playerid]]);
    QtLitrosCarga[playerid] = 0;
    Posto[playerid] = 0;
	return 1;
}


public OnGameModeInit()
{
	print("Carregando MPA Reload RPG");
	SetGameModeText("MPA® Reload RPG™");

	AddPlayerClass(60, 768.2721, -36.8625, 1000.6865, 186.4601, 0, 0, 0, 0, 0, 0);
    UsePlayerPedAnims();
    ShowNameTags(1);
    EnableTirePopping(1);
//---------------------------------- VEÍCULOS ------------------------------------//
    
	// Carros Angel Pine
	CreateVehicle(463,-2210.6514,-2255.1765,30.2733,319.5424,0,1,-1); // freeway - 1
	CreateVehicle(508,-2205.6443,-2251.7271,31.0836,48.4874,1,1,-1); // van de turismo - 2
	CreateVehicle(VEH_PIZZABOY,-2100.7053,-2345.9402,30.2115,53.7351,3,1,-1); // pizza boy - 3
	CreateVehicle(VEH_PIZZABOY,-2157.8840,-2460.8801,30.1954,225.4417,3,1,-1); // pizza boy - 4
	CreateVehicle(VEH_CARROFORTE,-2187.9341,-2399.1440,30.3244,143.0973,86,86,-1); // carro forte - 5
	CreateVehicle(VEH_LIMOSINE,-2175.7058,-2336.1523,30.3270,322.0568,1,1,-1); // limosine - 6
	CreateVehicle(VEH_LIMOSINE,-2181.1003,-2343.1809,30.3294,322.2349,1,1,-1); // limosine - 7
	CreateVehicle(525,-2115.6960,-2469.0261,30.3416,47.3266,1,0,-1); // towtruck - 8
	CreateVehicle(408,-2092.6499,-2304.0359,30.2596,142.9992,86,0,-1); // caminhao de lixo - 9
	CreateVehicle(600,-2183.2251,-2502.2170,30.2690,233.1241,3,3,-1); // picador - 10
	CreateVehicle(597,-2156.0496,-2396.8076,30.3126,54.0081,0,1,-1); // carcopsf - 11
	CreateVehicle(597,-2161.9846,-2392.3926,30.3055,53.1031,0,1,-1); // carcopsf - 12
	CreateVehicle(VEH_CARCOPCS,-2168.1013,-2387.7903,30.7226,51.5341,0,1,-1); // carcopcs - 13
	CreateVehicle(523,-2174.1709,-2383.6321,30.0388,130.91,0,1,-1); // motocop - 14
	CreateVehicle(523,-2172.5046,-2384.6919,30.0389,141.8292,0,1,-1); // motocop - 15
	CreateVehicle(VEH_BUS,-2074.2454,-2462.0308,30.6801,49.9912,95,16,-1); // busao - 16
	CreateVehicle(VEH_BUS,-2083.2656,-2454.6643,30.6770,52.3799,98,20,-1); // busao - 17
	CreateVehicle(VEH_TAXI,-2142.7490,-2447.0286,30.4074,323.7563,6,1,-1); // taxi - 18
	CreateVehicle(VEH_TAXI,-2144.8958,-2445.4551,30.4074,323.7563,6,1,-1); // taxi - 19
	CreateVehicle(VEH_TAXI,-2149.1501,-2441.9424,30.4054,322.3454,6,1,-1); // taxi - 20
	CreateVehicle(581,-2146.4854,-2442.7917,30.2114,139.5587,6,6,-1); // moto taxi - 21
	CreateVehicle(581,-2150.2866,-2439.1633,30.2164,144.2821,6,6,-1); // moto taxi - 22
	CreateVehicle(VEH_SABRE,-2123.3308,-2255.6533,30.3456,232.2825,6,6,-1); // escola car - 23
	CreateVehicle(VEH_SABRE,-2133.3716,-2247.7283,30.3482,232.5271,6,6,-1); // escola car - 24
	CreateVehicle(VEH_SABRE,-2144.3083,-2254.1670,30.4276,321.2896,6,6,-1); // escola car - 25
	CreateVehicle(487,-2133.1821,-2258.0247,30.8092,50.5889,6,0,-1); // heli escola - 26
	CreateVehicle(461,-2140.8577,-2259.0566,30.6319,305.4985,6,0,-1); // moto escola - 27
	CreateVehicle(VEH_AMBULANCIA,-2201.9023,-2294.8242,30.7744,317.3578,1,3,-1); // ambulancia - 28
	CreateVehicle(VEH_BAUTRAILER,-2102.5415,-2228.6206,30.7584,140.1957,1,1,-1); // carreta - 29
	CreateVehicle(VEH_BAUTRAILER,-2099.5256,-2230.4441,30.8355,139.7521,1,1,-1); // carreta - 30
	CreateVehicle(VEH_BAUTRAILER,-2097.0061,-2232.6523,30.9025,140.5417,1,1,-1); // carreta - 31
	CreateVehicle(403,-2090.9934,-2241.9666,30.7345,53.5008,3,3,-1); // linerun - 32
	CreateVehicle(403,-2093.8887,-2245.9402,30.4708,53.8579,1,1,-1); // linerun - 33
	CreateVehicle(403,-2097.0798,-2250.0730,30.4281,55.1503,0,0,-1); // linerun - 34

	// Carros Fort Carson
	CreateVehicle(VEH_BUS,-156.9283,1194.6168,19.7815,270.8334,71,87,-1); // onibus - 35
	CreateVehicle(VEH_BUS,-171.1785,1194.6578,19.7390,269.4513,55,83,-1); // onibus - 36
	CreateVehicle(581,-141.9811,1187.3344,19.3212,342.5776,66,1,-1); // moto - 37
	CreateVehicle(509,-143.9405,1187.5908,19.2548,9.9856,16,1,-1); // bike - 38
	CreateVehicle(509,-146.3510,1187.3357,19.2545,349.8419,74,1,-1); // bike - 39
	CreateVehicle(543,-96.0622,1193.3949,19.4804,273.0895,67,8,-1); // camionete - 40
	CreateVehicle(510,-94.3977,1209.6837,19.3279,208.9742,46,46,-1); // mbike - 41
	CreateVehicle(508,-101.3297,1222.5194,20.1274,359.1908,1,1,-1); // van de turismo - 42
	CreateVehicle(463,-94.3121,1222.7695,19.2793,356.6828,84,84,-1); // freewall - 43
	CreateVehicle(531,-48.7209,1113.5156,19.7272,174.3214,91,2,-1); // trator - 44
	CreateVehicle(525,-33.5871,1086.4548,19.6341,3.2091,18,20,-1); // guincho - 45
	CreateVehicle(VEH_TAXI,-214.4730,1094.4625,19.3709,269.9807,6,1,-1); // taxi - 46
	CreateVehicle(VEH_TAXI,-222.1833,1094.5259,19.3668,267.9370,6,1,-1); // taxi - 47
	CreateVehicle(438,-229.8830,1094.5428,19.5790,270.5587,6,76,-1); // taxi - 48
	CreateVehicle(VEH_AMBULANCIA,-328.5625,1063.7593,19.8952,267.4351,1,3,-1); // ambulancia - 49
	CreateVehicle(478,-290.0367,1163.1853,19.6832,88.2329,40,1,-1); // camionatinha - 50
	CreateVehicle(VEH_SABRE,-143.5764,1111.9803,19.5540,1.4576,6,6,-1); // sabre auto - 51
	CreateVehicle(VEH_SABRE,-147.2038,1114.4742,19.5472,358.3855,6,6,-1); // sabre auto - 52
	CreateVehicle(VEH_SABRE,-147.2490,1128.8910,19.5439,0.4013,6,6,-1); // sabre auto - 53
	CreateVehicle(521,-137.7813,1127.7449,19.2955,59.6575,6,6,-1); // fcr auto - 54
	CreateVehicle(523,-211.0403,973.7650,18.6285,266.1498,0,1,-1); // motocop - 55
	CreateVehicle(VEH_CARCOPSF,-211.5761,984.4426,19.5220,271.6649,0,1,-1); // carcop - 56
	CreateVehicle(VEH_CARCOPCS,-211.4822,988.6226,19.6185,269.0335,0,1,-1); // carcop - 57
	CreateVehicle(VEH_CARCOPCS,-211.0507,993.4313,19.6987,265.8234,0,1,-1); // carcop - 58
	CreateVehicle(584,284.0438,1349.0657,10.1557,355.0104,0,1,-1); // carreta refinaria 1 - 59
	CreateVehicle(514,280.6498,1385.6342,10.1560,270.3433,0,1,-1); // tanker refinaria - 60
	CreateVehicle(478,-359.5844,1179.4850,19.7376,227.5946,40,1,-1); // camionete desmanche - 61
	CreateVehicle(444,364.6568,2536.4775,17.0400,186.9105,-1,-1,-1); // heli verdant - 62
	CreateVehicle(487,328.2084,2539.6592,17.1778,160.0905,-1,-1,-1); // aviao verdant - 63
	CreateVehicle(493,435.8224,2528.5095,17.2491,89.6305,3,6,-1); // monster verdant - 64

	// Carros San Fierro
	CreateVehicle(VEH_CARROFORTE,-2862.6038,1067.8722,31.5437,271.4576,0,93,-1); //carro forte - 65
    CreateVehicle(VEH_CARROFORTE,-2859.0481,1054.9222,32.7858,107.1070,0,93,-1); //carro forte - 66
    CreateVehicle(VEH_CARROFORTE,-2865.8396,1043.9181,34.0961,184.6119,0,93,-1); //carro forte - 67
	CreateVehicle(VEH_TAXI,-1446.8502,-280.6407,13.795,63.8307,6,6,-1); // taxi aero-porto - 68
	CreateVehicle(582,-2516.9233,-602.1367,132.9338,359.6379,1,0,-1); // van de reporter - 69
	CreateVehicle(566,-2397.5791,-610.8218,133.0197,213.7984,1,1,-1); // sem dono - 70
	CreateVehicle(404,-2498.1953,-602.0826,132.9338,359.6086,-1,-1,-1); // sem dono - 71
	CreateVehicle(VEH_PIZZABOY,-1806.0667,951.5513,24.8906,176.8832,3,1,-1); // pizzaboy - 72
	CreateVehicle(VEH_PIZZABOY,-2330.6489,-164.3958,35.5547,267.6751,3,1,-1); // pizzaboy - 73
	CreateVehicle(537,-1942.8452,167.4841,27.2245,356.7458,1,1,-1); // trem - 74
	CreateVehicle(449,-2264.8333,547.5076,35.5183,180.4091,3,3,-1); // bonde - 75
	CreateVehicle(VEH_CARCOPSF,-1607.5646,724.4725,12.0493,268.6696,0,1,-1); // carcopsf - 76
 	CreateVehicle(VEH_CARCOPSF,-1588.2479,748.0393,-5.4903,359.9998,0,1,-1); // carcop - 77
	CreateVehicle(523,-1584.0217,749.4910,-5.6655,180.9966,0,0,-1); // carcop - 78
	CreateVehicle(523,-1579.8461,749.0732,-5.6571,181.8757,0,0,-1); // carcop - 79
	CreateVehicle(VEH_CARCOPSF,-1574.2565,742.4983,-5.5206,88.9996,0,1,-1); // carcop - 80
	CreateVehicle(523,-1573.5985,734.6492,-5.6689,90.0025,0,0,-1); // carcop - 81
	CreateVehicle(497,-1679.5951,706.1432,30.7954,90.5114,0,1,-1); // helicop - 82
	CreateVehicle(437,-1988.5007,162.0946,27.6508,0.0000,1,1,-1); // busao - 83
	CreateVehicle(437,-1988.3359,131.3477,27.6943,0.0000,1,1,-1); // busao - 84
	CreateVehicle(VEH_MANANA,-2089.6643,-83.5934,34.7976,359.9729,6,6,-1); // carroescola - 85
	CreateVehicle(VEH_MANANA,-2081.2825,-83.4888,34.8086,4.0901,6,6,-1); // carroescola - 86
	CreateVehicle(461,-2022.3977,-124.3720,34.7832,179.9717,6,6,-1); // motoescola - 87
	CreateVehicle(487,-2032.2460,-155.6209,35.4656,0.0060,6,0,-1); // heliesc - 88
	CreateVehicle(VEH_SABRE,-2088.8313,-156.0123,35.0983,359.9812,6,6,-1); // carroesc - 89
	CreateVehicle(VEH_SABRE,-2092.4036,-145.2734,35.0986,0.0400,6,6,-1); // carroesc - 9
	CreateVehicle(VEH_SABRE,-2092.3503,-132.4997,35.0966,0.4676,6,6,-1); // carroesc - 91
	CreateVehicle(487,-1829.1174,1300.2819,59.8817,204.0558,54,29,-1); // mavmoto - 92
	CreateVehicle(453,-1556.1755,1260.8345,-0.5926,234.7669,69,69,-1); // barco pesca - 93
	CreateVehicle(453,-1565.1833,1259.7523,-0.5379,227.8785,69,69,-1); // barcopesca - 94
	CreateVehicle(453,-1578.2352,1260.0367,-0.0551,228.0564,69,69,-1); // barco pesca - 95
	CreateVehicle(493,-1474.4727,687.5856,-0.2037,268.8839,6,6,-1); // barco escola - 96
	CreateVehicle(453,-1473.3943,703.5046,-0.4342,272.7462,6,6,-1); // barco escola - 97
	CreateVehicle(VEH_TAXI,-1703.0906,1003.9794,17.3778,91.1514,6,1,-1); // taxi - 98
	CreateVehicle(VEH_TAXI,-1687.7856,999.6074,17.3444,270.7191,6,1,-1); // taxi - 99
	CreateVehicle(VEH_TAXI,-1696.9393,977.3001,17.3661,180.7287,6,1,-1); // taxi - 100
	CreateVehicle(VEH_TAXI,-1687.5576,983.2572,17.3647,269.0692,6,1,-1); // taxi - 101
	CreateVehicle(VEH_TAXI,-1410.9570,-309.9071,13.7718,34.9767,6,6,-1); // taxi - 102
	CreateVehicle(581,-1687.7793,995.4088,17.3665,90.6660,6,1,-1); // moto taxi - 103
	CreateVehicle(VEH_TAXI,-1703.6134,1012.2395,17.3648,91.3088,6,1,-1); // taxi - 104
	CreateVehicle(VEH_LIMOSINE,-1816.4678,1311.4034,50.2892,275.5558,1,1,-1); // limomoto - 105
	CreateVehicle(VEH_LIMOSINE,-1829.7208,1289.6337,50.2512,110.5457,1,1,-1); // lomomoto - 106
	CreateVehicle(VEH_LIMOSINE,-1734.8969,1011.9638,17.3660,89.3191,1,1,-1); // limozine - 107
	CreateVehicle(VEH_LIMOSINE,-1734.9292,1020.2990,17.3648,90.4921,1,1,-1); // limozine - 108
	CreateVehicle(VEH_LIMOSINE,-1756.8873,951.8206,24.9184,90.0569,1,1,-1); // limozine - 109
	CreateVehicle(433,-1307.1633,456.9036,7.5909,89.9428,0,0,-1); // caminhao - 110
	CreateVehicle(433,-1306.5189,463.9994,7.6436,89.6543,0,0,-1); // caminhao - 111
	CreateVehicle(433,-1306.5568,460.6202,7.6451,90.4466,0,0,-1); // caminhao - 112
	CreateVehicle(433,-1309.4952,444.8434,7.6132,55.0000,0,0,-1); // caminhao - 113
	CreateVehicle(433,-1307.2222,447.7583,7.5937,54.9896,0,0,-1); // caminhao - 114
	CreateVehicle(470,-1241.5155,445.2168,7.1593,326.9936,44,44,-1); // carro - 115
	CreateVehicle(470,-1232.7764,451.6962,7.1680,89.9980,0,0,-1); // carro - 116
	CreateVehicle(425,-1403.2001,465.2320,7.7642,181.0000,0,0,-1); // hunter - 117
	CreateVehicle(425,308.9300,1990.3328,18.2170,180.0703,0,0,-1); // hunter - 118
	CreateVehicle(425,309.5915,2056.1018,18.1976,180.0104,0,0,-1); // hunter - 119
	CreateVehicle(592,-1632.3605,-265.8031,15.3416,12.1937,1,1,-1); // andromada - 120
	CreateVehicle(519,-1626.1268,-219.8978,15.0673,339.8286,1,1,-1); // shamal - 121
	CreateVehicle(593,-1708.3000,-247.4316,14.6091,360.0000,0,0,-1); // dodo - 122
	CreateVehicle(403,-1732.9801,-110.8736,5.0921,40.0861,3,3,-1); // linerun - 123
	CreateVehicle(VEH_BAUTRAILER,-1720.1995,-63.6686,3.6880,133.0925,3,3,-1); // carreta 1 - 124
	CreateVehicle(VEH_BAUTRAILER,-1723.5540,-59.6139,3.6883,134.0423,3,3,-1); // carreta2 - 125
	CreateVehicle(VEH_BAUTRAILER,-1728.0133,-55.9080,3.6880,132.7226,3,3,-1); // carreta3 - 126
	CreateVehicle(VEH_BAUTRAILER,-1731.6532,-52.2449,3.6880,132.5403,3,3,-1); // carreta4 - 127
	CreateVehicle(VEH_BAUTRAILER,-1735.1477,-96.0247,3.6822,38.6315,3,3,-1); // carreta5 - 128
	CreateVehicle(VEH_BAUTRAILER,-1726.1198,-87.0242,3.6876,46.7879,3,3,-1); // carreta6 - 129
	CreateVehicle(VEH_BAUTRAILER,-1723.2843,-84.4416,3.6883,44.7653,3,3,-1); // carreta7 - 130
    CreateVehicle(584,-2414.3237,952.5922,44.9535,269.1496,1,1,-1); // careta1 - 131
	CreateVehicle(VEH_AMBULANCIA,-2573.1768,632.4861,14.1799,90.000,1,3,-1); // ambulancia - 132
	CreateVehicle(VEH_AMBULANCIA,-2625.6328,629.8738,14.1801,270.000,1,3,-1); // ambulancia - 133
	CreateVehicle(VEH_AMBULANCIA,-2592.8674,660.9832,27.5316,90.000,1,3,-1); // ambulancia - 134
    carroaluguel = CreateVehicle(504,-1665.7111,1224.1819,20.9466,40.9238,0,0,-1); // Agencia de alugueis otto cars - 135
    carroaluguel2 = CreateVehicle(492,-1680.5042,1210.2413,20.9380,50.2592,0,0,-1); // Agencia de alugueis otto cars - 136
    carroaluguel3 = CreateVehicle(491,-1658.3174,1206.0847,20.8698,2.0899,0,0,-1); // Agencia de alugueis otto cars - 137
    carroaluguel4 = CreateVehicle(VEH_INFERNUS,-1678.6064,1210.7205,13.4010,44.3841,4,4,-1); // Agencia de alugueis otto cars - 138
    carroaluguel5 = CreateVehicle(415,-1667.7877,1222.8989,13.4468,282.5329,1,1,-1); // Agencia de alugueis otto cars - 139
    carroaluguel6 = CreateVehicle(402,-1646.4025,1206.4597,13.5070,234.7827,6,6,-1); // Agencia de alugueis otto cars - 140
    carroaluguel7 = CreateVehicle(421,-1659.4150,1219.4540,13.5543,301.7943,0,0,-1); // Agencia de alugueis otto cars - 141
    carroaluguel8 = CreateVehicle(474,-1668.8802,1206.8923,7.0173,320.1071,0,0,-1); // Agencia de alugueis otto cars - 142
    carx = CreateVehicle(451,-2714.3953,196.1324,4.0351,179.7363,0,0,-1); // Wheel arch angels - 143
    
	// Carros Los Santos
	CreateVehicle(538,801.0978,-1354.3145,-0.1562,48.3636,1,1,-1); // trem - 144
	CreateVehicle(VEH_CARCOPSF,1602.5104,-1700.1234,6.0783,89.8649,0,1,-1); // carro cop - 145
	CreateVehicle(VEH_CARCOPSF,1535.6339,-1677.9895,13.1038,1.2792,0,1,-1); // carcopls - 146
	CreateVehicle(VEH_TAXI,1658.3230,-1719.1973,20.2619,356.5259,6,1,-1); // taxi - 147
	CreateVehicle(VEH_AMBULANCIA,1179.6992,-1338.6689,14.1709,272.5164,1,3,-1); // ambulancia - 148
	CreateVehicle(407,1749.5994,-1455.1704,13.6770,270.4327,3,1,-1); // bombeiro - 149
	CreateVehicle(577,2007.9968,-2452.5190,13.4781,114.4148,0,1,-1);//at-400 - 150
	CreateVehicle(592,1929.8413,-2420.5664,14.7364,151.3048,1,1,-1); // andromada - 151
	CreateVehicle(519,1880.5740,-2415.2832,14.4735,211.5916,1,1,-1); // shamal - 152
	CreateVehicle(519,1860.9817,-2419.2339,14.4755,222.8972,1,1,-1); // shamal - 153
	CreateVehicle(593,1989.0896,-2394.1892,14.0093,120.8235,0,0,-1); // dodo - 154
	CreateVehicle(608,1992.5629,-2465.1179,15.7895,22.8657,0,0,-1); // escada - 155
	CreateVehicle(VEH_CARCOPSF,1652.7618,-2323.6194,13.1833,269.5071,0,1,-1); // carro policia aero - 156

	// Carros Las Venturas
	CreateVehicle(VEH_AMBULANCIA,1571.5830,1739.2963,11.1164,3.2085,1,3,-1); // ambulancia - 157

//-------------------------- OBJETOS E PICKUP's ---------------------------------//
	CreateObject(16477,2463.2739,-58.5999,25.6200,0,0,101.5); // posto
	CreateObject(1686,2461.1143,-40.5480,25.6800,0,0,90); // bomba de combustivel
	CreateObject(1686,2464.1423,-40.5479,25.6800,0,0,90); // bomba de combustivel
	CreateObject(1686,2463.7864,-46.5849,25.6800,0,0,90); // bomba de combustivel
	CreateObject(1686,2460.6365,-46.5516,25.6800,0,0,90); // bomba de combustivel
	CreateObject(2754,-2671.3176,636.8948,14.4531,0,0,180);//caixa eletronico hospital
	CreateObject(2754,-1980.0176,165.6948,27.6875,0,0,0);//caixa eletronico rodoviaria
	CreateObject(2754, 1707.557739, -1682.152100, 13.449019, 0, 0, 90);//caixa banco central ls
	CreateObject(2754, 395.868530, -1806.711060, 7.665324, 0, 0, 270);//caixa banco secuntario ls
	CreateObject(2754, 1582.904907, 1756.698242, 10.722457, 0, 0, 270);//caixa hospital lv
	CreateObject(2754, -180.679840, 1137.522949, 19.650196, 0, 0, 0);//caixa fc
	CreateObject(2754, -2206.764893, -2291.594482, 30.534670, 0, 0, 230.2339);//caixa ap
	CreateObject(1238,-2063.9045,-178.4728,34.8203,0,0,0); //cone auto sf
	CreateObject(1238,-2064.4001,-186.0513,34.8203,0,0,0); //cone auto sf
	CreateObject(1238,-2063.2490,-192.7540,34.8203,0,0,0); //cone auto sf
	CreateObject(1238,-2067.5437,-195.1631,34.8203,0,0,0); //cone auto sf
	CreateObject(1238,-2073.2283,-195.8197,34.8203,0,0,0); //cone auto sf
	CreateObject(1238,-2078.1802,-191.3293,34.8203,0,0,0); //cone auto sf
	CreateObject(1238,-2084.4641,-186.5283,34.8203,0,0,0); //cone auto sf
	CreateObject(17573,-2333.3542,-1638.3593,483.2702,0,0,130); //casa
	CreateObject(1238,-2175.2144,-2382.9856,29.8688,0,0,0); //cone
	CreateObject(1238,-2151.5981,-2400.7253,29.8688,0,0,0); //cone
    CreateObject(16361, -1990.126099, -36.748909, 34.261917, 0, 0, 270);
    CreateObject(640, -1996.484375, -41.752087, 35.010704, 0, 0, 180);
    CreateObject(640, -1996.584961, -48.593716, 35.017345, 0, 0, 180);
    CreateObject(640, -1996.594238, -30.931187, 34.941437, 0, 0, 180);
    CreateObject(640, -1996.596802, -23.896408, 34.905777, 0, 0, 180);
    CreateObject(678, -1996.999023, -44.985119, 34.431408, 0, 0, 33.75);
    CreateObject(634, -1995.188965, -45.141659, 34.336464, 0, 0, 0);
    CreateObject(634, -1995.392578, -27.575947, 34.230988, 0, 0, 0);
    CreateObject(669, -1992.921021, -3.017248, 33.931404, 0, 0, 0);
    CreateObject(1696, -1990.635498, -28.934231, 38.996548, 0, 0, 180);
    CreateObject(1696, -1990.241821, -42.898766, 38.996548, 0, 0, 180);
    CreateObject(14665, -1989.962646, -36.365780, 21.896940, 0, 0, 0);
    CreateObject(16378, -1993.479248, -44.955719, 20.641701, 0, 0, 270);
    CreateObject(16154, -1992.590210, -28.261271, 19.986359, 0, 0, 180);
    CreateObject(14493, -1995.266846, -38.783585, 22.189928, 0, 0, 90);
    CreateObject(18092, -1992.756226, -34.301636, 20.411995, 0, 0, 180);
    CreateObject(1671, -1992.457275, -33.124660, 20.372787, 0, 0, 22.5);
    CreateObject(1721, -1993.385376, -29.980417, 19.925724, 0, 0, 0);
    CreateObject(1723, -1994.578003, -40.812881, 19.910620, 0, 0, 90);
    CreateObject(1723, -1991.560669, -41.903053, 19.910620, 0, 0, 180);
    CreateObject(2180, -1990.240234, -39.886398, 19.910364, 0, 0, 90);
    CreateObject(2605, -1988.557495, -46.678547, 20.311003, 0, 0, 180);
    CreateObject(1721, -1988.282227, -45.482025, 19.925716, 0, 0, 157.5);
    CreateObject(7191, -2010.701416, -31.120234, 21.887243, 0, 0, 270);
    CreateObject(7191, -2016.105469, -38.064735, 21.912243, 0, 0, 270);
    CreateObject(7191, -1990.463135, -38.160088, 7.387243, 90.2409, 358.2811, 270);
    CreateObject(7191, -1988.584717, -40.156784, 7.412248, 90.2409, 339.3735, 199.5264);
    CreateObject(7191, -1988.620972, -40.631615, 7.387253, 90.2409, 339.3735, 199.5264);
    CreateObject(7191, -2011.281128, -42.588490, 21.862244, 0, 0, 90);
    CreateObject(7191, -1988.630127, -7.321120, 21.887243, 0, 0, 180);
    CreateObject(7191, -1988.638794, -27.168760, 24.387236, 0, 0, 180);
    CreateObject(1502, -1992.471436, -38.029018, 19.955360, 0, 0, 180);
    CreateObject(1502, -1988.642212, -31.016083, 19.903509, 0, 0, 90.0001);
    CreateObject(7191, -1988.566528, -38.341255, 24.378912, 0, 0, 267.6626);
    CreateObject(7191, -1984.990967, -38.510185, 21.887243, 90.2408, 354.8434, 272.8191);
    CreateObject(1502, -1988.473755, -38.443535, 19.903509, 0, 0, 0);
    CreateObject(7191, -1988.715820, -33.181648, 21.887243, 268.1446, 16.3293, 196.9481);
    CreateObject(1532, -1995.414795, -37.926327, 19.906408, 0, 0, 90);
    CreateObject(1532, -1995.458374, -34.912140, 19.906408, 0, 0, 269.9999);
    CreateObject(1518, -1990.227661, -39.515747, 20.992130, 0, 0, 281.25);
    CreateObject(7191, -1964.916260, -29.222893, 21.887243, 0, 0, 90);
    CreateObject(1502, -1988.597290, -29.281738, 19.903509, 0, 0, 0.0001);
    CreateObject(7191, -1988.541504, -29.259926, 24.380289, 0, 0, 92.337);
    CreateObject(2836, -1993.602539, -36.073292, 19.912140, 0, 0, 0);
    CreateObject(2833, -1993.931396, -39.059322, 19.912140, 0, 0, 270);
    CreateObject(14527, -1992.855347, -39.863598, 21.294979, 0, 0, 0);
    CreateObject(2833, -1992.838257, -39.061745, 19.912140, 0, 0, 270);
    CreateObject(2738, -1984.922607, -26.840427, 20.515415, 0, 0, 270);
    CreateObject(2524, -1986.194824, -28.650637, 19.912565, 0, 0, 180);
    CreateObject(2835, -1987.195923, -27.623489, 19.910673, 0, 0, 0);
    CreateObject(2834, -1986.996460, -32.213314, 19.912140, 0, 0, 270);
    CreateObject(2833, -1991.316650, -44.434891, 19.912140, 0, 0, 270);
    CreateObject(2833, -1987.141113, -42.603943, 19.912140, 0, 0, 270);
    CreateObject(2596, -1994.387939, -31.547955, 22.799969, 0, 0, 0);
    CreateObject(2229, -1989.851807, -41.169472, 19.912565, 0, 0, 270);
    CreateObject(2190, -1991.777588, -34.883747, 20.908075, 0, 0, 180);
    CreateObject(2028, -1990.371582, -38.787380, 20.795349, 0, 0, 270);
    CreateObject(1318, -1995.716553, -36.494286, 35.260208, 0, 0, 0);
    CreateObject(1318, -1994.810059, -36.399963, 20.736036, 0, 0, 0);
    CreateObject(1239, -1992.393555, -35.100075, 20.457029, 0, 0, 0);
    CreateObject(2690, -1995.096924, -34.671234, 21.884041, 0, 0, 101.25);
	AddStaticPickup(1274,1,-2425.2385,66.4771,35.1719);
	CreateObject(4859, 3923.016357, -315.825928, 31.351326, 0.196350, 0.000000, 0.000000);
	CreateObject(5812, 3926.851318, -346.635834, 30.468454, -1.767145, 0.000000, 0.000000);
	CreateObject(1612, 3917.264404, -280.495758, 38.334255, 1.374447, 0.000000, 0.000000);
	portaotrafico = CreateObject(7657, -2122.220703, -80.644669, 36.037155, 0, 0, 0);//portao da fabrica de drogas
    portao1 = CreateObject(975, -1770.112793, 979.835083, 24.182503, 0, 0, 270);//portao do estacionamento 1
    portao2 = CreateObject(975, -1770.122803, 988.664185, 24.182503, 0, 0, 270);//portao do estacionamento 2
//------------------------------ COMPONENTS --------------------------------------//
    AddVehicleComponent(carx,1010);
    AddVehicleComponent(carx,1087);
//------------------------------ GANGZONE's --------------------------------------//
	Pesca1 = GangZoneCreate(-1610.9099, 1279.2794, -1496.5111, 1295.2489);// cooperativa de pesca
	Plantacao = GangZoneCreate(-1194.7273, -1064.6096, -1007.1719, -915.6717);//pantação da fazenda
	VendaMilho = GangZoneCreate(-1118.8129, -1319.42541, -1027.5986, -1120.223);//fazenda, venda de milho
	Caca1 = GangZoneCreate(-2824.2483, -1534.1261, -2801.2568, -1510.1261);//cooperativa de caça
//------------------------------- TEXTDRAW's -------------------------------------//
	Bemvindo = TextDrawCreate(320,200,"~r~Bem-vindo ao ~n~ ~b~MPA Reload RPG");
	TextDrawColor(Bemvindo,0xFFF000FF);
	TextDrawAlignment(Bemvindo,2);
	TextDrawFont(Bemvindo,0);
	TextDrawLetterSize(Bemvindo,2.5,2.5);
	//txtdr2
	Bemvindo2 = TextDrawCreate(320,240,"~w~Comandos: ~n~ /ajuda - Ajuda sobre o RPG ~n~ /aprender - Aprenda mais sobre gamemode RPG ~n~ /profissoes - Lista de profiss¨es disponiveis ~n~ Para mais comandos, digite /comandos ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~b~Visite o nosso site: WWW.GTABRASIL.NET");
	TextDrawColor(Bemvindo2,COR_AZUL);
	TextDrawAlignment(Bemvindo2,2);
	TextDrawFont(Bemvindo2,1);
	TextDrawSetOutline(Bemvindo2,1);
	TextDrawSetShadow(Bemvindo2,0);
	//site-announce
	Bemvindo3 = TextDrawCreate(320,400,"Visite nosso site: WWW.GTABRASIL.NET ~n~WWW.MPACLAN.COM ~n~ WWW.INFERNUSGROUP.COM");
	TextDrawColor(Bemvindo3,COR_NARCOTICOS);
	TextDrawSetOutline(Bemvindo3,1);
	TextDrawSetShadow(Bemvindo3,1);
	TextDrawAlignment(Bemvindo3,2);
	
	moneyloteria = 2000;
	
	for(new i=0; i<QTCARS; i++){
	new strgas[256];
	format(strgas,256,"%d.vinfo",i);
	if(!fexist(strgas))
	if(dini_Isset(strgas,"gasolina"))
	GPV[i] = dini_Int(strgas,"gasolina");
	new tmp[256];
	new slot;
    format(tmp,256,"%d.vinfo",i);
    new tmp2[256];
    format(tmp2,256,"tun%d",slot);
    if(fexist(tmp2))
    AddVehicleComponent(i,slot);
    new color1;
    color1 = dini_Int(tmp,"cor1");
    new color2;
    color2 = dini_Int(tmp,"cor2");
    ChangeVehicleColor(i,color1,color2);
	}
	new QtCarros;
	new QtCasas;
	new File:temp;
	new index = 0;
	new tmp[256];
	new modelid, Float:X, Float:Y, Float:Z, Float:ang, Cor1, Cor2;
	temp = fopen("reloadrpg.carros", io_readwrite);
	while(fread(temp, tmp, sizeof(tmp), false)) {
		index = 0;
		modelid    = strval(strtok(tmp, index));
		X          = Float:floatstr(strtok(tmp, index));
		Y          = Float:floatstr(strtok(tmp, index));
		Z          = Float:floatstr(strtok(tmp, index));
		ang        = Float:floatstr(strtok(tmp, index));
		Cor1       = strval(strtok(tmp, index));
		Cor2       = strval(strtok(tmp, index));
		CreateVehicle(modelid, X, Y, Z, ang, Cor1, Cor2,-1);
		QtCarros++;
	}
	fclose(temp);
	
	temp = fopen("reloadrpg.casas", io_readwrite);
	while(fread(temp, tmp, sizeof(tmp), false)) {
		index = 0;
		X          = Float:floatstr(strtok(tmp, index));
		Y          = Float:floatstr(strtok(tmp, index));
		Z          = Float:floatstr(strtok(tmp, index));
  		AddStaticPickup(1272, 1, X, Y, Z);
  		QtCasas++;
	}
	fclose(temp);

	SetTimer("Bancos", 1000, 1);
	SetTimer("MoneyGrubScoreUpdate", 1000, 1);
	SetTimer("TempoPrisao", 1000, 1);
	SetTimer("Taxi", 5000, 1);
	SetTimer("MTaxi", 5000, 1);
	SetTimer("ATaxi", 5000, 1);
	SetTimer("Tempo", 60000, 1);
	SetTimer("tirandograna", 2000, 1);
	SetTimer("CheckFuel", 50000, 1);
	SetTimer("Speed",250,true);
	SetTimer("verificacao",50000,1);
	SetTimer("Semana",140000,false);
	SetTimer("Cheat", 600000, 1);
	SetTimer("Megasena", 600000, 1);
	SetTimer("balada", 1000, 1);
	SetTimer("quefome",30000,1);
	SetTimer("CreateStartupFiles",1000,1);
	SetTimer("SaveFiles",1000,1);
	SetTimer("LoadFiles",1000,1);
	
	detonado = TextDrawCreate(214.000000,170.000000,"Detonado!");
    TextDrawAlignment(detonado,0);
    TextDrawBackgroundColor(detonado,0x000000ff);
    TextDrawFont(detonado,0);
    TextDrawLetterSize(detonado,2.000000,3.000000);
    TextDrawColor(detonado,0xff000066);
    TextDrawSetOutline(detonado,1);
    TextDrawSetProportional(detonado,1);
    TextDrawSetShadow(detonado,1);
    
    TextDrawUseBox(velo, true);
	TextDrawBoxColor(velo, 0x0000FF);
	TextDrawFont(velo, 5);

    radares = CreateMenu("Radares",1,30.0,140.0,220.0,0.0);
	AddMenuItem(radares,0,"Ativar Radares da Cidade");
	AddMenuItem(radares,0,"Desativar Radares da Cidade");
	AddMenuItem(radares,0,"Sair");

	Terminais = CreateMenu("Terminais",1,30.0,140.0,220.0,0.0);
	AddMenuItem(Terminais,0,"Circuito de SF");
	AddMenuItem(Terminais,0,"Circuito de SF 2");
	AddMenuItem(Terminais,0,"Sair");
	
	acceptprof = CreateMenu(" ",1,30.0,140.0,220.0,0.0);
	SetMenuColumnHeader(acceptprof,0,"Aceita essa profissao?");
	AddMenuItem(acceptprof,0,"Aceitar");
	AddMenuItem(acceptprof,0,"Recusar");

	cardapio = CreateMenu("Cardapio",1,30.0,140.0,220.0,0.0);
	if(IsValidMenu(cardapio)){
	    SetMenuColumnHeader(cardapio,0,"Refeições");
	    SetMenuColumnHeader(cardapio,1,"Valor");
		AddMenuItem(cardapio,0,"X-Bacon");
		AddMenuItem(cardapio,1,"R$5");
		AddMenuItem(cardapio,0,"X-Burguer");
		AddMenuItem(cardapio,1,"R$6");
		AddMenuItem(cardapio,0,"X-Salada");
		AddMenuItem(cardapio,1,"R$4");
		AddMenuItem(cardapio,0,"Cachorro quente");
		AddMenuItem(cardapio,1,"R$6");
		AddMenuItem(cardapio,0,"Batata Frita");
		AddMenuItem(cardapio,1,"R$10");
		AddMenuItem(cardapio,0,"Refrigerante");
		AddMenuItem(cardapio,1,"R$5");
		AddMenuItem(cardapio,0,"Cerveja");
		AddMenuItem(cardapio,1,"R$5");
		AddMenuItem(cardapio,0,"Suco");
		AddMenuItem(cardapio,1,"R$4");
		AddMenuItem(cardapio,0,"Sair");
	}

//Menu das Profs

    level0 = CreateMenu("Profissoes",1,30.0,140.0,220.0,0.0);
	AddMenuItem(level0,0,"Entregador de Pizza");//2
	AddMenuItem(level0,0,"Sorveteiro");//4
	AddMenuItem(level0,0,"Taxista");//9
	AddMenuItem(level0,0,"Mendingo");//34
	AddMenuItem(level0,0,"Motorista de Onibus");//33
	AddMenuItem(level0,0,"Cancelar");
	
	level5 = CreateMenu("Profissoes",1,30.0,140.0,220.0,0.0);
	AddMenuItem(level5,0,"Barman");//3
	AddMenuItem(level5,0,"Pescador");//19
	AddMenuItem(level5,0,"Vendedor de Lanches");//5
	AddMenuItem(level5,0,"Caminhoneiro");//39
	AddMenuItem(level5,0,"Anterior<<");
	AddMenuItem(level5,0,"Cancelar");
	
	level10 = CreateMenu("Profissoes",1,30.0,140.0,220.0,0.0);
	AddMenuItem(level10,0,"Agricultor");//20
	AddMenuItem(level10,0,"Cacador");//18
	AddMenuItem(level10,0,"Motorista Particular");//32
	AddMenuItem(level10,0,"Transporte de combustivel");//40
	AddMenuItem(level10,0,"Anterior<<");
	AddMenuItem(level10,0,"Cancelar");
	
	level15 = CreateMenu("Profissoes",1,30.0,140.0,220.0,0.0);
	AddMenuItem(level15,0,"Frentista");//8
	AddMenuItem(level15,0,"Paramedico");//6
	AddMenuItem(level15,0,"Assassino");//13
	AddMenuItem(level15,0,"<Anterior");
	AddMenuItem(level15,0,"Cancelar");

	level20 = CreateMenu("Profissoes",1,30.0,140.0,220.0,0.0);
	AddMenuItem(level20,0,"Instrutor");//7
	AddMenuItem(level20,0,"Traficante");//16
	AddMenuItem(level20,0,"Assaltante");//14
	AddMenuItem(level20,0,"Seguranca");//31
	AddMenuItem(level20,0,"<Anterior");
	AddMenuItem(level20,0,"Cancelar");
	
	level25 = CreateMenu("Profissoes",1,30.0,140.0,220.0,0.0);
	AddMenuItem(level25,0,"Mecanico");//42
	AddMenuItem(level25,0,"Segurador");//37
	AddMenuItem(level25,0,"Policia Civil");//21
	AddMenuItem(level25,0,"Ladrao de carros");//15
	AddMenuItem(level25,0,"<Anterior");
	AddMenuItem(level25,0,"Cancelar");
	
	level30 = CreateMenu("Profissoes",1,30.0,140.0,220.0,0.0);
	AddMenuItem(level30,0,"Policia Rodoviaria");//22
	AddMenuItem(level30,0,"Taxi-Aereo");//11
	AddMenuItem(level30,0,"Vendedor de Armas");//17
	AddMenuItem(level30,0,"Sequestrador");//12
	AddMenuItem(level30,0,"<Anterior");
	AddMenuItem(level30,0,"Cancelar");
	
	level35 = CreateMenu("Profissoes",1,30.0,140.0,220.0,0.0);
	AddMenuItem(level35,0,"Locador de Carros");//41
	AddMenuItem(level35,0,"IBAMA");//28
	AddMenuItem(level35,0,"Confiscador");//43
	AddMenuItem(level35,0,"<Anterior");
	AddMenuItem(level35,0,"Cancelar");

	
	level40 = CreateMenu("Profissoes",1,30.0,140.0,220.0,0.0);
	AddMenuItem(level40,0,"Advogado");//30
	AddMenuItem(level40,0,"Narcoticos");//26
	AddMenuItem(level40,0,"Policia Florestal");//27
	AddMenuItem(level40,0,"<Anterior");
	AddMenuItem(level40,0,"Cancelar");
	
	level45 = CreateMenu("Profissoes",1,30.0,140.0,220.0,0.0);
	AddMenuItem(level45,0,"Policia de Elite");//23
	AddMenuItem(level45,0,"Corretor de Imoveis");//36
	AddMenuItem(level45,0,"<Anterior");
	AddMenuItem(level45,0,"Cancelar");
	
	level50 = CreateMenu("Profissoes",1,30.0,140.0,220.0,0.0);
	AddMenuItem(level50,0,"Exercito");//29
	AddMenuItem(level50,0,"Vendedor de Carros");//35
	AddMenuItem(level50,0,"<Anterior");
	AddMenuItem(level50,0,"Cancelar");
	
	level55 = CreateMenu("Profissoes",1,30.0,140.0,220.0,0.0);
	AddMenuItem(level55,0,"Juiz");//25
	AddMenuItem(level55,0,"Delegado");//24
	AddMenuItem(level55,0,"<Anterior");
	AddMenuItem(level55,0,"Cancelar");
	
	print("Gamemode carregado com sucesso");
	printf("Foram carregados %d Carros e %d Casas", QtCarros, QtCasas);
    return 1;
}
public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerInterior(playerid,6);
	SetPlayerPos(playerid,768.2721,-36.8625,1000.6865);
	SetPlayerFacingAngle(playerid, 180.000);
	SetPlayerCameraPos(playerid,770.1794,-39.5800,1000.6865);
	SetPlayerCameraLookAt(playerid,768.2721,-36.8625,1000.6865);
	TextDrawShowForPlayer(playerid,Bemvindo);
	TextDrawShowForPlayer(playerid,Bemvindo2);
	TextDrawShowForPlayer(playerid,Bemvindo3);
	SetTimerEx("textdestroy",8000,false,"d",playerid);
	return 1;
	}

public OnGameModeExit()
{
	for(new i=0; i<MAX_PLAYERS; i++){
		if(IsPlayerConnected(i)){
			if(PLAYERLIST_authed[i] == 1) {
				udb_setAccState(PlayerName(i),GetPlayerMoney(i));
				new Float:health;
				GetPlayerHealth(i, health);
				udb_setHealth(PlayerName(i), health);
				printf("Os dados de %s (ID: %d) foram salvos com sucesso\n",PlayerName(i),i);
				DestroyMenu(radares);
				DestroyMenu(Terminais);
				DestroyMenu(acceptprof);
				DestroyMenu(cardapio);
				DestroyMenu(level0);
				DestroyMenu(level5);
				DestroyMenu(level10);
				DestroyMenu(level15);
				DestroyMenu(level20);
				DestroyMenu(level25);
				DestroyMenu(level30);
				DestroyMenu(level35);
				DestroyMenu(level40);
				DestroyMenu(level45);
				DestroyMenu(level50);
				DestroyMenu(level55);
				
			}
		}
	}
	print("Saindo do MPA Reload RPG");
	return 1;
}

public OnPlayerConnect(playerid)
{
    new string[256];
  	format(string, sizeof(string), "* %s acabou de entrar.", PlayerName(playerid));
	SendClientMessageToAll(COR_COP_ELITE, string);
    TogglePlayerClock(playerid, worldTime);
	SendClientMessage(playerid, COR_COP_ELITE, "MPA® Reload RPG™");
	SendClientMessage(playerid, COR_AZULB, "Precisa de Ajuda? /ajuda");
	SendClientMessage(playerid, COR_AZULB, "Quais Comandos? /comandos");
	SendClientMessage(playerid, COR_AZULB, "Nunca Jogou? /aprender");
	SetPlayerMapIcon(playerid, 1, -2431.1716, 67.0822, 35.1719, 52, 0xFFFFFFFF);//banco sf centro
	SetPlayerMapIcon(playerid, 2, -1981.4067, 165.7179, 27.6875, 52, 0xFFFFFFFF);//banco sf rodoviaria
	SetPlayerMapIcon(playerid, 3, -2670.0745, 636.9832, 14.4531, 52, 0xFFFFFFFF);//banco sf hospital
	SetPlayerMapIcon(playerid, 4, -2206.0032, -2290.7778, 30.6250, 52, 0xFFFFFFFF);//banco ap
	SetPlayerMapIcon(playerid, 5, 1707.6603, -1683.2781, 13.5469, 52, 0xFFFFFFFF);//banco ls principal
	SetPlayerMapIcon(playerid, 6, 395.8569, -1805.9064, 7.8380, 52, 0xFFFFFFFF);//banco ls secuntario
	SetPlayerMapIcon(playerid, 7, -181.5996, 1137.5221, 19.7422, 52, 0xFFFFFFFF);//banco fc
	SetPlayerMapIcon(playerid, 8, 1582.7406, 1757.4973, 10.8203, 52, 0xFFFFFFFF);//banco hospital lv
	SetPlayerMapIcon(playerid, 9, -2651.6501, 634.4510, 14.4531, 22, 0xFFFFFFFF);//hospital sf
	SetPlayerMapIcon(playerid, 10, -319.0593, 1061.6935, 19.7422, 22, 0xFFFFFFFF);//hospital fc
	SetPlayerMapIcon(playerid, 11, -1514.7489, 2528.3391, 55.7214, 22, 0xFFFFFFFF);//hospital ap
	SetPlayerMapIcon(playerid, 12, 1173.9358, -1324.5092, 14.9922, 22, 0xFFFFFFFF);//hospital ls
	SetPlayerMapIcon(playerid, 13, -2025.0167, 66.8148, 28.4352,20, 0xFFFFFFFF); // BOMBEIRO
	SetPlayerMapIcon(playerid, 14, 2237.6768, 2453.6729, 10.7541, 30, 0xFFFFFFFF); // DELEGACIA
	SetPlayerMapIcon(playerid, 15, -1605.3073, 718.3339, 11.9387, 30, 0xFFFFFFFF); // DELEGACIA
	SetPlayerMapIcon(playerid, 16, -213.4346, 979.4687, 19.3326, 30, 0xFFFFFFFF); // DELEGACIA
	SetPlayerMapIcon(playerid, 17, -2163.4719, -2386.5974, 30.6250, 30, 0xFFFFFFFF); // DELEGACIA
	SetPlayerMapIcon(playerid, 18, -142.8048, 1124.1094, 19.3151, 36, 0xFFFFFFFF); // AUTO ESCOLA
	SetPlayerMapIcon(playerid, 19, -2129.7178, -2257.4451, 30.6250, 36, 0xFFFFFFFF); // AUTO ESCOLA
	SetPlayerMapIcon(playerid, 20, -2027.2357, -93.6293, 35.1641, 36, 0xFFFFFFFF); // AUTO ESCOLA
	SetPlayerMapIcon(playerid, 21,-2097.3877, -2255.6489, 30.6250, 51, 0xFFFFFFFF); // CARGA
	//gang zones
	GangZoneShowForPlayer(playerid, Pesca1, 0xDBDBFFFF);
	GangZoneShowForPlayer(playerid, Plantacao, 0x336600AA);
	GangZoneShowForPlayer(playerid, VendaMilho, 0xF0E68CAA);
	GangZoneShowForPlayer(playerid, Caca1, 0xAA3333AA);
	SetPlayerTime(playerid,worldTime,worldMinute);
	if (udb_Exists(PlayerName(playerid))) {
	SendClientMessage(playerid, COR_AZUL_CLARO, "Você já está registrado. Faça login com /logar [senha]");
	return 1;
	}
	if (!udb_Exists(PlayerName(playerid))) {
	SendClientMessage(playerid, COR_AZUL_CLARO, "Você não está registrado. Registre-se com /registrar [senha]");
	return 1;
	}
	PLAYERLIST_authed[playerid] = 0;
	AreaBanco[playerid] = 0;
	Log[playerid] = 0;
	return false;
}

public OnPlayerDisconnect(playerid, reason)
{
	if (PLAYERLIST_authed[playerid] == 1) {
		PLAYERLIST_authed[playerid] = 0;
		udb_setAccState(PlayerName(playerid),GetPlayerMoney(playerid));
		new Float:health;
		GetPlayerHealth(playerid, health);
		GetPlayerWeaponData(playerid,slotw,weapons,municao);
		udb_setHealth(PlayerName(playerid), health);
 		new msg[256];
		switch (reason){
 		case 0: {
				format(msg,sizeof(msg),"* %s saiu do servidor (Queda de Conexão)", PlayerName(playerid));
				SendClientMessageToAll(COR_COP_ELITE, msg);
			}
			case 1: {
				format(msg,sizeof(msg), "* %s saiu do servidor (Vontade Propria)", PlayerName(playerid));
				SendClientMessageToAll(COR_COP_ELITE, msg);
			}
			case 2: {
				format(msg,sizeof(msg), "* %s saiu do servidor (Kickado/Banido)", PlayerName(playerid));
				SendClientMessageToAll(COR_COP_ELITE, msg);
			}
		}
	}
	return 0;
}

public OnPlayerSpawn(playerid)
{
	zoneupdates[playerid] = 1;
	player_zone[playerid] = -1;
	TextDrawHideForPlayer(playerid,Bemvindo);
	TextDrawHideForPlayer(playerid,Bemvindo2);
	TextDrawHideForPlayer(playerid,Bemvindo3);
	if(!zoneupdate) zoneupdate = SetTimer("update_zones",1000,4);
    if(Profissao[playerid] == DESEMPREGADO) {
		SetPlayerColor(playerid, COR_DESEMPREGADO); // Cinza
		GivePlayerWeapon(playerid,6,0);//shevel
	}
	else if(Profissao[playerid] == ENTREGADOR_PIZZA) {
	    SetPlayerColor(playerid,COR_ENTREGADOR_PIZZA);
	    GivePlayerWeapon(playerid,2,1);//taco de golf
	}
	else if(Profissao[playerid] == BARMAN) {
		SetPlayerColor(playerid, COR_BARMAN); // Bege
		GivePlayerWeapon(playerid,2,0);//taco de golf
	}
	else if(Profissao[playerid] == SORVETEIRO) {
		SetPlayerColor(playerid, COR_SORVETEIRO);
		GivePlayerWeapon(playerid,8,1);//katana
	}
	else if(Profissao[playerid] == VENDEDOR_LANCHE) {
		SetPlayerColor(playerid, COR_VENDEDOR_LANCHES);
		GivePlayerWeapon(playerid,5,0);//bastão basebool
	}
	else if(Profissao[playerid] == PARAMEDICO) {
		SetPlayerColor(playerid, COR_PARAMEDICO);
		GivePlayerWeapon(playerid,22,80);//colt 45
	}
	else if(Profissao[playerid] == INSTRUTOR_DE_DIRECAO) {
		SetPlayerColor(playerid, COR_INSTRUTOR); // VClaro
		GivePlayerWeapon(playerid,5,0);//bastão basebool
	}
	else if(Profissao[playerid] == FRENTISTA) {
		SetPlayerColor(playerid, COR_FRENTISTA); // VClaro
		GivePlayerWeapon(playerid,22,80);//colt 45
	}
	else if(Profissao[playerid] == TAXISTA) {
		SetPlayerColor(playerid, COR_TAXISTA); // Amarelo
		GivePlayerWeapon(playerid,6,1);//shovel
	}
	else if(Profissao[playerid] == MOTO_TAXI) {
	    SetPlayerColor(playerid, COR_MOTO_TAXI);
	    GivePlayerWeapon(playerid,6,1);//shovel
	}
	else if(Profissao[playerid] == TAXI_AEREO) {
	    SetPlayerColor(playerid, COR_TAXI_AEREO);
	    GivePlayerWeapon(playerid,6,1);//shovel
	    GivePlayerWeapon(playerid,24,80);//desert eagle
	}
	else if(Profissao[playerid] == SEQUESTRADOR) {
	    SetPlayerColor(playerid, COR_SEQUESTRADOR);
	    GivePlayerWeapon(playerid,6,1);//shovel
	}
	else if(Profissao[playerid] == ASSASSINO) {
		SetPlayerColor(playerid, COR_ASSASSINO); // Vermelho
		GivePlayerWeapon(playerid,23,80);//desert eagle
		GivePlayerWeapon(playerid,32,450);//tec 9
		GivePlayerWeapon(playerid,8,1);//motoserra
		GivePlayerWeapon(playerid,25,27);// combat shotgun
	}
	else if(Profissao[playerid] == ASSALTANTE) {
	    SetPlayerColor(playerid,COR_ASSALTANTE);
	    GivePlayerWeapon(playerid,24,80);//desert eagle
	    GivePlayerWeapon(playerid,26,42);// cano cerrado
	    GivePlayerWeapon(playerid,29,500);//MP 5
	}
	else if(Profissao[playerid] == LADRAO_CARROS) {
	    SetPlayerColor(playerid,COR_LADRAO_CARROS);
	    GivePlayerWeapon(playerid,24,80);//desert eagle
	    GivePlayerWeapon(playerid,29,500);//MP 5
		GivePlayerWeapon(playerid,2,0);//bastão
	}
	else if(Profissao[playerid] == TRAFICANTE) {
	    SetPlayerColor(playerid,COR_TRAFICANTE);
	    GivePlayerWeapon(playerid,24,80);//desert eagle
	    GivePlayerWeapon(playerid,26,42);// cano cerrado
	    GivePlayerWeapon(playerid,29,500);//MP 5
	}
	else if(Profissao[playerid] == VENDEDOR_DE_ARMAS) {
	    SetPlayerColor(playerid,COR_VENDEDOR_ARMAS);
	    GivePlayerWeapon(playerid,24,80);//desert eagle
	    GivePlayerWeapon(playerid,26,42);// cano cerrado
	    GivePlayerWeapon(playerid,29,500);//MP 5
	    GivePlayerWeapon(playerid,42,400);
	}
	else if(Profissao[playerid] == CACADOR) {
		SetPlayerColor(playerid, COR_CACADOR);
		GivePlayerWeapon(playerid,5,0);//bastão basebool
	}
	else if(Profissao[playerid] == PESCADOR) {
		SetPlayerColor(playerid, COR_PESCADOR); // Bege
		GivePlayerWeapon(playerid,5,0);//bastão basebool
	}
	else if(Profissao[playerid] == AGRICULTOR) {
		SetPlayerColor(playerid, COR_AGRICULTOR); // Bege
		GivePlayerWeapon(playerid,5,0);//bastão basebool
	}
	else if(Profissao[playerid] == COP_CIVIL) {
		SetPlayerColor(playerid, COR_COP_CIVIL); // Azul
 		GivePlayerWeapon(playerid,22,80);//colt 45
		GivePlayerWeapon(playerid,3,1);// stick cop
	}
	else if(Profissao[playerid] == COP_RODOVIARIO) {
		SetPlayerColor(playerid, COR_COP_RODOVIARIO); // Azul
 		GivePlayerWeapon(playerid,22,80);//colt 45
		GivePlayerWeapon(playerid,3,1);// stick cop
	}
	else if(Profissao[playerid] == COP_ELITE) {
		SetPlayerColor(playerid, COR_COP_ELITE); // Azul Claro
		GivePlayerWeapon(playerid,3,0);//stick cop
		GivePlayerWeapon(playerid,29,500);//MP 5
		GivePlayerWeapon(playerid,27,100);//combat chotgun
	}
	else if(Profissao[playerid] == DELEGADO) {
	    SetPlayerColor(playerid, COR_DELEGADO); //Azul Escuro
	    GivePlayerWeapon(playerid,24,80);//desert eagle
		GivePlayerWeapon(playerid,3,1);// stick cop
		GivePlayerWeapon(playerid,26,42);// cano cerrado
		GivePlayerWeapon(playerid,22,80);//colt 45
	}
	else if(Profissao[playerid] == JUIZ) {
		SetPlayerColor(playerid, COR_JUIZ); // verde
		GivePlayerWeapon(playerid,15,0);//cane
		GivePlayerWeapon(playerid,22,80);//colt 45
	}
	else if(Profissao[playerid] == NARCOTICOS) {
		SetPlayerColor(playerid, COR_NARCOTICOS); // Azul Claro
		GivePlayerWeapon(playerid,3,0);//stick cop
		GivePlayerWeapon(playerid,29,500);//MP 5
		GivePlayerWeapon(playerid,27,100);//combat chotgun
	}
	else if(Profissao[playerid] == POLICIA_FLORESTAL) {
		SetPlayerColor(playerid, COR_POLICIA_FLORESTAL); // verde escuro
		GivePlayerWeapon(playerid,15,0);//cane
		GivePlayerWeapon(playerid,22,300);//colt 45
	}
	else if(Profissao[playerid] == IBAMA) {
		SetPlayerColor(playerid, COR_IBAMA); // verde azul
		GivePlayerWeapon(playerid,15,0);//cane
		GivePlayerWeapon(playerid,22,300);//colt 45
	}
	else if(Profissao[playerid] == EXERCITO) {
		SetPlayerColor(playerid, COR_EXERCITO); // Azul Claro
		GivePlayerWeapon(playerid,3,0);//stick cop
		GivePlayerWeapon(playerid,29,500);//MP 5
		GivePlayerWeapon(playerid,27,100);//combat chotgun
		GivePlayerWeapon(playerid,31,200);//M4
	}
	else if(Profissao[playerid] == ADVOGADO) {
		SetPlayerColor(playerid, COR_ADVOGADO); // verde azul
		GivePlayerWeapon(playerid,15,0);//cane
		GivePlayerWeapon(playerid,22,300);//colt 45
	}
	else if(Profissao[playerid] == SEGURANÇA) {
		SetPlayerColor(playerid, COR_SEGURANÇA); // Azul claro
		GivePlayerWeapon(playerid,24,400);//desert eagle
		GivePlayerWeapon(playerid,26,700);//sawnoff
	}
	else if(Profissao[playerid] == MOTORISTA_PARTICULAR) {
		SetPlayerColor(playerid, COR_MOTORISTA); // Laranja
		GivePlayerWeapon(playerid,41,900);//spray
	}
	else if(Profissao[playerid] == MOTORISTA_DE_ONIBUS) {
		SetPlayerColor(playerid, COR_MOTORISTA_ONIBUS); // Claro
		GivePlayerWeapon(playerid,42,400);//spray
	}
	else if(Profissao[playerid] == MENDIGO ) {
		SetPlayerColor(playerid, COR_MENDIGO ); // Claro
		GivePlayerWeapon(playerid,42,400);//spray
	}
	else if(Profissao[playerid] == VENDEDOR_DE_CARROS) {
		SetPlayerColor(playerid, COR_VENDEDOR); // Verde
		GivePlayerWeapon(playerid,2,0);
	}
	else if(Profissao[playerid] == CORRETOR) {
		SetPlayerColor(playerid, COR_CORRETOR); // Marfin
		GivePlayerWeapon(playerid,15,0);
	}
	else if(Profissao[playerid] == SEGURADOR) {
		SetPlayerColor(playerid, COR_SEGURADOR);
		GivePlayerWeapon(playerid,5,0);//bastão basebool
	}
	else if(Profissao[playerid] == JORNALISTA) {
		SetPlayerColor(playerid, COR_JORNALISTA);
		GivePlayerWeapon(playerid,5,0);//bastão basebool
	}
	else if(Profissao[playerid] == CAMINHONEIRO) {
		SetPlayerColor(playerid, COR_CAMINHONEIRO); // gold
		GivePlayerWeapon(playerid,15,0);//cane
		GivePlayerWeapon(playerid,22,300);//colt 45
	}
	else if(Profissao[playerid] == TRANSPORTE_GAS) {
		SetPlayerColor(playerid, TRANSPORTE_GAS); // gold
		GivePlayerWeapon(playerid,15,0);//cane
		GivePlayerWeapon(playerid,22,300);//colt 45
    }
	else if(Profissao[playerid] == ALUGUEL_DE_CARROS) {
		SetPlayerColor(playerid, COR_ALUGUEL_DE_CARROS); // gold
		GivePlayerWeapon(playerid,15,0);//cane
	}
	else if(Profissao[playerid] == MECANICO) {
		SetPlayerColor(playerid, COR_MECANICO); // gold
		GivePlayerWeapon(playerid,15,0);//cane
	}
	else if(Profissao[playerid] == CONFISCADOR) {
		SetPlayerColor(playerid, COR_CONFISCADOR); // gold
		GivePlayerWeapon(playerid,15,0);//cane
		GivePlayerWeapon(playerid,32,300);//colt 45
	}
	else if(Profissao[playerid] == CONTRABANDISTA) {
		SetPlayerColor(playerid, COR_CONTRABANDISTA); // gold
		GivePlayerWeapon(playerid,15,0);//cane
		GivePlayerWeapon(playerid,30,300);//ak 47
	}
	else if(Profissao[playerid] == RECEITA_FEDERAL) {
		SetPlayerColor(playerid, COR_RECEITA_FEDERAL); // gold
		GivePlayerWeapon(playerid,15,0);//cane
	}
	else if(Profissao[playerid] == JUSTICA_FEDERAL) {
		SetPlayerColor(playerid, COR_JUSTICA_FEDERAL); // gold
		GivePlayerWeapon(playerid,15,0);//cane
	}
	else if(Profissao[playerid] == LIDER_DE_TRAFICO) {
		SetPlayerColor(playerid, COR_LIDER_DE_TRAFICO); // gold
		GivePlayerWeapon(playerid,15,0);//cane
        GivePlayerWeapon(playerid,24,80);//desert eagle
	    GivePlayerWeapon(playerid,26,42);//cano serrado
	    GivePlayerWeapon(playerid,29,500);//MP 5
	}
	else if(Profissao[playerid] == PREFEITO) {
		SetPlayerColor(playerid, COR_PREFEITO); // gold
		GivePlayerWeapon(playerid,15,0);//cane
	}
	else if(Profissao[playerid] == GOVERNADOR) {
		SetPlayerColor(playerid, COR_GOVERNADOR); // gold
		GivePlayerWeapon(playerid,5,0);//bastao basebal
	}
	else if(Profissao[playerid] == PRESIDENTE) {
		SetPlayerColor(playerid, COR_PRESIDENTE); // gold
		GivePlayerWeapon(playerid,5,0);//bastao basebal
	}
	else if(Profissao[playerid] == PROMOTER) {
		SetPlayerColor(playerid, COR_PROMOTER); // gold
		GivePlayerWeapon(playerid,5,0);//bastao basebal
	}
	else if(Profissao[playerid] == SERVICO_RECICLAGEM) {
		SetPlayerColor(playerid, COR_SERVICO_RECICLAGEM); // gold
		GivePlayerWeapon(playerid,5,0);//bastao basebal
	}
	else if(Profissao[playerid] == PEDREIRO) {
		SetPlayerColor(playerid, COR_PEDREIRO); 
		GivePlayerWeapon(playerid,5,0);//bastao basebal
	}
	else if(Profissao[playerid] == VENDEDOR_DE_BOMBAS) {
		SetPlayerColor(playerid, COR_VENDEDOR_DE_BOMBAS);
		GivePlayerWeapon(playerid,24,400);//desert eagle
		GivePlayerWeapon(playerid,26,700);//sawnoff
	}
	else if(Profissao[playerid] == PROSTITUTA) {
		SetPlayerColor(playerid, COR_PROSTITUTA);
		GivePlayerWeapon(playerid,12,400);//long white dildo
		GivePlayerWeapon(playerid,24,700);//desert eagle
	}
	else if(Profissao[playerid] == XERIFE) {
		SetPlayerColor(playerid, COR_XERIFE); // gold
		GivePlayerWeapon(playerid,15,0);//cane
        GivePlayerWeapon(playerid,24,80);//desert eagle
        GivePlayerWeapon(playerid,26,700);//sawnoff
		GivePlayerWeapon(playerid,30,100);//ak47
	}
	else if(Profissao[playerid] == TRANSPORTE_VALORES) {
		SetPlayerColor(playerid, COR_TRANSPORTE_VALORES); // gold
		GivePlayerWeapon(playerid,15,0);//cane
		GivePlayerWeapon(playerid,27,40);//combat chotgun
	}
	else{
	    SetPlayerColor(playerid, COR_DESEMPREGADO);
	}
    PrecoCorrida[playerid] = 0;
	SetPlayerInterior(playerid, 0);
	if(PLAYERLIST_authed[playerid] == 0){
		SetPlayerPos(playerid, -1958.5107, 293.6747, 35.4688);
		SetPlayerFacingAngle(playerid, 90.0000);
		TogglePlayerControllable(playerid, 0);
	  	return 1;
	}
	if(udb_getPrisao(PlayerName(playerid)) == 1){
		SetPlayerInterior(playerid, 6);
        SendClientMessage(playerid, COR_VERMELHO, "Você cometeu algum crime e foi preso, ficará 5 minutos na cadeia.");
        SendClientMessage(playerid, COR_AMARELO, "Você pode pedir a um advogado para lhe oferecer uma proposta de fiança por uma grana.");
        Presos[playerid] = 1;
		return 1;
	}
	else{
		TogglePlayerControllable(playerid, 1);
   		return 1;
	}
}
public textdestroy(playerid)
{
TextDrawHideForPlayer(playerid,detonado);
TextDrawHideForPlayer(playerid,Bemvindo);
TextDrawHideForPlayer(playerid,Bemvindo2);
TextDrawHideForPlayer(playerid,Bemvindo3);
}
public OnPlayerDeath(playerid, killerid, reason)
{
    if(GetClosestHospital(playerid) == 0){
    	SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), -2651.6501, 634.4510, 14.4531, 180.0000, 0, 0, 0, 0, 0, 0);
	}
    else if(GetClosestHospital(playerid) == 1){
    	SetSpawnInfo(playerid,1,udb_getSkin(PlayerName(playerid)),1173.5842,-1324.5615,15.1953,278.4624,0,0,0,0,0,0);
	}
    else if(GetClosestHospital(playerid) == 2){
        SetSpawnInfo(playerid,1,udb_getSkin(PlayerName(playerid)),2031.9415,-1404.3578,17.2614,165.8180,0,0,0,0,0,0);
	}
    else if(GetClosestHospital(playerid) == 3){
        SetSpawnInfo(playerid,1,udb_getSkin(PlayerName(playerid)),1582.5615,1768.7921,10.8203,93.7454,0,0,0,0,0,0);
	}
    else if(GetClosestHospital(playerid) == 4){
        SetSpawnInfo(playerid,1,udb_getSkin(PlayerName(playerid)),-319.0593,1061.6935,19.7422,0.000,0,0,0,0,0,0);
    }
 	new string[256];
	format(string, sizeof(string), "* %s ficou incosiente e foi levado ao hospital.", PlayerName(playerid));
	SendClientMessageToAll(COR_COP_ELITE, string);
	printf("O Jogador %s(id: %d) ficou inconsiente e foi levado ao hospital.", PlayerName(playerid),playerid);
	SendClientMessage(playerid, COR_VERMELHO, "Você foi encontrado quase morto e foi levado ao Hospital.");
	TextDrawShowForPlayer(playerid,detonado);
 	SetTimerEx("textdestroy",5000,false,"d",playerid);
    SetPlayerInterior(playerid,0);
    if(Seguro[playerid] == 0){
    	udb_setBankMoney(PlayerName(playerid), udb_getBankMoney(PlayerName(playerid)) - 150);
		SendClientMessage(playerid, COR_VERMELHO, "O tratamento ficou em R$150 e foi descontado direto de sua conta bancaria.");
	}
    if(Seguro[playerid] == 1){
    	udb_setBankMoney(PlayerName(playerid), udb_getBankMoney(PlayerName(playerid)) - 150);
    	SendClientMessage(playerid, COR_VERMELHO, "O seu seguro de vida cobriu o valor do tratamento que foi de R$150.");
	}
	if(Procurados[playerid] == 1){
        udb_setED(PlayerName(killerid),udb_getED(PlayerName(killerid)) + 1);
		SendClientMessage(killerid, COR_AZUL_CLARO, "Você ganhou 1 ponto de experiencia diária por matar alguém que estava na lista dos procurados.");
	    SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), 262.9540, 78.4339, 1001.0391, 270.0000, 0, 0, 0, 0, 0, 0);
	    udb_setPrisao(PlayerName(playerid), 1);
	    SetPlayerWantedLevel(playerid,0);
	}
	if(Presos[playerid] == 1){
	    SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), 262.9540, 78.4339, 1001.0391, 270.0000, 0, 0, 0, 0, 0, 0);
	    udb_setPrisao(PlayerName(playerid), 1);
	}
	if(Profissao[killerid] == ASSASSINO || Profissao[killerid] == ASSALTANTE || Profissao[killerid] == LADRAO_CARROS || Profissao[killerid] == TRAFICANTE){
		udb_setED(PlayerName(killerid),udb_getED(PlayerName(killerid)) + 1);
		SendClientMessage(killerid, COR_AZUL_CLARO, "Você ganhou 1 ponto de experiencia diária por matar alguém.");
	}
	if(killerid == INVALID_PLAYER_ID) {
        SendDeathMessage(INVALID_PLAYER_ID,playerid,reason);
        Qtmortes[killerid] ++;
	}
	else{
		SendDeathMessage(killerid,playerid,reason);
		if(GetPlayerMoney(playerid) > 0)  {
			GivePlayerMoney(killerid, GetPlayerMoney(playerid));
			Qtmortes[killerid] ++;
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
   if(segurocarro[vehicleid] == 1){
   SetVehicleToRespawn(vehicleid);
   segurocarro[vehicleid] = 0;
   }
}

public OnPlayerText(playerid, text[])
{
	if (Mudo[playerid] == 1)
	{
	SendClientMessage(playerid, COR_AZUL, "Você está silenciado!");
	return 0;
	}

    fixchars(text);
	if (Calling[playerid] > -1 && Answered[playerid] == 1)
	{
    	new string[256];
		new sendername[MAX_PLAYER_NAME];
		GetPlayerName(playerid, sendername, sizeof(sendername));
		format(string, sizeof(string), "%s: %s", sendername, text);
		SendClientMessage(Calling[playerid], COR_CONFISCADOR, string);
		format(string, sizeof(string), "%s: %s", sendername, text);
		SendClientMessage(playerid, COR_CONFISCADOR, string);
		format(string, sizeof(string), "%s: %s", sendername, text);
		print(string);
		format(string, sizeof(string), "%s: %s", sendername, text);
		print(string);
		return 0;
	}
	printf("%s id %d enviou uma mensagem: %s",PlayerName(playerid),playerid,text);
	return 1;
}
public OnPlayerCommandText(playerid, cmdtext[])
{
    fixchars(cmdtext);
	new playermoney;
    new cmd[256];
	new giveplayerid, moneys, idx;
    new giveplayer[MAX_PLAYER_NAME];
    new sendername[MAX_PLAYER_NAME];

	cmd = strtok(cmdtext, idx);
// SUICIDE COMMAND
	if(strcmp(cmd, "/kill", true) == 0) {
        if(Presos[playerid] == 0){
			SetPlayerHealth(playerid,0.0);
			printf("%s se suicidou",PlayerName(playerid));
			return 1;
			}
			else{
        	SendClientMessage(playerid,COR_VERMELHO,"Você está preso, não pode se suicidar!");
        	return 1;
		}
	}
//------------------------------------- RELOGIO -----------------------------------//
	if(strcmp(cmd, "/relogio", true) == 0) {
		new Ptmess[256];
		if(worldMinute < 10){
 			format(Ptmess, sizeof(Ptmess), "Agora são %d:0%d", worldTime, worldMinute);
		}
		if(worldMinute > 10){
		    format(Ptmess,sizeof(Ptmess),"Agora são %d:%d",worldTime,worldMinute);
		}
    	SendClientMessage(playerid,COR_AZUL,Ptmess);
 		return 1;
  	}
//-------------------------------- REGISTRAR E LOGAR ------------------------------//
	if(strcmp(cmd, "/registrar", true) == 0) {
		new tmp[256];
		tmp = strtok(cmdtext, idx);
    	if (udb_Exists(PlayerName(playerid))) {
			SendClientMessage(playerid, COR_VERMELHO, "Você já está registrado! Entre com /logar [senha].");
			return 1;
		}
    	if(PLAYERLIST_authed[playerid] == 1) {
			SendClientMessage(playerid, COR_VERMELHO, "Você já está registrado! Entre com /logar [senha]");
			return 1;
		}
    	if (strlen(tmp)==0) {
			SendClientMessage(playerid, COR_VERMELHO, "/registrar [senha]");
			return 1;
		}
    	else{
    	    PLAYERLIST_authed[playerid] = 1;
			udb_Create(PlayerName(playerid), tmp /*senha*/,0 /*creditos*/, 0 /*grana*/,60 /*skin*/, 5000 /*gbanco*/, 0/*seguro*/, 0 /*har*/, 0 /*hterra*/, 0 /*hmar*/, 0 /*preso*/, 0 /*EX Diaria*/, 0 /*XL*/,/*cell*/0,/*numcell*/ false, /*NM*/ 0, 0 /*prof*/, ""/*clantag*/,-1425.0415/*X*/, -289.4514/*Y*/, 14.1484/*Z*/,140.4826/*ang*/, 100.0 /*hp*/, 0 /*P1*/, 0 /*P2*/, 0 /*P3*/);
			new Float:X, Float:Y, Float:Z, Float:ang;
			udb_getPosition(PlayerName(playerid), X, Y, Z);
			udb_getAng(PlayerName(playerid), ang);
			SetPlayerColor(playerid, COR_DESEMPREGADO);
			SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), 1552.8347, -1675.3934, 16.1953, 95.2490, 0, 0, 0, 0, 0, 0);
			SpawnPlayer(playerid);
			new string[256];
			format(string, sizeof(string), "* %s acabou de se registrar.", PlayerName(playerid));
			SendClientMessageToAll(COR_COP_ELITE, string);
			SetPlayerCheckpoint(playerid, 1537.9189, -1678.7523, 13.5469, 2.0);
			SendClientMessage(playerid, COR_JUIZ, "Registrado e logado.");
			SendClientMessage(playerid, COR_AZUL, "Você acabou de sair da prisão, precisa sair da cidade até que a poeira abaixe.");
			SendClientMessage(playerid, COR_AZUL, "Os policiais vão te dar uma carona até o aero-porto.");
	    	return 1;
		}
 	}

	if(strcmp(cmd, "/logar", true) == 0 && IsPlayerConnected(playerid)) {
		new tmp[256];
		tmp = strtok(cmdtext, idx);
	    if (!udb_Exists(PlayerName(playerid))) {
			SendClientMessage(playerid, COR_VERMELHO, "Você não está registrado. Entre com /registrar [senha]");
			return 1;
		}
	    if (PLAYERLIST_authed[playerid] == 1) {
			SendClientMessage(playerid, COR_AMARELO, "Você já está logado.");
			return 1;
		}
	    if (strlen(tmp)==0) {
			SendClientMessage(playerid, COR_VERMELHO, "Você tem uma senha. USO: /logar [senha]");
			return 1;
		}

	    if (udb_CheckLogin(PlayerName(playerid),tmp)) {
		PLAYERLIST_authed[playerid] = 1;
		LogarPlayer(playerid);
		new string[256];
		format(string, sizeof(string), "* %s acabou de logar.", PlayerName(playerid));
		SendClientMessageToAll(COR_COP_ELITE, string);
	 	SendClientMessage(playerid, COR_JUIZ, "Logado");
	 	GivePlayerWeapon(playerid,weapons,municao);
		return 1;
		}
		else {
			SendClientMessage(playerid, COR_VERMELHO, "Senha Incorreta");
			return 1;
  		}
	}

//------------------------- COMANDO PARA IR AO AEROPORTO DE SAN FIERRO -------------------------------//
    if(strcmp(cmd,"/passagemsf",true) == 0) {
	  if(AreaAeroLS[playerid] == 1 && IsPlayerInCheckpoint(playerid)){
	  SetPlayerPos(playerid,-1425.5127,-290.0228,14.1484); //Aeroporto de San Fierro
	  DisablePlayerCheckpoint(playerid);
	  gPlayerCheckpointStatus[playerid] = CHECKPOINT_NONE;
	  SendClientMessage(playerid, COR_AZUL, "Você chegou no aeroporto de San Fierro prepare-se para começar a viver");
	  return 1;
	  }
	  else{
		  SendClientMessage(playerid, COR_VERMELHO, "Você não está no Aeroporto de Los Santos");
		  return 1;
		  }
    }
    
//------------------------- COMANDOS DE PEDREIRO ------------------------------//

    if(strcmp(cmd, "/recolherpedras", true) == 0) {
       if(Profissao[playerid] == PEDREIRO || IsPlayerAdmin(playerid)){
          if(AreaPedreira[playerid] == 1){
		  if(IsPlayerInAnyVehicle(playerid)){
		  if(GetVehicleModel(GetPlayerVehicleID(playerid)) == VEH_DUMPER){
		  if(Pedras[GetPlayerVehicleID(playerid)] == 0){
		  if(MissaoPedreira[playerid] == 0){
		  Pedras[GetPlayerVehicleID(playerid)] = 1;
		  MissaoPedreira[playerid] = 1;
		  SendClientMessage(playerid, COR_BRANCO, "Pedras recolhidas agora entregue-as na OBRA em San Fierro!");
		  return 1;
		  }
		  else{
			  SendClientMessage(playerid, COR_VERMELHO, "Ei, você já está fazendo um carregamento.");
			  }
		  }
		  else{
			  SendClientMessage(playerid, COR_VERMELHO, "Esse veiculo já possue pedras entregue essas primeiro para depois vir recolher mais.");
			  return 1;
			  }
		  }
		  else{
			  SendClientMessage(playerid, COR_VERMELHO, "Você tem que estar em um DUMPER.");
			  return 1;
			  }
		  }
		  else{
			  SendClientMessage(playerid, COR_VERMELHO, "Ei, esteja em um veiculo para utilizar este comando.");
			  return 1;
			  }
		  }
		  else{
			  SendClientMessage(playerid, COR_VERMELHO, "Você tem que estar na Pedreira.");
			  return 1;
			  }
		  }
		  else{
			  SendClientMessage(playerid, COR_VERMELHO, "Você nem devia estar mexendo nesse comando.");
			  return 1;
			  }
    }
    if(strcmp(cmd, "/entregarpedras", true) == 0) {
       if(Profissao[playerid] == PEDREIRO || IsPlayerAdmin(playerid)){
          if(AreaObra[playerid] == 1){
		  if(IsPlayerInAnyVehicle(playerid)){
		  if(GetVehicleModel(GetPlayerVehicleID(playerid)) == VEH_DUMPER){
		  if(Pedras[GetPlayerVehicleID(playerid)] == 1){
		  if(MissaoPedreira[playerid] == 1){
          Pedras[GetPlayerVehicleID(playerid)] = 0;
          GivePlayerMoney(playerid,400);
          udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
          MissaoPedreira[playerid] = 0;
          SendClientMessage(playerid, COR_BRANCO, "Pedras entregues! Você recebeu R$400 pelo trabalho.");
		  return 1;
		  }
		  else{
			  SendClientMessage(playerid, COR_VERMELHO, "Você não está fazendo nenhum carregamento.");
			  return 1;
			  }
		  }
		  else{
			  SendClientMessage(playerid, COR_VERMELHO, "Esse veiculo não possue nenhuma pedra.");
			  return 1;
			  }
		  }
		  else{
			  SendClientMessage(playerid, COR_VERMELHO, "Você não esta em um DUMPER.");
			  return 1;
			  }
		  }
		  else{
			  SendClientMessage(playerid, COR_VERMELHO, "Esteja em um veiculo para utilizar esse comando.");
			  return 1;
			  }
		  }
		  else{
			  SendClientMessage(playerid, COR_VERMELHO, "Você tem que estar na OBRA em San Fierro.");
			  return 1;
			  }
		  }
		  else{
			  SendClientMessage(playerid, COR_VERMELHO, "Você nem devia estar mexendo nesse comando.");
			  return 1;
			  }
    }
    if(strcmp(cmd, "/pegarferramentas", true) == 0) {
	   if(Profissao[playerid] == PEDREIRO || IsPlayerAdmin(playerid)){
		  if(AreaPedreira[playerid] == 1){
		  if(MissaoPedreira[playerid] == 0){
		  new qtferramentas = random(25-1)+1;
		  new string[256];
		  format(string,sizeof(string),"Lhe entregaram %d ferramentas agora entregue para a obra de construção em San Fierro.",qtferramentas);
		  SendClientMessage(playerid, COR_BRANCO,string);
		  Ferramentas[playerid] = qtferramentas;
		  MissaoPedreira[playerid] = 1;
		  return 1;
		  }
		  else{
			  SendClientMessage(playerid, COR_VERMELHO, "Você já está num carregamento. Termine-o para começar outro.");
			  return 1;
			  }
		  }
		  else{
			  SendClientMessage(playerid, COR_VERMELHO, "Você não está na pedreira.");
			  return 1;
			  }
		  }
		  else{
			  SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão.");
			  return 1;
			  }
    }
    
    if(strcmp(cmd, "/entregarferramentas", true) == 0) {
       if(Profissao[playerid] == PEDREIRO || IsPlayerAdmin(playerid)){
		  if(AreaObra[playerid] == 1){
		  if(MissaoPedreira[playerid] == 1){
		  if(Ferramentas[playerid] > 0){
		  new string[256];
		  format(string, sizeof(string),"Você entregou %d ferramentas e recebeu R$%d.",Ferramentas[playerid],Ferramentas[playerid]*20);
		  GivePlayerMoney(playerid,Ferramentas[playerid]*20);
		  udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
		  Ferramentas[playerid] = 0;
		  MissaoPedreira[playerid] = 0;
		  return 1;
		  }
		  else{
			  SendClientMessage(playerid, COR_VERMELHO, "Você não possue ferramentas.");
			  return 1;
			  }
		  }
		  else{
			  SendClientMessage(playerid, COR_VERMELHO, "Você não está fazendo um carregamento de ferramentas.");
			  return 1;
			  }
		  }
		  else{
			  SendClientMessage(playerid, COR_VERMELHO, "Você não está na obra de San Fierro.");
			  return 1;
			  }
		  }
		  else{
			  SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão.");
			  return 1;
			  }
    }
//------------------------- COMANDOS DE PROSTITUTA ----------------------------//
	if(strcmp(cmd,"/sexo",true)==0){
	  if(Profissao[playerid] == PROSTITUTA){
	  new tmp[256];
	  new plid;
	  new car;
	  tmp = strtok(cmdtext,idx);
	  plid = strval(tmp);
	  if(!strlen(tmp)){
	  SendClientMessage(playerid, COR_VERMELHO, "/sexo [id]");
	  return 1;
	  }
	  car = GetPlayerVehicleID(plid);
	  if(IsPlayerInVehicle(plid,car)){
	  if(IsPlayerInVehicle(playerid,car)){
	  if(GetPlayerMoney(plid) > 2){
	  if(IsPlayerConnected(plid)){
	  if(Sexo[plid] == 0){
	  if(Sexo[playerid] == 0){
	  TogglePlayerControllable(playerid,0);
	  TogglePlayerControllable(plid,0);
	  Sexo[playerid] = 1;
	  Sexo[plid] = 1;
	  FazendoSexo[playerid] = plid;
      FazendoSexo[plid] = playerid;
      udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
	  SendClientMessage(playerid, COR_BRANCO, "Sexo iniciado para para-lo digite /pararsexo");
	  SendClientMessage(plid, COR_BRANCO, "Você esta fazendo sexo com uma prostituta para-lo digite /pararsexo");
	  SetTimerEx("tirandograna",2000,false,"ddd",playerid,plid,car);
	  return 1;
	  }
	  else{
		  SendClientMessage(playerid, COR_VERMELHO, "Você ja está fazendo sexo.");
		  return 1;
		  }
	  }
	  else{
		  SendClientMessage(playerid, COR_VERMELHO, "O outro jogador já esta fazendo sexo.");
		  return 1;
		  }
	  }
	  else{
		  SendClientMessage(playerid, COR_VERMELHO, "Jogador não conectado/logado.");
		  return 1;
		  }
	  }
	  else{
		  SendClientMessage(playerid, COR_VERMELHO, "O outro jogador não possue grana.");
		  return 1;
		  }
	  }
	  else{
		  SendClientMessage(playerid, COR_VERMELHO, "Você tem que estar no veiculo do outro jogador.");
		  return 1;
		  }
	  }
	  else{
		  SendClientMessage(playerid, COR_VERMELHO, "O outro jogador não esta em um veiculo.");
		  return 1;
		  }
      }
      else{
		  SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão.");
		  return 1;
		  }
    }
//------------------------- COMANDOS DE JUSTIÇA FEDERAL ----------------------------//
	if(strcmp(cmd,"/tribunal",true) == 0) {
	  if(Profissao[playerid] == JUSTICA_FEDERAL || IsPlayerAdmin(playerid)){
		new tmp[256];
		new plid,plid2,tempo;
		tmp = strtok(cmdtext,idx);
		plid = strval(tmp);
		if(!strlen(tmp)){
		SendClientMessage(playerid, COR_VERMELHO, "/tribunal [id 1] [id 2] [daqui a quanto tempo]");
		return 1;
		}
		tmp = strtok(cmdtext,idx);
		plid2 = strval(tmp);
		if(!strlen(tmp)){
		SendClientMessage(playerid, COR_VERMELHO, "/tribunal [id 1] [id 2] [daqui a quanto tempo]");
		return 1;
		}
		tmp = strtok(cmdtext,idx);
		tempo = strval(tmp);
		if(!strlen(tmp)){
		SendClientMessage(playerid, COR_VERMELHO, "/tribunal [id 1] [id 2] [daqui a quanto tempo]");
		return 1;
		}
		if(IsPlayerConnected(plid)){
		if(IsPlayerConnected(plid2)){
		if(Tribunal[plid] == 0){
		if(Tribunal[plid2] == 0){
		if(tempo > 0){
		if(plid != plid2){
		Tribunal[plid] = 1;
		Tribunal[plid2] = 1;
		new msg[256];
		format(msg,sizeof(msg),"O Tribunal entre %s e %s começará daqui a %d minutos.",PlayerName(plid),PlayerName(plid2),tempo);
		SendClientMessageToAll(COR_BRANCO,msg);
		SendClientMessageToAll(COR_BRANCO,"Até lá arrangem um advogado!");
		SetTimerEx("InicioTribunal",60000*tempo,false,"dd",plid,plid2);
		udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
		return 1;
		}
		else{
			SendClientMessage(playerid, COR_VERMELHO, "Selecione 2 jogadores e não apenas 1 duas vezes.");
			return 1;
			}
		}
		else{
			SendClientMessage(playerid, COR_VERMELHO, "O tempo deve ser no mínimo de 1 minuto.");
			return 1;
			}
		}
		else{
			SendClientMessage(playerid, COR_VERMELHO, "O jogador 2 já está marcado para um tribunal.");
			return 1;
			}
		}
		else{
			SendClientMessage(playerid, COR_VERMELHO, "O jogador 1 já está marcado para um tribunal.");
			return 1;
			}
		}
		else{
			SendClientMessage(playerid, COR_VERMELHO, "Jogador 2 não conectado/logado.");
			return 1;
			}
		}
		else{
			SendClientMessage(playerid, COR_VERMELHO, "Jogador 1 não conectado/logado.");
			return 1;
			}
		}
		else{
			SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão.");
			return 1;
			}
	}
	if(strcmp(cmd,"/fimtribunais",true) == 0) {
	   if(Profissao[playerid] == JUSTICA_FEDERAL || IsPlayerAdmin(playerid)){
	   for(new i=0; i<MAX_PLAYERS; i++){
	   if(Tribunal[i] == 1){
	   Tribunal[i] = 0;
	   declaracoesabertas[i] = 0;
	   new string[256];
	   format(string,sizeof(string),"O Trabalhador da justiça federal %s deu um fim em todos os casos de tribunais.");
	   SendClientMessageToAll(COR_BRANCO, string);
	   return 1;
	   }
   }
}
	   else{
		   SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão.");
		   return 1;
		   }
	}
//------------------------- COMANDOS DE RECEITA FEDERAL ----------------------------//
	if(strcmp(cmd,"/removercontrabando",true) == 0) {
	  if(Profissao[playerid] == RECEITA_FEDERAL || IsPlayerAdmin(playerid)){
	   new tmp[256];
	   new plid;
	   tmp = strtok(cmdtext,idx);
	   plid = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COR_VERMELHO, "/removercontrabando [id]");
	   return 1;
	   }
	   if(Profissao[plid] == CONTRABANDISTA){
	   if(contrabando[plid] == 1){
	   if(revisao[playerid][plid] == 1){
	   if(IsPlayerConnected(plid)){
	   gPlayerCheckpointStatus[plid] = CHECKPOINT_NONE;
	   DisablePlayerCheckpoint(plid);
	   SendClientMessage(playerid, COR_VERDE, "Contrabando removido com sucesso.");
	   SendClientMessage(plid, COR_VERDE, "Seu contrabando foi removido por um trabalhador da Receita Federal.");
	   udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, COR_VERMELHO, "Jogador não conectado/logado.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COR_VERMELHO, "Você não fez a revisão neste jogador ainda.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COR_VERMELHO, "Esse jogador não esta fazendo contrabando.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COR_VERMELHO, "Esse jogador não é contrabandista");
		   return 1;
		   }
	   }
	   else{
           SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão.");
		   return 1;
		   }
    }
    if(strcmp(cmd,"/revisarcontrabando",true) == 0) {
	 if(Profissao[playerid] == RECEITA_FEDERAL || IsPlayerAdmin(playerid)){
	   new tmp[256];
	   new plid;
	   tmp = strtok(cmdtext,idx);
	   plid = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COR_VERMELHO, "/revisarcontrabando [id]");
	   return 1;
	   }
	   if(Profissao[plid] == CONTRABANDISTA){
	   if(IsPlayerConnected(plid)){
	   if(contrabando[plid] == 0){
	   revisao[playerid][plid] = 1;
	   SendClientMessage(playerid, COR_VERDE, "Esse jogador está livre! Não esta fazendo nenhum contrabando");
	   return 1;
	   }
	   else if(contrabando[playerid] == 1){
	   revisao[playerid][plid] = 1;
	   SendClientMessage(playerid, COR_VERDE, "Esse jogador está fazendo contrabando! Cancele esse contrabando e prenda-o");
	   SendClientMessage(plid, COR_VERMELHO, "Fudeu!!! Descobriram que você estava fazendo contrabando rápido fuja antes que seja tarde.");
	   return 1;
	   }
	}
	   else{
		   SendClientMessage(playerid, COR_VERMELHO, "Jogador não conectado/logado");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COR_VERMELHO, "Revisões só podem ser feitas em contrabandistas");
		   return 1;
		   }
   	   }
   	   else{
		   SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão");
		   return 1;
		   }
	}
	if(strcmp(cmd,"/permitircontrabando",true) == 0) {
     if(Profissao[playerid] == RECEITA_FEDERAL || IsPlayerAdmin(playerid)){
	   new tmp[256];
	   new plid;
	   tmp = strtok(cmdtext,idx);
	   plid = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COR_VERMELHO, "/permitircontrabando [id]");
	   return 1;
	   }
	   if(contrabando[plid] == 1){
	   if(Profissao[plid] == CONTRABANDISTA){
	   if(IsPlayerConnected(plid)){
	   SendClientMessage(playerid, COR_VERDE, "Você permitiu esse contrabando! Não deixe que ninguém perceba hein");
	   new string[256];
	   format(string,sizeof(string),"%s permitiu seu contrabando.",PlayerName(playerid));
	   SendClientMessage(plid, COR_VERDE, string);
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, COR_VERMELHO, "Jogador não conectado/logado");
		   return 1;
		   }
	   }
	   else{
           SendClientMessage(playerid, COR_VERMELHO, "Esse jogador não é contrabandista");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COR_VERMELHO, "Esse jogador não esta fazendo nenhum contrabando");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão");
		   return 1;
		   }
    }
	
//------------------------- COMANDOS DE LOCADOR DE CARROS --------------------------//
	if(strcmp(cmd,"/locar",true) == 0) {
	   if(Profissao[playerid] == ALUGUEL_DE_CARROS || IsPlayerAdmin(playerid)){
	   new tmp[256];
	   new plid;
	   new distancia;
	   new car;
	   new tempo;
	   distancia = GetDistanceBetweenPlayers(playerid,plid);
	   tmp = strtok(cmdtext,idx);
	   plid = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COR_VERMELHO, "/locar [id] [tempo]");
	   return 1;
	   }
	   tmp = strtok(cmdtext,idx);
	   tempo = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COR_VERMELHO, "/locar [id] [tempo]");
	   return 1;
	   }
	   car = GetPlayerVehicleID(playerid);
	   if(IsPlayerConnected(plid)){
       if(distancia < 10){
       if(car == carroaluguel || car == carroaluguel2 || car == carroaluguel3 || car == carroaluguel4 || car == carroaluguel5 || car == carroaluguel6 || car == carroaluguel7 || car == carroaluguel8){
       if(IsPlayerInVehicle(playerid,car)){
       if(tempo > 0){
       alugueis[plid] = 1;
       Aluguel[plid] = 1;
       CarroAlugado[plid] = car;
       new string[256];
       format(string,sizeof(string),"%s lhe locou um carro por %d minutos! Aproveite",PlayerName(playerid),tempo);
       SendClientMessage(plid, COR_VERDE, string);
       SendClientMessage(playerid, COR_VERDE, "Carro locado");
       SetTimerEx("locar",60000*tempo,false,"dd",plid,car);
       udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
       return 1;
       }
       else{
		   SendClientMessage(playerid, COR_VERMELHO, "Ei, o tempo tem que ser maior que 0.");
		   return 1;
		   }
       }
       else{
		   SendClientMessage(playerid, COR_VERMELHO, "Você não esta em um veiculo.");
		   return 1;
		   }
       }
       else{
		   SendClientMessage(playerid, COR_VERMELHO, "Você tem que estar em um carro de aluguel.");
		   return 1;
		   }
       }
	   else{
		   SendClientMessage(playerid, COR_VERMELHO, "Você está muito longe chegue mais perto.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COR_VERMELHO, "Jogador não conectado/logado.");
		   return 1;
		   }
	   }
       else{
		   SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissao");
           return 1;
           }
	}

//----------------------------- COMANDOS DO IBAMA ----------------------------------//
	if(strcmp(cmd, "/piracema",true) == 0) {
	    if(Profissao[playerid] == IBAMA || IsPlayerAdmin(playerid)) {
	        if(Piracema == 1){
	            SendClientMessageToAll(COR_VERDE,"A piracema agora está desativada. Pode pescar à vontade!");
			    SendClientMessage(playerid,COR_BRANCO,"Feito.");
			    printf("%s desativou a piracema",PlayerName(playerid));
			    Piracema = 0;
	      		return 1;
	        } else {
	            SendClientMessageToAll(COR_VERMELHO,"A piracema está ativada, quem for pego pescando será preso.");
	            SendClientMessage(playerid,COR_BRANCO,"Você ativou a piracema.");
	            printf("%s ativou a piracema",PlayerName(playerid));
	            Piracema = 1;
				return 1;
	        }
	    } else {
			SendClientMessage(playerid,COR_VERMELHO,"Você não é do IBAMA!");
			return 1;
	    }
	}
   
	if(strcmp(cmd,"/verpesca",true) == 0) {
	    if(Profissao[playerid] == IBAMA || IsPlayerAdmin(playerid)) {
			new tmp[256];
			new plid;
			tmp = strtok(cmdtext,idx);
			if(!strlen(tmp)){
			    SendClientMessage(playerid,COR_VERMELHO,"/verpesca [id]");
				return 1;
			}
			plid = strlen(tmp);
   			if(IsPlayerConnected(plid) && PLAYERLIST_authed[plid] == 1){
   			    if(PescaInProgress[plid] == 0){
   			        SendClientMessage(playerid,COR_VERDE,"O jogador não tem nem uma pesca.");
   			        printf("%s viu a pesca de %s e não havia nem uma pesca",PlayerName(playerid),PlayerName(plid));
					return 1;
				} else {
				    SendClientMessage(playerid,COR_VERDE,"O jogador está pescando ou já pescou.");
				    printf("%s viu a pesca de %s e havia  pescas",PlayerName(playerid),PlayerName(plid));
					return 1;
				}
			} else {
			    SendClientMessage(playerid,COR_VERMELHO,"Jogador não conectado/logado");
				return 1;
			}
		} else {
		    SendClientMessage(playerid,COR_VERMELHO,"Você não é do Ibama!");
			return 1;
		}
	}
	
	if(strcmp(cmd,"/prenderpesca",true) == 0) {
	    if(Profissao[playerid] == IBAMA || IsPlayerAdmin(playerid)) {
	        new tmp[256];
	        new plid;
	        tmp = strtok(cmdtext,idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid,COR_VERMELHO,"/prenderpesca [id]");
				return 1;
			}
			plid = strlen(tmp);
			if(IsPlayerConnected(plid) && PLAYERLIST_authed[plid] == 1){
			    if(Piracema == 0){
			        SendClientMessage(playerid,COR_VERMELHO,"A piracema não está ativada para você efetuar a prisão!");
					return 1;
				}
				else {
				    if(PescaInProgress[plid] == 0){
				        SendClientMessage(playerid,COR_VERMELHO,"O jogador não está pescando!");
						return 1;
					}
					else {
					    if(GetDistanceBetweenPlayers(plid,playerid) < 21){
					        SendClientMessage(playerid,COR_VERMELHO,"Chegue mais perto para efetuar a prisão!");
							return 1;
						} else {
						    udb_setPrisao(PlayerName(plid),1);
						    LogarPlayer(plid);
						    udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
						    printf("%s prendeu %s por pescas em temporada não autorizada",PlayerName(playerid),PlayerName(plid));
						}
					}
				}
				return 1;
			} else {
			    SendClientMessage(playerid,COR_VERMELHO,"Jogador não conectado/logado");
			}
			return 1;
		} else {
		    SendClientMessage(playerid,COR_VERMELHO,"Você não é do Ibama!");
		}
		return 1;
	}

//-------------------------------- COMANDOS DE PESCADOR ---------------------------//
	if(strcmp(cmd, "/pescar", true) == 0) {
	    if(PescaInProgress[playerid] == 1) {
	    SendClientMessage(playerid, COR_VERMELHO, "Você já está pescando!");
	    }
		if(PescaInProgress[playerid] == 0){
		new Float:X, Float:Y, Float:Z;
		GetPlayerPos(playerid,X,Y,Z);
		if(X >= -2713.9858 && X <= -2628.4883 && Y <= 1938.3077 && Y >= 1559.1425){
			SendClientMessage(playerid,COR_VERDE,"Você lançou a rede de pesca. Espere ela voltar para concluir a pesca.");
  			printf("%s pescou",PlayerName(playerid));
			PescaInProgress[playerid] = 1;
			SetTimer("Pesca",36000,false);
			return 1;
			}
			else {
			SendClientMessage(playerid,COR_VERMELHO,"Você não está na área de pesca, consulte nosso site para uma referência.");
			return 1;
			}
		}
	}

	if(strcmp(cmd, "/sellpesca", true) == 0) {
	    new msg[256];
	    new quantia;
	    if(AreaCoopPesca[playerid] == 1){
	    	if(QtPescas[playerid] == 0){
	        	SendClientMessage(playerid, COR_VERMELHO, "Você não tem nenhuma pesca, como poderá vender?");
	        	return 1;
			} else {
		    	if(Profissao[playerid] == PESCADOR) {
		   			quantia = QtPescas[playerid]*130;
		   			GivePlayerMoney(playerid,quantia);
					format(msg,sizeof(msg),"Você vendeu %d pesca(s) por R$130 cada e faturou R$%d com a venda.",QtPescas[playerid],quantia);
					SendClientMessage(playerid, COR_VERDE, msg);
					printf("%s vendeu suas pescas",PlayerName(playerid));
					QtPescas[playerid] = 0;
					return 1;
				}
				else {
				    quantia = QtPescas[playerid]*100;
				    GivePlayerMoney(playerid,quantia);
				    format(msg,sizeof(msg),"Você vendeu %d pesca(s) por R$100 cada e faturou R$%d com a venda.",QtPescas[playerid],quantia);
					SendClientMessage(playerid, COR_VERDE, msg);
					printf("%s vendeu suas pescas",PlayerName(playerid));
					QtPescas[playerid] = 0;
					udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
					return 1;
				}
			}
		}
		else {
			SendClientMessage(playerid, COR_VERMELHO, "Você não está na Cooperativa de Pesca.");
		}
		return 1;
	}
	
//--------------------------------- VENDEDOR DE ARMAS --------------------------------//

	if(strcmp(cmd,"/sellarma",true) == 0) {
		if(Profissao[playerid] == VENDEDOR_DE_ARMAS || IsPlayerAdmin(playerid)){
	  		new tmp[256];
	  		new plid,weaponid,ammo;
	  		tmp = strtok(cmdtext,idx);
	  		plid = strval(tmp);
	  		if(!strlen(tmp)){
	  			SendClientMessage(playerid, COR_VERMELHO, "/sellarma [id] [id da arma] [munição]");
	  			return 1;
	  		}
	  		tmp = strtok(cmdtext,idx);
	  		weaponid = strval(tmp);
	  		if(!strlen(tmp)){
	  			SendClientMessage(playerid, COR_VERMELHO, "/sellarma [id] [id da arma] [munição]");
	  			return 1;
	  		}
	  		tmp = strtok(cmdtext,idx);
	  		ammo = strval(tmp);
	  		if(!strlen(tmp)){
	  			SendClientMessage(playerid, COR_VERMELHO, "/sellarma [id] [id da arma] [munição]");
	  			return 1;
	  		}
	  		if(IsPlayerConnected(plid)){
	  			if(weaponid > 0 && weaponid < 47){
	  			    if(ammo > 0 && ammo < 1500){
	  					GivePlayerWeapon(plid,weaponid,ammo);
	  					SendClientMessage(playerid, COR_VERDE, "Arma vendida");
	  					SendClientMessage(plid, COR_VERDE, "Você recebeu uma arma");
	  					return 1;
	  				}
	  				else{
						SendClientMessage(playerid, COR_VERMELHO, "Arma inválida");
						return 1;
					}
		  		}
	 			else{
					SendClientMessage(playerid, COR_VERMELHO, "Munição inválida");
					return 1;
				}
		  	}
	  		else{
				SendClientMessage(playerid, COR_VERMELHO, "Jogador não conectado/logado");
				return 1;
			}
		}
		else{
		  	SendClientMessage(playerid, COR_VERMELHO, "Você é Vendedor de Armas");
		  	return 1;
		}
	}

//---------------------------- COMANDOS DE POLICIA FLORESTAL -------------------------//
	if(strcmp(cmd, "/cacaon",true) == 0) {
	    if(Profissao[playerid] == POLICIA_FLORESTAL || IsPlayerAdmin(playerid)) {
	        if(Piracema == 1){
	            SendClientMessage(playerid,COR_VERMELHO,"A temporada de caça já está ativada!");
	      		return 1;
	        } else {
	            SendClientMessageToAll(COR_VERMELHO,"A temporada de caça está ativada, quem for pego pescando será preso.");
	            SendClientMessage(playerid,COR_BRANCO,"Você ativou a temporada de caça.");
	            printf("%s ativou a temporada de caca",PlayerName(playerid));
	            TemporadaCaca = 1;
				return 1;
	        }
	    } else {
			SendClientMessage(playerid,COR_VERMELHO,"Você não é do Policia Florestal!");
			return 1;
	    }
	}

	if(strcmp(cmd, "/cacaoff",true) == 0) {
	    if(Profissao[playerid] == POLICIA_FLORESTAL || IsPlayerAdmin(playerid)) {
	        if(Piracema == 1){
	            SendClientMessage(playerid,COR_VERMELHO,"A temporada de caça já está desativada!");
	      		return 1;
	        } else {
	            SendClientMessageToAll(COR_VERMELHO,"A temporada de caça está desativada, pode pescar a vontade.");
	            SendClientMessage(playerid,COR_BRANCO,"Você desativou a temporada de caça.");
	            printf("%s desativou a temporada de caca",PlayerName(playerid));
	            TemporadaCaca = 1;
				return 1;
	        }
	    } else {
			SendClientMessage(playerid,COR_VERMELHO,"Você não é da Policia Florestal!");
			return 1;
	    }
	}

	if(strcmp(cmd,"/vercaca",true) == 0) {
	    if(Profissao[playerid] == POLICIA_FLORESTAL || IsPlayerAdmin(playerid)) {
			new tmp[256];
			new plid;
			tmp = strtok(cmdtext,idx);
			if(!strlen(tmp)){
			    SendClientMessage(playerid,COR_VERMELHO,"/vercaca [id]");
				return 1;
			}
			plid = strlen(tmp);
   			if(IsPlayerConnected(plid) && PLAYERLIST_authed[plid] == 1){
   			    if(CacaInProgress[plid] == 0){
   			        SendClientMessage(playerid,COR_VERDE,"O jogador não está caçando.");
   			        printf("%s viu a caca de %s e não havia nem uma cacas",PlayerName(playerid),PlayerName(plid));
					return 1;
				} else {
				    SendClientMessage(playerid,COR_VERDE,"O jogador está caçando.");
				    printf("%s viu a caca de %s e havia cacas",PlayerName(playerid),PlayerName(plid));
					return 1;
				}
			} else {
			    SendClientMessage(playerid,COR_VERMELHO,"Jogador não conectado/logado");
				return 1;
			}
		} else {
		    SendClientMessage(playerid,COR_VERMELHO,"Você não é da Policia Florestal!");
			return 1;
		}
	}

	if(strcmp(cmd,"/prendercaca",true) == 0) {
	    if(Profissao[playerid] == POLICIA_FLORESTAL || IsPlayerAdmin(playerid)) {
	        new tmp[256];
	        new plid;
	        tmp = strtok(cmdtext,idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid,COR_VERMELHO,"/prendercaca [id]");
				return 1;
			}
			plid = strlen(tmp);
			if(IsPlayerConnected(plid) && PLAYERLIST_authed[plid] == 1){
			    if(TemporadaCaca == 1){
			        SendClientMessage(playerid,COR_VERMELHO,"A temporada de caça está ativada, por isso você não pode prendê-lo!");
					return 1;
				} else {
				    if(CacaInProgress[plid] == 0){
				        SendClientMessage(playerid,COR_VERMELHO,"O jogador não está caçando!");
						return 1;
					} else {
					    if(GetDistanceBetweenPlayers(plid,playerid) < 21){
					        SendClientMessage(playerid,COR_VERMELHO,"Chegue mais perto para efetuar a prisão!");
							return 1;
						} else {
						    udb_setPrisao(PlayerName(plid),1);
						    LogarPlayer(plid);
						    udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
						    printf("%s prendeu %s por caças em temporada não autorizada",PlayerName(playerid),PlayerName(plid));
						}
					}
				}
				return 1;
			} else {
			    SendClientMessage(playerid,COR_VERMELHO,"Jogador não conectado/logado");
			}
			return 1;
		} else {
		    SendClientMessage(playerid,COR_VERMELHO,"Você não é da Policia Florestal!");
		}
		return 1;
	}
//-------------------------------- COMANDOS DE MENDINGO -----------------------------//
    if(strcmp(cmd,"/minhaslatinhas",true)==0){
	  if(Profissao[playerid] == MENDIGO || Profissao[playerid] == SERVICO_RECICLAGEM || IsPlayerAdmin(playerid)){
	   new string[256];
	   format(string,sizeof(string),"Você possue %d latas!",Latas[playerid]);
	   SendClientMessage(playerid, COR_AZUL, string);
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, COR_VERMELHO, "Você não é mendigo nem serviço de reciclagem portanto não possue latinhas");
		   return 1;
		   }
	}
    if(strcmp(cmd,"/selllatinha",true)==0){
	  if(Profissao[playerid] == MENDIGO || IsPlayerAdmin(playerid)){
	   new tmp[256];
  	   new plid;
  	   new latas;
  	   tmp = strtok(cmdtext,idx);
  	   plid = strval(tmp);
  	   if(!strlen(tmp)){
  	   SendClientMessage(playerid, COR_VERMELHO, "/selllatinha [id] [latas]");
  	   return 1;
  	   }
  	   tmp = strtok(cmdtext,idx);
  	   latas = strval(tmp);
  	   if(!strlen(tmp)){
  	   SendClientMessage(playerid, COR_VERMELHO, "/selllatinha [id] [latas]");
  	   return 1;
  	   }
	   if(IsPlayerConnected(plid)){
	   if(Profissao[plid] == SERVICO_RECICLAGEM){
	   if(latas <= Latas[playerid]){
	   Latas[plid] = Latas[plid]+latas;
	   new string[256];
	   format(string,sizeof(string),"Você recebeu %d latinhas de %s!",latas,PlayerName(playerid));
	   SendClientMessage(plid, COR_VERDE, string);
	   new msg[256];
	   format(msg,sizeof(msg),"Você entregou %d latas para %s",latas,PlayerName(plid));
	   SendClientMessage(playerid, COR_VERDE, msg);
	   udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, COR_VERMELHO,"Você não possue tudo isso de latinhas digite /minhaslatinhas para ver quanto você tem.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COR_VERMELHO,"Você só pode vender latinhas para um serviço de reciclagens.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COR_VERMELHO,"Jogador não conectado/logado.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COR_VERMELHO,"Você não tem permissão.");
		   return 1;
		   }
    }
	if(strcmp(cmd,"/pararcoleta",true)==0){
      if(Profissao[playerid] == MENDIGO || IsPlayerAdmin(playerid)){
	   if(CatarLatinha[playerid] == 1){
       DisablePlayerCheckpoint(playerid);
       gPlayerCheckpointStatus[playerid] = CHECKPOINT_NONE;
       CatarLatinha[playerid] = 0;
       SendClientMessage(playerid, COR_VERDE, "Você parou de coletar latinhas.");
       new string[256];
       format(string,sizeof(string),"Você possue %d latinhas",Latas[playerid]);
       SendClientMessage(playerid, COR_VERDE,string);
       Missao[playerid] = 0;
       return 1;
       }
       else{
		   SendClientMessage(playerid, COR_VERMELHO, "Você não esta coletando latinhas.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão.");
		   return 1;
		   }
	}
	if(strcmp(cmd,"/pegarlatinha",true)==0){
	    if(Profissao[playerid] == MENDIGO || IsPlayerAdmin(playerid)){
	        if(CatarLatinha[playerid] == 1){
				SendClientMessage(playerid,COR_VERMELHO,"Você já está coletando latinhas!");
				return 1;
			}
			else {
                CatarLatinha[playerid] = 1;
                DisablePlayerCheckpoint(playerid);
				SendClientMessage(playerid,COR_VERDE,"Agora você terá que coletar 6 pontos de acumulo de latinhas e levar para a reciclagem.");
				new latinhas = random(23);
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_CATANDOLATAS;
				SetPlayerCheckpoint(playerid,Latinhas[latinhas][0],Latinhas[latinhas][1],Latinhas[latinhas][2],3.0);
				Missao[playerid] = 1;
				return 1;
			}
		} else {
		    SendClientMessage(playerid,COR_VERMELHO,"Você não é Mendigo");
			return 1;
		}
	}
	
//-------------------------------- COMANDOS DE CAÇADOR ------------------------------//
	if(strcmp(cmd, "/cacar", true) == 0) {
	    if(PescaInProgress[playerid] == 1) {
	    SendClientMessage(playerid, COR_VERMELHO, "Sua Presa não morreu ainda!");
	    }
		if(PescaInProgress[playerid] == 0){
		new Float:X, Float:Y, Float:Z;
		GetPlayerPos(playerid,X,Y,Z);
		if(X >= -2062.2964 && X <= -2020.8334 && Y >= -1616.9932 && Y <= -1510.9994){
			SendClientMessage(playerid,COR_VERDE,"Espere a presa exalar seus últimos minutos de vida, para poder vendê-la.");
			PescaInProgress[playerid] = 1;
			printf("%s acabou de cacar",PlayerName(playerid));
			SetTimer("Caca",36000,false);
			return 1;
			}
			else {
			SendClientMessage(playerid,COR_VERMELHO,"Você não está na área de caça, consulte nosso site para uma referência.");
			return 1;
			}
		}
	}

	if(strcmp(cmd,"/sellcaca",true) == 0) {
	    if(Profissao[playerid] == CACADOR || IsPlayerAdmin(playerid)){
		    if(AreaCoopCaca[playerid] == 0){
		        SendClientMessage(playerid, COR_VERMELHO, "Você não está na Cooperativa de Caça.");
				return 1;
			} else {
			    if(QtCacas[playerid] == 0){
			        SendClientMessage(playerid, COR_VERMELHO, "Você não tem caças acumuladas.");
					return 1;
				} else {
					new msg[256];
					new quantia;
					quantia = QtCacas[playerid]*100;
					format(msg, sizeof(msg),"Você vendeu %d caça(s) por R$100 cada e faturou R$%d com a venda.",QtCacas[playerid],quantia);
					SendClientMessage(playerid,COR_VERDE,msg);
					GivePlayerMoney(playerid,quantia);
					printf("%s vendeu sua caca",PlayerName(playerid));
					QtCacas[playerid] = 0;
					udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
					return 1;
				}
			}
		} else {
		    SendClientMessage(playerid,COR_VERMELHO,"Você não tem permissão para isso!");
			return 1;
		}
	}


//----------------------------- COMANDOS DE MECANICO -------------------------------//

	if(strcmp(cmd, "/placa", true)==0){
	  if(Profissao[playerid] == MECANICO || IsPlayerAdmin(playerid)){
		new tmp[256];
		new car;
		new msg[256];
		tmp = strtok(cmdtext,idx);
		strmid(tmp,cmdtext, 6, strlen(cmdtext));
		if(!strlen(tmp)){
		SendClientMessage(playerid,COR_MECANICO, "/placa [nome]");
		return 1;
		}
		car = GetPlayerVehicleID(playerid);
		if(IsPlayerInVehicle(playerid,car)){
		SetVehicleNumberPlate(car,tmp);
		format(msg,sizeof(msg),"Placa mudada para %s",tmp);
		SendClientMessage(playerid,COR_AMARELOB,msg);
		return 1;
		}
		else{
			SendClientMessage(playerid, COR_MECANICO,"Você não está em um veiculo");
			return 1;
			}
	  }
	  else{
		  SendClientMessage(playerid, COR_MECANICO, "Você não tem permissao");
          return 1;
          }
	}
	if(strcmp(cmd, "/lavar", true) == 0) {
	   if(Profissao[playerid] == MECANICO || IsPlayerAdmin(playerid)){
	   new tmp[256];
	   new plid;
	   new car;
	   new distancia;
	   tmp = strtok(cmdtext,idx);
	   plid = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COR_VERMELHO, "Uso: /lavar [id]");
	   return 1;
	   }
	   distancia = GetDistanceBetweenPlayers(playerid,plid);
	   if(distancia > 10){
	   SendClientMessage(playerid, COR_VERMELHO, "Você está muito longe chegue mais perto.");
	   return 1;
	   }
	   car = GetPlayerVehicleID(plid);
	   if(IsPlayerInVehicle(plid,car)){
	   if(IsPlayerConnected(plid)){
	   if(lavagem[car] == 0){
	   SendClientMessage(playerid, COR_MECANICO, "Carro lavado.");
	   SendClientMessage(plid, COR_MECANICO, "Seu carro foi lavado por um mecanico.");
	   udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
	   lavagem[car] = 1;
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, COR_VERMELHO, "Esse carro ja está limpo.");
		   return 1;
		   }
	   }
	   else{
	       SendClientMessage(playerid, COR_VERMELHO, "Jogador não conectado/logado.");
	       return 1;
	       }
       }
	   else{
	       SendClientMessage(playerid, COR_VERMELHO, "O jogador indicado não está em um carro.");
	       return 1;
		   }
	   }
	   else{
	       SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão.");
	       return 1;
		   }
    }
	if(strcmp(cmd, "/consertar", true) == 0) {
	        if(Profissao[playerid] == MECANICO || IsPlayerAdmin(playerid)){
                new tmp[256];
                new vehicle;
                new plid;
                new distance;
                tmp = strtok(cmdtext, idx);
                distance = GetDistanceBetweenPlayers(playerid,plid);
                if(!strlen(tmp)){
				SendClientMessage(playerid, COR_MECANICO, "/consertar [id]");
				return 1;
				}
				vehicle= GetPlayerVehicleID(plid);
				plid = strval(tmp);
				if(distance < 10){
				if(IsPlayerConnected(plid)){
				if(IsPlayerInVehicle(plid,vehicle)) {
				new Float:X,Float:Y,Float:Z,Float: ang;
				new angulo;
				GetPlayerPos(playerid,X,Y,Z);
                angulo = GetVehicleZAngle(vehicle,ang);
				SetVehicleToRespawn(vehicle);
                SetVehicleHealth(vehicle,1000);
                SendClientMessage(playerid, COR_MECANICO, "Consertando.");
                SendClientMessage(plid, COR_MECANICO, "Aguarde veiculo sendo arrumado.");
                SetTimerEx("consertar",5000,false,"ddf",vehicle,plid,angulo);
                GameTextForPlayer(plid,"ARRUMANDO",5000,6);
                udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
                return 1;
                }
                else{
                    SendClientMessage(playerid, COR_MECANICO, "O jogador indicado não está em um veiculo");
                    return 1;
                    }
                }
                else{
                    SendClientMessage(playerid, COR_MECANICO, "Jogador não conectado/logado");
                    return 1;
                    }
                }
                else{
                    SendClientMessage(playerid, COR_MECANICO, "Você está muito longe chegue mais perto");
                    return 1;
                    }
              }
	}

    if(strcmp(cmd, "/pintar", true) == 0) {
	 if(Profissao[playerid] == MECANICO || IsPlayerAdmin(playerid)){
	   new tmp[256];
	   new cor1,cor2;
	   tmp = strtok(cmdtext,idx);
	   cor1 = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COR_VERMELHO, "/pintar [cor1] [cor2]");
	   return 1;
	   }
	   tmp = strtok(cmdtext,idx);
	   cor2 = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COR_VERMELHO, "/pintar [cor1] [cor2]");
	   return 1;
	   }
	   if(IsPlayerInAnyVehicle(playerid)){
	   if(cor1 >= 0 && cor1 <= 126){
	   if(cor2 >= 0 && cor2 <= 126){
	   ChangeVehicleColor(GetPlayerVehicleID(playerid),cor1,cor2);
	   SendClientMessage(playerid, COR_BRANCO, "Veiculo pintado com sucesso!");
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, COR_VERMELHO, "Cor 2 invalidá.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COR_VERMELHO, "Cor 1 invalidá");
		   return 1;
		   }
       }
       else{
		   SendClientMessage(playerid, COR_VERMELHO, "Você não esta em um veiculo.");
		   return 1;
		   }
       }
       else{
		   SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão.");
		   return 1;
		   }
    }
    
//----------------------------- COMANDOS DE AGRICULTOR ----------------------------//
    if(strcmp(cmd, "/plantar", true) == 0) {
		if(Profissao[playerid] == AGRICULTOR || IsPlayerAdmin(playerid)){
		    if(MilhoInProgress[playerid] == 1) {
		    SendClientMessage(playerid, COR_VERMELHO, "Você já está com o campo cheio!");
		    }
			if(MilhoInProgress[playerid] == 0){
			new Float:X, Float:Y, Float:Z;
			GetPlayerPos(playerid,X,Y,Z);
			if(X >= -1194.7273 && X <= -1007.1719 && Y >= -1064.6096 && Y <= -915.6717){
				SendClientMessage(playerid,COR_VERDE,"Plantado, espera o milho crescer para colher.");
				printf("%s plantou",PlayerName(playerid));
				MilhoInProgress[playerid] = 1;
				SetTimer("Plantacao",36000,false);
				udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
				return 1;
				}
				else {
				SendClientMessage(playerid,COR_VERMELHO,"Você não está na lavoura, consulte nosso site para uma referência.");
				return 1;
				}
  	 		} else {
    		SendClientMessage(playerid,COR_VERMELHO,"Você não é Agricultor!");
			return 1;
			}
		}
	}
	
	if(strcmp(cmd, "/colher", true) == 0) {
		if(Profissao[playerid] == AGRICULTOR || IsPlayerAdmin(playerid)){
		    if(PescaInProgress[playerid] == 0) {
		    SendClientMessage(playerid, COR_VERMELHO, "Você não plantou! Como que vai colher?");
		    }
			if(MilhoInProgress[playerid] == 1){
			new Float:X, Float:Y, Float:Z;
			GetPlayerPos(playerid,X,Y,Z);
			if(X >= -1194.7273 && X <= -1007.1719 && Y >= -1064.6096 && Y <= -915.6717){
				SendClientMessage(playerid,COR_VERDE,"Colhido, agora vá até a fazenda para vender sua colheita.");
				Milho[playerid] = 1;
				printf("%s colheu sua plantacao",PlayerName(playerid));
				udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
				return 1;
				}
				else {
				SendClientMessage(playerid,COR_VERMELHO,"Você não está na lavoura, consulte nosso site para uma referência.");
				return 1;
				}
  	 		} else {
    		SendClientMessage(playerid,COR_VERMELHO,"Você não é Agricultor!");
			return 1;
			}
		}
	}

	if(strcmp(cmd,"/sellmilho",true) == 0) {
	    if(Profissao[playerid] == AGRICULTOR || IsPlayerAdmin(playerid)){
		    if(AreaCoopFazenda[playerid] == 0){
		        SendClientMessage(playerid, COR_VERMELHO, "Você não está na Fazenda.");
				return 1;
			} else {
			    if(Milho[playerid] == 0){
			        SendClientMessage(playerid, COR_VERMELHO, "Você não tem colheitas acumuladas.");
					return 1;
				} else {
					new msg[256];
					new quantia;
					quantia = Milho[playerid]*100;
					format(msg, sizeof(msg),"Você vendeu %d colheira(s) de milho por R$100 cada e faturou R$%d com a venda.",QtCacas[playerid],quantia);
					SendClientMessage(playerid,COR_VERDE,msg);
					printf("%s vendeu sua plantacao",PlayerName(playerid));
					GivePlayerMoney(playerid,quantia);
					Milho[playerid] = 0;
					udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
					return 1;
				}
			}
		} else {
		    SendClientMessage(playerid,COR_VERMELHO,"Você não é Agricultor!");
			return 1;
		}
	}
	
//--------------------------- COMANDOS DE SEQUESTRADOR -----------------------------//
	if(strcmp(cmd, "/sequestrar", true)==0){
		if(Profissao[playerid] == SEQUESTRADOR || IsPlayerAdmin(playerid)){
		new tmp[256],plid;
		tmp = strtok(cmdtext,idx);
		if(!strlen(tmp)){
			SendClientMessage(playerid,COR_VERMELHO,"/sequestrar [id]");
			return 1;
		}
		plid = strlen(tmp);
		if(IsPlayerConnected(plid)){
	 		if(GetDistanceBetweenPlayers(plid,playerid) > 10){
    			SendClientMessage(playerid,COR_VERMELHO,"Você está muito longe chegue mais perto para entregar a pizza.");
				return 1;
			} else {
				SendClientMessage(playerid,COR_BRANCO,"Você sequestrou um jogador, seu chefe pagou o resgate adiantado.");
				SendClientMessage(plid,COR_VERDE,"Você foi sequestrado, ficará aqui até pagar resgate.");
				GivePlayerMoney(playerid,500);
				SetPlayerPos(plid, 1978.7238,-1603.9020,13.5401);
				TogglePlayerControllable(plid, 0);
				Sequestro[plid] = 1;
				udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
				return 1;
				}
			} else {
				SendClientMessage(playerid,COR_VERMELHO,"O jogador não está conectado!");
				return 1;
			}
   		} else {
			SendClientMessage(playerid,COR_VERMELHO,"Você não é Sequestrador!");
			return 1;
    	}
    }
    if(strcmp(cmd, "/oferecerresgate", true) == 0) {
     if(Profissao[playerid] == SEQUESTRADOR || IsPlayerAdmin(playerid)){
	   new tmp[256];
	   new plid;
	   new quant;
	   tmp = strtok(cmdtext,idx);
	   plid = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COR_VERMELHO, "/oferecerresgate [id] [quantia]");
	   return 1;
	   }
	   tmp = strtok(cmdtext,idx);
	   quant = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COR_VERMELHO, "/oferecerresgate [id] [quantia]");
	   return 1;
	   }
	   if(IsPlayerConnected(plid)){
	   if(Sequestro[plid] == 1){
	   invitestatus[plid] = INVITE_RESGATE;
	   dinheiroresgate = quant;
	   envconvite = playerid;
	   SendClientMessage(playerid, COR_VERDE, "Proposta de resgate oferecida");
	   new string[256];
	   format(string,sizeof(string),"%s esta lhe oferecendo uma proposta de %d para te tirar do sequestro! Digite /aceitar para aceitar e /recusar para recusar.",PlayerName(playerid),dinheirofianca);
	   SendClientMessage(plid, COR_VERDE, string);
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, COR_VERMELHO, "Esse jogador não esta sequestrado");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COR_VERMELHO, "Jogador não conectado/logado");
		   return 1;
		   }
	   }
	   else{
           SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão");
		   return 1;
		   }
    }

//------------------------------ COMANDOS DE FRENTISTA -----------------------------//
	if(strcmp(cmd, "/sellcomb", true) == 0) {
		if(Profissao[playerid] == FRENTISTA || IsPlayerAdmin(playerid)){
			new tmp[256];
			new msg[256];
			new petroleo;
			new plid, comb;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COR_VERMELHO, "/sellcomb [id] [litros]");
				return 1;
			}
		    plid = strval(tmp);
    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/sellcomb [id] [litros]");
				return 1;
			}
			comb = strval(tmp);
			if(comb > 100 || comb <= 0){
				SendClientMessage(playerid, COR_VERMELHO, "Quantidade inválida. Os valores devem ser de 1 à 100.");
				return 1;
			}
			if(IsPlayerConnected(plid)){
			if(IsPlayerInAnyVehicle(plid)){
			if((GPV[GetPlayerVehicleID(plid)] + comb) < 0){
			    petroleo = GPV[GetPlayerVehicleID(plid)] + comb;
				GPV[GetPlayerVehicleID(plid)] = petroleo;
				format(msg,sizeof(msg),"%s colocou %d litros de combustível para você, agora você tem %d litros de combustivel.",PlayerName(playerid),comb,petroleo);
				SendClientMessage(plid,COR_VERDE,msg);
				TogglePlayerControllable(plid, 1);
				GivePlayerMoney(playerid, comb);
				GivePlayerMoney(plid, - comb);
				SendClientMessage(playerid,COR_VERDE,"Combustível fornecido.");
				udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
				return 1;
			}
			else if((GPV[GetPlayerVehicleID(plid)] + comb) >= 0){
			    udb_setBankMoney(PlayerName(playerid), udb_getBankMoney(PlayerName(playerid)) - petroleo);
				petroleo = 0 - GPV[GetPlayerVehicleID(plid)];
				GPV[GetPlayerVehicleID(plid)] = 0;
				format(msg,sizeof(msg),"%s completou seu tanque, colocando %d litros",PlayerName(playerid),petroleo);
				SendClientMessage(plid,COR_VERDE,msg);
				TogglePlayerControllable(plid, 1);
				GivePlayerMoney(playerid, comb);
				GivePlayerMoney(plid, - comb);
				SendClientMessage(playerid,COR_VERDE,"Combustivel fornecido.");
				udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
				return 1;
			}
			return 1;
			}
			else{
			    SendClientMessage(playerid, COR_VERMELHO, "Jogador não conectado/logado.");
				return 1;
			}
		}
			else{
		    	SendClientMessage(playerid, COR_VERMELHO, "Jogador não está em um veículo!");
				return 1;
			}
		}
		else{
		    SendClientMessage(playerid, COR_VERMELHO, "Você não é Frentista!");
			return 1;
		}
	}
	
//----------------------------------- COMBUSTIVEL ---------------------------------//
	if(strcmp(cmd,"/colocar",true) == 0){
		if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER){
			if(Galao[playerid] == 0){
				SendClientMessage(playerid,COR_VERMELHO,"O Galão de Combustivel está vazio!");
				return 1;
			} else {
				Galao[playerid] = 0;
				SendClientMessage(playerid,COR_VERDE,"Você colocou um galão de 15 litros no tanque do carro, agora vá até o posto e abasteça.");
				GPV[GetPlayerVehicleID(playerid)] = GPV[GetPlayerVehicleID(playerid)] + 15;
				return 1;
			}
 		} else {
			SendClientMessage(playerid,COR_VERMELHO,"Você precisa estar em um veículo para usar este comando.");
			return 1;
		}
	}

	if(strcmp(cmd, "/buygalao", true) == 0) {
		if(Galao[playerid] == 0){
			if(AreaPosto[playerid] == 1){
				SendClientMessage(playerid,COR_VERDE,"Você comprou um galão com 15 litros de combustivel.");
				SendClientMessage(playerid,COR_VERDE,"Para colocar entre no carro e digite '/colocar'.");
				GivePlayerMoney(playerid, -15);
				Galao[playerid] = 1;
				return 1;
			} else {
				SendClientMessage(playerid,COR_VERMELHO,"Você não está no posto!");
	    		return 1;
  			}
		} else {
			SendClientMessage(playerid,COR_VERMELHO,"Seu galão de combustivel já está cheio!");
			return 1;
		}
	}
	
	if(strcmp(cmd, "/abastecer", true) == 0) {
	    if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER){
			new tmp[256];
			new quantidade;
			new string[256];
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COR_VERMELHO, "Uso: /abastecer [litros]");
				return 1;
			}
		    quantidade = strval(tmp);
		    if(quantidade <= -100 || GetPlayerMoney(playerid) < quantidade){
		        SendClientMessage(playerid, COR_VERMELHO, "Você não tem dinheiro para pagar. Ou você está querendo tirar combustível do veículo.");
				return 1;
			}
			if(AreaPosto[playerid] == 1){
				if(quantidade + GPV[GetPlayerVehicleID(playerid)] < 100){
				    GPV[GetPlayerVehicleID(playerid)] = GPV[GetPlayerVehicleID(playerid)] + quantidade;
				    format(string, sizeof(string), "Colocamos %d litros de combustível.", quantidade);
					SendClientMessage(playerid, COR_VERDE, string);
					return 1;
				}
				if(quantidade + GPV[GetPlayerVehicleID(playerid)] >= 100){
				    new quantia;
				    quantia = 100 - GPV[GetPlayerVehicleID(playerid)];
				    GPV[GetPlayerVehicleID(playerid)] = 100;
					format(string, sizeof(string), "Enchemos o tanque, colocados %d litros.", quantia);
					SendClientMessage(playerid, COR_VERDE, string);
					GivePlayerMoney(playerid, - quantia);
					return 1;
				}
			}
			else{
			    SendClientMessage(playerid, COR_VERMELHO, "Você não está no posto, consulte o mapa para ver a localização do posto mais proximo.");
				return 1;
			}
		}
		else{
			SendClientMessage(playerid, COR_VERMELHO, "Você precisa estar em um veículo para usar este comando.");
			return 1;
		}
	}
	
//--------------------------------- CELULAR -------------------------------------//
    if(strcmp(cmd, "/ligar", true) == 0)
		{
		new tmp[256];
		new plid;
		new string[256];
		new cell;
		cell = udb_getcell(PlayerName(playerid));
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COR_JUIZ, "/ligar [id]");
			return 1;
		}
		giveplayerid = strval(tmp);

		if(!IsPlayerConnected(plid))
		{
		    SendClientMessage(playerid, COR_BRANCO, "Você deve estar logado para ligar");
			return 1;
		}
		if(cell == 0)
		{
			SendClientMessage(playerid, COR_BRANCO, "Você não possue celular para fazer uma ligação");
			return 1;
		}
		if (GetPlayerMoney(playerid) < CallCost)
		{
			SendClientMessage(playerid, COR_BRANCO, "Você não tem dinheiro para uma ligação");
			return 1;
		}

		if (giveplayerid == playerid)
		{
		    SendClientMessage(playerid, COR_BRANCO, "Você não pode ligar para você mesmo");
		    return 1;
		}
		if (!(IsPlayerConnected(giveplayerid)))
		{
		    SendClientMessage(playerid, COR_BRANCO, "Jogador não conectado/logado");
		    return 1;
		}
		if (Calling[playerid] > -1)
		{
			GetPlayerName(Calling[playerid], giveplayer, sizeof(giveplayer));
			format(string, sizeof(string), "Você está no telefone com %s!", giveplayer);
			SendClientMessage(playerid, COR_COP_ELITE, string);
			return 1;
		}
		if (Calling[giveplayerid] > -1)
		{
			GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
			format(string, sizeof(string), "%s ja está no telefone, tente mais tarde.", giveplayer);
			SendClientMessage(playerid, COR_BRANCO, string);
			return 1;
		}
		else
		GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
		GetPlayerName(playerid, sendername, sizeof(sendername));
		format(string, sizeof(string), "%s está te ligando digite /atender para atender o celular ou /desligar para desligar o celular", sendername);
		SendClientMessage(giveplayerid, COR_BRANCO, string);
		format(string, sizeof(string), "Você está falando com %s", giveplayer);
		SendClientMessage(playerid, COR_COP_ELITE, string);
        SetPlayerSpecialAction(playerid,SPECIAL_ACTION_STOPUSECELLPHONE);
   		Calling[playerid] = giveplayerid;
   		Calling[giveplayerid] = playerid;
		Callerid[playerid] = 1;
	    return 1;
	}
    if(strcmp(cmd, "/atender", true) == 0)
		{
		new plid;
		new string[256];
		new tmp[256];
        new cell;
		cell = udb_getcell(PlayerName(playerid));
		plid = strval(tmp);
		if(!IsPlayerConnected(plid))
		{
		    SendClientMessage(playerid, COR_BRANCO, "Você deve estar logado para atender uma chamada de telefone");
			return 1;
		}
		if(cell == 0)
		{
			SendClientMessage(playerid, COR_BRANCO, "Como você vai atender uma ligação se não possue nenhum celular");
			return 1;
		}
		if (Calling[playerid] == -1)
		{
		    SendClientMessage(playerid, COR_BRANCO, "Ninguem está te ligando");
		    return 1;
		}
		if (Answered[playerid] == 1)
		{
		    SendClientMessage(playerid, COR_BRANCO, "Você ja está no telefone");
		    return 1;
		}
		else
		GetPlayerName(Calling[playerid], giveplayer, sizeof(giveplayer));
		GetPlayerName(playerid, sendername, sizeof(sendername));
		format(string, sizeof(string), "%s está te chamando", sendername);
		SendClientMessage(Calling[playerid], COR_AZUL, string);
		format(string, sizeof(string), "Você aceitou a chamada de %s's call", giveplayer);
        SendClientMessage(playerid, COR_AZUL, string);
        SetPlayerSpecialAction(playerid,SPECIAL_ACTION_STOPUSECELLPHONE);
   		Answered[playerid] = 1;
   		Answered[Calling[playerid]] = 1;
		Callerid[Calling[playerid]] = 1;
	    return 1;
	}
    if(strcmp(cmd, "/desligar", true) == 0)
		{
		new plid;
		new string[256];
		new tmp[256];

		plid = strval(tmp);
		if(!IsPlayerConnected(plid))
		{
		    SendClientMessage(playerid, COR_AZUL, "Você deve estar logado para desligar uma chamada");
			return 1;
		}
		if (Calling[playerid] == -1)
		{
		    SendClientMessage(playerid, COR_AZUL, "Você não está no celular");
		    return 1;
		}
		else
		{
			GetPlayerName(Calling[playerid], giveplayer, sizeof(giveplayer));
			GetPlayerName(playerid, sendername, sizeof(sendername));
			format(string, sizeof(string), "%s Desligou o telefone", sendername);
			SendClientMessage(Calling[playerid], COR_BRANCO, string);
			format(string, sizeof(string), "Você desligou a chamada com %s", giveplayer);
			SendClientMessage(playerid, COR_BRANCO, string);
		    new bCalling = Calling[playerid];
   			Calling[playerid] = -1;
   			Answered[playerid] = 0;
			Callerid[playerid] = 0;
   			Calling[bCalling] = -1;
   			Answered[bCalling] = 0;
			Callerid[bCalling] = 0;
		}
        return 1;
	}
	
    if(strcmp(cmd, "/sms", true) == 0)
	{
	   new tmp[256];
	   new plid;
	   new msg[256];
	   new o[256];
	   strmid(o,cmdtext, 6, strlen(cmdtext));
	   tmp = strtok(cmdtext,idx);
	   plid = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COR_BRANCO, "/sms [id] [mensagem]");
	   return 1;
	   }
	   if(GetPlayerMoney(playerid) < 5){
	   SendClientMessage(playerid, COR_VERDE, "Você não possue dinheiro para mandar uma SMS");
	   return 1;
	   }
	   if(IsPlayerConnected(plid)){
	   if(udb_getcell(PlayerName(playerid)) == 1){
	   GivePlayerMoney(playerid,0 - 5);
	   SendClientMessage(playerid, COR_BRANCO, "SMS enviada");
	   format(msg,sizeof(msg),"SMS enviada por %s.",PlayerName(playerid));
       SendClientMessage(plid,0x888888AA,msg);
       SendClientMessage(plid,0xFFFFFAAA,o);
       return 1;
       }
       else{
		   SendClientMessage(playerid, COR_VERMELHO, "Você não possue celular para mandar uma SMS");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COR_VERMELHO, "Jogador não conectado/logado");
		   return 1;
		   }
    }
//--------------------------- COMANDOS DE PROMOTER ---------------------------------//

    if (strcmp(cmd, "/organizarfesta", true)==0){
	  if(Profissao[playerid] == PROMOTER || IsPlayerAdmin(playerid)){
		new tmp[256];
		strmid(tmp, cmdtext, 15, strlen(cmdtext));
		if(!strlen(tmp)){
		SendClientMessage(playerid, COR_VERMELHO, "/organizarfesta [local]");
		return 1;
		}
		SendClientMessage(playerid, COR_VERDE,"Convite enviado a todos");
		for(new i=0; i<MAX_PLAYERS; i++){
		new msg[256];
		format(msg,sizeof(msg),"%s esta para fazer uma festa! Local:%s.",PlayerName(playerid),tmp);
		SendClientMessage(i,COR_BRANCO,msg);
		return 1;
		}
	}
		else{
			SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão");
			return 1;
			}
	}
	if (strcmp(cmd, "/contagem", true)==0){
	   if(Profissao[playerid] == PROMOTER || IsPlayerAdmin(playerid)){
	   new tmp[256];
	   new string[256];
	   tmp = strtok(cmdtext,idx);
	   for(new i=0; i<MAX_PLAYERS; i++){
       format(string,sizeof(string), "Contagem feita por %s!", PlayerName(playerid));
       SendClientMessage(i,COR_AMARELO,string);
       GameTextForAll("~y~5",2000,6);
       SetTimer("contagem",1000,false);
       return 1;
       }
    }
	   return 1;
	}
	if (strcmp(cmd, "/sellconvite", true)==0){
      if(Profissao[playerid] == PROMOTER || IsPlayerAdmin(playerid)){
		new tmp[256];
		new plid;
		new distancia;
		tmp = strtok(cmdtext,idx);
		plid = strval(tmp);
		if(!strlen(tmp)){
		SendClientMessage(playerid, COR_VERMELHO, "/sellconvite [id]");
		return 1;
		}
		distancia = GetDistanceBetweenPlayers(playerid,plid);
		if(distancia <= 10){
		if(convite[plid] == 0){
		if(IsPlayerConnected(plid)){
		if(plid != playerid){
		SendClientMessage(playerid, COR_BRANCO, "Convite enviado.");
		new string[256];
		format(string,sizeof(string),"%s lhe vendeu um convite aproveite a festa.");
		SendClientMessage(plid, COR_BRANCO, string);
		convite[plid] = 1;
		udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
		return 1;
		}
		else{
			SendClientMessage(playerid, COR_VERMELHO, "Você não pode vender convites para você mesmo.");
			return 1;
			}
		}
		else{
			SendClientMessage(playerid, COR_VERMELHO, "Jogador não conectado/logado");
			return 1;
			}
		}
		else{
			SendClientMessage(playerid, COR_VERMELHO, "Este jogador já possue convite.");
			return 1;
			}
		}
		else{
			SendClientMessage(playerid, COR_VERMELHO, "Você está muito longe chegue mais perto.");
			return 1;
			}
	    }
        else{
			SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão.");
			return 1;
			}
	}
	if (strcmp(cmd, "/verificar", true)==0){
      if(Profissao[playerid] == PROMOTER || IsPlayerAdmin(playerid)){
		new tmp[256];
		new plid;
		new distancia;
		tmp = strtok(cmdtext,idx);
		plid = strval(tmp);
		if(!strlen(tmp)){
		SendClientMessage(playerid, COR_VERMELHO, "/verificar [id]");
		return 1;
		}
		if(IsPlayerConnected(plid)){
		if(distancia <= 10){
		if(convite[plid] == 0){
		SendClientMessage(playerid, COR_VERMELHO, "Este jogador não possue convite!");
		return 1;
		}
		else if(convite[plid] == 1){
		SendClientMessage(playerid, COR_AZUL, "Este jogador possue convite.");
		return 1;
		}
	}
	    else{
		    SendClientMessage(playerid, COR_VERMELHO,"Você esta muito longe chegue mais perto.");
	    	return 1;
	    	}
    	}
    	else{
	    	SendClientMessage(playerid, COR_VERMELHO,"Jogador não conectado/logado.");
	    	return 1;
	    	}
	    }
	    else{
		    SendClientMessage(playerid, COR_VERMELHO,"Você não tem permissão.");
	    	return 1;
	    	}
	}
	if (strcmp(cmd, "/recolherconvite", true)==0){
      if(Profissao[playerid] == PROMOTER || IsPlayerAdmin(playerid)){
		new tmp[256];
		new plid;
		new distancia;
		tmp = strtok(cmdtext,idx);
		plid = strval(tmp);
		if(!strlen(tmp)){
		SendClientMessage(playerid, COR_VERMELHO, "/recolherconvite [id]");
		return 1;
		}
		distancia = GetDistanceBetweenPlayers(playerid,plid);
		if(distancia <= 10){
		if(convite[plid] == 1){
		if(IsPlayerConnected(plid)){
		if(plid != playerid){
		SendClientMessage(playerid, COR_BRANCO, "Convite recolhido.");
		new string[256];
		format(string,sizeof(string),"%s recolheu seu convite.");
		SendClientMessage(plid, COR_BRANCO, string);
		convite[plid] = 1;
		udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
		return 1;
		}
		else{
			SendClientMessage(playerid, COR_VERMELHO, "Você não pode vender convites para você mesmo.");
			return 1;
			}
		}
		else{
			SendClientMessage(playerid, COR_VERMELHO, "Jogador não conectado/logado");
			return 1;
			}
		}
		else{
			SendClientMessage(playerid, COR_VERMELHO, "Este jogador não possue convite.");
			return 1;
			}
		}
		else{
			SendClientMessage(playerid, COR_VERMELHO, "Você está muito longe chegue mais perto.");
			return 1;
			}
	    }
        else{
			SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão.");
			return 1;
			}
	}
//--------------------------- COMANDOS DE LADRAO DE CARROS -------------------------//
	if(strcmp(cmd, "/desmanchar", true) == 0) {
	    if(Profissao[playerid] == LADRAO_CARROS || IsPlayerAdmin(playerid)){
	        if(AreaDesmanche[playerid] == 1){
				if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER){
					if(Galao[playerid] == 0){
		   				SendClientMessage(playerid,COR_VERDE,"Veículo desmanchado, pagaram R$2500 pelo veículo roubado.");
						DestroyVehicle(GetPlayerVehicleID(playerid));
			   			GivePlayerMoney(playerid, 2500);
			   			Desmanche[playerid] = 1;
			   			SetTimer("Desmanchado",60000,false);
			   			udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
						return 1;
					} else {
						SendClientMessage(playerid,COR_VERMELHO,"Você precisa estar em um veículo para usar este comando!");
		    			return 1;
  					}
				} else {
					SendClientMessage(playerid, COR_VERMELHO, "Você não está no desmanche!");
					return 1;
		    	}
			} else {
				SendClientMessage(playerid, COR_VERMELHO, "Você não é Ladrão de Carros!");
				return 1;
			}
		} else {
			SendClientMessage(playerid, COR_VERMELHO, "Vai com calma, algum jogador entregou um veículo a pouco tempo, espera a poeira abaixar para entregar outro veículo!");
			return 1;
		}
	}
	
	if(strcmp(cmd, "/desalarme", true) == 0) {
	  	if(Profissao[playerid] == LADRAO_CARROS){
	   		if(IsPlayerInAnyVehicle(playerid)){
	   			Alarme[GetPlayerVehicleID(playerid)] = 0;
	   			SendClientMessage(playerid, COR_VERDE, "Alarme destruido");
	   			udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
	   			return 1;
	   		}
	   		else{
  	 			SendClientMessage(playerid,COR_VERMELHO,"Você precisa estar em um veículo para usar este comando!");
		   		return 1;
			}
		}
		else{
		   SendClientMessage(playerid, COR_VERMELHO, "Você não é Ladrão de Carros!");
		   return 1;
		}
	}
//--------------------------------- COMANDOS DE VENDEDOR DE BOMBAS -----------------//

    if(strcmp(cmd,"/selldinamite", true) == 0){
	   new tmp[256];
	   new plid;
	   tmp = strtok(cmdtext,idx);
	   plid = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COR_VERMELHO, "/selldinamite [id]");
	   return 1;
	   }
	   if(IsPlayerConnected(plid)){
	   if(plid != playerid){
	   SendClientMessage(playerid, COR_VERDE, "Dinamite vendida com sucesso");
	   SendClientMessage(plid, COR_VERDE, "Você recebeu uma dinamite para explosões de veiculos! Aproveite xD");
	   dinamite[plid] ++;
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, COR_VERMELHO, "Você não pode vender para você mesmo.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COR_VERMELHO, "Jogador não conectado/logado.");
		   return 1;
		   }
	}
	if(strcmp(cmd,"/sellgranada", true) == 0){
	 if(Profissao[playerid] == VENDEDOR_DE_BOMBAS || IsPlayerAdmin(playerid)){
	   new tmp[256];
	   new plid;
	   tmp = strtok(cmdtext,idx);
	   plid = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COR_VERMELHO, "/sellgranada [id]");
	   return 1;
	   }
	   if(IsPlayerConnected(plid)){
	   if(plid != playerid){
	   GivePlayerWeapon(plid,16,2);
	   SendClientMessage(playerid, COR_VERDE,"Granada vendida.");
	   SendClientMessage(plid, COR_VERDE, "Você recebeu uma granada.");
	   udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, COR_VERMELHO, "Você não pode vender para você mesmo.");
		   return 1;
		   }
	   }
	   else{
           SendClientMessage(playerid, COR_VERMELHO, "Jogador não conectado/logado.");
		   return 1;
		   }
	   }
	   else{
           SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão.");
		   return 1;
		   }
    }
    if(strcmp(cmd,"/sellbombagas", true) == 0){
	 if(Profissao[playerid] == VENDEDOR_DE_BOMBAS || IsPlayerAdmin(playerid)){
	   new tmp[256];
	   new plid;
	   tmp = strtok(cmdtext,idx);
	   plid = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COR_VERMELHO, "/sellbombagas [id]");
	   return 1;
	   }
	   if(IsPlayerConnected(plid)){
	   if(plid != playerid){
	   GivePlayerWeapon(plid,17,2);
	   SendClientMessage(playerid, COR_VERDE,"Bomba de gas vendida.");
	   SendClientMessage(plid, COR_VERDE, "Você recebeu uma bomba de gas.");
	   udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, COR_VERMELHO, "Você não pode vender para você mesmo.");
		   return 1;
		   }
	   }
	   else{
           SendClientMessage(playerid, COR_VERMELHO, "Jogador não conectado/logado.");
		   return 1;
		   }
	   }
	   else{
           SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão.");
		   return 1;
		   }
    }
    if(strcmp(cmd,"/sellmolotov", true) == 0){
	 if(Profissao[playerid] == VENDEDOR_DE_BOMBAS || IsPlayerAdmin(playerid)){
	   new tmp[256];
	   new plid;
	   tmp = strtok(cmdtext,idx);
	   plid = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COR_VERMELHO, "/sellmolotov [id]");
	   return 1;
	   }
	   if(IsPlayerConnected(plid)){
	   if(plid != playerid){
	   GivePlayerWeapon(plid,18,2);
	   SendClientMessage(playerid, COR_VERDE,"Molotov vendido.");
	   SendClientMessage(plid, COR_VERDE, "Você recebeu um molotov.");
	   udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, COR_VERMELHO, "Você não pode vender para você mesmo.");
		   return 1;
		   }
	   }
	   else{
           SendClientMessage(playerid, COR_VERMELHO, "Jogador não conectado/logado.");
		   return 1;
		   }
	   }
	   else{
           SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão.");
		   return 1;
		   }
    }
//--------------------------------- COMANDOS DE ADVOGADO ---------------------------//
    if(strcmp(cmd, "/fianca", true) == 0) {
	  if(Profissao[playerid] == ADVOGADO){
	   new tmp[256];
	   new plid;
	   new quant;
	   new string[256];
	   tmp = strtok(cmdtext,idx);
	   plid = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COR_ADVOGADO, "/fianca [id] [quantia]");
	   return 1;
	   }
	   tmp = strtok(cmdtext,idx);
	   quant = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COR_ADVOGADO, "/fianca [id] [quantia]");
	   return 1;
	   }
	   if(IsPlayerConnected(plid)){
	   if(plid != playerid){
	   format(string,sizeof(string),"O advogado %s está lhe cobrando %d para lhe tirar da prisão para aceitar faça /aceitar para recusar faça /recusar",PlayerName(playerid),quant);
	   SendClientMessage(plid,COR_ADVOGADO,string);
	   SendClientMessage(playerid, COR_ADVOGADO, "Proposta enviada");
	   envconvite = playerid;
	   dinheirofianca = quant;
	   invitestatus[plid] = INVITE_FIANCA;
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, COR_ADVOGADO, "Você não pode se próprio fazer uma oferta");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COR_ADVOGADO,"Jogador não conectado/logado");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COR_ADVOGADO, "Você não tem permissao");
		   return 1;
	   }
    }

//------------------------------- COMANDOS DE PROPOSTAS ----------------------------//
    if(strcmp(cmd, "/recusar", true) == 0) {
                new tmp[256];
		        tmp = strtok(cmdtext, idx);
		        switch (invitestatus[playerid]){
				case INVITE_NONE :
				{
				SendClientMessage(playerid, COR_BRANCO, "Nenhuma proposta foi oferecida a você");
                return 1;
				}
				case INVITE_FIANCA :
				{
				SendClientMessage(playerid, COR_ADVOGADO, "Proposta recusada");
				SendClientMessage(envconvite, COR_ADVOGADO, "Sua proposta foi recusada tente diminui-la");
				invitestatus[playerid] = INVITE_NONE;
				return 1;
				}
				case INVITE_CASA :
				{
				SendClientMessage(playerid, COR_ADVOGADO, "Casa recusada");
				SendClientMessage(envconvite, COR_ADVOGADO, "Essa casa foi recusada.Talvez outra sirva para esse jogador!");
				invitestatus[playerid] = INVITE_NONE;
				return 1;
				}
				case INVITE_CARRO :
				{
				SendClientMessage(playerid, COR_ADVOGADO, "Carro recusado");
				SendClientMessage(envconvite, COR_ADVOGADO, "Seu carro foi recusado.Talvez o jogador queira outro modelo");
				invitestatus[playerid] = INVITE_NONE;
				return 1;
				}
				case INVITE_RESGATE :
				{
				SendClientMessage(playerid, COR_ADVOGADO, "Proposta de resgate recusada");
				SendClientMessage(envconvite, COR_ADVOGADO, "A proposta de resgate foi recusada esse jogador talvez se acostumou com o local");
				invitestatus[playerid] = INVITE_NONE;
				return 1;
				}
          }
	}


    if(strcmp(cmd, "/aceitar", true) == 0) {
        new tmp[256];
		tmp = strtok(cmdtext, idx);
		switch (invitestatus[playerid]){
				case INVITE_NONE :
				{
				SendClientMessage(playerid, COR_BRANCO, "Nenhuma proposta foi oferecida a você");
				return 1;
				}
				case INVITE_FIANCA :
				{
				GivePlayerMoney(playerid, 0 - dinheirofianca);
				GivePlayerMoney(envconvite,dinheirofianca);
				SendClientMessage(playerid, COR_ADVOGADO, "Proposta aceita");
				SendClientMessage(envconvite, COR_ADVOGADO, "Sua proposta foi aceita");
				invitestatus[playerid] = INVITE_NONE;
				Presos[playerid] = 0;
			    SetSpawnInfo(playerid,0,udb_getSkin(PlayerName(playerid)),-1605.5067,710.3071,13.8672,0,0,0,0,0,0,0);
			    SpawnPlayer(playerid);
			    udb_setED(PlayerName(envconvite),udb_getED(PlayerName(envconvite)) + 1);
			    return 1;
				}
				case INVITE_CASA :
				{
				new Float:X,Float:Y,Float:Z,Float:ang;
		        new File:temp;
		        new File:temx;
		        new string[256];
				GetPlayerPos(envconvite,X,Y,Z);
				GetPlayerFacingAngle(envconvite,ang);
				udb_setPosition(PlayerName(playerid), X, Y, Z);
			    udb_setAng(PlayerName(playerid), ang);
			    SendClientMessage(envconvite, COR_VERDE, "O Jogador aceitou a casa.");
			    AddStaticPickup(1272,1,X,Y,Z);
			    format(string, sizeof(string), "AddStaticPickup(1272,1,%f %f %f) //%s\r\n",X, Y, Z);
			    temx = fopen("icones.ini", io_append);
                fwrite(temx, string);
                fclose(temx);
			    format(string, sizeof(string), "%s te setou uma casa, digite /mudar para mudar para sua casa nova.", PlayerName(envconvite));
			    SendClientMessage(playerid, COR_VERDE, string);
				format(string, sizeof(string), "%f %f %f // %s(vendedor: %s)\r\n", X, Y, Z, PlayerName(playerid), PlayerName(envconvite));
				temp = fopen("reloadrpg.casas", io_append);
    			fwrite(temp, string);
       			fclose(temp);
          		SetTimerEx("SetCasa",10000,0,"fff", X, Y, Z);
				Casa[playerid] = 1;
				udb_setED(PlayerName(envconvite),udb_getED(PlayerName(envconvite)) + 1);
				invitestatus[playerid] = INVITE_NONE;
				return 1;
				}
				case INVITE_CARRO :
				{
				new string[256];
   	            new File:temp;
   	            new Float:X,Float:Y,Float:Z,Float:ang;
    	    	GetPlayerPos(envconvite,X,Y,Z);
				GetVehicleZAngle(GetPlayerVehicleID(envconvite),ang);
				format(string, sizeof(string), "%s %d %f %f %f %f %d %d // Local:\r\n",  PlayerName(playerid), icarid, X, Y, Z, ang, icor1, icor2);
				temp = fopen("reloadrpg.carros", io_append);
               	fwrite(temp, string);
               	fclose(temp);
               	SetTimerEx("SetCar",10000,0,"dffffdd",icarid,X,Y,Z,ang,icor1,icor2);
               	format(string, sizeof(string), "Você vendeu um veículo(id: %d) para %s, dentro de 10 segundos ele aparecerá.", icarid, PlayerName(playerid));
               	SendClientMessage(envconvite, COR_COP_ELITE, string);
               	format(string, sizeof(string), "%s te vendeu um veículo(id: %d).", PlayerName(envconvite),icarid);
				SendClientMessage(playerid, COR_VERDE, string);
   	            format(string, sizeof(string), "* %s setou um veículo(id: %d) para %s.", PlayerName(envconvite),icarid,PlayerName(playerid));
				SendClientMessageToAll(COR_COP_ELITE, string);
				printf("O Jogador %s setou um veiculo(id: %d) para %s.", PlayerName(envconvite),icarid,PlayerName(playerid));
                udb_setED(PlayerName(envconvite),udb_getED(PlayerName(envconvite)) + 1);
                invitestatus[playerid] = INVITE_NONE;
				return 1;
				}
				case INVITE_RESGATE :
				{
				SendClientMessage(playerid, COR_VERDE, "Você pagou o dinheiro do resgate e foi solto");
				SendClientMessage(envconvite, COR_VERDE, "Proposta de resgate aceita");
				LogarPlayer(playerid);
				GivePlayerMoney(envconvite,dinheiroresgate);
				GivePlayerMoney(playerid,0-dinheiroresgate);
				invitestatus[playerid] = INVITE_NONE;
				udb_setED(PlayerName(envconvite),udb_getED(PlayerName(envconvite)) + 1);
				return 1;
				}
		  }
	}
//------------------------------- COMANDOS DE ADMIN --------------------------------//

	if(strcmp(cmd, "/camera", true) == 0){
	  if(IsPlayerAdmin(playerid)){
	  GivePlayerWeapon(playerid,43,100);
	  return 1;
	  }
	  else{
		  SendClientMessage(playerid, COR_VERMELHO,"Você não tem permissão");
		  return 1;
		  }
	}
    if(strcmp(cmd, "/setprof", true) == 0 && IsPlayerConnected(playerid)) {
		if(IsPlayerAdmin(playerid) == 1) {
	    	new tmp[256];
	    	new plid;
	    	new prof;
	    	new string[256];
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/setprof [id] [prof]");
				return 1;
			}
        	plid = strval(tmp);
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/setprof [id] [prof]");
				return 1;
			}
        	prof = strval(tmp);
        	if(IsPlayerConnected(plid)){
            	if(prof > 0 && prof < 61){
					udb_setProf(PlayerName(plid), prof);
					format(string, sizeof(string), "Você mudou a profissão de %s para %s(id:%d)", PlayerName(plid),ProfName[prof],prof);
					SendClientMessage(playerid, COR_VERDE, string);
					format(string, sizeof(string), "Você mudou sua profissao para %s para mais informaçoes digite /profissao", ProfName[prof]);
					SendClientMessage(plid, COR_VERDE, string);
					Profissao[plid] = prof;
					udb_setSkin(PlayerName(plid),ProfSkin[prof]);
					LogarPlayer(plid);
					SpawnPlayer(plid);
					SetPlayerPos(plid,ProfPos[prof][0],ProfPos[prof][1],ProfPos[prof][2]);
					return 1;
				}
				else{
			    	SendClientMessage(playerid, COR_VERMELHO, "Essa não é uma profisssão válida!");
				}
				return 1;
			}
			else{
		    	SendClientMessage(playerid, COR_VERMELHO, "Jogador não está conectado/logado");
			}
		}
		else
		{
			SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão para isso!");
		}
		return 1;
	}
	if(strcmp(cmd, "/seradmin", true) == 0) {
	   SendClientMessage(playerid, COR_BRANCO, "SERVER: You are logged in as admin");
	   return 1;
	}
	if(strcmp(cmd, "/addxl", true) == 0) {
	    if(IsPlayerAdmin(playerid)){
	    new tmp[256];
	    new plid;
	    new quant;
	    tmp = strtok(cmdtext,idx);
	    plid = strval(tmp);
	    if(!strlen(tmp)){
	    SendClientMessage(playerid, COR_VERMELHO, "/addxl [id] [quantia]");
	    return 1;
	    }
	    tmp = strtok(cmdtext,idx);
		quant = strval(tmp);
	    if(!strlen(tmp)){
	    SendClientMessage(playerid, COR_VERMELHO, "/addxl [id] [quantia]");
	    return 1;
	    }
	    if(IsPlayerConnected(plid)){
		udb_setXP(PlayerName(plid),udb_getXP(PlayerName(plid)) + quant);
		new string[256];
		format(string,sizeof(string),"%s aumentou %d do XL de %s",PlayerName(playerid),quant,PlayerName(plid));
		SendClientMessageToAll(COR_VERDE,string);
		udb_setNM(PlayerName(plid),0);
		return 1;
		}
		else{
		    SendClientMessage(playerid, COR_VERMELHO, "Jogador não conectado/logado");
	        return 1;
	        }
	    }
	    else{
		    SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão");
	        return 1;
	        }
    }
    if(strcmp(cmd, "/tirarxl", true) == 0) {
	    if(IsPlayerAdmin(playerid)){
	    new tmp[256];
	    new plid;
	    new quant;
	    tmp = strtok(cmdtext,idx);
	    plid = strval(tmp);
	    if(!strlen(tmp)){
	    SendClientMessage(playerid, COR_VERMELHO, "/tirarxl [id] [quantia]");
	    return 1;
	    }
	    tmp = strtok(cmdtext,idx);
		quant = strval(tmp);
	    if(!strlen(tmp)){
	    SendClientMessage(playerid, COR_VERMELHO, "/tirarxl [id] [quantia]");
	    return 1;
	    }
	    if(IsPlayerConnected(plid)){
		udb_setXP(PlayerName(plid),udb_getXP(PlayerName(plid)) - quant);
		new string[256];
		format(string,sizeof(string),"%s tirou %d do XL de %s",PlayerName(playerid),quant,PlayerName(plid));
		SendClientMessageToAll(COR_VERDE,string);
		udb_setNM(PlayerName(plid),0);
		return 1;
		}
		else{
		    SendClientMessage(playerid, COR_VERMELHO, "Jogador não conectado/logado");
	        return 1;
	        }
	    }
	    else{
		    SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão");
	        return 1;
	        }
    }
	if (strcmp(cmd, "/trazer", true)==0){
	 if(IsPlayerAdmin(playerid)){
	  new tmp[256];
	  new plid;
	  tmp = strtok(cmdtext,idx);
	  plid = strval(tmp);
	  if(!strlen(tmp)){
	  SendClientMessage(playerid, COR_BRANCO, "/trazer [id]");
	  return 1;
	  }
	  if(IsPlayerConnected(plid)){
	  new Float:X ,Float:Y ,Float:Z;
	  GetPlayerPos(playerid, X, Y, Z);
	  SetPlayerPos(plid,X,Y,Z);
	  SendClientMessage(playerid, COR_BRANCO, "Você trouxe alguem");
	  SendClientMessage(plid, COR_BRANCO, "Um admin lhe levou até ele");
	  return 1;
      }
      else{
          SendClientMessage(playerid, COR_BRANCO, "Jogador não conectado/logado");
          return 1;
          }
	 }
	 else{
         SendClientMessage(playerid, COR_BRANCO, "Você não tem permissão");
         return 1;
         }
    }
    if (strcmp(cmd, "/ir", true)==0){
	 if(IsPlayerAdmin(playerid)){
	  new tmp[256];
	  new plid;
	  tmp = strtok(cmdtext,idx);
	  plid = strval(tmp);
	  if(!strlen(tmp)){
	  SendClientMessage(playerid, COR_BRANCO, "/ir [id]");
	  return 1;
	  }
	  if(IsPlayerConnected(plid)){
	  new Float:X ,Float:Y ,Float:Z;
	  GetPlayerPos(plid, X, Y, Z);
	  SetPlayerPos(playerid,X,Y,Z);
	  SendClientMessage(playerid, COR_BRANCO, "Você foi até alguem");
	  SendClientMessage(plid, COR_BRANCO, "Um admin foi até você");
	  return 1;
      }
      else{
          SendClientMessage(playerid, COR_BRANCO, "Jogador não conectado/logado");
          return 1;
          }
	 }
	 else{
         SendClientMessage(playerid, COR_BRANCO, "Você não tem permissão");
         return 1;
         }
     }

	if(strcmp(cmd,"/colete",true)==0) {
	    if(Profissao[playerid] == VENDEDOR_DE_ARMAS || IsPlayerAdmin(playerid)){
			new tmp[256];
			new plid;
			tmp = strtok(cmdtext,idx);
			plid =  strval(tmp);
			if(!strlen(tmp)){
			SendClientMessage(playerid, COR_VERMELHO, "/colete [id]");
			return 1;
			}
			if(IsPlayerConnected(plid)){
			if(plid != playerid){
			SetPlayerArmour(plid,100);
			SendClientMessage(playerid, COR_VERDE, "Colete vendido");
			SendClientMessage(plid, COR_VERDE, "Você recebeu um colete");
			return 1;
			}
			else{
				SendClientMessage(playerid, COR_VERMELHO,"Você não pode vender colete para si mesmo");
				return 1;
				}
			}
			else{
				SendClientMessage(playerid, COR_VERMELHO, "Jogador não conectado/logado");
				return 1;
				}
	        }
	        else{
				SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão");
				return 1;
				}
	}
	if(strcmp(cmd,"/camuflar",true)==0) {
      if(Profissao[playerid] == VENDEDOR_DE_ARMAS || IsPlayerAdmin(playerid)){
		new tmp[256];
		new tmp2[256];
		new plid;
		new tempo;
		tmp = strtok(cmdtext,idx);
		plid = strval(tmp);
		if(!strlen(tmp)){
		SendClientMessage(playerid, COR_VERMELHO, "/camuflar [id] [tempo]");
		return 1;
		}
		tmp = strtok(cmdtext,idx);
		tempo = strval(tmp2);
		if(!strlen(tmp)){
		SendClientMessage(playerid, COR_VERMELHO, "/camuflar [id] [tempo]");
		return 1;
		}
		if(IsPlayerConnected(plid)){
		if(plid != playerid){
		if(tempo > 0){
		SetPlayerColor(plid,0x0000000);
		SendClientMessage(playerid, COR_VERDE, "Camuflagem feita");
		new msg[256];
		format(msg,sizeof(msg),"%s lhe camuflou por %d minutos",PlayerName(playerid),tempo);
		SendClientMessage(plid,COR_VERDE,msg);
		SetTimerEx("Fimcamuflagem",60000*tempo,false,"dd",playerid,plid);
		return 1;
		}
		else{
			SendClientMessage(playerid, COR_VERMELHO, "Tempo inválido!");
			return 1;
			}
		}
		else{
			SendClientMessage(playerid, COR_VERMELHO, "Você não pode se auto-camuflar");
			return 1;
			}
		}
		else{
			SendClientMessage(playerid, COR_VERMELHO, "Jogador não conectado/logado");
			return 1;
			}
		}
		else{
			SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão");
			return 1;
			}
	}
	if(strcmp(cmd,"/setarma",true)==0) {
	    if(Profissao[playerid] == VENDEDOR_DE_ARMAS || IsPlayerAdmin(playerid)){
	        new plid[256], weapon[256], ammo[256];
	        new msg[256];
	        plid = strtok(cmdtext, idx);
	        weapon = strtok(cmdtext, idx);
	        ammo = strtok(cmdtext, idx);
	        if(!strlen(plid) || !strlen(weapon)){
	            SendClientMessage(playerid,COR_VERMELHO,"Especifique ao menos um jogador e uma arma!");
	            return 1;
			}
			if(strval(weapon) < 1 || strval(weapon) > 46 || strval(weapon) == 39 || strval(weapon) == 40){
			    SendClientMessage(playerid,COR_VERMELHO,"Arma inválida.");
			    return 1;
			    } else {
            if(Profissao[strval(plid)] == VENDEDOR_DE_ARMAS){
            SendClientMessage(playerid,COR_VERMELHO,"Você não pode vender armas para outro vendedor.");
            return 1;
			} else {
				if(!IsPlayerConnected(strval(plid))){
				    SendClientMessage(playerid,COR_VERMELHO,"Jogador não conectado.");
				    return 1;
				} else {
					format(msg,sizeof(msg),"%s te vendeu uma arma.",PlayerName(playerid));
			    	SendClientMessage(strval(plid),COR_VERDE,msg);
			    	format(msg,sizeof(msg),"Você vendeu uma arma para %s .",(playerid));
			    	SendClientMessage(playerid,COR_VERDE,msg);
			    	udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
				    if(!strval(ammo)){
				        GivePlayerWeapon(strval(plid),strval(weapon),100);
				        return 1;
					} else {
					    GivePlayerWeapon(strval(plid),strval(weapon),strval(ammo));
					    udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
					    return 1;
					    }
					}
				}
			}
		}
	}
	
	if(strcmp(cmdtext, "/limparchat", true) ==0 && IsPlayerAdmin(playerid)){
		SendClientMessageToAll(COR_VERMELHO, " ");
		SendClientMessageToAll(COR_VERMELHO, " ");
		SendClientMessageToAll(COR_VERMELHO, " ");
		SendClientMessageToAll(COR_VERMELHO, " ");
		SendClientMessageToAll(COR_VERMELHO, " ");
		SendClientMessageToAll(COR_VERMELHO, " ");
		SendClientMessageToAll(COR_VERMELHO, " ");
		SendClientMessageToAll(COR_VERMELHO, " ");
		SendClientMessageToAll(COR_VERMELHO, " ");
		SendClientMessageToAll(COR_VERMELHO, "Chat Limpado!");
		return 1;
	}
	
	if(strcmp(cmd,"/teleportar",true) == 0) {
	    if(IsPlayerAdmin(playerid)) {
			new tmp[256];
			new plid1, plid2;
			new Float:X, Float:Y, Float:Z;
			tmp = strtok(cmdtext,idx);
			if(!strlen(tmp)){
			    SendClientMessage(playerid,COR_VERMELHO,"/teleportar [id] [id_destino]");
				return 1;
			}
			plid1 = strlen(tmp);
			plid2 = strlen(tmp);
   			if(IsPlayerConnected(plid1)){
   				if(IsPlayerConnected(plid1)){
					SendClientMessage(playerid,COR_VERDE,"Feito.");
					GetPlayerPos(plid1, X, Y, Z);
	    			SetPlayerPos(plid2, X, Y, Z);
	    			SetPlayerInterior(plid2,GetPlayerInterior(plid1));
					printf("%s teleportou %s a %s",PlayerName(playerid),PlayerName(plid1),PlayerName(plid2));
					return 1;
				} else {
					SendClientMessage(playerid,COR_VERMELHO,"Jogador não conectado/logado");
					return 1;
				}
			} else {
			    SendClientMessage(playerid,COR_VERMELHO,"Jogador não conectado/logado");
				return 1;
			}
		} else {
		    SendClientMessage(playerid,COR_VERMELHO,"Você não tem permissão!");
			return 1;
		}
	}
	
	if(strcmp(cmd, "/matar", true) == 0) {
		if(IsPlayerAdmin(playerid)){
	  		new tmp[256];
	  		new plid;
	  		tmp = strtok(cmdtext,idx);
	  		plid = strval(tmp);
	  		if(!strlen(tmp)){
	  			SendClientMessage(playerid, COR_AMARELOB, "/matar [id]");
	  			return 1;
	  		}
	  		if(IsPlayerConnected(plid)){
	  			SetPlayerHealth(plid,0);
	 			SendClientMessage(playerid, COR_BRANCO, "Morte feita");
	  			SendClientMessage(plid, COR_BRANCO, "Você foi morto por um admin");
	  			return 1;
  			}
		}
      	else{
	      	SendClientMessage(playerid, COR_JUIZ, "Jogador não conectado/logado");
	      	return 1;
	   	}
 	}
 	
	if(strcmp(cmd, "/dinheiro", true) == 0) {
	  	if(IsPlayerAdmin(playerid)){
	   		new tmp[256];
	   		new tmx[256];
	   		new plid;
	   		new quantia;
	   		tmp = strtok(cmdtext,idx);
	   		tmx = strtok(cmdtext,idx);
	   		plid = strval(tmp);
	   		if(!strlen(tmp)){
	   			SendClientMessage(playerid, COR_BRANCO, "/dinheiro [id] [quantia]");
	   			return 1;
	   		}
	   		quantia = strval(tmx);
	   		if(!strlen(tmp)){
	   			SendClientMessage(playerid, COR_BRANCO, "/dinheiro [id] [quantia]");
	   			return 1;
   			}
	   		if(IsPlayerConnected(plid)){
	   			GivePlayerMoney(plid,quantia);
	   			new string[256];
	   			SendClientMessage(plid, COR_BRANCO, "Um admin lhe entregou uma grana");
	   			SendClientMessage(playerid, COR_BRANCO, "Grana entregue");
	   			format(string,sizeof(string)," O admin %s deu $%d para %s",PlayerName(playerid),quantia,PlayerName(plid));
	   			SendClientMessageToAll(COR_COP_ELITE,string);
	   			return 1;
	   		}
    	}
		else{
			SendClientMessage(playerid, COR_BRANCO, "Jogador não conectado/logado");
	       	return 1;
   		}
	}

	if(strcmp(cmd, "/spvehicle", true) == 0) {
	  if(IsPlayerAdmin(playerid)){
	   new tmp[256];
	   new plid;
	   new car;
	   tmp = strtok(cmdtext,idx);
	   plid = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COR_BRANCO, "/spvehicle [id]");
	   return 1;
	   }
	   car = GetPlayerVehicleID(plid);
	   if(IsPlayerConnected(plid)){
	   if(IsPlayerInVehicle(plid,car)){
	   SetVehicleToRespawn(car);
	   SendClientMessage(playerid, COR_AMARELOB, "Carro spawnado");
	   SendClientMessage(plid, COR_AMARELOB, "Seu carro foi spawnado por um admin");
	   return 1;
	   }
   	 }
   	   else{
		   SendClientMessage(playerid, COR_JUIZ, " O jogador não está em um veiculo");
		   return 1;
		   }
       }
    }

	if(strcmp(cmd, "/spawnid", true) == 0) {
	  if(IsPlayerAdmin(playerid)){
	   new tmp[256];
	   new plid;
	   tmp = strtok(cmdtext,idx);
	   plid = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COR_BRANCO, "spawnid [id]");
	   return 1;
	   }
	   if(IsPlayerConnected(plid)){
	   LogarPlayer(plid);
	   SendClientMessage(playerid, COR_AZUL, "Spawn feito");
	   SendClientMessage(plid, COR_AZUL, "Você foi spawnado por um admin");
	   return 1;
	   }
    }
	   else{
	   SendClientMessage(playerid, COR_JUIZ, "Jogador não conectado/logado");
	   return 1;
	   }
	}
    if(strcmp(cmd, "/destruir", true) == 0) {
	   if(IsPlayerAdmin(playerid)){
	   new tmp[256];
	   new plid;
	   new carro;
	   tmp = strtok(cmdtext,idx);
	   plid = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COR_BRANCO, "Selecione um jogador para usar esse comando");
	   return 1;
	   }
	   carro = GetPlayerVehicleID(plid);
	   if(IsPlayerConnected(plid)){
	   if(IsPlayerInVehicle(plid,carro)){
	   SetVehicleHealth(carro,0);
	   SendClientMessage(playerid, COR_BRANCO, "Carro Destruido");
	   SendClientMessage(plid, COR_BRANCO, "Seu veiculo foi destruido por um admin");
	   return 1;
	   }
	}
	   else{
	       SendClientMessage(playerid, COR_JUIZ, "O jogador não está em um veiculo");
	       return 1;
	   }
    }
       else{
	       SendClientMessage(playerid, COR_JUIZ, "Jogador não conectado/logado");
	       return 1;
	   }
    }
    if(strcmp(cmd, "/criarcarro", true) == 0) {
		if(IsPlayerAdmin(playerid)){
			new tmp[256];
			new car;
			tmp = strtok(cmdtext,idx);
			car = strval(tmp);
			if(!strlen(tmp)){
			SendClientMessage(playerid, COR_BRANCO, "/criarcarro [id do carro]");
			return 1;
			}
			if(car > 399 && car < 611){
            new Float:X, Float:Y, Float:Z;
            GetPlayerPos(playerid,X, Y,Z);
			CreateVehicle(car,X + 2.5, Y, Z + 1.0,0,0,0,false);
            SendClientMessage(playerid, COR_CONFISCADOR, "Veiculo criado");
            printf("Admin %s criou um carro (id: %d )",PlayerName(playerid),car);
			return 1;
			}
			else{
			SendClientMessage(playerid, COR_JUIZ, "Carro Invalido");
			return 1;
			}
		 }
         else{
			SendClientMessage(playerid, COR_JUIZ, "Você não tem permissao");
			return 1;
		}
    }
	if(strcmp(cmd, "/admcmds", true) == 0 && IsPlayerAdmin(playerid)) {
		SendClientMessage(playerid, COR_BRANCO, "Comandos de administradores do [MPA]Furious RPG");
		SendClientMessage(playerid, COR_NARCOTICOS, "/addxl [id] [quantia] : Adiciona XL a alguem.");
		SendClientMessage(playerid, COR_NARCOTICOS, "/tirarxl [id] [quantia] : Tira XL de alguem.");
		SendClientMessage(playerid, COR_NARCOTICOS, "/calar [id] : Dexa alguem mudo.");
		SendClientMessage(playerid, COR_NARCOTICOS, "/descalar [id] : Dexa alguem falar.");
		SendClientMessage(playerid, COR_NARCOTICOS, "/matar [id] : Mata alguem.");
		SendClientMessage(playerid, COR_BRANCO, "Digite /admcmds2 para mais comandos de admin");
        return 1;
    }
    if(strcmp(cmd, "/admcmds2", true) == 0 && IsPlayerAdmin(playerid)) {
		SendClientMessage(playerid, COR_BRANCO, "Comandos de administradores do [MPA]Furious RPG");
		SendClientMessage(playerid, COR_NARCOTICOS, "/paralisar: Paralisa um jogador.");
		SendClientMessage(playerid, COR_NARCOTICOS, "/desparalisar : Desparalisa um jogador.");
		SendClientMessage(playerid, COR_NARCOTICOS, "/destruir : Destroi o carro de um jogador OBS:ele tem que estar dentro dele.");
		SendClientMessage(playerid, COR_NARCOTICOS, "/spvehicle : Spawna o carro de um jogador OBS:ele tem que estar dentro dele.");
		SendClientMessage(playerid, COR_NARCOTICOS, "/spawnid : Spawna um jogador.");
		SendClientMessage(playerid, COR_BRANCO, "Digite /admcmds3 para mais comandos de admin");
        return 1;
    }
    if(strcmp(cmd, "/admcmds3", true) == 0 && IsPlayerAdmin(playerid)) {
		SendClientMessage(playerid, COR_BRANCO, "Comandos de administradores do [MPA]Furious RPG");
		SendClientMessage(playerid, COR_NARCOTICOS, "/criarcarro [id do carro] : Cria um carro.");
		SendClientMessage(playerid, COR_NARCOTICOS, "/dinheiro [id] [quantia] : Da dinheiro pra alguem.");
		SendClientMessage(playerid, COR_BRANCO, "Estes sao os comandos de admins do server");
        return 1;
    }
	if(strcmp(cmd,"/resetarmas",true)==0 && IsPlayerAdmin(playerid)){
		new tmp[256];
	   	new plid;
	   	tmp = strtok(cmdtext,idx);
	   	if(!strlen(tmp)){
	       	SendClientMessage(playerid,COR_VERMELHO,"/resetarmas [id]");
			return 1;
		} else {
			SendClientMessage(playerid,COR_BRANCO,"Feito.");
			SendClientMessage(plid,COR_VERMELHO, "Agora você não tem mais nem uma arma em mãos.");
			ResetPlayerWeapons(plid);
			return 1;
		}
	}
	
	if(strcmp(cmd, "/textall", true)==0 && IsPlayerAdmin(playerid)){
		new msg[256];
	   	strmid(msg, cmdtext, 8, strlen(cmdtext));
		if(!strlen(msg)) {
			SendClientMessage(playerid, COR_VERMELHO, "/textall [mensagem]");
			return 1;
		}
		else{
		    SendClientMessage(playerid, COR_BRANCO, "Feito.");
			format(msg, sizeof(msg), "%s", msg);
			GameTextForAll(msg,3000,2);
			return 1;
		}
	}
	
	if(strcmp(cmd,"/desparalizar",true)==0 && IsPlayerAdmin(playerid)){
		new tmp[256];
	   	new plid;
	   	tmp = strtok(cmdtext,idx);
	   	if(!strlen(tmp)){
	       	SendClientMessage(playerid,COR_VERMELHO,"/desparalizar [id]");
			return 1;
		}
		if(IsPlayerConnected(plid)){
			Paralize[plid] = 1;
			SendClientMessage(playerid,COR_BRANCO,"Feito.");
			SendClientMessage(plid,COR_VERMELHO, "Um Admin te desparalizou, não faça mais bobagem ou será paralizado novamente.");
			TogglePlayerControllable(plid, 1);
			return 1;
		}
		else{
  			SendClientMessage(playerid, COR_JUIZ, "Jogador não conectado/logado");
     		return 1;
     	}
	}
	
	if(strcmp(cmd,"/paralizar",true)==0 && IsPlayerAdmin(playerid)){
		new tmp[256];
	   	new plid;
	   	tmp = strtok(cmdtext,idx);
	   	if(!strlen(tmp)){
	       	SendClientMessage(playerid,COR_VERMELHO,"/paralizar [id]");
			return 1;
		}
		if(IsPlayerConnected(plid)){
			Paralize[plid] = 1;
			SendClientMessage(playerid,COR_BRANCO,"Feito.");
			SendClientMessage(plid,COR_VERMELHO, "Um Admin te paralizou, ficará assim até que te desparalize.");
			TogglePlayerControllable(plid, 0);
			return 1;
		}
		else{
  			SendClientMessage(playerid, COR_JUIZ, "Jogador não conectado/logado");
     		return 1;
     	}
	}
	if(strcmp(cmd, "/setskin", true) == 0) {
		if(IsPlayerAdmin(playerid)){
			new tmp[256];
			new plid, skin;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COR_VERMELHO, "/setskin [id] [skin]");
				return 1;
			}
		    plid = strval(tmp);
    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/setskin [id] [skin]");
				return 1;
			}
			skin = strval(tmp);
			if(skin>=289){
			SendClientMessage(playerid, COR_VERMELHO, "ID de skin inválido!");
			return 1;
			}
			if(IsPlayerConnected(plid)){
			    udb_setSkin(PlayerName(plid), skin);
				SendClientMessage(playerid, COR_VERDE, "Skin Setado.");
				SendClientMessage(plid, COR_VERDE, "Agora você tem um skin novo!");
				SetPlayerSkin(plid,skin);
				printf("%s(id: %d) setou a %s(id: %d) um skin novo",PlayerName(playerid), playerid, PlayerName(plid), plid);
				return 1;
			}
			else{
			    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado!");
				return 1;
			}
		}
		else{
		    SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão para isso");
			return 1;
		}
	}
	
//---------------------------- COMANDOS DE ASSALTANTE -----------------------------//

	if(strcmp(cmd, "/assaltar", true) == 0) {
	  if(Profissao[playerid] == ASSALTANTE){
		    new tmp[256];
		    new string[256];
		    tmp = strtok(cmdtext,idx);
            if(AreaBanco[playerid] == 1 || AreaMercado[playerid] == 1){
		    if(assalto[playerid] == 0){
		    GivePlayerMoney(playerid,1000);
		    assalto[playerid] = 1;
		    SendClientMessage(playerid, COR_ASSALTANTE, "Assalto Concluido");
		    format(string,sizeof(string),"AVISO AOS POLICIAIS: %s acabou de assaltar um banco ou mercado e foi posto na lista dos procurados, é bom vocês agirem logo",PlayerName(playerid));
		    SendClientMessageToAll(COR_COP_ELITE,string);
		    SetTimerEx("assaltar",300000,false,"d",playerid);
		    udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
		    return 1;
		    }
	        else{
			    SendClientMessage(playerid, COR_ASSALTANTE, "Espere mais tempo para assaltar novamente");
			    return 1;
			    }
		    }
	        else{
			    SendClientMessage(playerid, COR_ASSALTANTE, "Você deve estar em um banco ou mercado para usar este comando");
			    return 1;
			    }
	  }
	  else{
		  SendClientMessage(playerid, COR_ASSALTANTE, "Você não tem permissão");
		  return 1;
		  }
	}
	if(strcmp(cmd,"/roubar",true)==0){
	    if(Profissao[playerid] == ASSALTANTE || IsPlayerAdmin(playerid)){
			new tmp[256];
			new plid,quant;
			tmp = strtok(cmdtext,idx);
			plid = strval(tmp);
			if(!strlen(tmp)){
			SendClientMessage(playerid, COR_VERMELHO, "/roubar [id] [quantia]");
			return 1;
			}
			tmp = strtok(cmdtext,idx);
			quant = strval(tmp);
			if(!strlen(tmp)){
			SendClientMessage(playerid, COR_VERMELHO, "/roubar [id] [quantia]");
			return 1;
			}
			if(IsPlayerConnected(plid)){
			if(quant <= GetPlayerMoney(plid)){
			if(Roubo[playerid] == 0){
			Roubo[playerid] = 1;
			GivePlayerMoney(playerid,quant);
			GivePlayerMoney(plid,0-quant);
			udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
			new string[256];
			format(string,sizeof(string),"%s lhe assaltou roubando R$%d rápido chame a polícia.",PlayerName(playerid),quant);
			SendClientMessage(plid, COR_VERMELHO, string);
			SendClientMessage(playerid, COR_BRANCO, "Roubo concluído! Agora fuja antes que o jogador indicado resolva chamar os policiais.");
			return 1;
			}
			else{
				SendClientMessage(playerid, COR_VERMELHO, "Você ja roubou alguém espere a poeira abaixar para roubar novamente.");
				return 1;
				}
			}
			else{
				SendClientMessage(playerid, COR_VERMELHO, "O Jogador indicado não possue essa quantia de dinheiro nas mãos.");
				return 1;
				}
			}
			else{
				SendClientMessage(playerid, COR_VERMELHO, "Jogador não conectado/logado.");
				return 1;
				}
			}
			else{
				SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão.");
				return 1;
				}
	}
//------------------------------- COMANDOS DE SEGURADOR ----------------------------//
	if(strcmp(cmd,"/segurar",true)==0){
	    if(Profissao[playerid] == SEGURADOR || IsPlayerAdmin(playerid)){
			new tmp[256];
	    	new plid, minutos;
	    	new string[256];
	    	tmp = strtok(cmdtext,idx);
	    	if(!strlen(tmp)){
	        	SendClientMessage(playerid,COR_VERMELHO,"/segurar [id] [minutos]");
				return 1;
			}
			minutos = strval(tmp);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/segurar [id] [minutos]");
				return 1;
			}
			strval(tmp);
		 	if(GetPlayerMoney(plid) > 20*minutos){
	        SendClientMessage(playerid, COR_VERMELHO, "O Jogador que você quer segurar não esse dinheiro em mãos.");
			return 1;
			}
			strval(tmp);
		 	if(minutos >= 1){
	        SendClientMessage(playerid, COR_VERMELHO, "Tempo mínimo de 1 minuto.");
			return 1;
			}
			plid = strlen(tmp);
			if(IsPlayerConnected(plid) && PLAYERLIST_authed[plid] == 1){
			    if(GetDistanceBetweenPlayers(plid,playerid) > 15){
			        SendClientMessage(playerid,COR_VERMELHO,"Chegue mais perto.");
					return 1;
				}
				if(plid == playerid){
                SendClientMessage(playerid,COR_VERMELHO,"Você não pode vender seguros para você mesmo.");
				return 1;
				}
				else {
				    Seguro[plid] = 1;
				    SendClientMessage(playerid,COR_ENTREGADOR_PIZZA,"Segurado.");
				    format(string, sizeof(string), "%s te vendeu um seguro de vida e cobrou R$500, agora quando morrer não vai mais gastar dinheiro com hospital (até o proximo gmx)." , PlayerName(playerid));
					SendClientMessage(plid, COR_COP_ELITE, string);
				    GivePlayerMoney(playerid, 500);
				    GivePlayerMoney(plid, -500);
				    SetTimer("Segurado",60000*minutos,false);
				    udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
					return 1;
				}
			} else {
			    SendClientMessage(playerid,COR_VERMELHO,"Jogador não conectado/logado");
				return 1;
   			}
		} else {
		    SendClientMessage(playerid,COR_VERMELHO,"Você não é Segurador!");
			return 1;
		}
	}
	if(strcmp(cmd,"/segurarcarro",true)==0){
      if(Profissao[playerid] == SEGURADOR || IsPlayerAdmin(playerid)){
		new tmp[256];
		new car;
		new plid;
		tmp = strtok(cmdtext,idx);
		plid = strval(tmp);
		if(!strlen(tmp)){
		SendClientMessage(playerid, COR_SEGURADOR, "/segurarcarro [id]");
		return 1;
		}
		car = GetPlayerVehicleID(plid);
		if(IsPlayerInVehicle(plid,car)){
		if(segurocarro[car] == 0){
		if(plid != playerid){
		if(GetPlayerMoney(plid) >= 400){
		SendClientMessage(playerid, COR_SEGURADOR, "Carro segurado você recebeu $400 pelo trabalho");
		SendClientMessage(plid, COR_SEGURADOR, "Seu carro foi segurado e você pagou $400 pelo trabalho");
		GivePlayerMoney(plid,0-400);
		GivePlayerMoney(playerid,400);
        udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
		return 1;
		}
		else{
            SendClientMessage(playerid,COR_VERMELHO,"Esse jogador não possue dinheiro.");
		    return 1;
		    }
		}
		else{
            SendClientMessage(playerid,COR_VERMELHO,"Você não pode vender seguros para você mesmo.");
		    return 1;
		    }
		}
		else{
			SendClientMessage(playerid, COR_VERMELHO, "Este carro ja possue seguro!");
			return 1;
			}
		}
		else{
			SendClientMessage(playerid, COR_VERMELHO, "O jogador precisa estar em um veiculo.");
			return 1;
			}
  	  }
	  else{
	  	  SendClientMessage(playerid, COR_VERMELHO, "Você não é Segurador");
		  return 1;
		  }
    }
//------------------------------ COMANDOS DE SERVIÇO DE RECICLAGENS ----------------//
	if(strcmp(cmd, "/selllatas",true)==0){
	   if(Profissao[playerid] == SERVICO_RECICLAGEM || Profissao[playerid] == MENDIGO || IsPlayerAdmin(playerid)){
		 if(AreaReciclagem[playerid] == 1){
		 GivePlayerMoney(playerid,Latas[playerid]*100);
		 new string[256];
		 format(string,sizeof(string),"Você vendeu %d latinhas e recebeu $%d por isso",Latas[playerid],Latas[playerid]*100);
		 SendClientMessage(playerid, COR_BRANCO, string);
		 Latas[playerid] = 0;
		 udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
		 return 1;
		 }
		 else{
			 SendClientMessage(playerid, COR_VERMELHO, "Você não esta na area de reciclagem");
			 return 1;
			 }
		 }
		 else{
			 SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão");
			 return 1;
			 }
    }
//------------------------------ COMANDOS DE PARAMEDICO ----------------------------//
	if(strcmp(cmd,"/socorrer",true)==0){
	    if(Profissao[playerid] == PARAMEDICO || IsPlayerAdmin(playerid)){
			new tmp[256];
	    	new plid;
	    	new string[256];
	    	tmp = strtok(cmdtext,idx);
	    	if(!strlen(tmp)){
	        	SendClientMessage(playerid,COR_VERMELHO,"/socorrer [id]");
				return 1;
			}
			strval(tmp);
		 	if(GetPlayerMoney(plid) > 20){
	        SendClientMessage(playerid, COR_VERMELHO, "O Jogador que você quer socorrer não tem o dinheiro da consulta em mãos.");
			return 1;
			}
			if(plid == playerid){
            SendClientMessage(playerid, COR_VERMELHO, "Você não pode vender para você mesmo");
            return 1;
		    }
			plid = strlen(tmp);
			if(IsPlayerConnected(plid) && PLAYERLIST_authed[plid] == 1){
			    if(GetDistanceBetweenPlayers(plid,playerid) > 10){
			        SendClientMessage(playerid,COR_VERMELHO,"Chegue mais perto.");
					return 1;
				} else {
				    
				    SendClientMessage(playerid,COR_ENTREGADOR_PIZZA,"Socorrido.");
				    format(string, sizeof(string), "%s encheu sua vida e cobrou R$20." , PlayerName(playerid));
					SendClientMessage(plid, COR_COP_ELITE, string);
				    GivePlayerMoney(playerid, 20);
				    GivePlayerMoney(plid, -20);
                    udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
					return 1;
			  	 }
			} else {
			    SendClientMessage(playerid,COR_VERMELHO,"Jogador não conectado/logado");
				return 1;
   			}
		} else {
		    SendClientMessage(playerid,COR_VERMELHO,"Você não é Paramedico!");
			return 1;
		}
	}
	

	
//--------------------------- COMANDOS DE MOTORISTA DE ONIBUS -----------------------//
	if(strcmp(cmd, "/verpassagem", true) == 0) {
 		if(Profissao[playerid] == MOTORISTA_DE_ONIBUS){
			new tmp[256];
  			new plid;
	   		new msg[256];
  			tmp = strtok(cmdtext,idx);
	  		plid = strval(tmp);
  			if(!strlen(tmp)){
  				SendClientMessage(playerid, COR_VERMELHO, "/verpassagem [id]");
			  	return 1;
			}
  			if(IsPlayerConnected(plid)){
			  	if(Passagem[plid] == 0){
				  	format(msg,sizeof(msg),"Passagem de %s não encontrada.",PlayerName(playerid));
    		      	SendClientMessage(playerid,COR_VERDE,msg);
    		      	return 1;
      			}
 	    	  	else if(Passagem[plid] == 1){
				  	format(msg,sizeof(msg),"Passagem de %s encontrada.",PlayerName(playerid));
    		      	SendClientMessage(playerid,COR_VERDE,msg);
				  	return 1;
			  	}
	   		}
     		else{
      			SendClientMessage(playerid, COR_VERMELHO, "Jogador não conectado/logado");
        		return 1;
      		}
	        return 1;
        }
    }
    if(strcmp(cmd,"/progressosflv",true)==0){
	   if(Profissao[playerid] == MOTORISTA_DE_ONIBUS){
	   DisablePlayerCheckpoint(playerid);
	   SetPlayerCheckpoint(playerid,-182.4270,1019.6400,19.6817,2.5);
	   gPlayerCheckpointStatus[playerid] = CHECKPOINT_VIAGEMSFLV;
	   SendClientMessage(playerid, COR_VERDE, "Vá para o checkpoint na rodoviaria de Forst Cason");
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, COR_AZUL, "Você não tem permissao");
		   return 1;
		   }
	}
	if(strcmp(cmd,"/progressolvsf",true)==0){
	   if(Profissao[playerid] == MOTORISTA_DE_ONIBUS){
	   DisablePlayerCheckpoint(playerid);
	   SetPlayerCheckpoint(playerid,-182.4270,1019.6400,19.6817,2.5);
	   gPlayerCheckpointStatus[playerid] = CHECKPOINT_VIAGEMSFLV;
	   SendClientMessage(playerid, COR_VERDE, "Vá para o checkpoint na rodoviaria de Forst Cason");
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, COR_AZUL, "Você não tem permissao");
		   return 1;
		   }
	}
	if (strcmp(cmd, "/terminais", true)==0){
		if(Profissao[playerid] == MOTORISTA_DE_ONIBUS){
		ShowMenuForPlayer(Terminais,playerid);
		return 1;
		}
		else{
			SendClientMessage(playerid, COR_BRANCO, "Você não tem permissao");
			return 1;
			}
	}
    if(strcmp(cmd, "/passagem", true) == 0) {
	    if(Profissao[playerid] == MOTORISTA_DE_ONIBUS || IsPlayerAdmin(playerid)){
	        new tmp[256];
	        new msg[256];
	        new plid;
			plid = strval(tmp);
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
			    SendClientMessage(playerid, COR_MOTORISTA_ONIBUS, "/passagem [id]");
				return 1;
			}
			else{
			    if(!IsPlayerConnected(plid)){
			        SendClientMessage(playerid,COR_MOTORISTA_ONIBUS, "O jogador que você indicou não está conectado.");
				    return 1;
			    }
				if(plid == playerid){
				    SendClientMessage(playerid, COR_VERMELHO, "Você não pode vender para você mesmo");
			        return 1;
				}
				if(Passagem[plid] == 1){
				   SendClientMessage(playerid, COR_VERMELHO, "O Jogador indicado já possue passagem");
				   return 1;
			    }
			    else{
			        if(GetDistanceBetweenPlayers(playerid,plid) > 20){
						SendClientMessage(playerid,COR_VERMELHO, "Chegue mais perto para vender a passagem.");
						return 1;
						}
						else {
							Passagem[plid] = 1;
					    	SendClientMessage(playerid,COR_MOTORISTA_ONIBUS, "Passagem Vendida!");
					    	format(msg,sizeof(msg),"Você recebeu uma passagem de %s.",PlayerName(playerid));
					    	SendClientMessage(plid,COR_BRANCO,msg);
					    	udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
						}
					}
				}
			}
		else {
			SendClientMessage(playerid,COR_VERMELHO,"Você não tem permissão para isso!");
			return 1;
		}
		return 1;
	}
    if(strcmp(cmd, "/recolherpass", true) == 0) {
	    if(Profissao[playerid] == MOTORISTA_DE_ONIBUS || IsPlayerAdmin(playerid)){
	        new tmp[256];
	        new msg[256];
	        new plid;
			plid = strval(tmp);
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
			    SendClientMessage(playerid, COR_VERMELHO, "/recolherpass [id]");
				return 1;
			}

			else{
			    if(!IsPlayerConnected(plid)){
			        SendClientMessage(playerid,COR_VERMELHO, "O jogador que você indicou não está conectado.");
				    return 1;
			    }
			    else{
			        if(GetDistanceBetweenPlayers(playerid,plid) > 20){
						SendClientMessage(playerid,COR_VERMELHO, "Chege mais perto para recolher a passagem.");
						return 1;
						}
						else {
							Passagem[plid] = 0;
					    	SendClientMessage(playerid,COR_MOTORISTA_ONIBUS, "Passagem Recolhida!");
					    	format(msg,sizeof(msg),"Sua passagem foi recolhida por %s.",PlayerName(playerid));
					    	SendClientMessage(plid,COR_VERDE,msg);
						}
					}
				}
			}
		else {
			SendClientMessage(playerid,COR_VERMELHO,"Você não é Motorista de Onibus!");
			return 1;
		}
		return 1;
	}


//------------------------------- COMANDOS DE TODOS PLAYER'S ----------------------//

//Somente Message's
    if(strcmp(cmd, "/ajuda", true) == 0) {
        SendClientMessage(playerid, COR_COP_ELITE, "Ajuda?");
        SendClientMessage(playerid, COR_AMARELO_CLARO, "/comandos : comandos do RPG");
        SendClientMessage(playerid, COR_AMARELO_CLARO, "/registrar [senha] : se registra");
        SendClientMessage(playerid, COR_AMARELO_CLARO, "/logar [senha] : se loga no jogo");
        SendClientMessage(playerid, COR_AMARELO_CLARO, "/aprender : Mostra uma breve explicação.");
        SendClientMessage(playerid, COR_AMARELO_CLARO, "/creditos : Vê os creditos.");
		return 1;
	}

	if(strcmp(cmd, "/creditos", true) == 0) {
	    SendClientMessage(playerid, COR_COP_ELITE, "MPA® Reload RPG™.");
	    SendClientMessage(playerid, COR_SEGURANÇA,"Mode unido com [MPA]Furious RPG");
	    SendClientMessage(playerid, COR_BRANCO,"Projeto Inicial : SolidNuts, TheHitman, Luigui e DaMNeD");
	    SendClientMessage(playerid, COR_BRANCO,"Projeto Atual: [MPA]Guilherme, [MPA]Rodrigo e [MPA]Rafael");
	    SendClientMessage(playerid, COR_BRANCO,"Agradecimentos: [MPA]VanCy, JnR, [MPA]Keninho e [TMR]MtS.");
		return 1;
	}

	if(strcmp(cmd, "/aprender", true) == 0) {
	    SendClientMessage(playerid, COR_CINZA, "MPA® Reload RPG™");
	    SendClientMessage(playerid, COR_BRANCO, "Este servidor é um RPG, ou seja, simula como se fosse a vida real.");
	    SendClientMessage(playerid, COR_BRANCO, "Nele você arranja um emprego para ganhar dinheiro para pode comprar sua casa, carros, etc.");
	    SendClientMessage(playerid, COR_BRANCO, "Como na vida real, existem crimes, como roubo e morte, e neste mode a policia irá te prender caso você cometa algum crime.");
		SendClientMessage(playerid, COR_BRANCO, "Você também só pode dirigir com habilitação (Terrestre, Naútica e Aérea).");
		SendClientMessage(playerid, COR_BRANCO, "Caso a policia te pegue andando sem habilitação, você vai tomar uma multa e poderá até ser preso.");
		SendClientMessage(playerid, COR_BRANCO, "Espero que você se divirta neste servidor. Boa diversão! =)");
		SendClientMessage(playerid, COR_LARANJA, "Digite /ajuda ou /comandos para visualizar os comandos.");
		return 1;
	}
	
    if(strcmp(cmdtext, "/veiculos", true) == 0) {
	    SendClientMessage(playerid,COR_VERDEB,"Preços dos carros:");
	    SendClientMessage(playerid,COR_AMARELOB,"Carros pesados:  /carros1");
        SendClientMessage(playerid,COR_AMARELOB,"Carros de Luxo de 2 portas:  /carros2");
        SendClientMessage(playerid,COR_AMARELOB,"Carros de luxo de 4 portas:  /carros3");
	  	SendClientMessage(playerid,COR_AMARELOB,"Muscle cars:  /carros4");
	  	SendClientMessage(playerid,COR_AMARELOB,"Carros de rua:  /carros5");
	  	SendClientMessage(playerid,COR_AMARELOB,"Carros de alta performance:  /carros6");
	  	SendClientMessage(playerid,COR_AMARELOB,"Caminhões:  /carros7");
	  	SendClientMessage(playerid,COR_VERDEB,"Para mais Carros digite /veiculos2");
	    return 1;
	}
    if(strcmp(cmdtext, "/veiculos2", true) == 0) {
	    SendClientMessage(playerid,COR_AMARELOB,"Lowriders:  /carros8");
        SendClientMessage(playerid,COR_AMARELOB,"Recreacionais:  /carros9");
        SendClientMessage(playerid,COR_AMARELOB,"Motos:  /carros10");
        SendClientMessage(playerid,COR_AMARELOB,"Carros publicos:  /carros11");
        SendClientMessage(playerid,COR_AMARELOB,"Carros do Governo:  /carros12");
	  	SendClientMessage(playerid,COR_AMARELOB,"Veiculos Aéreos:  /carros13");
	  	SendClientMessage(playerid,COR_AMARELOB,"Veiculos Navais:  /carros14");
        return 1;
	}
    if(strcmp(cmdtext, "/carros1", true) == 0) {
	    SendClientMessage(playerid,COR_VERDEB,"Carros pesados:");
	    SendClientMessage(playerid,COR_AMARELOB,"400 - Landstalker $10000");
        return 1;
	}
    if(strcmp(cmdtext, "/carros2", true) == 0) {
        SendClientMessage(playerid,COR_VERDEB,"Carros de Luxo de 2 portas:");
	    SendClientMessage(playerid,COR_AMARELOB,"602 - Alpha $22000");
        SendClientMessage(playerid,COR_AMARELOB,"496 - Blista Compact $12000");
        SendClientMessage(playerid,COR_AMARELOB,"410 - Manana $6000");
        SendClientMessage(playerid,COR_AMARELOB,"517 - Majestic $29000");
        SendClientMessage(playerid,COR_AMARELOB,"439 - Stallion $24000");
    	SendClientMessage(playerid,COR_AMARELOB,"587 - Euros $32000");
        return 1;
	}
    if(strcmp(cmdtext, "/carros3", true) == 0) {
        SendClientMessage(playerid,COR_VERDEB,"Carros de Luxo de 4 portas:");
	    SendClientMessage(playerid,COR_AMARELOB,"445 - Admiral $17000");
        SendClientMessage(playerid,COR_AMARELOB,"405 - Sentinel $23000");
        SendClientMessage(playerid,COR_AMARELOB,"409 - Stretch $60000");
        return 1;
	}
    if(strcmp(cmdtext, "/carros4", true) == 0) {
	  	SendClientMessage(playerid,COR_VERDEB,"Muscle cars:");
	    SendClientMessage(playerid,COR_AMARELOB,"402 - Buffalo $35000");
        SendClientMessage(playerid,COR_AMARELOB,"603 - Phoenix $52000");
        SendClientMessage(playerid,COR_AMARELOB,"475 - Sabre $10000");
        return 1;
	}
    if(strcmp(cmdtext, "/carros5", true) == 0) {
	  	SendClientMessage(playerid,COR_VERDEB,"Carros de rua:");
        SendClientMessage(playerid,COR_AMARELOB,"559 - Jester $50000");
        SendClientMessage(playerid,COR_AMARELOB,"560 - Sultan $42000");
        return 1;
	}
    if(strcmp(cmdtext, "/carros6", true) == 0) {
	  	SendClientMessage(playerid,COR_VERDEB,"Carros de alta performance:");
        SendClientMessage(playerid,COR_AMARELOB,"541 - Bullet $45000");
        SendClientMessage(playerid,COR_AMARELOB,"415 - Cheetah $74000");
        SendClientMessage(playerid,COR_AMARELOB,"480 - Comet $65000");
        SendClientMessage(playerid,COR_AMARELOB,"434 - Hotknife $60000");
	  	SendClientMessage(playerid,COR_AMARELOB,"411 - Infernus $90000");
	  	SendClientMessage(playerid,COR_AMARELOB,"451 - Turismo $83000");
        return 1;
	}
    if(strcmp(cmdtext, "/carros7", true) == 0) {
	  	SendClientMessage(playerid,COR_VERDEB,"Caminhões:");
        SendClientMessage(playerid,COR_AMARELOB,"515 - RoadTrain $43000");
        return 1;
	}
    if(strcmp(cmdtext, "/carros8", true) == 0) {
	    SendClientMessage(playerid,COR_VERDEB,"Lowriders:");
        SendClientMessage(playerid,COR_AMARELOB,"536 - Blade $25000");
        SendClientMessage(playerid,COR_AMARELOB,"534 - Remington $26000");
        SendClientMessage(playerid,COR_AMARELOB,"535 - Slamvan $30000");
        return 1;
	}
    if(strcmp(cmdtext, "/carros9", true) == 0) {
        SendClientMessage(playerid,COR_VERDEB,"Recreacionais:");
        SendClientMessage(playerid,COR_AMARELOB,"424 - BF Injection $18000");
        SendClientMessage(playerid,COR_AMARELOB,"444 - Monster $40000");
        SendClientMessage(playerid,COR_AMARELOB,"471 - Quad $6000");
        return 1;
	}
    if(strcmp(cmdtext, "/carros10", true) == 0) {
	    SendClientMessage(playerid,COR_VERDEB,"Motos:");
        SendClientMessage(playerid,COR_AMARELOB,"461 - PCJ-600 $10000");
        SendClientMessage(playerid,COR_AMARELOB,"521 - FCR-900 $20000");
        SendClientMessage(playerid,COR_AMARELOB,"463 - Freeway $12000");
        SendClientMessage(playerid,COR_AMARELOB,"468 - Sanchez $10000");
	  	SendClientMessage(playerid,COR_AMARELOB,"462 - Faggio $5000");
	  	SendClientMessage(playerid,COR_AMARELOB,"522 - NRG-500 $30000");
        return 1;
	}
    if(strcmp(cmdtext, "/carros11", true) == 0) {
        SendClientMessage(playerid,COR_VERDEB,"Carros públicos:");
        SendClientMessage(playerid,COR_AMARELOB,"420 - Taxi $10000");
	  	SendClientMessage(playerid,COR_AMARELOB,"437 - Coach $15000");
        return 1;
	}
    if(strcmp(cmdtext, "/carros12", true) == 0) {
	    SendClientMessage(playerid,COR_VERDEB,"Carros do Governo:");
        SendClientMessage(playerid,COR_AMARELOB,"433 - Barracks $30000");
        SendClientMessage(playerid,COR_AMARELOB,"523 - HPV-1000 $10000");
        SendClientMessage(playerid,COR_AMARELOB,"470 - Patriot $60000");
        SendClientMessage(playerid,COR_AMARELOB,"596 - Police $10000");
        return 1;
	}
    if(strcmp(cmdtext, "/carros13", true) == 0) {
	    SendClientMessage(playerid,COR_VERDEB,"Veiculos Aéreos:");
        SendClientMessage(playerid,COR_AMARELOB,"425 - Hunter $130000");
        SendClientMessage(playerid,COR_AMARELOB,"487 - Maverick $70000");
        SendClientMessage(playerid,COR_AMARELOB,"497 - Police Maverick $75000");
        SendClientMessage(playerid,COR_AMARELOB,"593 - Dodo $80000");
	  	SendClientMessage(playerid,COR_AMARELOB,"519 - Shamal $132000");
        return 1;
	}
    if(strcmp(cmdtext, "/carros14", true) == 0) {
	    SendClientMessage(playerid,COR_VERDEB,"Veiculos Navais:");
        SendClientMessage(playerid,COR_AMARELOB,"453 - Reefer - $40000");
	  	SendClientMessage(playerid,COR_AMARELOB,"493 - Jetmax $40000");
	  	SendClientMessage(playerid,COR_AMARELOB,"473 - Dinghy $50000");
        return 1;
	}
	if(strcmp(cmd, "/armas", true) == 0) { 
		SendClientMessage(playerid, COR_BRANCO, "Lista de armas do [MPA]Furious RPG");
		SendClientMessage(playerid, COR_AZUL, "1 Brass Knuckles $120");
		SendClientMessage(playerid, COR_AZUL, "2 Golf Club $150|| 3 Night Stick $100");
		SendClientMessage(playerid, COR_AZUL, "4 Knife $150|| 5 Baseball Bat$100");
		SendClientMessage(playerid, COR_AZUL, "6 Shovel $50 || 7 Pool cue$50");
		SendClientMessage(playerid, COR_AZUL, "8 Katana $100|| 9 Chainsaw $150");
        SendClientMessage(playerid, COR_BRANCO, "Para mais armas digite /armas2");
		return 1;
    }
    if(strcmp(cmd, "/armas2", true) == 0) {
		SendClientMessage(playerid, COR_BRANCO, "Lista de armas do [MPA]Furious RPG");
		SendClientMessage(playerid, COR_VERMELHO, "10 Purple Dildo $100");
		SendClientMessage(playerid, COR_VERMELHO, "11 White Dildo $100|| 12 Long White Dildo $100");
		SendClientMessage(playerid, COR_VERMELHO, "13 White Dildo $100 || 14 Flowers $200");
		SendClientMessage(playerid, COR_VERMELHO, "15 Cane $400|| 16 Grenades $5000 ");
		SendClientMessage(playerid, COR_VERMELHO, "17 TearGas $300 || 18 Molotovs $3000");
        SendClientMessage(playerid, COR_BRANCO, "Para mais armas digite /armas3");
		return 1;
    }
    if(strcmp(cmd, "/armas3", true) == 0) {
		SendClientMessage(playerid, COR_BRANCO, "Lista de armas do [MPA]Furious RPG");
		SendClientMessage(playerid, COR_MOTORISTA, "22 Pistol $500");
		SendClientMessage(playerid, COR_MOTORISTA, "23 Silenced Pistol $800 || 24 Desert Eagle $700");
		SendClientMessage(playerid, COR_MOTORISTA, "25 Shotgun $1200||26 Sawn Off Shotgun $ 1300");
		SendClientMessage(playerid, COR_MOTORISTA, "27 Combat Shotgun $1700 || 28 Micro Uzi (Mac 10) $ 900");
		SendClientMessage(playerid, COR_MOTORISTA, "29 MP5 $1400|| 30 AK47 $ 1500");
        SendClientMessage(playerid, COR_BRANCO, "Para mais armas digite /armas4");
		return 1;
    }
    if(strcmp(cmd, "/armas4", true) == 0) {
		SendClientMessage(playerid, COR_BRANCO, "Lista de armas do [MPA]Furious RPG");
		SendClientMessage(playerid, COR_ASSALTANTE, "31 M4 $1500 || 32 Tec9 $900");
		SendClientMessage(playerid, COR_ASSALTANTE, "33 Rifle $1200 || 34 Sniper Rifle $1000");
        SendClientMessage(playerid, COR_BRANCO, "Essas sao algumas armas do nosso mode!");
        SendClientMessage(playerid, COR_BRANCO, "Se quiser uma compre com um vendedor de armas mas se for bomba");
        SendClientMessage(playerid, COR_BRANCO, "fale com um vendedor de bombas.");
		return 1;
	}
	if(strcmp(cmd, "/comandos", true) == 0) {
		SendClientMessage(playerid, COR_COP_ELITE, "Comandos:");
		SendClientMessage(playerid, COR_AMARELO_CLARO, "/profissoes : Mostra as profissões disponiveis.");
		SendClientMessage(playerid, COR_AMARELO_CLARO, "/docs [id] : Mostra seus ducumentos.");
		SendClientMessage(playerid, COR_AMARELO_CLARO, "/taxi [local] : Chama um taxí.");
		SendClientMessage(playerid, COR_AMARELO_CLARO, "/190 [denuncia] : Faz uma denuncia para todos policiais.");
		SendClientMessage(playerid, COR_AMARELO_CLARO, "/192 [local] : Chama uma ambulancia.");
		SendClientMessage(playerid, COR_AMARELO_CLARO, "/abastecer [litros] : Abastece seu veículo (você deve estar no posto para usar este comando).");
		SendClientMessage(playerid, COR_AMARELO_CLARO, "/trancar : Tranca seu veículo impossibilitando que os outros jogadores possam entrar.");
		SendClientMessage(playerid, COR_AMARELO_CLARO, "/destrancar : Destranca seu veículo.");
		SendClientMessage(playerid, COR_JUSTICA_FEDERAL, "Para mais comandos digite /comandos2.");
		return 1;
	}
	if(strcmp(cmd, "/comandos2", true) == 0) {
		SendClientMessage(playerid, COR_COP_ELITE, "Comandos - Parte 2:");
		SendClientMessage(playerid, COR_AMARELO_CLARO, "/presos : Vê a lista de jogadores presos.");
		SendClientMessage(playerid, COR_AMARELO_CLARO, "/procurados : Vê a lista de jogadores procurados.");
		SendClientMessage(playerid, COR_AMARELO_CLARO, "/advogado : Pede um advogado.");
		SendClientMessage(playerid, COR_AMARELO_CLARO, "/carteiras : Vê as os preços das carteiras (você precisa estar na auto-escola).");
		SendClientMessage(playerid, COR_AMARELO_CLARO, "/skin [id da skin] : Muda sua skin.");
		SendClientMessage(playerid, COR_AMARELO_CLARO, "/report [id] [rasão] : Denuncia o uso de cheater aos admins.");
		SendClientMessage(playerid, COR_AMARELO_CLARO, "/armas : Ve a lista de armas.");
		SendClientMessage(playerid, COR_AMARELO_CLARO, "/veiculos : Ve a lista dos carros do RPG.");
		SendClientMessage(playerid, COR_JUSTICA_FEDERAL, "Para mais comandos digite /comandos3.");
		return 1;
	}
	if(strcmp(cmd, "/comandos3", true) == 0) {
		SendClientMessage(playerid, COR_COP_ELITE, "Comandos - Parte 3:");
		SendClientMessage(playerid, COR_AMARELO_CLARO, "/diskdroga [local] : Chama um traficante.");
		SendClientMessage(playerid, COR_AMARELO_CLARO, "/ligar [id] : Liga do celular para alguem.");
		SendClientMessage(playerid, COR_AMARELO_CLARO, "/atender : Atende o celular.");
		SendClientMessage(playerid, COR_AMARELO_CLARO, "/desligar : Desliga o celular.");
		SendClientMessage(playerid, COR_AMARELO_CLARO, "/bebidas : Vê as bebidas do RPG.");
		SendClientMessage(playerid, COR_AMARELO_CLARO, "/sabores : Vê os sabores de sorvete do RPG.");
		SendClientMessage(playerid, COR_AMARELO_CLARO, "/lanches : Vê os lanches do RPG.");
		SendClientMessage(playerid, COR_AMARELO_CLARO, "/pizzas : Vê os sabores de pizzas do RPG.");
		SendClientMessage(playerid, COR_JUSTICA_FEDERAL, "para mais comandos digite /comandos4.");
		return 1;
	}

    if(strcmp(cmd, "/comandos4", true) == 0) {
        SendClientMessage(playerid, COR_COP_ELITE, "Comandos - Parte 3:");
		SendClientMessage(playerid, COR_AMARELO_CLARO, "/tomarsorvete [sabor] : Toma um sorvete (Você tem que estar na sorveteria).");
		SendClientMessage(playerid, COR_AMARELO_CLARO, "/calculadorainfo : Vê as opções de calculadora.");
		SendClientMessage(playerid, COR_AMARELO_CLARO, "/plantardinamite : Planta a dinamite em um veiculo (Você tem que ter uma dinamite).");
		SendClientMessage(playerid, COR_AMARELO_CLARO, "/veiculoid : Vê o id do seu veiculo.");
		SendClientMessage(playerid, COR_JUSTICA_FEDERAL, "Esses são os comandos do RPG.");
		return 1;
	}
	if(strcmp(cmd, "/bancoinfo", true) == 0) {
        SendClientMessage(playerid, COR_COP_ELITE, "Comandos do Banco:");
        SendClientMessage(playerid, COR_AMARELO_CLARO, "/depositar [quantia] : Deposita dinheiro na sua conta do banco");
        SendClientMessage(playerid, COR_AMARELO_CLARO, "/sacar [quantia] : retira dinheiro na sua conta do banco");
        SendClientMessage(playerid, COR_AMARELO_CLARO, "/saldo : checa seu o saldo bancário..");
        SendClientMessage(playerid, COR_AMARELO_CLARO, "/saldocel : checa seu o saldo bancário através do seu celular, custo R$20.");
        SendClientMessage(playerid, COR_LARANJA, "Você precisa estar em um banco para usar esses comandos, menos o /saldocel.");
		return 1;
	}

	if(strcmp(cmd, "/autoinfo", true) == 0) {
		if(AreaEscola[playerid] == 1){
        	SendClientMessage(playerid, COR_COP_ELITE, "Comandos da Auto-Escola:");
        	SendClientMessage(playerid, COR_AMARELO_SCLARO, "/carteiras : Vê o id das carteiras.");
        	SendClientMessage(playerid, COR_AMARELO_SCLARO, "/carteira [id_da_carteira] : Pede uma carteira.");
        	SendClientMessage(playerid, COR_ROSA, "As Carteiras só podem ser constatadas com teste e por um Instrutor de Direção.");
			return 1;
		}
		else{
			SendClientMessage(playerid, COR_VERMELHO, "Você não está na Auto-Escola");
			return 1;
		}
	}
	
	if(strcmp(cmd, "/baladainfo", true) == 0) {
		if(AreaBalada[playerid] == 1){
    	    SendClientMessage(playerid, COR_VERMELHO, "Comandos da Balada Reload:");
    	    SendClientMessage(playerid, COR_AMARELO_CLARO, "/dancar [id] : Dança na balada.");
    	    SendClientMessage(playerid, COR_AMARELO_CLARO, "/bebervodka [quantia] : Bebe vodca.");
    	    SendClientMessage(playerid, COR_AMARELO_CLARO, "/bebercerveja [latas] : Bebe cerveja.");
    	    SendClientMessage(playerid, COR_BRANCO, "Enquanto você ficar em nossa balada irá ouvir músicas.");
    	    SendClientMessage(playerid, COR_BRANCO, "Chame um promoter caso queira organizar uma festa em nossa balada.");
			return 1;
		}
		else{
			SendClientMessage(playerid, COR_VERMELHO, "Você não está na Balada.");
			return 1;
		}
	}
	
	if(strcmp(cmd, "/carteiras", true) == 0) {
		if(AreaEscola[playerid] == 1){
        	SendClientMessage(playerid, COR_COP_ELITE, "ID das Cateiras:");
        	SendClientMessage(playerid, COR_AMARELO_CLARO, "1 - Terrestre:	R$  500");
        	SendClientMessage(playerid, COR_AMARELO_CLARO, "2 - Aerea:		R$ 1200");
        	SendClientMessage(playerid, COR_AMARELO_CLARO, "3 - Nautica:	R$  800");
        	SendClientMessage(playerid, COR_ROSA, "As Carteiras só podem ser constatadas com teste e por um Instrutor de Direção.");
			return 1;
		}
		else{
			SendClientMessage(playerid, COR_VERMELHO, "Você não está na Auto -Escola");
			return 1;
		}
	}
	
	if(strcmp(cmd, "/postoinfo", true) == 0) {
		if(AreaPosto[playerid] == 1){
    	    SendClientMessage(playerid, COR_VERMELHO, "Comandos do Posto:");
    	    SendClientMessage(playerid, COR_AMARELO_CLARO, "/abastecer [litros] : Abastece seu veículo.");
    	    SendClientMessage(playerid, COR_AMARELO_CLARO, "/buygalao : Compra um galão de combustivel com 15 litros para colocar em seu veículo.");
			return 1;
		}
		else{
			SendClientMessage(playerid, COR_VERMELHO, "Você não está no Posto");
			return 1;
		}
	}
	
	if(strcmp(cmd, "/pescainfo", true) == 0) {
		if(AreaPosto[playerid] == 1){
    	    SendClientMessage(playerid, COR_AZUL, "Comandos de Pesca:");
    	    SendClientMessage(playerid, COR_AMARELO_CLARO, "/pescar : Pesca(você precisa estar na área de pesca).");
    	    SendClientMessage(playerid, COR_AMARELO_CLARO, "/sellpesca : Vende sua pesca(você precisa estar na cooperativa de pesca).");
			return 1;
		}
		else{
			SendClientMessage(playerid, COR_VERMELHO, "Você não está no Posto");
			return 1;
		}
	}
	
	if(strcmp(cmd, "/refinariainfo", true) == 0) {
		if(AreaRefinaria[playerid] == 1){
    	    SendClientMessage(playerid, COR_VERMELHO, "Comandos da Refinaria:");
    	    SendClientMessage(playerid, COR_AMARELO_CLARO, "/carregarcomb : Carrega seu veículo(você precisa ser transportador de combustivel).");
			return 1;
		}
		else{
			SendClientMessage(playerid, COR_VERMELHO, "Você não está na Refinaria!");
			return 1;
		}
	}

	if(strcmp(cmd, "/cardapio", true) == 0) {
		if(AreaBar[playerid] == 1){
            TogglePlayerControllable(playerid, false);
	        ShowMenuForPlayer(cardapio,playerid);
			return 1;
	 	}
	 	else{
			SendClientMessage(playerid, COR_VERMELHO, "Você não está no Bar");
			return 1;
		}
	}
	

	if(strcmp(cmd, "/profissoes", true) == 0) {
			TogglePlayerControllable(playerid,false);
			new Level;
            Level = udb_getXP(PlayerName(playerid));
            if(Level < 5){
            ShowMenuForPlayer(level0,playerid);
            return 1;
            }
            if(Level >= 5 && Level < 10){
            ShowMenuForPlayer(level5,playerid);
            return 1;
            }
            if(Level >= 10 && Level < 15){
            ShowMenuForPlayer(level10,playerid);
            return 1;
            }
            if(Level >= 15 && Level < 20){
            ShowMenuForPlayer(level15,playerid);
            return 1;
            }
            if(Level >= 20 && Level < 25){
            ShowMenuForPlayer(level20,playerid);
            return 1;
            }
            if(Level >= 25 && Level < 30){
            ShowMenuForPlayer(level25,playerid);
            return 1;
            }
            if(Level >= 30 && Level < 35){
            ShowMenuForPlayer(level30,playerid);
            return 1;
            }
            if(Level >= 35 && Level < 40){
            ShowMenuForPlayer(level35,playerid);
            return 1;
            }
            if(Level >= 40 && Level < 45){
            ShowMenuForPlayer(level40,playerid);
            return 1;
            }
            if(Level >= 45 && Level < 50){
            ShowMenuForPlayer(level45,playerid);
            return 1;
            }
            if(Level >= 50 && Level < 55){
            ShowMenuForPlayer(level50,playerid);
            return 1;
            }
            if(Level >= 55){
            ShowMenuForPlayer(level55,playerid);
            return 1;
            }
	}
	if(strcmp(cmdtext, "/plantardinamite", true) == 0) {
	   new carid;
	   carid = GetPlayerVehicleID(playerid);
	   if(IsPlayerInVehicle(playerid,carid)){
	   if(dinamite[playerid] > 0){
       DinamitePlantada[carid] = 1;
       SetTimerEx("BUM",120000,false,"d",carid);
       SendClientMessage(playerid, COR_VERMELHO, "Bomba plantada explodirá em 1 minuto não deixe nenhum polícial desarma-la.");
       return 1;
       }
       else{
		   SendClientMessage(playerid, COR_VERMELHO, "Você não possue dinamite.");
		   return 1;
		   }
	   }
       else{
		   SendClientMessage(playerid, COR_VERMELHO, "Você não está em um veiculo");
		   return 1;
		   }
	}
	if(strcmp(cmd, "/rc", true) == 0) {
		SendClientMessage(playerid, COR_VERMELHO, "RC Disponiveis:");
		SendClientMessage(playerid, COR_AMARELO, "/rcbaron : Aviao de Controle(Apenas Admins)");
		SendClientMessage(playerid, COR_AMARELO, "/rcbandit : Carrinho de Controle");
		SendClientMessage(playerid, COR_AMARELO, "/rcraider : Helicoptero de Controle");
		SendClientMessage(playerid, COR_AMARELO, "/rcglobim : Helicoptero de Controle");
		SendClientMessage(playerid, COR_AMARELO, "/rccam : Vaso de Controle(Apenas Admins)");
		SendClientMessage(playerid, COR_AMARELO, "/rctiger : Tanque de Controle(Apenas Admins)");
		return 1;
	}

	if(strcmp(cmd, "/sabores", true) == 0) {
        SendClientMessage(playerid, COR_COP_ELITE, "Sabores de sorvetes:");
        SendClientMessage(playerid, COR_AMARELO_CLARO, "1 - Morango.");
        SendClientMessage(playerid, COR_AMARELO_CLARO, "2 - Leite Condensado.");
        SendClientMessage(playerid, COR_AMARELO_CLARO, "3 - Flocos.");
        SendClientMessage(playerid, COR_AMARELO_CLARO, "4 - Creme.");
        SendClientMessage(playerid, COR_AMARELO_CLARO, "5 - Doce de Leite.");
        SendClientMessage(playerid, COR_AMARELO_CLARO, "6 - Refrigerante");
        SendClientMessage(playerid, COR_AMARELO_CLARO, "7 - Coco");
        SendClientMessage(playerid, COR_AMARELO_CLARO, "8 - Tutti-frutti");
        SendClientMessage(playerid, COR_VENDEDOR_LANCHES, "Peça para um Sorveteiro te vender.");
		return 1;
	}

    if(strcmp(cmd, "/bebidas", true) == 0) {
        SendClientMessage(playerid, COR_COP_ELITE, "Bebidas Disponiveis:");
        SendClientMessage(playerid, COR_AMARELO_CLARO, "1 - Coca Cola.");
        SendClientMessage(playerid, COR_AMARELO_CLARO, "2 - Sukita.");
        SendClientMessage(playerid, COR_AMARELO_CLARO, "3 - Guaraná.");
        SendClientMessage(playerid, COR_AMARELO_CLARO, "4 - Soda.");
        SendClientMessage(playerid, COR_VENDEDOR_LANCHES, "Peça para um Vendedor de Lanches,Barman ou Entregador de pizzas lhe vender.");
        SendClientMessage(playerid, COR_MECANICO, "Assim que tomar a bebida entregue a latinha a um mendingo ou serviço de reciclagem com /entregarlata [id].");
        SendClientMessage(playerid, COR_MECANICO, "Assim estará ajudando eles e a acabar com a poluição mundial =).");
		return 1;
	}
	if(strcmp(cmd, "/calculadorainfo", true) == 0) {
        SendClientMessage(playerid, COR_COP_ELITE, "Comandos de calculadora");
        SendClientMessage(playerid, COR_AMARELO_CLARO, "/dividir [numero 1] [numero 2] : Divide um número pelo outro.");
        SendClientMessage(playerid, COR_AMARELO_CLARO, "/multiplicar [numero 1] [numero 2] : Multiplica um número pelo outro.");
        SendClientMessage(playerid, COR_AMARELO_CLARO, "/somar [numero 1] [numero 2] : Soma um número com outro.");
        SendClientMessage(playerid, COR_AMARELO_CLARO, "/subtrair [numero 1] [numero 2] : Subtrai um número pelo outro.");
        SendClientMessage(playerid, COR_VENDEDOR_LANCHES, "Para possuir uma calculadora compre um celular.");
        SendClientMessage(playerid, COR_VERMELHO, "AVISO: Números negativos serão dados resultados como 0.");
        return 1;
	}
	if(strcmp(cmd, "/lanches", true) == 0) {
        SendClientMessage(playerid, COR_COP_ELITE, "Lanches Disponiveis:");
        SendClientMessage(playerid, COR_AMARELO_CLARO, "1 - X-Bacon.");
        SendClientMessage(playerid, COR_AMARELO_CLARO, "2 - X-Burguer.");
        SendClientMessage(playerid, COR_AMARELO_CLARO, "3 - X-Salada.");
        SendClientMessage(playerid, COR_AMARELO_CLARO, "4 - X-Tudo.");
        SendClientMessage(playerid, COR_VENDEDOR_LANCHES, "Peça para um Vendedor de Lanches lhe vender.");
		return 1;
	}
	
	if(strcmp(cmd, "/pizzas", true) == 0) {
        SendClientMessage(playerid, COR_COP_ELITE, "Pizzas Disponiveis:");
        SendClientMessage(playerid, COR_AMARELO_CLARO, "1 - 4 Queijos.");
        SendClientMessage(playerid, COR_AMARELO_CLARO, "2 - Calabresa.");
        SendClientMessage(playerid, COR_AMARELO_CLARO, "3 - Frango-Catupiry.");
        SendClientMessage(playerid, COR_AMARELO_CLARO, "4 - Presunto e Queijo.");
        SendClientMessage(playerid, COR_VENDEDOR_LANCHES, "Peça para um Entregador de Pizza lhe vender.");
		return 1;
	}
	
	if(strcmp(cmd, "/drogas", true) == 0) {
        SendClientMessage(playerid, COR_COP_ELITE, "Drogas disponíveis:");
        SendClientMessage(playerid, COR_AMARELO_CLARO, "1 - Maconha");
		SendClientMessage(playerid, COR_AMARELO_CLARO, "2 - Cocaína");
		SendClientMessage(playerid, COR_AMARELO_CLARO, "3 - Heroína");
		SendClientMessage(playerid, COR_AMARELO_CLARO, "4 - Crack");
		SendClientMessage(playerid, COR_VENDEDOR_LANCHES, "Quer uma dessas? Fale com um traficante.");
		return 1;
	}
	
	if(strcmp(cmd, "/int", true) == 0) {
		SetPlayerInterior(playerid, GetPlayerInterior(playerid));
		return 1;
	}

	if(strcmp(cmd, "/profs", true) == 0) {
        SendClientMessage(playerid, COR_COP_ELITE, "Comando Mudado!");
        SendClientMessage(playerid, COR_ASSALTANTE, "Agora temos sistema de XL vá na agencia de empregos e escolha uma profissão.");
		SendClientMessage(playerid, COR_ASSALTANTE, "Caso não saiba onde é, peça para um taxista lhe levar ao local.");
		return 1;
	}
	if(strcmp(cmd, "/gasolina", true) == 0 || strcmp(cmd, "/buygas", true) == 0) {
        SendClientMessage(playerid, COR_INSTRUTOR, "Comando incorreto!");
        SendClientMessage(playerid, COR_LARANJA, "Use: /abastecer [litros].");
		return 1;
	}
	if(strcmp(cmd, "/dinheiro", true) == 0 && IsPlayerAdmin(playerid)) {
        SendClientMessage(playerid, COR_BRANCO, "Feito.");
		udb_setBankMoney(PlayerName(playerid), udb_getBankMoney(PlayerName(playerid)) + 1500);
		return 1;
	}
	if(strcmp(cmd, "/ci", true) == 0) {
        SendClientMessage(playerid, COR_INSTRUTOR, "Comando incorreto!");
        SendClientMessage(playerid, COR_LARANJA, "Use: /docs [id].");
		return 1;
	}
	if(strcmp(cmd, "/givecash", true) == 0 || strcmp(cmd, "/transferir", true) == 0) {
        SendClientMessage(playerid, COR_INSTRUTOR, "Comando incorreto!");
        SendClientMessage(playerid, COR_LARANJA, "Use: /enviar [id] [valor].");
		return 1;
	}
	if(strcmp(cmd, "/bdp", true) == 0 || strcmp(cmd, "/bwd", true) == 0 || strcmp(cmd, "/bstats", true) == 0 || strcmp(cmd, "/bscell", true) == 0) {
        SendClientMessage(playerid, COR_INSTRUTOR, "Comando incorreto!");
        SendClientMessage(playerid, COR_AMARELO_CLARO, "/retirar [valor] ou /sacar [valor] : Retira dinheiro de sua conta bancaria. ");
		SendClientMessage(playerid, COR_AMARELO_CLARO, "/depositar [valor] : Deposita em sua conta bancaria");
		SendClientMessage(playerid, COR_AMARELO_CLARO, "/saldo : Vê o saldo de sua conta bancaria.");
		SendClientMessage(playerid, COR_AMARELO_CLARO, "/saldocel : Vê o saldo de sua conta bancaria pelo celular.");
		return 1;
	}
	
	if(strcmp(cmd, "/veiculoid", true) == 0) {
	  if(IsPlayerInAnyVehicle(playerid)){
		new vehid = GetPlayerVehicleID(playerid);
		new msg[256];
		format(msg,sizeof(msg),"O ID do seu veiculo é %d",vehid);
		SendClientMessage(playerid, COR_AZUL, msg);
		return 1;
		}
		else{
			SendClientMessage(playerid, COR_VERMELHO, "Você não está em um veiculo.");
			return 1;
			}
	}
	
	if(strcmp(cmd,"/pararsexo",true)==0){
      if(Sexo[playerid] == 1){
	   new id;
	   id = FazendoSexo[playerid];
	   TogglePlayerControllable(playerid,1);
	   TogglePlayerControllable(id,1);
	   Sexo[playerid] = 0;
	   Sexo[id] = 0;
	   FazendoSexo[playerid] = 0;
       FazendoSexo[id] = 0;
	   SendClientMessage(playerid, COR_VERMELHO, "Sexo parado.");
	   SendClientMessage(id, COR_VERMELHO, "O sexo acabou.");
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, COR_VERMELHO, "Você não está fazendo sexo");
		   return 1;
		   }
	}
	if(strcmp(cmd,"/mudar",true) == 0){
		if(Casa[playerid] == 0){
			SendClientMessage(playerid,COR_VERMELHO,"Você não tem uma casa nova!");
			return 1;
		} else {
		    Casa[playerid] = 0;
		    SendClientMessage(playerid,COR_VERDE,"Você se mudou para sua casa nova.");
			LogarPlayer(playerid);
			return 1;
		}
	}
//hora real
	if(strcmp(cmd, "/horas", true) == 0){
	   new hora,minuto,segundo;
	   new dia,mes,ano;
	   gettime(hora,minuto,segundo);
	   getdate(dia,mes,ano);
	   new msg[256];
	   format(msg,sizeof(msg),"~r~Data:~w~%d/%d/%d~n~~r~Hora:~w~%d:%d:%d",dia,mes,ano,hora,minuto,segundo);
	   GameTextForPlayer(playerid,msg,5000,4);
	   return 1;
	}
//--------------------------------- TROCA DE SKIN ----------------------------------//
	if(strcmp(cmd, "/skin", true) == 0) {
		new tmp[256];
		new skin;
		tmp = strtok(cmdtext, idx);
   		if(!strlen(tmp)){
			SendClientMessage(playerid, COR_VERMELHO, "/skin [skin]");
			return 1;
		}
		skin = strval(tmp);
		if(skin>=289){
		SendClientMessage(playerid, COR_VERMELHO, "ID de skin inválido!");
		return 1;
		}
		if(IsPlayerConnected(playerid)){
		    udb_setSkin(PlayerName(playerid), skin);
			SendClientMessage(playerid, COR_VERDE, "Agora você tem um skin novo!");
			SetPlayerSkin(playerid,skin);
			printf("%s(id: %d) comprou um novo skin",PlayerName(playerid), playerid);
			return 1;
		}
	}
//------------------------------------ STATUS -------------------------------------//
    if(strcmp(cmd, "/meustatus", true) == 0) {
		   new msg[256];
		   format(msg,sizeof(msg),"Status de %s || ID: %d",PlayerName(playerid),playerid);
		   SendClientMessage(playerid, COR_BRANCO, msg);
		   new string[256];
		   format(string,sizeof(string),"Profissao: %s || Experiencia Diaria : %d  || XL : %d  || Skin : %d",ProfName[Profissao[playerid]],udb_getED(PlayerName(playerid)),udb_getXP(PlayerName(playerid)),GetPlayerSkin(playerid));
		   SendClientMessage(playerid,COR_SERVICO_RECICLAGEM,string);
		   new string2[256];
		   format(string2,sizeof(string2),"Habilitação Terrestre : %s || Habilitação Aérea : %s || Habilitação Náutica: %s",NameCarteira[udb_gethabterre(PlayerName(playerid))],NameCarteira[udb_getHabaerea(PlayerName(playerid))],NameCarteira[udb_getHabnauti(PlayerName(playerid))]);
		   SendClientMessage(playerid, COR_SERVICO_RECICLAGEM, string2);
		   return 1;
    }
//------------------------------- PASSAGENS DE ONIBUS -----------------------------//
	if(strcmp(cmd, "/mostrarpassagem", true) == 0) {
 		new tmp[256];
	  	new plid;
 		new msg[256];
	  	tmp = strtok(cmdtext,idx);
	  	plid = strval(tmp);
	  	if(!strlen(tmp)){
	  		SendClientMessage(playerid, COR_BRANCO, "/mostrarpassagem [id]");
		  	return 1;
	  	}
	  	if(IsPlayerConnected(plid)){
			if(Passagem[playerid] == 0){
  				format(msg,sizeof(msg),"Passagem de %s não encontrada.",PlayerName(playerid));
   	  			SendClientMessage(plid,COR_BRANCO,msg);
 	     	 	return 1;
   	      	}
   	      	else if(Passagem[playerid] == 1){
			  	format(msg,sizeof(msg),"Passagem de %s encontrada.",PlayerName(playerid));
    	      	SendClientMessage(plid,COR_BRANCO,msg);
			  	return 1;
	  		}
   		}
     	else{
      		SendClientMessage(playerid, COR_JUIZ, "Jogador não conectado/logado");
        	return 1;
		}
		return 1;
	}

//-------------------------------- DENUNCIAS --------------------------------------//
    if(strcmp(cmd, "/report", true) == 0) {
 		new tmp[256];
 		new msg[256];
 		new rasao[256];
 		new plid;
 		new File:temp;
	  	tmp = strtok(cmdtext,idx);
	  	if(!strlen(tmp)){
	  		SendClientMessage(playerid, COR_BRANCO, "/report [id] [rasão]");
		  	return 1;
	  	}
	  	plid = strval(tmp);
	  	tmp = strtok(cmdtext, idx);
	  	if(!strlen(tmp)){
	  		SendClientMessage(playerid, COR_BRANCO, "/report [id] [rasão]");
		  	return 1;
	  	}
	  	set(rasao, tmp);
	  	if(IsPlayerConnected(plid)){
	  	    format(msg, sizeof(msg), "%s: denunciado por: %s, rasão: %s", PlayerName(plid), PlayerName(playerid), rasao);
			temp = fopen("reloadrpg.denuncias", io_append);
   			fwrite(temp, msg);
      		fclose(temp);
      		for(new i=0; i<MAX_PLAYERS; i++){
      			if(IsPlayerAdmin(i)){
					format(msg,sizeof(msg),"O Jogador %s(id: %d) foi denunciado por %s(id: %d).",PlayerName(plid), plid, PlayerName(playerid), playerid);
					SendClientMessage(i,COR_VERMELHO,msg);
					format(msg,sizeof(msg),"Rasão: %s.",rasao);
					SendClientMessage(i,COR_VERMELHO,msg);
					return 1;
				}
			}
			return 1;
        }
     	else{
      		SendClientMessage(playerid, COR_JUIZ, "Jogador não conectado/logado");
        	return 1;
		}
	}

//---------------------------- EMERGENCIAS E PEDIDOS -------------------------------//
	if(strcmp(cmd, "/pizza", true)==0){
	    SendClientMessage(playerid,COR_AMARELO,"Uma pizza está a caminho!");
	    for(new i=0; i<MAX_PLAYERS; i++){
	        if(Profissao[i] == ENTREGADOR_PIZZA || IsPlayerAdmin(i)){
	            new msg[256];
	            format(msg,sizeof(msg),"O jogador %s solicita uma pizza.",PlayerName(playerid));
	            SendClientMessage(i,COR_ENTREGADOR_PIZZA,msg);
				return 1;
			}
		}
	}
	
	if(strcmp(cmd, "/advogado", true)==0){
 		SendClientMessage(playerid, COR_VERDE, "Um dos advogados de San Andreas, ira lhe defender no tribunal.");
   		for(new i=0; i<MAX_PLAYERS; i++){
     		if(IsPlayerConnected(i) && Profissao[i] == ADVOGADO || IsPlayerAdmin(i)){
     		    new string[256];
				format(string, sizeof(string), "O jogador %s solicita um advogado.", PlayerName(playerid));
				SendClientMessage(i, COR_VERDE, string);
				printf("%s solicita um advogado",PlayerName(playerid));
				return 1;
			}
		}
	}

	if (strcmp(cmd, "/processo", true)==0){
		if(Profissao[playerid] == ADVOGADO || IsPlayerAdmin(playerid)){
			new tmp[256];
			new string[256];
	    	strmid(tmp, cmdtext, 10, strlen(cmdtext));
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/processo [nome_do_réu] [descrição_da_causa]");
				return 1;
			}
		    SendClientMessage(playerid, COR_ADVOGADO, "Você fez a defesa do seu cliente e o processo está em andamento, aguarde a sentença do juiz");
		    for(new i=0; i<MAX_PLAYERS; i++){
		        if(Profissao[i] == JUIZ || IsPlayerAdmin(playerid)){
					format(string, sizeof(string), "O Dr.%s entrou com um processo em defesa do réu %s.", PlayerName(playerid), tmp);
					SendClientMessage(i, COR_VERDE, string);
					printf("%s entrou com um preocesso: %s",PlayerName(playerid), tmp);
					udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
					return 1;
		        }
			}
		} else {
		    SendClientMessage(playerid, COR_VERMELHO, "Você não é Advogado!");
			return 1;
		}
	}
	
	if(strcmp(cmd, "/carteira", true) == 0) {
		if(AreaEscola[playerid] == 1){
            new string[256];
			new tmp[256];
			new carteira;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COR_VERMELHO, "/carteira [id_da_carteira]");
				return 1;
			}
			carteira = strval(tmp);
			if(carteira < 1 || carteira > 3){
			    SendClientMessage(playerid, COR_VERMELHO, "Carteira Invalida, As carteiras são de 1 a 3.");
			    SendClientMessage(playerid, COR_VERMELHO, "Para ver os ids das carteiras digite /carteiras.");
				return 1;
			}
			else{
				for(new i=0; i<MAX_PLAYERS; i++){
					if(Profissao[i] == INSTRUTOR_DE_DIRECAO || IsPlayerAdmin(playerid)){
						format(string, sizeof(string), "o Jogador %s solicita uma carteira %s.", PlayerName(playerid),CarteiraName[carteira]);
						printf("%s solicita uma carteira %s",PlayerName(playerid),CarteiraName[carteira]);
						SendClientMessage(i, COR_VERDE, string);
						SendClientMessage(playerid, COR_ADVOGADO, "Carteira Solicitada.");
						return 1;
					}
					else{
						SendClientMessage(playerid, COR_VERMELHO, "Você não está na Auto Escola!");
						return 1;
					}
				}
			}
		}
	}
	
	if (strcmp(cmd, "/190", true)==0){
		new tmp[256];
		new string[256];
	    strmid(tmp, cmdtext, 4, strlen(cmdtext));
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COR_VERMELHO, "/190 [denuncia]");
			return 1;
		}
		else{
		    SendClientMessage(playerid, COR_COP_ELITE, "Os policiais foram informados");
		    for(new i=0; i<MAX_PLAYERS; i++){
		        if(Profissao[i] == COP_CIVIL || Profissao[i] == XERIFE || Profissao[i] == DELEGADO || Profissao[i] == EXERCITO || Profissao[i] == COP_RODOVIARIO || Profissao[i] == COP_ELITE){
					format(string, sizeof(string), "%s fez uma denuncia: %s", PlayerName(playerid), tmp);
					SendClientMessage(i, COR_COP_ELITE, string);
		        }
			}
			return 1;
		}
	}
	if (strcmp(cmd, "/diskdroga", true)==0){
		new tmp[256];
		new string[256];
	    strmid(tmp, cmdtext, 4, strlen(cmdtext));
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COR_VERMELHO, "/diskdroga [local]");
			return 1;
		}
		else{
		    SendClientMessage(playerid, COR_COP_ELITE, "Os traficantes foram informados");
		    for(new i=0; i<MAX_PLAYERS; i++){
		        if(Profissao[i] == TRAFICANTE || Profissao[i] == LIDER_DE_TRAFICO){
					format(string, sizeof(string), "%s pediu uma droga: %s", PlayerName(playerid), tmp);
					SendClientMessage(i, COR_COP_ELITE, string);
		        }
			}
			return 1;
		}
	}
	
	if (strcmp(cmd, "/taxi", true)==0){
		new tmp[256];
		new string[256];
	    strmid(tmp, cmdtext, 5, strlen(cmdtext));
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COR_VERMELHO, "/taxi [aonde]");
			return 1;
		}
		else{
		    SendClientMessage(playerid, COR_AMARELO, "Os taxistas foram informados");
		    for(new i=0; i<MAX_PLAYERS; i++){
		        if(Profissao[i] == TAXISTA){
					format(string, sizeof(string), "%s pede um taxi. Local: %s", PlayerName(playerid), tmp);
					SendClientMessage(i, COR_AMARELO, string);
		        }
			}
			return 1;
		}
	}

	if (strcmp(cmd, "/192", true)==0){
		new tmp[256];
		new string[256];
	    strmid(tmp, cmdtext, 4, strlen(cmdtext));
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COR_VERMELHO, "/192 [local]");
			return 1;
		}
		else{
		    SendClientMessage(playerid, COR_COP_ELITE, "Os paramédicos foram informados");
		    for(new i=0; i<MAX_PLAYERS; i++){
		        if(Profissao[i] == PARAMEDICO){
					format(string, sizeof(string), "%s precisa de uma Ambulancia. Local: %s", PlayerName(playerid), tmp);
					SendClientMessage(i, COR_COP_ELITE, string);
		        }
			}
			return 1;
		}
	}

//--------------------------- TRANCAR E DESTRANCAR ---------------------------------//
	if (strcmp(cmdtext, "/trancar", true)==0){
		if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER){
			new i;
			for(i=0;i<MAX_PLAYERS;i++){
				if(i != playerid){
					SetVehicleParamsForPlayer(GetPlayerVehicleID(playerid),i, 0, 1);
				}
			}
			SendClientMessage(playerid, COR_VERMELHO, "Você não está dirigindo nenhum veiculo!");
		}
		else{
			SendClientMessage(playerid, COR_COP_ELITE, "Veículo Trancado");
			new Float:X, Float:Y, Float:Z;
			PlayerPlaySound(playerid,1056,X,Y,Z);
			return 1;
		}
	}

	if (strcmp(cmdtext, "/destrancar", true)==0){
		if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER){
			new i;
			for(i=0;i<MAX_PLAYERS;i++){
				if(i != playerid){
					SetVehicleParamsForPlayer(GetPlayerVehicleID(playerid),i, 0, 0);
				}
			}
			SendClientMessage(playerid, COR_VERMELHO, "Você não está dirigindo nenhum veiculo!");
		}
		else{
			SendClientMessage(playerid, COR_COP_ELITE, "Veículo Destrancado");
			new Float:X, Float:Y, Float:Z;
			PlayerPlaySound(playerid,1057,X,Y,Z);
			return 1;
		}
		return 1;
	}

//--------------------------- COMANDOS DE JORNALISTA -------------------------------//
	if (strcmp(cmd, "/noticia", true)==0){
	    if(Profissao[playerid] == JORNALISTA || IsPlayerAdmin(playerid)){
			new tmp[256];
			new string[256];
	    	strmid(tmp, cmdtext, 8, strlen(cmdtext));
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/noticia [mensagen]");
				return 1;
			}
			else{
			    SendClientMessage(playerid, COR_AMARELO, "Noticia Publicada.");
				format(string, sizeof(string), "Noticias de San Andreas, Jornalista %s.", PlayerName(playerid));
				SendClientMessageToAll(COR_BRANCO, string);
				format(string, sizeof(string), "Noticia: %s ", tmp);
				SendClientMessageToAll(COR_AZUL_CLARO, string);
				udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
				return 1;
		    }
		} else {
		    SendClientMessage(playerid, COR_VERMELHO, "Você não é Jornalista!");
			return 1;
		}
	}
    if(strcmp(cmd,"/anunciar",true)==0){
	    if(Profissao[playerid] == JORNALISTA || IsPlayerAdmin(playerid)){
	    	new tmp[256];
	    	new msg[256];
	    	strmid(tmp,cmdtext,10,strlen(cmdtext));
	    	if(!strlen(tmp)) {
	        	SendClientMessage(playerid,COR_VERMELHO,"/anunciar [texto]");
				return 1;
			} else {
			    format(msg,sizeof(msg),"Anuncio feito por: %s",PlayerName(playerid));
			    SendClientMessageToAll(COR_JORNALISTA,msg);
			    GameTextForAll(tmp,5000,0);
			    udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
			}
			return 1;
		}else{
		    SendClientMessage(playerid,COR_VERMELHO,"Você não tem permissão!");
		}
		return 1;
	}
	if (strcmp(cmd, "/pediranuncio", true)==0){
        new tmp[256];
	    new msg[256];
	    new plid;
	    tmp = strtok(cmdtext,idx);
	    plid = strval(tmp);
		if(!strlen(tmp)){
		SendClientMessage(playerid,COR_VERMELHO,"/pediranuncio [id] [anúncio]");
		return 1;
		}
		tmp = strtok(cmdtext,idx);
	    strmid(msg,cmdtext,10,strlen(cmdtext));
		if(!strlen(tmp)){
		SendClientMessage(playerid,COR_VERMELHO,"/pediranuncio [id] [anúncio]");
		return 1;
		}
		if(IsPlayerConnected(plid)){
		if(Profissao[plid] == JORNALISTA || IsPlayerAdmin(plid)){
    	SendClientMessage(playerid, COR_BRANCO, "Anuncio pedido com sucesso.");
    	new string[256];
    	format(string,sizeof(string),"%s esta lhe pedindo um anúncio",PlayerName(playerid));
    	SendClientMessage(plid, COR_BRANCO, string);
    	SendClientMessage(plid, COR_BRANCO, msg);
    	return 1;
    	}
    	else{
			SendClientMessage(playerid, COR_VERMELHO, "Você só pode pedir anúncio para jornalistas.");
			return 1;
			}
		}
		else{
			SendClientMessage(playerid, COR_VERMELHO, "Jogador não conectado/logado.");
			return 1;
			}
	}
	if (strcmp(cmd, "/pedirnoticia", true)==0){
        new tmp[256];
	    new msg[256];
	    new plid;
	    tmp = strtok(cmdtext,idx);
	    plid = strval(tmp);
		if(!strlen(tmp)){
		SendClientMessage(playerid,COR_VERMELHO,"/pedirnoticia [id] [notícia]");
		return 1;
		}
		tmp = strtok(cmdtext,idx);
	    strmid(msg,cmdtext,10,strlen(cmdtext));
		if(!strlen(tmp)){
		SendClientMessage(playerid,COR_VERMELHO,"/pediranuncio [id] [notícia]");
		return 1;
		}
		if(IsPlayerConnected(plid)){
		if(Profissao[plid] == JORNALISTA || IsPlayerAdmin(plid)){
    	SendClientMessage(playerid, COR_BRANCO, "Anuncio pedido com sucesso.");
    	new string[256];
    	format(string,sizeof(string),"%s esta lhe pedindo um anúncio",PlayerName(playerid));
    	SendClientMessage(plid, COR_BRANCO, string);
    	SendClientMessage(plid, COR_BRANCO, msg);
    	return 1;
    	}
    	else{
			SendClientMessage(playerid, COR_VERMELHO, "Você só pode pedir anúncio para jornalistas.");
			return 1;
			}
		}
		else{
			SendClientMessage(playerid, COR_VERMELHO, "Jogador não conectado/logado.");
			return 1;
			}
	}


//----------------------------- COMANDOS DE TRANSFERENCIA --------------------------//
	if(strcmp(cmd, "/enviar", true) == 0) {
		new string[256];
	    new tmp[256];
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COR_VERMELHO, "Uso: /enviar [id] [valor]");
			return 1;
		}
		giveplayerid = strval(tmp);
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COR_VERMELHO, "Uso: /enviar [id] [valor]");
			return 1;
		}
 		moneys = strval(tmp);
		if (IsPlayerConnected(giveplayerid)) {
			GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
			GetPlayerName(playerid, sendername, sizeof(sendername));
			playermoney = GetPlayerMoney(playerid);
			if (moneys > 0 && playermoney >= moneys) {
				GivePlayerMoney(playerid, (0 - moneys));
				GivePlayerMoney(giveplayerid, moneys);
				format(string, sizeof(string), "Você enviou %s(id: %d), R$%d.", giveplayer,giveplayerid, moneys);
				SendClientMessage(playerid, COR_AMARELO, string);
				format(string, sizeof(string), "Você recebeu R$%d de %s(id: %d).", moneys, sendername, playerid);
				SendClientMessage(giveplayerid, COR_AMARELO, string);
			}
			else {
				SendClientMessage(playerid, COR_AMARELO, "Valor inválido.");
			}
		}
		else {
			format(string, sizeof(string), "O Jogador de id: %d, não está online", giveplayerid);
			SendClientMessage(playerid, COR_AMARELO, string);
		}
		return 1;
	}
	
	if(strcmp(cmd, "/pagar", true) == 0) {
		new string[256];
	    new tmp[256];
	    new plid;
	    new pagamento;
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COR_VERMELHO, "/pagar [id] [valor]");
			return 1;
		}
		plid = strval(tmp);
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COR_VERMELHO, "/pagar [id] [valor]");
			return 1;
		}
 		pagamento = strval(tmp);
        if(Profissao[plid] == VENDEDOR_DE_CARROS || Profissao[plid] == CORRETOR){
 			if(pagamento > GetPlayerMoney(plid) || pagamento <= 0){
				SendClientMessage(playerid, COR_VERMELHO, "Você não tem esse dinheiro! ou não está querendo pagar de forma justa.");
				return 1;
			}
 			if(IsPlayerConnected(plid)){
 			    GivePlayerMoney(plid, pagamento/10);
 			    GivePlayerMoney(playerid, 0-pagamento);
    	        SendClientMessage(playerid, COR_VERDE, "Pagamento feito.");
				format(string, sizeof(string), "Você vendeu por %d e lucrou %d com a venda", pagamento, pagamento/10);
				SendClientMessage(playerid, COR_VERDE, string);
				return 1;
			}
			else{
				SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado!");
				return 1;
			}
		}
		if(Profissao[plid] != VENDEDOR_DE_CARROS || Profissao[plid] != CORRETOR){
		    SendClientMessage(playerid, COR_VERMELHO, "Você está tentando pagaer a alguem que não é coretoe e nem vendedor!");
			return 1;
		}
		return 1;
	}

//-------------------------------- COMANDOS DO BANCO -------------------------------//
    if(strcmp(cmd, "/depositar", true) == 0) {
		new tmp[256];
		new quantidade;
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)){
			SendClientMessage(playerid, COR_BRANCO, "Uso: /depositar [quantidade]");
			return 1;
		}
	    quantidade = strval(tmp);
	    if(quantidade <= 0 || quantidade > GetPlayerMoney(playerid)){
	        SendClientMessage(playerid, COR_VERMELHO, "Você não tem todo esse dinheiro. Ou está tentando enviar R$0.");
			return 1;
		}
	    if(IsPlayerInCheckpoint(playerid)){
	        GivePlayerMoney(playerid, 0 - quantidade);
	        udb_setBankMoney(PlayerName(playerid), udb_getBankMoney(PlayerName(playerid)) + quantidade);
            TogglePlayerControllable(playerid,0);
            SetTimerEx("depositar",11000,false,"d",playerid);
            ApplyAnimation(playerid,"PED","ATM",4.1,0,1,1,1,1);
			return 1;
		}
		else{
			SendClientMessage(playerid, COR_AMARELO, "Você precisa estar em um banco para usar esse comando.");
			return 1;
		}
	}

    if(strcmp(cmd, "/sacar", true) == 0 || strcmp(cmd, "/retirar", true) == 0) {
        new string[256];
		new tmp[256];
		new quantidade;
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)){
			SendClientMessage(playerid, COR_BRANCO, "Uso: /sacar [valor] ou /retirar [valor]");
			return 1;
		}
	    quantidade = strval(tmp);
	    if(quantidade < 0){
	        SendClientMessage(playerid, COR_VERMELHO, "Você não pode depositar com esse comando");
			return 1;
		}
		if(quantidade > udb_getBankMoney(PlayerName(playerid))){
		    SendClientMessage(playerid, COR_VERMELHO, "Você não pode tem essa quantidade no banco");
			return 1;
		}
	    if(IsPlayerInCheckpoint(playerid)){
	        GivePlayerMoney(playerid, quantidade);
	        udb_setBankMoney(PlayerName(playerid), udb_getBankMoney(PlayerName(playerid)) - quantidade);
			format(string, sizeof(string), "Você retirou R$%d do banco. seu saldo atual é de R$%d", quantidade, udb_getBankMoney(PlayerName(playerid)));
			SendClientMessage(playerid, COR_AMARELO, string);
			TogglePlayerControllable(playerid,0);
			SetTimerEx("sacar",11000,false,"d",playerid);
			ApplyAnimation(playerid,"PED","ATM",4.1,0,1,1,1,1);
			return 1;
		}
		else{
			SendClientMessage(playerid, COR_AMARELO, "Você precisa estar em um banco para usar esse comando.");
			return 1;
		}
	}

    if(strcmp(cmd, "/saldo", true) == 0) {
		new string[256];
        if(IsPlayerInCheckpoint(playerid)){
			format(string, sizeof(string), "%s, você tem %d na conta (seu id: %d)", PlayerName(playerid),udb_getBankMoney(PlayerName(playerid)), playerid);
			SendClientMessage(playerid, COR_VERDE, string);
			return 1;
		}
		else{
			SendClientMessage(playerid, COR_AMARELO, "Você precisa estar em um banco para usar esse comando.");
			return 1;
		}
	}

	if(strcmp(cmd, "/saldocel", true) == 0) {
		new string[256];
	    if(GetPlayerMoney(playerid) < 2){
            SendClientMessage(playerid, COR_AMARELO, "Você não tem dinheiro em mãos(Custo: R$2).");
			return 1;
		}
		else{
		    GivePlayerMoney(playerid, 0 - 2);
		    SendClientMessage(playerid, COR_AMARELO, "Nova mensagem de Bancos SA.");
			format(string, sizeof(string),"%s(id: %d), você tem %d em sua conta bancaria.", PlayerName(playerid),udb_getBankMoney(PlayerName(playerid)), playerid);
			SendClientMessage(playerid, COR_VERDE, string);
			return 1;
		}
	}
//------------------------------- SISTEMA DE VOTAÇOES ------------------------------//
    if(strcmp(cmd, "/votacaoon", true) == 0) {
   if(IsPlayerAdmin(playerid)){
       new tmp[256];
       new tmo[256];
       new plid1;
       new plid2;
       for(new i=0; i<MAX_PLAYERS; i++){
       tmp = strtok(cmdtext,idx);
       plid1 = strval(tmp);
       if(!strlen(tmp)){
       SendClientMessage(playerid, COR_BRANCO, "/votacaoon [id1] [id2]");
       return 1;
       }
       tmo = strtok(cmdtext,idx);
       plid2 = strval(tmo);
       if(!strlen(tmo)){
       SendClientMessage(playerid, COR_BRANCO, "/votacaoon [id1] [id2]");
       return 1;
       }
       if(IsPlayerConnected(i)){
       if(plid1 != plid2){
       if(IsPlayerConnected(plid1)){
       if(IsPlayerConnected(plid2) && PLAYERLIST_authed[playerid] == 1){
	   Votacoes[plid1] = 1;
	   Votacoes[plid2] = 1;
       temporadavotos[i] = 1;
       votosabertos[plid1] = 1;
       votosabertos[plid2] = 1;
       new msg[256];
       format(msg,sizeof(msg),"Votaçoes politicas abertas entre %s e %s.",PlayerName(plid1),PlayerName(plid2));
  	   SendClientMessageToAll(COR_BRANCO,msg);
  	   SetTimerEx("votacaoon",1500000,1,"dd",plid1,plid2);
       return 1;
       }
	   else{
	       SendClientMessage(playerid, COR_JUIZ, "Jogador 2 não conectado/logado");
	       return 1;
	       }
       }
       else{
	       SendClientMessage(playerid, COR_JUIZ, "Jogador 1 não conectado/logado");
	       return 1;
	       }
       }
       else{
           SendClientMessage(playerid, COR_JUIZ, "não da pra elegir 1 pessoa 2 vezes né");
	       return 1;
	       }
       }
	 }
   }
   return 1;
}

    if(strcmp(cmd,"/votar",true) == 0) {
		new tmp[256];
		new plid;
		tmp = strtok(cmdtext,idx);
		plid = strval(tmp);
		if(!strlen(tmp)){
		SendClientMessage(playerid, COR_BRANCO, "/votar [id]");
		return 1;
		}
		if(temporadavotos[playerid] != 1){
		SendClientMessage(playerid, COR_BRANCO, "não estamos na temporada de votos espere ate ela para votar");
		return 1;
		}
		if(votosabertos[plid] != 1){
		SendClientMessage(playerid, COR_BRANCO, "O jogador que você quer votar não está elegido para votaçoes por enquanto");
		return 1;
		}
		if(voto[playerid] == 1){
		SendClientMessage(playerid, COR_BRANCO, "Você ja votou agora basta esperar os resultados");
		return 1;
		}
		if(IsPlayerConnected(plid)){
		if(AreaBanco[playerid] == 1){
		Qtvotos[plid]++;
		voto[playerid] = 1;
		SendClientMessage(playerid, COR_ASSALTANTE, "Obrigado por colaborar os resultados dos votos sairão no jornal");
		return 1;
		}
    }
		else{
		SendClientMessage(playerid, COR_JUIZ, "Você tem que estar em um banco para votar");
    	return 1;
		}
    }
//------------------------------- DOCUMENTOS -------------------------------------//
	if(strcmp(cmd, "/docs", true) == 0) {
		new string[256];
	    new tmp[256];
	    new plid;
	    new hab[5];
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COR_VERMELHO, "Documentos mostrados.");
			return 1;
		}
        plid = strval(tmp);
		if(IsPlayerConnected(plid)){
		    hab[2] = udb_getHabaerea(PlayerName(playerid));
		    hab[0] = udb_gethabterre(PlayerName(playerid));
		    hab[1] = udb_getHabnauti(PlayerName(playerid));
			format(string, sizeof(string), "Identidade de : %s", PlayerName(playerid));
			SendClientMessage(playerid, COR_COP_ELITE, string);
			format(string, sizeof(string), "Skin : %d", udb_getSkin(PlayerName(playerid)));
			SendClientMessage(playerid, COR_LARANJA, string);
			if(hab[0] == 0){
			    SendClientMessage(playerid, COR_BRANCO, "Habilitação de Carros e Motos: NÂO");
			}
			if(hab[0] == 1){
			    SendClientMessage(playerid, COR_COP_ELITE, "Habilitação de Carros e Motos: SIM");
			}
			if(hab[1] == 0){
			    SendClientMessage(playerid, COR_BRANCO, "Habilitação Náutica: NÂO");
			}
			if(hab[1] == 1){
			    SendClientMessage(playerid, COR_COP_ELITE, "Habilitação Náutica: SIM");
			}
			if(hab[2] == 0){
			    SendClientMessage(playerid, COR_BRANCO, "Habilitação Aérea: NÂO");
			}
			if(hab[2] == 1){
			    SendClientMessage(playerid, COR_COP_ELITE, "Habilitação Aérea: SIM");
			}
			format(string, sizeof(string), "Documentos mostrados para %s.", PlayerName(plid));
			SendClientMessage(playerid, COR_COP_ELITE, string);
			return 1;
		}
		else{
		    SendClientMessage(playerid, COR_VERMELHO, "Jogador não conectado/logado.");
		}
		return 1;
	}
	
//----------------------------- COMANDOS DE INSTRUTOR -----------------------------//
	if(strcmp(cmd, "/habaerea", true) == 0) {
	    if(Profissao[playerid] == INSTRUTOR_DE_DIRECAO || IsPlayerAdmin(playerid)){
		    new tmp[256];
		    new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/habaerea [id].");
				return 1;
			}
	        plid = strval(tmp);
	        new hab;
            hab = udb_getHabaerea(PlayerName(plid));
		    if(hab == 0){
			    if(IsPlayerConnected(plid)){
			        udb_setHabaerea(PlayerName(plid), 1);
				    SendClientMessage(playerid, COR_VERDE, "Habilitação de direção habilitação aéria concedida.");
				    SendClientMessage(plid, COR_VERDE, "Agora você tem carteira de habilitação aéria, pode dirigir: helicopteros e aviões.");
				    printf("O Jogador %s(id: %d) deu carteira de habilitaçao aerea a %s(id: %d).", PlayerName(playerid),playerid,PlayerName(plid),plid);
				    GivePlayerMoney(plid, -1200);
				    udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
					return 1;
				} else {
				    SendClientMessage(playerid, COR_VERMELHO, "ID Invalido");
				    return 1;
				}
			} else {
				SendClientMessage(playerid, COR_VERMELHO, "O jogador ja possue habilitação aerea");
				return 1;
			}
		}
        if(Profissao[playerid] != INSTRUTOR_DE_DIRECAO){
            SendClientMessage(playerid, COR_VERMELHO, "Você não é Intrutor de Direção.");
			return 1;
		}
	}


	if(strcmp(cmd, "/habterrestre", true) == 0) {
	    if(Profissao[playerid] == INSTRUTOR_DE_DIRECAO || IsPlayerAdmin(playerid)){
			new tmp[256];
		    new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/habterrestre [id].");
				return 1;
			}
    	    plid = strval(tmp);
			if(IsPlayerConnected(plid)){
			    new hab;
                hab = udb_gethabterre(PlayerName(plid));
		        if(hab == 0){
			    udb_setHabterre(PlayerName(plid), 1);
			    SendClientMessage(playerid, COR_VERDE, "Habilitação de direção terrestre concedida.");
			    SendClientMessage(plid, COR_VERDE, "Agora você tem carteira de habilitação terrestre, pode dirigir: carros, motos, caminhoes e onibus.");
			    printf("O Jogador %s(id: %d) deu carteira de habilitaçao terrestre a %s(id: %d).", PlayerName(playerid),playerid,PlayerName(plid),plid);
			    GivePlayerMoney(plid, -500);
			    udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
				return 1;
			    }
			    else{
					SendClientMessage(playerid, COR_VERMELHO, "O jogador ja possue habilitação terrestre");
					return 1;
					}
			}
			else{
			    SendClientMessage(playerid, COR_VERMELHO, "ID inválido");
				return 1;
			}
		}
        if(Profissao[playerid] != INSTRUTOR_DE_DIRECAO){
            SendClientMessage(playerid, COR_VERMELHO, "Você não é Intrutor de Direção.");
			return 1;
		}
	}

	if(strcmp(cmd, "/habnautica", true) == 0) {
		if(Profissao[playerid] == INSTRUTOR_DE_DIRECAO || IsPlayerAdmin(playerid)){
			new tmp[256];
			new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
			SendClientMessage(playerid, COR_VERMELHO, "/habnautica [id].");
			return 1;
			}
    	    plid = strval(tmp);
			if(IsPlayerConnected(plid)){
                new hab;
                hab = udb_getHabnauti(PlayerName(plid));
		        if(hab == 0){
			    udb_setHabnauti(PlayerName(plid), 1);
			    SendClientMessage(playerid, COR_VERDE, "Habilitação de direção náutica concedida.");
			    SendClientMessage(plid, COR_VERDE, "Agora você tem carteira de habilitação nautica, pode dirigir: barcos, navios.");
			    printf("O Jogador %s(id: %d) deu carteira de habilitaçao nautica a %s(id: %d).", PlayerName(playerid),playerid,PlayerName(plid),plid);
			    GivePlayerMoney(plid, -800);
			    udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
				return 1;
			    }
                else{
					SendClientMessage(playerid, COR_VERMELHO, "O jogador ja possue habilitação nautica");
					return 1;
					}
			}
			else{
			    SendClientMessage(playerid, COR_VERMELHO, "ID inválido");
				return 1;
			}
		}
        if(Profissao[playerid] != INSTRUTOR_DE_DIRECAO){
            SendClientMessage(playerid, COR_VERMELHO, "Você não tem level o suficiente.");
			return 1;
		}
	}

//--------------------------- COMANDOS DE MOTORISTA --------------------------------//
    if(strcmp(cmd, "/revisarlimo", true) == 0) {
	   if(Profissao[playerid] == MOTORISTA_PARTICULAR){
          new modelo = GetVehicleModel(GetPlayerVehicleID(playerid));
		  if(modelo == VEH_LIMOSINE){
		  if(IsPlayerInAnyVehicle(playerid)){
		  if(limorevisada[GetPlayerVehicleID(playerid)] == 0){
		  DisablePlayerCheckpoint(playerid);
		  SetPlayerCheckpoint(playerid, -1923.7761,302.5551,41.0469, 3.0);
		  gPlayerCheckpointStatus[playerid] = CHECKPOINT_REVISAO;
		  SendClientMessage(playerid, COR_BRANCO, "O Circuito para revisar a limosine começou.");
		  SendClientMessage(playerid, COR_BRANCO, "Vá até a oficina para revisar a saúde do carro.");
		  return 1;
		  }
		  else{
			  SendClientMessage(playerid, COR_VERMELHO, "Esta limosine já foi revisada.");
			  return 1;
			  }
		  }
		  else{
			  SendClientMessage(playerid, COR_VERMELHO, "Você não está em um veiculo.");
			  return 1;
			  }
		  }
		  else{
			  SendClientMessage(playerid, COR_VERMELHO, "Você tem que estar em uma limosine.");
			  return 1;
			  }
		  }
		  else{
			  SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão.");
			  return 1;
			  }
    }
	if(strcmp(cmd, "/lavarlimo", true) == 0) {
		if(Profissao[playerid] == MOTORISTA_PARTICULAR){
			new tmp[256];
			new car;
			tmp = strtok(cmdtext,idx);
			car = GetPlayerVehicleID(playerid);
			new modelo = GetVehicleModel(GetPlayerVehicleID(playerid));
			if(IsPlayerInVehicle(playerid,car)){
			if(AreaLimosine[playerid] == 1){
				if(modelo == VEH_LIMOSINE){
					GivePlayerMoney(playerid,100);
       				SendClientMessage(playerid, COR_MOTORISTA, "Limosine lavada! Você recebeu R$100 pelo trabalho");
       				lavagem[car] = 1;
       				udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
       				return 1;
       			}
       			else{
	  		 		SendClientMessage(playerid, COR_VERMELHO, "Você não está numa limosine");
			   		return 1;
   				}
	   		}
	   		else{
			   	SendClientMessage(playerid, COR_VERMELHO, "Você não está na companhia de limosine");
	   			return 1;
	   	    	}
   	  	    }
   		    else{
		     	 SendClientMessage(playerid, COR_VERMELHO, "Você não está em um veiculo.");
 		    	 return 1;
	   	    	 }
   		}
		else{
	 		SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão");
  			return 1;
  		}
    }
    if(strcmp(cmd, "/alugarlimo", true) == 0) {
	  if(Profissao[playerid] == MOTORISTA_PARTICULAR || IsPlayerAdmin(playerid)){
	  new tmp[256];
	  new car;
	  tmp = strtok(cmdtext,idx);
	  devolucao[playerid] ++;
	  if(AreaLimosine[playerid] == 1){
	  udb_setBankMoney(PlayerName(playerid),udb_getBankMoney(PlayerName(playerid)) - 400);
      SendClientMessage(playerid, COR_MOTORISTA, "Limosine alugada por R$400 o dinheiro foi retirado do banco, não esqueça de devolver a Limosine");
      car = CreateVehicle(VEH_LIMOSINE,-1974.1918,724.8635,45.0975,266.6841,0,0,0);
      SetTimerEx("alugarlimo",600000,1,"dd",car,playerid);
      return 1;
      }
	  else{
	      SendClientMessage(playerid, COR_VERMELHO, "Você não está na companhia de limosines");
	      return 1;
	      }
      }
      else{
		  SendClientMessage(playerid, COR_VERMELHO, "Você não é motorista");
		  return 1;
		  }
	}
	if(strcmp(cmd, "/devolverlimo", true) == 0) {
	   if(Profissao[playerid] == MOTORISTA_PARTICULAR){
	   new tmp[256];
	   new car;
	   new modelo = GetVehicleModel(GetPlayerVehicleID(playerid));
	   if(modelo == VEH_LIMOSINE){
	   tmp = strtok(cmdtext,idx);
	   car = GetPlayerVehicleID(playerid);
	   if(AreaLimosine[playerid] == 1){
	   if(IsPlayerInVehicle(playerid,car)){
	   if(lavagem[car] == 0){
       devolucao[playerid] --;
	   DestroyVehicle(car);
	   SendClientMessage(playerid, COR_BRANCO, "Limosine Devolvida com sucesso");
	   return 1;
	   }
	   else{
           SendClientMessage(playerid, COR_BRANCO, "Limosine Devolvida com sucesso");
           SendClientMessage(playerid, COR_MOTORISTA, "Obrigado por lavar nossas limosines você recebeu $150 pelo bom trabalho.");
           devolucao[playerid] --;
	       GivePlayerMoney(playerid,150);
	       DestroyVehicle(car);
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COR_VERMELHO, "Você não está em um carro");
		   return 1;
		   }
       }
       else{
		  SendClientMessage(playerid, COR_VERMELHO, "Você não está na companhia de limosines");
		  return 1;
		  }
	   }
	   else{
		   SendClientMessage(playerid, COR_VERMELHO, "Você tem que estar numa limosine");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COR_VERMELHO, "Você não é motorista particular");
		   return 1;
		   }
    }
//---------------------------------- COMANDOS DE CELULAR ----------------------------//
    if(strcmp(cmd,"/buycell",true) == 0) {
		  new cell;
		  cell = udb_getcell(PlayerName(playerid));
		  if(GetPlayerMoney(playerid) >= 500){
		  if(cell == 0){
		  if(AreaOperadora[playerid] == 1 || IsPlayerAdmin(playerid)){
		  GivePlayerMoney(playerid,0-500);
		  udb_setcell(PlayerName(playerid),1);
		  SendClientMessage(playerid, COR_BRANCO, "Agora você possue um celular!");
		  SendClientMessage(playerid, COR_BRANCO, "Digite /calculadorainfo para ver as opções da calculadora dele");
		  return 1;
		  }
		  else{
			  SendClientMessage(playerid, COR_VERMELHO, "Você não está na operadora");
			  return 1;
			  }
		  }
		  else{
			  SendClientMessage(playerid, COR_VERMELHO, "Você ja possue celular");
			  return 1;
			  }
		  }
		  else{
			  SendClientMessage(playerid, COR_VERMELHO, "Você não possue $500 para comprar um celular.");
			  return 1;
			  }
		  }
    if(strcmp(cmd,"/meuscreditos",true) == 0) {
       new cell;
	   cell = udb_getcell(PlayerName(playerid));
	   if(cell == 1){
	   new string[256];
	   format(string,sizeof(string), "Você possue %d créditos em seu celular",udb_getnumcell(PlayerName(playerid)));
	   SendClientMessage(playerid, COR_BRANCO,string);
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, COR_VERMELHO, "Você não possue celular");
		   return 1;
		   }
    }
    if(strcmp(cmd,"/buycreditos",true) == 0) {
	   new tmp[256];
	   new creditos;
	   tmp = strtok(cmdtext,idx);
	   creditos = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COR_VERMELHO, "/buycreditos [quantia de creditos]");
	   return 1;
	   }
	   new celular;
	   celular = udb_getcell(PlayerName(playerid));
	   new cell;
	   cell = udb_getnumcell(PlayerName(playerid));
	   if(cell + creditos <= 150){
	   if(AreaOperadora[playerid] == 1 || IsPlayerAdmin(playerid)){
	   if(GetPlayerMoney(playerid) > creditos*2){
	   if(celular == 1){
	   udb_setnumcell(PlayerName(playerid),udb_getnumcell(PlayerName(playerid)) + creditos);
	   GivePlayerMoney(playerid,0 - creditos*2);
	   new string[256];
	   format(string,sizeof(string),"Você comprou %d créditos e pagou $%d",creditos,creditos*2);
	   SendClientMessage(playerid, COR_BRANCO,string);
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, COR_VERMELHO, "Você não possue celular");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COR_VERMELHO, "Você não possue dinheiro para comprar");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COR_VERMELHO, "Você não está na operadora");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COR_VERMELHO, "O Limite de créditos é 150 digite /meuscreditos para ver quanto você tem para ver quanto pode comprar");
		   return 1;
		   }
    }
    if(strcmp(cmd,"/dividir",true) == 0) {
		new tmp[256];
		new tmp2[256];
		new num;
		new num2;
		new resultado;
		new celular;
	    celular = udb_getcell(PlayerName(playerid));
		tmp = strtok(cmdtext,idx);
		num = strval(tmp);
		if(!strlen(tmp)){
		SendClientMessage(playerid, COR_VERMELHO, "/dividir [numero 1] [numero 2]");
		return 1;
		}
		tmp2 = strtok(cmdtext,idx);
		num2 = strval(tmp2);
		if(!strlen(tmp)){
		SendClientMessage(playerid, COR_VERMELHO, "/dividir [numero 1] [numero 2]");
		return 1;
		}
		resultado = num/num2;
		if(celular == 1){
		new string[256];
		format(string,sizeof(string),"Você dividiu %d por %d e o resultado foi: %d",num,num2,resultado);
		SendClientMessage(playerid, COR_BRANCO, string);
		return 1;
		}
		else{
			SendClientMessage(playerid, COR_VERMELHO, "Você não possue celular");
			return 1;
			}
	}
	if(strcmp(cmd,"/multiplicar",true) == 0) {
		new tmp[256];
		new tmp2[256];
		new num;
		new num2;
		new resultado;
		new celular;
	    celular = udb_getcell(PlayerName(playerid));
		tmp = strtok(cmdtext,idx);
		num = strval(tmp);
		if(!strlen(tmp)){
		SendClientMessage(playerid, COR_VERMELHO, "/multiplicar [numero 1] [numero 2]");
		return 1;
		}
		tmp2 = strtok(cmdtext,idx);
		num2 = strval(tmp2);
		if(!strlen(tmp)){
		SendClientMessage(playerid, COR_VERMELHO, "/multiplicar [numero 1] [numero 2]");
		return 1;
		}
		resultado = num*num2;
		if(celular == 1){
		new string[256];
		format(string,sizeof(string),"Você multiplicou %d por %d e o resultado foi: %d",num,num2,resultado);
		SendClientMessage(playerid, COR_BRANCO, string);
		return 1;
		}
		else{
			SendClientMessage(playerid, COR_VERMELHO, "Você não possue celular");
			return 1;
			}
	}
	if(strcmp(cmd,"/somar",true) == 0) {
		new tmp[256];
		new tmp2[256];
		new num;
		new num2;
		new resultado;
		new celular;
	    celular = udb_getcell(PlayerName(playerid));
		tmp = strtok(cmdtext,idx);
		num = strval(tmp);
		if(!strlen(tmp)){
		SendClientMessage(playerid, COR_VERMELHO, "/somar [numero 1] [numero 2]");
		return 1;
		}
		tmp2 = strtok(cmdtext,idx);
		num2 = strval(tmp2);
		if(!strlen(tmp)){
		SendClientMessage(playerid, COR_VERMELHO, "/somar [numero 1] [numero 2]");
		return 1;
		}
		resultado = num+num2;
		if(celular == 1){
		new string[256];
		format(string,sizeof(string),"Você somou %d com %d e o resultado foi: %d",num,num2,resultado);
		SendClientMessage(playerid, COR_BRANCO, string);
		return 1;
		}
		else{
			SendClientMessage(playerid, COR_VERMELHO, "Você não possue celular");
			return 1;
			}
	}
	if(strcmp(cmd,"/subtrair",true) == 0) {
		new tmp[256];
		new tmp2[256];
		new num;
		new num2;
		new resultado;
		new celular;
	    celular = udb_getcell(PlayerName(playerid));
		tmp = strtok(cmdtext,idx);
		num = strval(tmp);
		if(!strlen(tmp)){
		SendClientMessage(playerid, COR_VERMELHO, "/subtrair [numero 1] [numero 2]");
		return 1;
		}
		tmp2 = strtok(cmdtext,idx);
		num2 = strval(tmp2);
		if(!strlen(tmp)){
		SendClientMessage(playerid, COR_VERMELHO, "/subtrair [numero 1] [numero 2]");
		return 1;
		}
		resultado = num-num2;
		if(celular == 1){
		new string[256];
		format(string,sizeof(string),"Você subtraiu %d por %d e o resultado foi: %d",num,num2,resultado);
		SendClientMessage(playerid, COR_BRANCO, string);
		return 1;
		}
		else{
			SendClientMessage(playerid, COR_VERMELHO, "Você não possue celular");
			return 1;
			}
	}
//---------------------------------- COMANDOS DE JUIZ -------------------------------//
    if(strcmp(cmd,"/culpado",true) == 0) {
	    if(Profissao[playerid] == JUIZ || IsPlayerAdmin(playerid)){
	    	new tmp[256];
	    	new plid;
	    	new msg[256];
	    	new File:temp;
	    	tmp = strtok(cmdtext,idx);
	    	plid = strval(tmp);
	    	if(!strlen(tmp)){
	    		SendClientMessage(playerid, COR_JUIZ, "/culpado [id]");
	    		return 1;
	    	}
	    	if(IsPlayerConnected(plid)){
			if(declaracoesabertas[plid] == 1){
	    		format(msg,sizeof(msg),"O Juiz %s declarou %s Culpado.",PlayerName(playerid),PlayerName(plid));
	    		SendClientMessageToAll(COR_JUIZ, msg);
	    		temp = fopen("reloadrpg.culpados", io_append);
   			    fwrite(temp, msg);
      		    fclose(temp);
	    		return 1;
	    	}
	    	else{
				SendClientMessage(playerid, COR_VERMELHO, "Esse jogador não está aberto para declarações.");
				return 1;
				}
			}
            else{
				SendClientMessage(playerid, COR_VERMELHO, "Jogador não conectado/logado.");
				return 1;
				}
			}
			else{
				SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão.");
				return 1;
				}
    }
    if(strcmp(cmd,"/inocente",true) == 0) {
	    if(Profissao[playerid] == JUIZ || IsPlayerAdmin(playerid)){
	    	new tmp[256];
	    	new plid;
	    	new msg[256];
	    	new File:temp;
	    	tmp = strtok(cmdtext,idx);
	    	plid = strval(tmp);
	    	if(!strlen(tmp)){
	    		SendClientMessage(playerid, COR_JUIZ, "/inocente [id]");
	    		return 1;
	    	}
	    	if(IsPlayerConnected(plid)){
	    	if(declaracoesabertas[plid] == 1){
	    		format(msg,sizeof(msg),"O Juiz %s declarou %s Inocente.",PlayerName(playerid),PlayerName(plid));
	    		SendClientMessageToAll(COR_JUIZ, msg);
	    		temp = fopen("reloadrpg.inocentes", io_append);
   			    fwrite(temp, msg);
      		    fclose(temp);
	    		return 1;
	    	}
	    	else{
				SendClientMessage(playerid, COR_VERMELHO, "Esse jogador não está aberto para declarações.");
				return 1;
				}
			}
            else{
				SendClientMessage(playerid, COR_VERMELHO, "Jogador não conectado/logado.");
				return 1;
				}
			}
			else{
				SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão.");
				return 1;
				}
    }
    
//------------------------ COMANDOS DE CONFISCADOR/COP RODOVIARIO -----------------//
	if(strcmp(cmd, "/radar", true) == 0) {
		if(Profissao[playerid] == CONFISCADOR || IsPlayerAdmin(playerid)){
			TogglePlayerControllable(playerid,false);
			ShowMenuForPlayer(radares,playerid);
			return 1;
		}
	}
	if(strcmp(cmd, "/cacarterrestre", true) == 0) {
	    if(Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == CONFISCADOR || IsPlayerAdmin(playerid)){
			new tmp[256];
		    new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERDE, "Habilitação de direção terrestre removida.");
				return 1;
			}
    	    plid = strval(tmp);
			if(IsPlayerConnected(plid)){
			    udb_setHabterre(PlayerName(plid), 0);
			    SendClientMessage(playerid, COR_VERDE, "Habilitação de direção terrestre removida.");
			    SendClientMessage(plid, COR_VERDE, "Sua Carteira de habilitação terrestre foi caçada, agora não pode dirigir mais nem um veículo terrestre.");
			    printf("O Jogador %s(id: %d) deu carteira de habilitaçao terrestre a %s(id: %d).", PlayerName(playerid),playerid,PlayerName(plid),plid);
			    udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
				return 1;
			}
			else{
			    SendClientMessage(playerid, COR_VERMELHO, "ID inválido");
				return 1;
			}
		}
        if(Profissao[playerid] != COP_RODOVIARIO){
            SendClientMessage(playerid, COR_VERMELHO, "Você não é Policial, Conficador.");
			return 1;
		}
	}

	if(strcmp(cmd, "/cacaraerea", true) == 0) {
	    if(Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == CONFISCADOR || IsPlayerAdmin(playerid)){
			new tmp[256];
		    new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERDE, "Habilitação de direção aerea removida.");
				return 1;
			}
    	    plid = strval(tmp);
			if(IsPlayerConnected(plid)){
			    udb_setHabaerea(PlayerName(plid), 0);
			    SendClientMessage(playerid, COR_VERDE, "Habilitação de direção aérea removida.");
			    SendClientMessage(plid, COR_VERDE, "Sua Carteira de habilitação aérea foi caçada, agora não pode dirigir mais nem um veículo aério.");
			    printf("O Jogador %s(id: %d) deu carteira de habilitaçao terrestre a %s(id: %d).", PlayerName(playerid),playerid,PlayerName(plid),plid);
                udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
				return 1;
			}
			else{
			    SendClientMessage(playerid, COR_VERMELHO, "ID inválido");
				return 1;
			}
		}
        if(Profissao[playerid] != COP_RODOVIARIO){
            SendClientMessage(playerid, COR_VERMELHO, "Você não é Policial, Conficador.");
			return 1;
		}
	}

	if(strcmp(cmd, "/cacarnautica", true) == 0) {
	    if(Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == CONFISCADOR || IsPlayerAdmin(playerid)){
			new tmp[256];
		    new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERDE, "Habilitação de direção nautica removida.");
				return 1;
			}
    	    plid = strval(tmp);
			if(IsPlayerConnected(plid)){
			    udb_setHabnauti(PlayerName(plid), 0);
			    SendClientMessage(playerid, COR_VERDE, "Habilitação de direção nautica removida.");
			    SendClientMessage(plid, COR_VERDE, "Sua Carteira de habilitação nautica foi caçada, agora não pode dirigir mais nem um veículo nautico.");
			    printf("O Jogador %s(id: %d) deu carteira de habilitaçao terrestre a %s(id: %d).", PlayerName(playerid),playerid,PlayerName(plid),plid);
                udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
				return 1;
			}
			else{
			    SendClientMessage(playerid, COR_VERMELHO, "ID inválido");
				return 1;
			}
		}
        if(Profissao[playerid] != COP_RODOVIARIO){
            SendClientMessage(playerid, COR_VERMELHO, "Você não é Policial, Conficador.");
			return 1;
		}
	}

//-------------------------- COMANDOS DE COP ----------------------//
    
    if(strcmp(cmd, "/setcone", true) == 0) {
        if(Profissao[playerid] == COP_RODOVIARIO || IsPlayerAdmin(playerid)) {
            new Float:X, Float:Y, Float:Z;
            GetPlayerPos(playerid,X, Y, Z);
			SetTimerEx("SetCone",5000,0,"fff", X, Y, Z);
            SendClientMessage(playerid, COR_VERDE, "Você adicionou um cone neste local, dentro de 5 segundos ele aparecerá.");
			return 1;
		}
		else{
			SendClientMessage(playerid, COR_VERMELHO, "Você não é Policial Rodoviario");
            return 1;
		}
	}
	
	if(strcmp(cmd, "/multar", true) == 0) {
	    if(Profissao[playerid] == COP_CIVIL || Profissao[playerid] == XERIFE || Profissao[playerid] == RECEITA_FEDERAL || Profissao[playerid] == DELEGADO || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == IBAMA || Profissao[playerid] == COP_ELITE || IsPlayerAdmin(playerid)){
			new tmp[256];
	    	new plid;
	    	new quant;
	    	new string[256];
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/multar [id] [valor]");
				return 1;
			}
        	plid = strval(tmp);
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/multar [id] [valor]");
				return 1;
			}
        	quant = strval(tmp);
 			if(quant > 1000 || quant <= 0){
				SendClientMessage(playerid, COR_VERMELHO, "Você não está querendo multar de forma justa.");
				return 1;
			}
			if(IsPlayerConnected(plid)){
				format(string, sizeof(string), "Você recebeu uma multa de %d dada por %s. Descontade direto de sua conta bancaria.", quant, PlayerName(playerid));
				SendClientMessage(plid, COR_VERDE, string);
				SendClientMessage(playerid, COR_VERDE, "Multa dada.");
				printf("O Jogador %s(id: %d) deu uma multa para %s(id: %d) de R$%d.", PlayerName(playerid),playerid,PlayerName(plid),plid,quant);
				udb_setBankMoney(PlayerName(plid), udb_getBankMoney(PlayerName(plid)) - quant);
				udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
				return 1;
			}
			else{
			    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado!");
				return 1;
			}
		}
		if(Profissao[playerid] != COP_CIVIL || Profissao[playerid] != XERIFE || Profissao[playerid] != COP_RODOVIARIO || Profissao[playerid] != IBAMA || Profissao[playerid] != COP_ELITE){
			SendClientMessage(playerid, COR_VERMELHO, "Você não é policial.");
			return 1;
		}
		return 1;
	}
	
	if(strcmp(cmd, "/procurar", true)==0){
	    if(Profissao[playerid] == COP_CIVIL || Profissao[playerid] == XERIFE || Profissao[playerid] == EXERCITO || Profissao[playerid] == DELEGADO || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == COP_ELITE || IsPlayerAdmin(playerid)){
		    new tmp[256];
		    new string[256];
		    new msg[256];
		    new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_COP_ELITE, "SERVIDOR: Comando não encontrado.");
				return 1;
			}
	        plid = strval(tmp);
			if(IsPlayerConnected(plid) && PLAYERLIST_authed[playerid] == 1){
				Procurados[plid] = 1;
				format(msg, sizeof(msg), "%s agora está com %d niveis de procurados", PlayerName(plid),GetPlayerWantedLevel(plid)+1);
				SendClientMessageToAll(COR_COP_ELITE, msg);
				format(string, sizeof(string), "Você está sendo perseguido pela policia, Você foi colocado na lista por: %s", PlayerName(playerid));
				SendClientMessage(plid, COR_COP_ELITE, string);
				SetPlayerWantedLevel(plid,GetPlayerWantedLevel(plid)+1);
				return 1;
			}
			else{
	            SendClientMessage(playerid, COR_COP_ELITE, "SERVIDOR: Comando não encontrado.");
				return 1;
			}
		}
		if(Profissao[playerid] != COP_CIVIL || Profissao[playerid] != XERIFE || Profissao[playerid] != COP_RODOVIARIO || Profissao[playerid] != COP_ELITE || !IsPlayerAdmin(playerid)){
			SendClientMessage(playerid, COR_VERMELHO, "Você não é policial");
			return 1;
		}
	}
    if(strcmp(cmd, "/desprocurar", true)==0){
	    if(Profissao[playerid] == COP_CIVIL || Profissao[playerid] == XERIFE || Profissao[playerid] == EXERCITO || Profissao[playerid] == DELEGADO || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == COP_ELITE || Profissao[playerid] == EXERCITO || IsPlayerAdmin(playerid)){
		    new tmp[256];
		    new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_COP_ELITE, "SERVIDOR: Comando não encontrado.");
				return 1;
			}
	        plid = strval(tmp);
			if(IsPlayerConnected(plid) && PLAYERLIST_authed[playerid] == 1){
				Procurados[plid] = 0;
				SendClientMessage(playerid, COR_AZUL, "Excluido da lista com suscesso.");
				SendClientMessage(plid, COR_AZUL, "Você foi retirado da lista de procurados");
                SetPlayerWantedLevel(plid,0);
				return 1;
			}
			else{
	            SendClientMessage(playerid, COR_COP_ELITE, "SERVIDOR: Comando não encontrado.");
				return 1;
			}
		}
		if(Profissao[playerid] != COP_CIVIL || Profissao[playerid] != XERIFE || Profissao[playerid] != COP_RODOVIARIO || Profissao[playerid] != COP_ELITE || !IsPlayerAdmin(playerid)){
			SendClientMessage(playerid, COR_VERMELHO, "Você não é policial");
			return 1;
		}
	}
	
	if(strcmp(cmd, "/bafometro", true) == 0) {
	    if(Profissao[playerid] == COP_CIVIL || Profissao[playerid] == XERIFE || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == EXERCITO || Profissao[playerid] == COP_ELITE || IsPlayerAdmin(playerid)){
		    new tmp[256];
		    new string[256];
      		new plid;
			new distancia;
		    distancia = GetDistanceBetweenPlayers(playerid, plid);
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/bafometro [id]");
				return 1;
			}
	        plid = strval(tmp);
			if(IsPlayerConnected(plid) && PLAYERLIST_authed[playerid] == 1){
				if(distancia > 20){
			        SendClientMessage(playerid, COR_VERMELHO, "Você está muito longe, chegue mais perto!");
					return 1;
				}
				if(distancia <= 20){
					format(string, sizeof(string), "O bafômetro mostra: %s no sangue", Bebida[plid]);
					SendClientMessage(playerid, COR_AMARELO, string);
					return 1;
				}
			}
			else{
	            SendClientMessage(playerid, COR_VERMELHO, "Jogador não está conectado/logado");
				return 1;
			}
		}
		if(Profissao[playerid] != COP_CIVIL || Profissao[playerid] != XERIFE || Profissao[playerid] != COP_RODOVIARIO || Profissao[playerid] != COP_ELITE){
		    SendClientMessage(playerid, COR_VERMELHO, "Você não é policial");
			return 1;
		}
		return 1;
	}
	if(strcmp(cmdtext, "/desarmardinamite", true) == 0) {
       if(Profissao[playerid] == DELEGADO || Profissao[playerid] == XERIFE || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == COP_CIVIL || Profissao[playerid] == COP_ELITE || IsPlayerAdmin(playerid)){
	   new carro;
	   carro = GetPlayerVehicleID(playerid);
	   if(IsPlayerInVehicle(playerid,carro)){
	   if(DinamitePlantada[carro] == 1){
	   TogglePlayerControllable(playerid,0);
	   SendClientMessage(playerid, COR_BRANCO, "Aguarde você esta desarmando a bomba.");
	   SetTimerEx("Desarme",10000,false,"dd",playerid,carro);
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, COR_VERMELHO, "Não há nenhuma dinamite plantada nesse carro");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COR_VERMELHO, "Você não esta em um veiculo");
		   return 1;
		   }
   	   }
   	   else{
		   SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão");
		   return 1;
		   }
	}
	if(strcmp(cmd, "/reforco", true)==0){
	    if(Profissao[playerid] == DELEGADO || Profissao[playerid] == XERIFE || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == COP_CIVIL || IsPlayerAdmin(playerid)){
			new plid;
			new tmp[256];
			new string[256];
			strmid(tmp, cmdtext, 8, strlen(cmdtext));
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/reforco [id_do_procurado]");
				return 1;
			}
         	plid = strval(tmp);
			if(IsPlayerConnected(plid) && PLAYERLIST_authed[playerid] == 1){
			    SendClientMessage(playerid, COR_AMARELO, "Os policiais foram informados");
			    for(new i=0; i<MAX_PLAYERS; i++){
			        if(Profissao[i] == EXERCITO || Profissao[i] == XERIFE || Profissao[i] == COP_ELITE || Profissao[i] == COP_RODOVIARIO || Profissao[i] == COP_CIVIL){
						format(string, sizeof(string), "O Policial %s precisa de reforços contra %s", PlayerName(playerid),PlayerName(plid));
						SendClientMessage(i, COR_AMARELO, string);
						return 1;
					}
		        }
			}
			} else {
	  			SendClientMessage(playerid, COR_VERMELHO, "Jogador não conectado/logado!");
				return 1;
			}
		if(Profissao[playerid] != DELEGADO || Profissao[playerid] != XERIFE || Profissao[playerid] != COP_RODOVIARIO || Profissao[playerid] != COP_CIVIL){
			SendClientMessage(playerid, COR_VERMELHO, "Você não é Policial!");
			return 1;
		}
	}

 	if(strcmp(cmd, "/prender", true) == 0) {
	    if(Profissao[playerid] == COP_CIVIL  || Profissao[playerid] == JUSTICA_FEDERAL || Profissao[playerid] == XERIFE || Profissao[playerid] == RECEITA_FEDERAL || Profissao[playerid] == EXERCITO || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == DELEGADO || Profissao[playerid] == COP_ELITE || Profissao[playerid] == NARCOTICOS || IsPlayerAdmin(playerid)){
	    	new tmp[256];
	    	new plid;
	    	new distancia;
	    	new string[256];
	    	distancia = GetDistanceBetweenPlayers(playerid, plid);
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/prender [id]");
				return 1;
			}
        	plid = strval(tmp);
			if(IsPlayerConnected(plid) && PLAYERLIST_authed[plid] == 1){
			    if(distancia > 10){
			        SendClientMessage(playerid, COR_VERMELHO, "Chegue mais perto!");
					return 1;
				}
				if(distancia <= 10){
				    RemovePlayerFromVehicle(plid);
				    Presos[plid] = 1;
				    udb_setPrisao(PlayerName(plid), 1);
				    SetTimerEx("Prisao", 2000, 0, "%d", plid);
					RemovePlayerFromVehicle(plid);
					LogarPlayer(plid);
					format(string, sizeof(string), "Você foi preso por: %s", PlayerName(playerid));
					SendClientMessage(plid, COR_SEGURANÇA, string);
				    SendClientMessage(playerid, COR_VERDE, "Prisão concluida");
				    SetPlayerSpecialAction(plid,SPECIAL_ACTION_HANDSUP);
				    printf("O Jogador %s(id: %d) prendeu %s(id: %d).", PlayerName(playerid),playerid,PlayerName(plid),plid);
                    udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
					return 1;
				}
			}
			else{
    	        SendClientMessage(playerid, COR_VERMELHO, "Jogador não está conectado/logado");
				return 1;
			}
		}
		if(Profissao[playerid] != COP_CIVIL || Profissao[playerid] != XERIFE || Profissao[playerid] != RECEITA_FEDERAL || Profissao[playerid] != COP_RODOVIARIO || Profissao[playerid] != DELEGADO || Profissao[playerid] != COP_ELITE){
			SendClientMessage(playerid, COR_VERMELHO, "Você não é policial/Delegado");
			return 1;
		}
	}

	if(strcmp(cmd, "/soltar", true) == 0) {
	    if(Profissao[playerid] == JUIZ || Profissao[playerid] == JUSTICA_FEDERAL || Profissao[playerid] == XERIFE || Profissao[playerid] == EXERCITO || Profissao[playerid] == RECEITA_FEDERAL || Profissao[playerid] == DELEGADO || IsPlayerAdmin(playerid)){
		    new tmp[256];
		    new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/soltar [id]");
				return 1;
			}
	        plid = strval(tmp);
			if(IsPlayerConnected(plid) && PLAYERLIST_authed[playerid] == 1){
				if(Presos[plid] == 0){
				    SendClientMessage(playerid,COR_VERMELHO,"O jogador não está preso!");
					return 1;
				} else {
				    udb_setPrisao(PlayerName(playerid), 0);
				    Presos[plid] = 0;
				    SetSpawnInfo(plid,0,udb_getSkin(PlayerName(plid)),-1605.3073,718.3339,11.9387,0,0,0,0,0,0,0);
				    SetPlayerInterior(plid,0);
				    SpawnPlayer(plid);
				    SetPlayerWantedLevel(plid, 0);
				    SendClientMessage(plid,COR_VERDE,"Sua sentença acabou, não cometa mais crimes, ou será preso novamente.");
				    format(tmp,sizeof(tmp),"Você foi solto por %s",PlayerName(playerid));
				    SendClientMessage(plid,COR_VERDE,tmp);
				    SendClientMessage(playerid,COR_VERDE,"Libertado");
				    udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
					return 1;
				}
			}
			else{
	            SendClientMessage(playerid, COR_VERMELHO, "Jogador não está conectado/logado");
				return 1;
			}
		}
		if(Profissao[playerid] != JUIZ || Profissao[playerid] != XERIFE || Profissao[playerid] == RECEITA_FEDERAL || Profissao[playerid] != DELEGADO){
		    SendClientMessage(playerid, COR_VERMELHO, "Você não é Policial.");
			return 1;
		}
	}
	
//------------------------------COMANDOS NARCOTICOS ------------------------------//
	if(strcmp(cmd,"/examead",true) == 0) {
	  if(Profissao[playerid] == NARCOTICOS || IsPlayerAdmin(playerid)){
	   new tmp[256];
	   new plid;
	   new drogas[4];
	   tmp = strtok(cmdtext,idx);
	   plid = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COR_VERMELHO, "/examead [id]");
	   return 1;
	   }
	   if(IsPlayerConnected(plid)){
	   drogas[0] = Maconha[plid];
	   drogas[1] = Cocaina[plid];
	   drogas[2] = Heroina[plid];
	   drogas[3] = Crack[plid];
	   new msg[256];
	   new string[256];
	   new string2[256];
	   new string3[256];
	   new string4[256];
	   format(msg,sizeof(msg),"Exame anti-drogas de %s",PlayerName(plid));
	   SendClientMessage(playerid, COR_JUIZ,msg);
	   format(string,sizeof(string),"Maconha: %d dose(s)",drogas[0]);
	   SendClientMessage(playerid, COR_BRANCO, string);
	   format(string2,sizeof(string2),"Cocaína: %d dose(s)",drogas[1]);
	   SendClientMessage(playerid, COR_BRANCO, string2);
	   format(string3,sizeof(string3),"Heroína: %d dose(s)",drogas[2]);
	   SendClientMessage(playerid, COR_BRANCO, string3);
	   format(string4,sizeof(string4),"Crack: %d dose(s)",drogas[3]);
	   SendClientMessage(playerid, COR_BRANCO, string4);
	   SendClientMessage(playerid, COR_JUIZ, "Exame anti-drogas concluído.");
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, COR_VERMELHO, "Jogador não conectado/logado.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão.");
		   return 1;
		   }
	}
	if(strcmp(cmd, "/revisardrogas", true) == 0) {
	  if(Profissao[playerid] == NARCOTICOS || IsPlayerAdmin(playerid)){
		if(IsPlayerInAnyVehicle(playerid)){
		if(drogasplantadas[GetPlayerVehicleID(playerid)] == 0){
		SendClientMessage(playerid, COR_BRANCO, "Este carro está livre! Não possue nenhuma droga plantada nele");
		return 1;
		}
		else if(drogasplantadas[GetPlayerVehicleID(playerid)] == 1){
        SendClientMessage(playerid, COR_BRANCO, "Esse carro possue drogas plantadas é melhor você ir atras do dono");
        udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
        return 1;
        }
	}
		else{
			SendClientMessage(playerid, COR_VERMELHO, "Você não está em um veiculo");
			return 1;
			}
		}
		else{
			SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão");
			return 1;
			}
	}
	if(strcmp(cmd, "/verdrogas", true) == 0) {
	    if(Profissao[playerid] == NARCOTICOS || IsPlayerAdmin(playerid)){
	        new tmp[256];
	        new msg[256];
	        new plid;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)) {
	            SendClientMessage(playerid,COR_VERMELHO,"/verdrogas [id]");
				return 1;
			}
			plid = strval(tmp);
			if(IsPlayerConnected(plid) && PLAYERLIST_authed[playerid] == 1){
			    if(GetDistanceBetweenPlayers(playerid,plid) > 20){
			        SendClientMessage(playerid,COR_VERMELHO,"Você está muito longe, chegue mais perto!");
					return 1;
				} else {
				    SendClientMessage(playerid,COR_AMARELO,"Drogas:");
				    format(msg, sizeof(msg), "Maconha : %d cigarro(s)",QtMaconha[plid]);
				    SendClientMessage(playerid,COR_AMARELO,msg);
				    format(msg, sizeof(msg), "Cocaína : %d grama(s)",QtCocaina[plid]);
				    SendClientMessage(playerid,COR_AMARELO,msg);
					return 1;
				}
			} else {
			    SendClientMessage(playerid,COR_VERMELHO,"Jogador não conectado/logado");
				return 1;
			}
		} else {
			SendClientMessage(playerid,COR_VERMELHO,"Você não tem permissão para isso!");
			return 1;
		}
	}

//----------------------------- COMANDOS DAS PROFISSÕES ----------------------------//
	if (strcmp(cmd, "/pt", true)==0){
		new tmp[256];
		new string[256];
	    strmid(tmp, cmdtext, 3, strlen(cmdtext));
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COR_VERMELHO, "/pt [texto]");
			return 1;
		}
		else{
		    for(new i=0; i<MAX_PLAYERS; i++){
		        if(Profissao[i] == Profissao[playerid]){
					format(string, sizeof(string), "%s: %s", PlayerName(playerid), tmp);
					SendClientMessage(i, GetPlayerColor(playerid), string);
					SendClientMessage(playerid, GetPlayerColor(playerid), string);
					return 1;
				}
			}
			return 1;
		}
	}

	if (strcmp(cmdtext, "/profissao", true)==0){
	    if(Profissao[playerid] == ENTREGADOR_PIZZA) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - ENTREGADOR DE PIZZA");
			SendClientMessage(playerid, COR_ENTREGADOR_PIZZA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_ENTREGADOR_PIZZA, "/sellpizza [id] [sabor] : Vende uma pizza a um jogador.");
			SendClientMessage(playerid, COR_ENTREGADOR_PIZZA, "/sellbebida [id] [bebida] : Vende uma bebida a um jogador.");
			SendClientMessage(playerid, COR_BRANCO, "Seu objetivo agora é vender pizzas pela cidade! Digite /pizzas para ver os sabores.");
			SendClientMessage(playerid, COR_BRANCO, "Toda vez que alguém quizer pizza fará /pizza tamem tente vender bebidas! Digite /bebidas para ver.");
			SendClientMessage(playerid, COR_BRANCO, "Bom Trabalho.");
		}
		else if(Profissao[playerid] == BARMAN) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - BARMAN");
			SendClientMessage(playerid, COR_BARMAN, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_BARMAN, "/sellcerveja [id] [teor] : Vende uma bebida alcoolica e adiciona o teor de alcool no sangue da pessoa");
			SendClientMessage(playerid, COR_BARMAN, "/sellbebida [id] [bebida] : Vende uma bebida a um jogador.");
			SendClientMessage(playerid, COR_BRANCO, "Agora você é um barman. Tente vender cervejas por um preço mais barato que os bares da cidade.");
			SendClientMessage(playerid, COR_BRANCO, "Também venda bebidas! Digite /bebidas para ver as bebidas.");
			SendClientMessage(playerid, COR_BRANCO, "Bom Trabalho.");
		}
		else if(Profissao[playerid] == VENDEDOR_DE_BOMBAS) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - VENDEDOR DE BOMBAS");
			SendClientMessage(playerid, COR_VENDEDOR_DE_BOMBAS, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_VENDEDOR_DE_BOMBAS, "/sellbombagas [id] :  Vende uma bomba de gas para alguém.");
			SendClientMessage(playerid, COR_VENDEDOR_DE_BOMBAS, "/sellgranada [id] : Vende uma granada para alguém.");
			SendClientMessage(playerid, COR_VENDEDOR_DE_BOMBAS, "/sellmolotov [id] : Vende um molotov a um jogador.");
			SendClientMessage(playerid, COR_VENDEDOR_DE_BOMBAS, "/selldinamite [id] : Vende uma dinamite a um jogador.");
			SendClientMessage(playerid, COR_BRANCO, "Agora você é um vendedor de bombas. Venda suas bombas pela cidade e aumente o crime cada vez mais.");
			SendClientMessage(playerid, COR_BRANCO, "Quando muita gente não ter paciencia de tanta guerra iram comprar uma bomba com você para se defender.");
			SendClientMessage(playerid, COR_BRANCO, "Ou até mesmo para explodir alguém. Bom Trabalho.");
		}
		else if(Profissao[playerid] == PROSTITUTA) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - PROSTITUTA");
			SendClientMessage(playerid, COR_PROSTITUTA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_PROSTITUTA, "/sexo [id] : Começa a fazer sexo com alguém.");
			SendClientMessage(playerid, COR_BRANCO, "Agora que você é uma prostituta deverá fazer sexo com os outros e enquanto o sexo vai indo.");
			SendClientMessage(playerid, COR_BRANCO, "Você irá recebendo $2 enquanto estiver fazendo sexo.");
			SendClientMessage(playerid, COR_BRANCO, "Bom Trabalho.");
		}
		else if(Profissao[playerid] == JUSTICA_FEDERAL) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - JUSTIÇA FEDERAL");
			SendClientMessage(playerid, COR_JUSTICA_FEDERAL, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_JUSTICA_FEDERAL, "/tribunal [id 1] [id 2] [daqui a quanto tempo] : Marca um tribunal com dois jogadores depois de um certo tempo.");
			SendClientMessage(playerid, COR_JUSTICA_FEDERAL, "/fimtribunais : Dá fim a todos os tribunais que estão tendo.");
			SendClientMessage(playerid, COR_JUSTICA_FEDERAL, "/prender [id] : Prende um jogador.");
			SendClientMessage(playerid, COR_JUSTICA_FEDERAL, "/soltar [id] : Solta um jogador da prisão.");
			SendClientMessage(playerid, COR_BRANCO, "Você é um trabalhador da justiça federal. Deverá marcar tribunais, selecionar os júizes e ajudar a decidir os casos.");
            SendClientMessage(playerid, COR_BRANCO, "OBS: Nunca se esqueça de dar fim aos tribunais depois das declarações dos júizes.");
            SendClientMessage(playerid, COR_BRANCO, "Bom Trabalho.");
		}
		else if(Profissao[playerid] == SORVETEIRO) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - SORVETEIRO");
			SendClientMessage(playerid, COR_SORVETEIRO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_SORVETEIRO, "/sellsorvete [id] [sabor] : Vende um sorvete a um jogador.");
			SendClientMessage(playerid, COR_SORVETEIRO, "/pegarsorvete [bolas] : Pega sorvetes para vender!");
			SendClientMessage(playerid, COR_BRANCO, "Agora você é um sorveteiro. Pegue os sorvetes na sorveteria e comece a vender.");
			SendClientMessage(playerid, COR_BRANCO, "Digite /sabores para ver os sabores de sorvete.");
			SendClientMessage(playerid, COR_BRANCO, "Bom Trabalho.");
		}
		else if(Profissao[playerid] == VENDEDOR_LANCHE) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - VENDEDOR DE LANCHES");
			SendClientMessage(playerid, COR_VENDEDOR_LANCHES, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_VENDEDOR_LANCHES, "/selllanche [id] [lanche] : Vende um lanche a um jogador.");
			SendClientMessage(playerid, COR_VENDEDOR_LANCHES, "/vhotdog [id] [1-prensado ou 2-tradicional] : Vende um cachorro quente a um jogador.");
			SendClientMessage(playerid, COR_VENDEDOR_LANCHES, "/sellbebida [id] [bebida] : Vende uma bebida a um jogador.");
			SendClientMessage(playerid, COR_BRANCO, "Agora você é um vendedor de lanches. Digite /lanches para ver os lanches disponíveis.");
			SendClientMessage(playerid, COR_BRANCO, "Além de vender lanches e bebidas venda cachorros-quentes basta estar no carro de cachorro quente.");
			SendClientMessage(playerid, COR_BRANCO, "Bom Trabalho.");
		}
		else if(Profissao[playerid] == PARAMEDICO) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - PARAMEDICO");
			SendClientMessage(playerid, COR_PARAMEDICO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_PARAMEDICO, "/socorrer [id] : Socorre um jogador enchendo sua vida.");
			SendClientMessage(playerid, COR_BRANCO, "Bom Trabalho.");
		}
		else if(Profissao[playerid] == INSTRUTOR_DE_DIRECAO) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - INSTRUTOR DE DIREÇÃO");
			SendClientMessage(playerid, COR_INSTRUTOR, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_INSTRUTOR, "/habaero : Habilita uma pessoa a dirigir veículos aereos (aviões e helicopteros).");
			SendClientMessage(playerid, COR_INSTRUTOR, "/habterrestre : Habilita uma pessoa a dirigir veículos terrestres (carros e motos).");
			SendClientMessage(playerid, COR_INSTRUTOR, "/habnautica : Habilita uma pessoa a dirigir veículos nauticos (barcos).");
			SendClientMessage(playerid, COR_BRANCO, "Bom Trabalho.");
		}
		else if(Profissao[playerid] == RECEITA_FEDERAL) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - RECEITA FEDERAL");
			SendClientMessage(playerid, COR_RECEITA_FEDERAL, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_RECEITA_FEDERAL, "/removercontrabando : Remove o contrabando de alguém.");
			SendClientMessage(playerid, COR_RECEITA_FEDERAL, "/permitircontrabando : Permite o contrabando de alguém.");
			SendClientMessage(playerid, COR_RECEITA_FEDERAL, "/revisarcontrabando : Revisa o contrabando de alguém.");
			SendClientMessage(playerid, COR_RECEITA_FEDERAL, "/prender [id] : Prende quem estiver fazendo contrabando.");
			SendClientMessage(playerid, COR_RECEITA_FEDERAL, "/soltar [id] : Solta alguem da prisão.");
			SendClientMessage(playerid, COR_RECEITA_FEDERAL, "/multar [id] [amount] : Multa alguem que estiver fazendo contrabando.");
			SendClientMessage(playerid, COR_BRANCO, "Agora você é Receita Federal. Muitas vezes revise os contrabandos e caso estiver precisando de uma graninha.");
			SendClientMessage(playerid, COR_BRANCO, "peça dinheiro ao contrabandista e permita o contrabando. Quando for a primeira vez pode dar uma chance apenas multando. Bom Trabalho.");
		}
		else if(Profissao[playerid] == FRENTISTA) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - FRENTISTA");
			SendClientMessage(playerid, COR_FRENTISTA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_FRENTISTA, "/sellcomb [id] [litros] : Vende combustivel a um jogador.");
			SendClientMessage(playerid, COR_BRANCO, "Bom Trabalho.");
		}
		else if(Profissao[playerid] == TAXISTA) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - TAXISTA");
			SendClientMessage(playerid, COR_TAXISTA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_TAXISTA, "/staxi [id] : Começa a rodar o taxímetro (o passageiro tem que estar no seu carro).");
			SendClientMessage(playerid, COR_BRANCO, "Bom Trabalho.");
		}
		else if(Profissao[playerid] == MOTO_TAXI) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - MOTO-TAXI");
			SendClientMessage(playerid, COR_MOTO_TAXI, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_MOTO_TAXI, "/mtaxi [id] : Começa a rodar o moto-taxímetro (o passageiro tem que estar em sua moto).");
			SendClientMessage(playerid, COR_BRANCO, "Bom Trabalho.");
		}
		else if(Profissao[playerid] == TAXI_AEREO) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - TAXISTA AÉREO");
			SendClientMessage(playerid, COR_TAXI_AEREO , "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_TAXI_AEREO , "/ataxi [id] : Começa a rodar o aero-taxímetro (o passageiro tem que estar em seu helicoptero).");
			SendClientMessage(playerid, COR_BRANCO, "Bom Trabalho.");
		}
		else if(Profissao[playerid] == JUIZ) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - JUIZ");
			SendClientMessage(playerid, COR_JUIZ, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_JUIZ, "/prender [id] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(playerid, COR_JUIZ, "/soltar [id] : Solta uma pessoa da cadeia.");
			SendClientMessage(playerid, COR_JUIZ, "/culpado [id] : Declara alguem culpado.");
			SendClientMessage(playerid, COR_JUIZ, "/inocente [id] : Declara alguem inocente.");
			SendClientMessage(playerid, COR_BRANCO, "Você é um Juiz. Todas suas declarações serão totalmente importantes. É sempre bom consultar os jogadores da receita federal nas declarações.");
			SendClientMessage(playerid, COR_BRANCO, "CUIDADO: Um pequeno erro pode obter grandes sacríficios na sua carreira e nos outros.");
			SendClientMessage(playerid, COR_BRANCO, "Bom Trabalho.");
		}
		else if(Profissao[playerid] == SEQUESTRADOR) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - SEQUESTRADOR");
			SendClientMessage(playerid, COR_SEQUESTRADOR, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_SEQUESTRADOR, "/sequestrar [id] : Sequestra um jogador.");
			SendClientMessage(playerid, COR_SEQUESTRADOR, "/oferecerresgate [id] [quantia] : Oferece resgate para um jogador por uma certa quantia.");
			SendClientMessage(playerid, COR_BRANCO, "O seu objetivo é apenas sequestrar alguém, pedir resgate e depois soltar. Você ganhará XL matando os outros também");
			SendClientMessage(playerid, COR_BRANCO, "Bom Trabalho.");
		}
		else if(Profissao[playerid] == ASSASSINO) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - ASSASSINO");
			SendClientMessage(playerid, COR_ASSASSINO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_ASSASSINO, "Sua profissão não tem comando especiais! É só matar para ganhar dinheiro e XL.");
			SendClientMessage(playerid, COR_BRANCO, "Bom Trabalho.");
		}
		else if(Profissao[playerid] == ASSALTANTE) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - ASSALTANTE");
			SendClientMessage(playerid, COR_ASSALTANTE, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_ASSALTANTE, "/assaltar : Assalta um banco.");
			SendClientMessage(playerid, COR_ASSALTANTE, "/roubar [id] [quantia] : Rouba uma certa quantia de um jogador.");
			SendClientMessage(playerid, COR_BRANCO, "Assalte os bancos,pegue a grana e fuja. Lembre-se: cada vez que for preso isso afetará sua profissão.");
			SendClientMessage(playerid, COR_BRANCO, "Você ganhará XL matando os outros também");
			SendClientMessage(playerid, COR_BRANCO, "Bom Trabalho.");
		}
		else if(Profissao[playerid] == LADRAO_CARROS) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - LADRÃO DE CARROS");
			SendClientMessage(playerid, COR_LADRAO_CARROS, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_LADRAO_CARROS, "/desmanchar : Vende um carro pro desmanche.");
			SendClientMessage(playerid, COR_BRANCO, "Você deve levar veiculos para o desmanche e desmancha-los utilizando o comando /desmanchar.");
			SendClientMessage(playerid, COR_BRANCO, "Você ganhará XL matando os outros também");
            SendClientMessage(playerid, COR_BRANCO, "Bom Trabalho.");
		}
		else if(Profissao[playerid] == PROMOTER) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - PROMOTER");
			SendClientMessage(playerid, COR_PROMOTER, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_PROMOTER, "/contagem : Começa a fazer uma contagem (Isso poderá servir para corridas de carros).");
			SendClientMessage(playerid, COR_PROMOTER, "/organizarfesta [local] : Avisa a todos onde terá uma festa.");
			SendClientMessage(playerid, COR_PROMOTER, "/sellconvite [id] : Vende convite para alguém.");
			SendClientMessage(playerid, COR_PROMOTER, "/verificar [id] : Verifica se alguém possue convite.");
			SendClientMessage(playerid, COR_PROMOTER, "/recolherconvite [id] : Recolhe o convite de alguém.");
			SendClientMessage(playerid, COR_BRANCO, "Agora você é um promoter. Seu objetivo é organizar festas e eventos cobrando uma certa quantia em grana.");
			SendClientMessage(playerid, COR_BRANCO, "Você também poderá fazer festas publicas contratando barmans, fazendo eventos e também verificar as pessoas que possuem convites.");
			SendClientMessage(playerid, COR_BRANCO, "OBS: Quando fizer uma festa lembre-se de entregar os convites e recolhe-los depois. Bom Trabalho.");
		}
		else if(Profissao[playerid] == TRAFICANTE) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - TRAFICANTE");
			SendClientMessage(playerid, COR_TRAFICANTE, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_TRAFICANTE, "/selldroga [id] [id-da-droga] [doses] : Vende uma droga para um jogador.");
			SendClientMessage(playerid, COR_TRAFICANTE, "/meusbags : Vê quantos bagulhos você possue.");
	        SendClientMessage(playerid, COR_TRAFICANTE, "/comprarbagulho [quantia] : Compra bagulhos para poder vender as drogas.");
            SendClientMessage(playerid, COR_BRANCO, "Para ver os ids das drogas digite /drogas.");
			SendClientMessage(playerid, COR_BRANCO, "Bom Trabalho.");
		}
		else if(Profissao[playerid] == LIDER_DE_TRAFICO) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - LIDER DE TRAFICO");
			SendClientMessage(playerid, COR_LIDER_DE_TRAFICO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
	        SendClientMessage(playerid, COR_LIDER_DE_TRAFICO, "/selldroga [id] [id-da-droga] [doses] : Vende uma droga para um jogador.");
	        SendClientMessage(playerid, COR_LIDER_DE_TRAFICO, "/comprarbagulho [quantia] : Compra bagulho para poder vender as drogas.");
	        SendClientMessage(playerid, COR_LIDER_DE_TRAFICO, "/meusbags : Vê quantos bagulhos você possue.");
	        SendClientMessage(playerid, COR_LIDER_DE_TRAFICO, "/pdrogas : Planta drogas em um veiculo.");
	        SendClientMessage(playerid, COR_BRANCO, "Agora você é líder de tráfico ou seja será o lider de todos os traficantes.");
	        SendClientMessage(playerid, COR_BRANCO, "Você agora tem os mesmos objetivos que os traficantes, pegar bagulhos para poder vender as drogas e");
	        SendClientMessage(playerid, COR_BRANCO, "para ver os ids das drogas digite /drogas.");
	        SendClientMessage(playerid, COR_BRANCO, "Bom Trabalho.");
		}
		else if(Profissao[playerid] == VENDEDOR_DE_ARMAS) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - VENDEDOR DE ARMAS");
			SendClientMessage(playerid, COR_VENDEDOR_ARMAS, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_VENDEDOR_ARMAS, "/setarma [id] [id_da_arma] [balas] : Vende um carro pro desmanche.");
			SendClientMessage(playerid, COR_VENDEDOR_ARMAS, "/colete [id] : Vende um colete para alguem.");
			SendClientMessage(playerid, COR_VENDEDOR_ARMAS, "/camuflar [id] [tempo] : Camufla alguem por um tempo(em minutos).");
			SendClientMessage(playerid, COR_BRANCO, "Agora você é um vendedor de armas. Venda armas, coletes e camuflagens para os outros jogadores.");
            SendClientMessage(playerid, COR_BRANCO, "Os ids das armas você encontra digitando /armas (1 a 9), /armas2 (10 a 18), /armas3 (22 a 30) e /armas4 (31 a 34).");
            SendClientMessage(playerid, COR_BRANCO, "Bom Trabalho.");
		}
		else if(Profissao[playerid] == CACADOR) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - CAÇADOR");
			SendClientMessage(playerid, COR_CACADOR, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_CACADOR, "/cacar : Caça animais (você precisa estar na Area de Caça).");
			SendClientMessage(playerid, COR_CACADOR, "/sellcaca : Vende sua Caça.");
			SendClientMessage(playerid, COR_BRANCO, "Bom Trabalho.");
		}
		else if(Profissao[playerid] == TRANSPORTE_VALORES) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - TRANSPORTE DE VALORES");
			SendClientMessage(playerid, COR_TRANSPORTE_VALORES, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_TRANSPORTE_VALORES, "/pegarvalores : Pega valores de um carro forte.");
			SendClientMessage(playerid, COR_TRANSPORTE_VALORES, "/entregarvalores : Entrega os valores ao banco.");
			SendClientMessage(playerid, COR_TRANSPORTE_VALORES, "/verbolsa : Vê sua bolsa de valores.");
			SendClientMessage(playerid, COR_BRANCO, "Você é um transportador de valores. Você deve pegar uma bolsa de valores que estarão nos carros fortes e");
            SendClientMessage(playerid, COR_BRANCO, "entregar ao banco. A cada entrega você recebera 25 por cento da bolsa entregue.");
            SendClientMessage(playerid, COR_BRANCO, "Bom Trabalho.");
		}
		else if(Profissao[playerid] == MECANICO) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - MECANICO");
			SendClientMessage(playerid, COR_MECANICO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_MECANICO, "/consertar [id] : Conserta um carro.");
			SendClientMessage(playerid, COR_MECANICO, "/pintar [id] [cor1] [cor2] :  Pinta um carro.");
			SendClientMessage(playerid, COR_MECANICO, "/lavar [id] : Lava o carro de alguem.");
			SendClientMessage(playerid, COR_MECANICO, "/placa [nome] : Troca a placa do carro de alguem.");
			SendClientMessage(playerid, COR_BRANCO, "Bom Trabalho.");
        }
		else if(Profissao[playerid] == PESCADOR) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - PESCADOR");
			SendClientMessage(playerid, COR_PESCADOR, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_PESCADOR, "/pescar : Pesca (você precisa estar na Area de Pesca).");
			SendClientMessage(playerid, COR_PESCADOR, "/sellpesca : Vende sua Pesca.");
			SendClientMessage(playerid, COR_BRANCO, "Bom Trabalho.");
		}
		else if(Profissao[playerid] == AGRICULTOR) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - AGRICULTOR");
			SendClientMessage(playerid, COR_AGRICULTOR, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_AGRICULTOR, "/plantar : Planta milho.");
			SendClientMessage(playerid, COR_AGRICULTOR, "/colher : Colhe o milho.");
			SendClientMessage(playerid, COR_AGRICULTOR, "/sellmilho : Vende o milho a Fazenda.");
			SendClientMessage(playerid, COR_BRANCO, "Bom Trabalho.");
		}
		else if(Profissao[playerid] == COP_CIVIL) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - POLICIAL CIVIL");
			SendClientMessage(playerid, COR_COP_CIVIL, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_COP_CIVIL, "/prender [id] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(playerid, COR_COP_CIVIL, "/bafometro [id] : Vê o teor de alcool no sangue de alguém");
			SendClientMessage(playerid, COR_COP_CIVIL, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, COR_COP_CIVIL, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
			SendClientMessage(playerid, COR_COP_CIVIL, "/multar [id] [valor] : Multar um Jogador.");
			SendClientMessage(playerid, COR_COP_CIVIL, "/desarmardinamite : Desarma uma dinamite plantada em um carro.");
			SendClientMessage(playerid, COR_BRANCO, "A cidade está cheia de bandidos, por isso sua missão é cuidar bem da cidade, evitando assaltos, roubos, crimes");
			SendClientMessage(playerid, COR_BRANCO, "assassinatos e rachas. Bom Trabalho!");
		}
		else if(Profissao[playerid] == COP_RODOVIARIO) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - POLICIAL RODOVIARIO");
			SendClientMessage(playerid, COR_COP_RODOVIARIO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_COP_RODOVIARIO, "/prender [id] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(playerid, COR_COP_RODOVIARIO, "/bafometro [id] : Vê o teor de alcool no sangue de alguém");
			SendClientMessage(playerid, COR_COP_RODOVIARIO, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, COR_COP_RODOVIARIO, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
			SendClientMessage(playerid, COR_COP_RODOVIARIO, "/multar [id] [valor] : Multar uma pessoa.");
        	SendClientMessage(playerid, COR_COP_RODOVIARIO, "/cacarterrestre [id] : Caça a carteira de um Jogador.");
        	SendClientMessage(playerid, COR_COP_RODOVIARIO, "/desarmardinamite : Desarma uma dinamite plantada em um carro.");
        	SendClientMessage(playerid, COR_BRANCO, "As Estradas são muito perigosas, por isso sua missão é cuidar de nossas estradas, evitando rachas e dando multa");
			SendClientMessage(playerid, COR_BRANCO, "a jogadores a cima da velocidade permitida. Bom Trabalho!");
		}
		else if(Profissao[playerid] == COP_ELITE) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - ATIRADOR DE ELITE");
			SendClientMessage(playerid, COR_COP_ELITE, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_COP_ELITE, "/prender [id] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(playerid, COR_COP_ELITE, "/bafometro [id] : Vê o teor de alcool no sangue de alguém");
			SendClientMessage(playerid, COR_COP_ELITE, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, COR_COP_ELITE, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
			SendClientMessage(playerid, COR_COP_ELITE, "/multar [id] [valor] : Multar uma pessoa.");
			SendClientMessage(playerid, COR_COP_ELITE, "/desarmardinamite : Desarma uma dinamite plantada em um carro.");
			SendClientMessage(playerid, COR_BRANCO, "A Policia trabalha bem, mais quando a policia não consegur prender ou matar o assassino é chamado Atiradores de Elite. Por isso sua missão é ficar sempre");
			SendClientMessage(playerid, COR_BRANCO, "a disposição para matar assassinos e ladrões Bom Trabalho!");
		}
		else if(Profissao[playerid] == DELEGADO) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - DELEGADO");
			SendClientMessage(playerid, COR_DELEGADO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
            SendClientMessage(playerid, COR_DELEGADO, "/prender [id] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(playerid, COR_DELEGADO, "/soltar [id] : Solta uma pessoa da cadeia.");
			SendClientMessage(playerid, COR_DELEGADO, "/multar [id] [valor] : Multar uma pessoa.");
			SendClientMessage(playerid, COR_DELEGADO, "/exercito [mensagen] : pede ajuda ao exercito.");
			SendClientMessage(playerid, COR_DELEGADO, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, COR_DELEGADO, "/desarmardinamite : Desarma uma dinamite plantada em um carro.");
			SendClientMessage(playerid, COR_DELEGADO, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
			SendClientMessage(playerid, COR_BRANCO, "Bom Trabalho.");
		}
		else if(Profissao[playerid] == XERIFE) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - XERIFE");
			SendClientMessage(playerid, COR_XERIFE, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
            SendClientMessage(playerid, COR_XERIFE, "/prender [id] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(playerid, COR_XERIFE, "/soltar [id] : Solta uma pessoa da cadeia.");
			SendClientMessage(playerid, COR_XERIFE, "/multar [id] [valor] : Multar uma pessoa.");
			SendClientMessage(playerid, COR_XERIFE, "/reforco [id do procurado] : Pede reforço para pegar algum procurado.");
			SendClientMessage(playerid, COR_XERIFE, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, COR_XERIFE, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
			SendClientMessage(playerid, COR_XERIFE, "/desarmardinamite : Desarma uma dinamite plantada em um carro.");
			SendClientMessage(playerid, COR_BRANCO, "Bom Trabalho.");
		}
		else if(Profissao[playerid] == NARCOTICOS) {
		    SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - NARCOTICOS:");
			SendClientMessage(playerid, COR_NARCOTICOS, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
		    SendClientMessage(playerid, COR_NARCOTICOS, "/examead [id] : Realiza o exame anti-dopping para verificar a presença de entorpecentes no sangue de um jogador.");
		    SendClientMessage(playerid, COR_NARCOTICOS, "/revisardrogas : Revisa se um carro possue drogas.");
		    SendClientMessage(playerid, COR_NARCOTICOS, "/verdrogas [id] : Vê se alguma pessoa fumou drogas.");
		    SendClientMessage(playerid, COR_NARCOTICOS, "/prender [id] : Prende uma pessoa na cadeia para aguardar julgamento.");
		    SendClientMessage(playerid, COR_BRANCO, "Bom Trabalho.");
		}
		else if(Profissao[playerid] == POLICIA_FLORESTAL) {
		    SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - POLICIAL FLORESTAL:");
			SendClientMessage(playerid, COR_POLICIA_FLORESTAL, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
		    SendClientMessage(playerid, COR_POLICIA_FLORESTAL, "/cacaon : Liga a temporada de Caça.");
		    SendClientMessage(playerid, COR_POLICIA_FLORESTAL, "/cacaoff : Desliga a temporada de Caça");
		    SendClientMessage(playerid, COR_POLICIA_FLORESTAL, "/vercaca : Vê se um jogador está caçando.");
		    SendClientMessage(playerid, COR_POLICIA_FLORESTAL, "/prendercaca [id] : Prende quem estiver caçando.");
		    SendClientMessage(playerid, COR_POLICIA_FLORESTAL, "/multar : Multa um jogador.");
		    SendClientMessage(playerid, COR_BRANCO, "Bom Trabalho.");
		}
		else if(Profissao[playerid] == IBAMA) {
		    SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - IBAMA:");
			SendClientMessage(playerid, COR_IBAMA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
		    SendClientMessage(playerid, COR_IBAMA, "/piracema : Liga e Desliga a Piracema.");
		    SendClientMessage(playerid, COR_IBAMA, "/prenderpesca [id] : Prende quem estiver pescando.");
		    SendClientMessage(playerid, COR_IBAMA, "/verpesca : Vê se um jogador está pescando.");
		    SendClientMessage(playerid, COR_IBAMA, "/multar : Multa um jogador.");
		    SendClientMessage(playerid, COR_BRANCO, "Bom Trabalho.");
        }
        else if(Profissao[playerid] == PEDREIRO) {
		    SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - PEDREIRO:");
			SendClientMessage(playerid, COR_PEDREIRO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
		    SendClientMessage(playerid, COR_PEDREIRO, "/pegarferramentas : Pega ferramentas (Você tem que estar na pedreira).");
		    SendClientMessage(playerid, COR_PEDREIRO, "/entregarferramentas : Entrega as ferramentas recebendo R$20 por cada (Você tem que estar na OBRA em San Fierro).");
		    SendClientMessage(playerid, COR_PEDREIRO, "/recolherpedras : Recolhe as pedras (Você tem que estar na pedreira).");
		    SendClientMessage(playerid, COR_PEDREIRO, "/entregarpedras : Entrega as pedras (Você tem que estar na OBRA em San Fierro).");
		    SendClientMessage(playerid, COR_BRANCO, "Bom Trabalho.");
        }
        else if(Profissao[playerid] == ALUGUEL_DE_CARROS){
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - LOCADOR DE CARROS");
			SendClientMessage(playerid, COR_ALUGUEL_DE_CARROS, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_ALUGUEL_DE_CARROS, "/locar [id] [tempo] : Loca carro por um tempo em minutos para alguem");
            SendClientMessage(playerid, COR_ALUGUEL_DE_CARROS, "/alugueis : Vê a lista de pessoas que locaram um carro");
            SendClientMessage(playerid, COR_BRANCO, "Enquanto você for locador de carros terá acesso aos carros da locadora.");
            SendClientMessage(playerid, COR_BRANCO, "Lembre-se de que se você ficar pegando muitos carros os outros jogadores não terão chance de aluga-los.");
            SendClientMessage(playerid, COR_BRANCO, "Por isso controle-se pegue os carros da locadora apenas quando estiver urgentemente precisando. Bom Trabalho.");
		}
		else if(Profissao[playerid] == EXERCITO) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - EXERCITO");
			SendClientMessage(playerid, COR_EXERCITO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_EXERCITO, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, COR_EXERCITO, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
			SendClientMessage(playerid, COR_EXERCITO, "/prender [id] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(playerid, COR_EXERCITO, "/soltar [id] : Tira um jogador da prisão");
			SendClientMessage(playerid, COR_EXERCITO, "/bafometro [id] : Vê o teor de alcool no sangue de alguém");
			SendClientMessage(playerid, COR_BRANCO, "Bom Trabalho.");
        }
		else if(Profissao[playerid] == CONFISCADOR) {
		    SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - FISCAL DE VEICULOS:");
			SendClientMessage(playerid, COR_CONFISCADOR, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
		    SendClientMessage(playerid, COR_CONFISCADOR, "/tiraraerea : Tira a habilitação aerea de alguem.");
		    SendClientMessage(playerid, COR_CONFISCADOR, "/tirarnautica : Tira a habilitação nautica de alguem");
		    SendClientMessage(playerid, COR_CONFISCADOR, "/tirarterrestre : Tira a habilitação terrestre de alguem.");
		    SendClientMessage(playerid, COR_CONFISCADOR, "/radar : Vê as opçoes de radares da cidade.");
		    SendClientMessage(playerid, COR_BRANCO, "Bom Trabalho.");
		}
		else if(Profissao[playerid] == ADVOGADO) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - ADVOGADO");
			SendClientMessage(playerid, COR_ADVOGADO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_ADVOGADO, "/processo [nome_do_reu] [descrição_da_causa] : Entra com um processo em favor ao réu.");
			SendClientMessage(playerid, COR_ADVOGADO, "/fianca [id] [quantia] : Oferece proposta de fiança para um jogador.");
			SendClientMessage(playerid, COR_BRANCO, "Agora você é um advogado. Tente defender seus clientes cada vez mais e lembre-se caso precise você poderá oferecer");
			SendClientMessage(playerid, COR_BRANCO, "propostas de fianças para os outros jogadores saírem da prisão.");
			SendClientMessage(playerid, COR_BRANCO, "Bom Trabalho.");
		}
		else if(Profissao[playerid] == SEGURANÇA) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - SEGURANÇA");
			SendClientMessage(playerid, COR_SEGURANÇA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_BRANCO, "Por enquanto sua profissão não tem comandos especiais mas aguarde para isso estamos trabalhando.");
			SendClientMessage(playerid, COR_BRANCO, "Seu objetivo agora é defender seu chefe de criminosos e também tente trabalhar em estacionamentos cuidando de veiculos.");
			SendClientMessage(playerid, COR_BRANCO, "Bom Trabalho.");
		}
		else if(Profissao[playerid] == MOTORISTA_PARTICULAR){
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - MOTORISTA PARTICULAR");
			SendClientMessage(playerid, COR_MOTORISTA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_MOTORISTA, "/alugarlimo : Aluga uma limosine OBS:Você tem que estar na companhia de limosines");
			SendClientMessage(playerid, COR_MOTORISTA, "/devolverlimo : Devolve uma limosine para a companhia de limosines");
			SendClientMessage(playerid, COR_MOTORISTA, "/lavarlimo : Lava uma limosine OBS:Você tem que estar na companhia ou lavar com um mecanico");
			SendClientMessage(playerid, COR_MOTORISTA, "/revisarlimo : Começa a ir nos lugares revisando uma limosine.");
			SendClientMessage(playerid, COR_BRANCO, "Bom Trabalho.");
        }
		else if(Profissao[playerid] == MOTORISTA_DE_ONIBUS) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - MOTORISTA DE ONIBUS");
			SendClientMessage(playerid, COR_MOTORISTA_ONIBUS, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_MOTORISTA_ONIBUS, "/terminais : Ve as opçoes de terminais.");
			SendClientMessage(playerid, COR_MOTORISTA_ONIBUS, "/passagem [id] : Vende passagem a alguem.");
			SendClientMessage(playerid, COR_MOTORISTA_ONIBUS, "/verpassagem : Ve se alguem tem passagem.");
			SendClientMessage(playerid, COR_MOTORISTA_ONIBUS, "/recolherpass : Recolhe a passagem de alguem.");
			SendClientMessage(playerid, COR_BRANCO, "Agora que você é um motorista de onibus poderá vender passagens para os outros em caso de viagens e também");
			SendClientMessage(playerid, COR_BRANCO, "Terá que revistar e recolher. Lembre-se quando estiver passando pelos terminais não esqueça de parar.");
			SendClientMessage(playerid, COR_BRANCO, "Bom Trabalho.");
		}
		else if(Profissao[playerid] == MENDIGO ) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - MENDIGO ");
			SendClientMessage(playerid, COR_MENDIGO , "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_MENDIGO , "/pegarlatinha : Começa a fazer um circuito pegando latinhas.");
			SendClientMessage(playerid, COR_MENDIGO , "/pararcoleta : Para de fazer uma coleta de latinhas.");
			SendClientMessage(playerid, COR_MENDIGO , "/minhaslatinhas : Vê quantas latinhas você possue.");
			SendClientMessage(playerid, COR_MENDIGO , "/selllatinha [id] [latas] : Vende latinhas para algum serviço de reciclagens.");
			SendClientMessage(playerid, COR_MENDIGO , "/selllatas : Vende latinhas na area de reciclagens.");
			SendClientMessage(playerid, COR_BRANCO, "Você é um mendingo. Seu objetivo agora é recolher latinhas pelo circuito e pedindo para as pessoas que tomarem refrigerante.");
			SendClientMessage(playerid, COR_BRANCO, "Depois venda-as para um serviço de reciclagens ou entregue direto para o local da reciclagem.");
			SendClientMessage(playerid, COR_BRANCO, "OBS: Você mesmo poderá comprar bebidas para ganhar latinhas.");
			SendClientMessage(playerid, COR_BRANCO, "Bom Trabalho.");
		}
		else if(Profissao[playerid] == SERVICO_RECICLAGEM) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - SERVIÇO DE RECICLAGENS");
			SendClientMessage(playerid, COR_SERVICO_RECICLAGEM, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_SERVICO_RECICLAGEM, "/selllatas : Vende todas suas latinhas na area de reciclagens.");
			SendClientMessage(playerid, COR_SERVICO_RECICLAGEM, "/minhaslatinhas : Vê quantas latinhas você possue.");
            SendClientMessage(playerid, COR_BRANCO, "Agora você é um serviço de reciclagens. Pegue as latinhas com um mendigo ou então tome bebidas para conseguir.");
            SendClientMessage(playerid, COR_BRANCO, "Você terá que ir na area de reciclagem para vender latinhas e também poderá ir ao lixão pegar as latinhas.");
			SendClientMessage(playerid, COR_BRANCO, "Bom Trabalho.");
		}
		else if(Profissao[playerid] == VENDEDOR_DE_CARROS) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - VENDEDOR DE CARROS");
			SendClientMessage(playerid, COR_VENDEDOR, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_VENDEDOR, "/setcar [id_do_veículo] [id_do_comprador] [cor1] [cor2] : Vende um carro (esteja com ele na posição de spawn).");
			SendClientMessage(playerid, COR_BRANCO, "Bom Trabalho.");
		}
		else if(Profissao[playerid] == CORRETOR) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - CORRETOR DE IMOVEIS");
			SendClientMessage(playerid, COR_CORRETOR, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_CORRETOR, "/setcasa [id] : Seta a casa para alguem, (esteja na posiçao exterior à casa).");
			SendClientMessage(playerid, COR_BRANCO, "Bom Trabalho.");
		}
		else if(Profissao[playerid] == SEGURADOR) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - SEGURADOR");
			SendClientMessage(playerid, COR_SEGURADOR, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_SEGURADOR, "/segurar [id] : Vende um seguro de vida a um jogador.");
			SendClientMessage(playerid, COR_SEGURADOR, "/segurarcarro [id] : Vende um seguro de carro a um jogador.");
			SendClientMessage(playerid, COR_SEGURADOR, "/seguros : Ve os jogadores que possuem seguros de vida.");
			SendClientMessage(playerid, COR_BRANCO, "Bom Trabalho.");
		}
		else if(Profissao[playerid] == JORNALISTA) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - JORNALISTA");
			SendClientMessage(playerid, COR_JORNALISTA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_JORNALISTA, "/noticia [texto] : Publica uma notícia.");
			SendClientMessage(playerid, COR_JORNALISTA, "/anunciar [texto] : Anuncia uma reportagem.");
			SendClientMessage(playerid, COR_BRANCO, "Bom Trabalho.");
		}
		else if(Profissao[playerid] == CAMINHONEIRO) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - CAMINHONEIRO");
			SendClientMessage(playerid, COR_CAMINHONEIRO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_CAMINHONEIRO, "/carregar : Carrega seu caminhão.");
			SendClientMessage(playerid, COR_CAMINHONEIRO, "/descarregar : descarrega seu caminhão.");
			SendClientMessage(playerid, COR_BRANCO, "Bom Trabalho.");
		}
		else if(Profissao[playerid] == TRANSPORTE_GAS) {
			SendClientMessage(playerid, COR_BRANCO, "Comandos de sua profissão - TRANSPORTE DE COMBUSTIVEL");
			SendClientMessage(playerid, COR_TRANSPORTE_GAS, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_TRANSPORTE_GAS, "/carregarcomb : Carrega seu caminhão.");
			SendClientMessage(playerid, COR_TRANSPORTE_GAS, "/descarregarcomb : descarrega seu caminhão.");
			SendClientMessage(playerid, COR_BRANCO, "Bom Trabalho.");
		}
		else{
			SendClientMessage(playerid, COR_BRANCO, "Você é Desempregado, não tem comandos especiais");
			SendClientMessage(playerid, COR_DESEMPREGADO, "/pt [texto] : Manda uma mensagem para todas as pessoas que são desempregadas.");
		}
		return 1;
	}

//----------------------------------- LISTAS ---------------------------------------//
//Lista de Presos
	if (strcmp(cmd, "/presos", true)==0){
		new string[256];
	    SendClientMessage(playerid, COR_AMARELO, "Lista de presos");
	    for(new i=0; i<MAX_PLAYERS; i++){
   		if(Presos[i] == 1){
			format(string, sizeof(string), "- %s", PlayerName(i));
			SendClientMessage(playerid, COR_AMARELO, string);
			return 1;
			}
		}
	}

//Lista de Locadores
	if (strcmp(cmdtext, "/alugueis", true)==0){
		new string[256];
	    SendClientMessage(playerid, COR_ALUGUEL_DE_CARROS, "Lista de locadores");
	    for(new i=0; i<MAX_PLAYERS; i++){
	        if(alugueis[i] == 1){
				format(string, sizeof(string), "%d: %s",i, PlayerName(i));
				SendClientMessage(playerid, COR_ALUGUEL_DE_CARROS, string);
				return 1;
			}
		}
	}
	
//Lista de Procurados
	if (strcmp(cmd, "/procurados", true)==0){
		new string[256];
	    SendClientMessage(playerid, COR_AMARELO, "Lista de procurados");
	    for(new i=0; i<MAX_PLAYERS; i++){
   		if(Procurados[i] == 1){
			format(string, sizeof(string), "- %s", PlayerName(i));
			SendClientMessage(playerid, COR_AMARELO, string);
			return 1;
			}
		}
	}
	
//Lista de Segurados
	if (strcmp(cmd, "/seguros", true)==0){
		new string[256];
	    SendClientMessage(playerid, COR_AMARELO, "Lista de segurados");
	    for(new i=0; i<MAX_PLAYERS; i++){
   		if(Seguro[i] == 1){
			format(string, sizeof(string), "- %s", PlayerName(i));
			SendClientMessage(playerid, COR_AMARELO, string);
			return 1;
			}
		}
	}
	
//---------------------------- COMANDOS DE TAXISTAS -------------------------------//
//Aério
	if(strcmp(cmd, "/ataxi", true) == 0 && IsPlayerConnected(playerid)) {
	    if(Profissao[playerid] == TAXI_AEREO || IsPlayerAdmin(playerid)) {
	        new tmp[256];
	        new plid;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)) {
	            SendClientMessage(playerid, COR_VERMELHO, "/mtaxi [id]");
				return 1;
			}
			plid = strval(tmp);
			new modelo = GetVehicleModel(GetPlayerVehicleID(playerid));
			if(modelo != VEH_MAVERICK){
			    SendClientMessage(playerid, COR_VERMELHO, "Você não está dirigindo uma aeronave autorizada para sua profissão.");
				SendClientMessage(playerid, COR_VERMELHO, "Use apenas helicópteros Maverick.");
				return 1;
			} else {
			    if(GetPlayerVehicleID(playerid) == GetPlayerVehicleID(plid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER){
			        SendClientMessage(playerid, COR_VERDE, "O aero-taxímetro começou a rodar");
			        SendClientMessage(plid, COR_VERDE, "O aero-taxímetro já está rodando. A corrida está sendo cobrada a partir de agora.");
			        ATaximetro[plid][0] = 1;
					ATaximetro[plid][1] = playerid;
					udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
					return 1;
				}
				else {
				    SendClientMessage(playerid, COR_VERMELHO, "O passageiro não está na sua moto, ou você não é o condutor.");
					return 1;
				}
			}
	    } else {
	        SendClientMessage(playerid, COR_VERMELHO, "Você não é Taxista Aéreo.");
			return 1;
		}
	}

//Moto-Taxi
	if(strcmp(cmd, "/mtaxi", true) == 0 && IsPlayerConnected(playerid)) {
	    if(Profissao[playerid] == MOTO_TAXI || IsPlayerAdmin(playerid)) {
	        new tmp[256];
	        new plid;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)) {
	            SendClientMessage(playerid, COR_VERMELHO, "/mtaxi [id]");
				return 1;
			}
			plid = strval(tmp);
			new modelo = GetVehicleModel(GetPlayerVehicleID(playerid));
			if(modelo != VEH_PCJ600){
			    SendClientMessage(playerid, COR_VERMELHO, "Você não está dirigindo uma moto autorizada para moto-taxí.");
				SendClientMessage(playerid, COR_VERMELHO, "Use motos do modelo PCJ-600 para esse tipo de profissão.");
				return 1;
			} else {
			    if(GetPlayerVehicleID(playerid) == GetPlayerVehicleID(plid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER){
			        SendClientMessage(playerid, COR_VERDE, "O moto-taxímetro começou a rodar");
			        SendClientMessage(plid, COR_VERDE, "O moto-taxímetro já está rodando. A corrida está sendo cobrada a partir de agora.");
			        MTaximetro[plid][0] = 1;
					MTaximetro[plid][1] = playerid;
					udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
					return 1;
				}
				else {
				    SendClientMessage(playerid, COR_VERMELHO, "O passageiro não está em uma moto, ou você não é o condutor.");
					return 1;
				}
			}
	    } else {
	        SendClientMessage(playerid, COR_VERMELHO, "Você não é Moto-Taxista.");
			return 1;
		}
	}

//Taxista
	if(strcmp(cmd, "/staxi", true) == 0 && IsPlayerConnected(playerid)) {
	    if(Profissao[playerid] == TAXISTA || IsPlayerAdmin(playerid)) {
	        new tmp[256];
	        new plid;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)) {
	            SendClientMessage(playerid, COR_VERMELHO, "/staxi [id]");
				return 1;
			}
			plid = strval(tmp);
			new modelo = GetVehicleModel(GetPlayerVehicleID(playerid));
			if(modelo != VEH_CABBIE && modelo != VEH_TAXI){
			    SendClientMessage(playerid, COR_VERMELHO, "Você não está dirigindo um veiculo autorizada para taxísta.");
				SendClientMessage(playerid, COR_VERMELHO, "Use carros do modelo Cabbie ou Taxi para esse tipo de profissão.");
				return 1;
			} else {
			    if(GetPlayerVehicleID(playerid) == GetPlayerVehicleID(plid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER){
			        SendClientMessage(playerid, COR_VERDE, "O taxímetro começou a rodar");
			        SendClientMessage(plid, COR_VERDE, "O taxímetro já está rodando. A corrida está sendo cobrada a partir de agora.");
			        Taximetro[plid][0] = 1;
					Taximetro[plid][1] = playerid;
					udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
					return 1;
				}
				else {
				    SendClientMessage(playerid, COR_VERMELHO, "O passageiro não está em um taxi, ou você não é o condutor.");
					return 1;
				}
			}
	    } else {
	        SendClientMessage(playerid, COR_VERMELHO, "Você não é Taxista.");
			return 1;
		}
	}
//---------------------------- COMANDOS DE CORRETOR DE IMOVEIS ---------------------//
	if(strcmp(cmd, "/setcasa", true) == 0) {
	    if(Profissao[playerid] == CORRETOR || IsPlayerAdmin(playerid)){
			new plid;
			new string[256];
			new tmp[256];
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/setcasa [id]");
				return 1;
			}
			plid = strval(tmp);
    		if(udb_Exists(PlayerName(plid))) {
    		    if(Casa[plid] == 0){
                if(IsPlayerConnected(plid) && PLAYERLIST_authed[plid] == 1){
	            invitestatus[plid] = INVITE_CASA;
				envconvite = playerid;
				SendClientMessage(playerid, COR_VERDE, "Otimo! Agora espere o outro jogador aceitar a casa");
				format(string,sizeof(string),"%s está lhe oferecendo uma casa, digite /aceitar para aceitar e /recusar para recusar",PlayerName(playerid));
				SendClientMessage(plid, COR_VERDE, string);
    	    	return 1;
    	    	}
   	          }
			}
			else{
		   		SendClientMessage(playerid, COR_VERMELHO, "Jogador não conectado/logado");
				return 1;
			}
		}
		else{
		    SendClientMessage(playerid, COR_VERMELHO, "Você não é Corretor de Imoveis");
			return 1;
		}
    	return 1;
	}
//--------------------------- COMANDOS DE VENDEDOR DE CARROS -----------------------//
	if(strcmp(cmd, "/setcar", true) == 0) {
		if(Profissao[playerid] == VENDEDOR_DE_CARROS || IsPlayerAdmin(playerid)){
			new tmp[256];
			new carid, plid, cor1, cor2;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COR_VERMELHO, "ID fora do normal | ID's = 400-611");
				return 1;
			}
		    carid = strval(tmp);
    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/setcar [id_do_veículo] [id_do_comprador] [cor1] [cor2]");
				return 1;
			}
			plid = strval(tmp);
    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/setcar [id_do_veículo] [id_do_comprador] [cor1] [cor2]");
				return 1;
			}
			cor1 = strval(tmp);
    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/setcar [id_do_veículo] [id_do_comprador] [cor1] [cor2]");
				return 1;
			}
			cor2 = strval(tmp);
			if(carid >= 400 && carid <= 611){
			    if(IsPlayerInAnyVehicle(playerid)){
			        if(IsPlayerConnected(plid)){
			       	invitestatus[plid] = INVITE_CARRO;
			       	SendClientMessage(playerid, COR_VERMELHO, "Foi enviado ao outro jogador um convite para ver se ele aceita o carro.");
			       	new string[256];
			       	format(string,sizeof(string),"%s esta lhe oferecendo um carro. Digite /aceitar para aceitar e digite /recusar para recusar",PlayerName(playerid));
			       	SendClientMessage(playerid, COR_VERDE,string);
			       	envconvite = playerid;
			       	icarid = carid;
			       	icor1 = cor1;
			       	icor2 = cor2;
					return 1;
					}
					else{
				    	SendClientMessage(playerid, COR_VERMELHO, "Jogador não conectado.");
						return 1;
					}
				}
				else{
				    SendClientMessage(playerid, COR_VERMELHO, "Você precisa estar em um veiculo para vender.");
					return 1;
				}
			}
			else{
				SendClientMessage(playerid, COR_VERMELHO, "ID fora do normal | ID's = 400-611");
				return 1;
			}
		}
		if(Profissao[playerid] != VENDEDOR_DE_CARROS){
			SendClientMessage(playerid, COR_VERMELHO, "Você não é Vendedor de Carros e Skins");
			return 1;
		}
	}

//----------------------------- COMANDOS DE BARMAN --------------------------------//
    if(strcmp(cmd, "/sellcerveja", true) == 0) {
        if(Profissao[playerid] == BARMAN || IsPlayerAdmin(playerid)){
            new string[256];
			new tmp[256];
			new plid, quantia;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COR_VERMELHO, "/selldcerveja [id] [quantia]");
				return 1;
			}
		    plid = strval(tmp);
    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/sellcerveja [id] [quantia]");
				return 1;
			}
			quantia = strval(tmp);
			if(quantia < 1 || quantia > 10){
			    SendClientMessage(playerid, COR_VERMELHO, "Mínimo 1 cerveja e maxímo 10 cervejas.");
				return 1;
			}
			else{
       			if(GetDistanceBetweenPlayers(playerid, plid) <= 20){
			       	if(Bebida[plid] == 10){
			       	  	SendClientMessage(playerid,COR_VERMELHO, "Você quer matar seu cliente!");
						return 1;
					}
					if(IsPlayerConnected(plid)){
					 if(plid != playerid){
					    QtCerveja[plid] = quantia;
				    	SendClientMessage(playerid,COR_VERDE, "Missão cumprida!");
				    	format(string,sizeof(string),"%s te vendeu %d latas de cerveja, para bebe-las digite /beber [latas].",PlayerName(playerid),quantia);
				    	SendClientMessage(plid,COR_VERDE,string);
				    	QtCerveja[plid]++;
				    	udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
						return 1;
					 }
                     else{
						 SendClientMessage(playerid, COR_VERMELHO, "Você não pode vende para você mesmo");
						 return 1;
						 }
					}
					else{
					    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado/logado!");
						return 1;
					}
				}
				else{
				    SendClientMessage(playerid, COR_VERMELHO, "Você está muito longe, chegue mais perto para entregar a bebida.");
					return 1;
				}
			}
		}
		if(Profissao[playerid] != BARMAN){
		    SendClientMessage(playerid, COR_VERMELHO, "Você não é Barman!");
			return 1;
		}
		return 1;
	}
	if(strcmp(cmd, "/sellbebida", true) == 0) {
	  if(Profissao[playerid] == BARMAN || Profissao[playerid] == VENDEDOR_LANCHE || Profissao[playerid] == ENTREGADOR_PIZZA){
		   new tmp[256];
		   new plid;
		   new bebida;
		   new distancia;
		   distancia = GetDistanceBetweenPlayers(playerid,plid);
		   tmp = strtok(cmdtext,idx);
		   plid = strval(tmp);
		   if(!strlen(tmp)){
		   SendClientMessage(playerid, COR_VERMELHO, "/sellbebida [id] [bebida");
		   return 1;
		   }
		   tmp = strtok(cmdtext,idx);
		   bebida = strval(tmp);
		   if(bebida < 0 || bebida > 5){
		   SendClientMessage(playerid, COR_VERMELHO, "Bebida inválida as bebidas são de 1 a 5");
		   return 1;
		   }
		   if(distancia < 10){
		   if(IsPlayerConnected(plid)){
		   if(plid != playerid){
		   SendClientMessage(playerid, COR_VERDE, "Bebida vendida com sucesso.");
		   Latas[plid] ++;
		   new msg[256];
		   format(msg,sizeof(msg), "%s lhe vendeu uma bebida: %s",PlayerName(playerid),BebidaName[bebida]);
		   SendClientMessage(plid, COR_VERDE,msg);
		   udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
		   return 1;
		   }
		   else{
			   SendClientMessage(playerid, COR_VERMELHO, "Você não pode vender bebida para você mesmo");
			   return 1;
			   }
		   }
		   else{
			   SendClientMessage(playerid, COR_VERMELHO, "Jogador não conectado/logado");
			   return 1;
			   }
		   }
		   else{
			   SendClientMessage(playerid, COR_VERMELHO, "Chegue mais perto para vender a bebida");
			   return 1;
			   }
		   }
		   else{
			   SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão");
			   return 1;
			   }
	}
//--------------------------- COMANDOS DE VENDEDOR DE LANCHES ---------------------//
	if(strcmp(cmd, "/selllanche", true) == 0) {
        if(Profissao[playerid] == VENDEDOR_LANCHE || IsPlayerAdmin(playerid)){
            new string[256];
			new tmp[256];
			new plid, lanche;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COR_VERMELHO, "/selllanche [id] [lanche]");
				return 1;
			}
		    plid = strval(tmp);
    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/selllanche [id] [lanche]");
				return 1;
			}
			lanche = strval(tmp);
			if(lanche < 1 || lanche > 7){
			    SendClientMessage(playerid, COR_VERMELHO, "Lanche Invalido, Os lanches são de 1 a 7.");
				return 1;
			}
			strval(tmp);
			if(GetPlayerMoney(plid) < 8){
	        SendClientMessage(playerid, COR_VERMELHO, "O Jogador não tem dinheiro em mãos.");
			return 1;
			}
			else{
			    if(GetDistanceBetweenPlayers(playerid, plid) <= 10){
					if(IsPlayerConnected(plid)){
					  if(plid != playerid){
					    Lanche[plid] = lanche;
						format(string, sizeof(string), "%s, %s", PlayerName(playerid),LancheName[lanche]);
			            SendClientMessage(plid, COR_VERDE, string);
			            SetPlayerHealth(plid,100);
			            GivePlayerMoney(plid,-8);
               			format(string, sizeof(string), "Você vendeu lanche para %s",PlayerName(plid));
			            SendClientMessage(playerid, COR_VERDE, string);
			            ApplyAnimation(playerid, "FOOD", "EAT_Burger", 3.00, 0, 0, 0, 0, 0);
			            GivePlayerMoney(playerid,8);
			            fome[plid] --;
			            udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
						return 1;
					  }
					  else{
						  SendClientMessage(playerid, COR_VERMELHO, "Você não pode vende para você mesmo");
						  return 1;
						  }
					}
					else{
					    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado/logado!");
						return 1;
					}
				}
				else{
				    SendClientMessage(playerid, COR_VERMELHO, "Você está muito longe, chegue mais perto para entregar a bebida.");
					return 1;
				}
			}
		}
		if(Profissao[playerid] != VENDEDOR_LANCHE){
		    SendClientMessage(playerid, COR_VERMELHO, "Você não é Vendedor de Lanches!");
			return 1;
		}
		return 1;
	}
    if(strcmp(cmd, "/vhotdog", true) == 0) {
     if(Profissao[playerid] == VENDEDOR_LANCHE || IsPlayerAdmin(playerid)){
	   new tmp[256];
	   new plid;
	   new esthd;
	   tmp = strtok(cmdtext,idx);
	   plid = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COR_VERMELHO, "/vhotdog [id] [1(prensado) ou 2(tradicional)]");
	   return 1;
	   }
	   esthd = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COR_VERMELHO, "/vhotdog [id] [1(prensado) ou 2(tradicional)");
	   return 1;
	   }
	   if(esthd > 0 && esthd < 3){
	   if(IsPlayerConnected(plid)){
	   if(plid != playerid){
	   new modelo = GetVehicleModel(GetPlayerVehicleID(playerid));
	   if(modelo == VEH_HOTDOG){
	   SendClientMessage(playerid, COR_VERDE, "Cachorro quente vendido");
	   new string[256];
	   format(string,sizeof(string),"%s",HotDogName[esthd]);
	   SendClientMessage(plid, COR_VERDE,string);
	   udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, COR_VERMELHO, "Você tem que estar em um veiculo de cachorro quente");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COR_VERMELHO, "Você não pode vender para si mesmo");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COR_VERMELHO, "Jogador não conectado/logado");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COR_VERMELHO, "Cachorro quente invalido! Os cachorros quentes só podem ser de 1 a 2");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão");
		   return 1;
		   }
    }
//------------------------- COMANDOS DE ENTREGADOR DE PIZZA -----------------------//
	if(strcmp(cmd, "/sellpizza", true) == 0) {
        if(Profissao[playerid] == ENTREGADOR_PIZZA || IsPlayerAdmin(playerid)){
            new string[256];
			new tmp[256];
			new plid, sabor;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COR_VERMELHO, "/sellpizza [id] [sabor]");
				return 1;
			}
		    plid = strval(tmp);
    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/sellpizza [id] [sabor]");
				return 1;
			}
			sabor = strval(tmp);
			if(sabor < 1 || sabor > 4){
			    SendClientMessage(playerid, COR_VERMELHO, "Sabor Invalido, Os sabores são de 1 a 4.");
				return 1;
			}
			strval(tmp);
			if(GetPlayerMoney(plid) < 15){
	        SendClientMessage(playerid, COR_VERMELHO, "O Jogador não tem dinheiro em mãos.");
			return 1;
			}
			else{
			    if(GetDistanceBetweenPlayers(playerid, plid) <= 20){
					if(IsPlayerConnected(plid)){
					  if(plid != playerid){
					  if(IsPlayerInAnyVehicle(playerid)){
                        new modelo = GetVehicleModel(GetPlayerVehicleID(playerid));
	                    if(modelo == VEH_PIZZABOY){
					    Pizza[plid] = sabor;
						format(string, sizeof(string), "%s te vendeu uma pizza de %s", PlayerName(playerid),PizzaName[sabor]);
			            SendClientMessage(plid, COR_VERDE, string);
			            SetPlayerHealth(plid,100);
			            GivePlayerMoney(plid,-15);
               			format(string, sizeof(string), "Você vendeu uma pizza de %s para %s", PizzaName[sabor],PlayerName(plid));
			            SendClientMessage(playerid, COR_VERDE, string);
			            ApplyAnimation(playerid, "FOOD", "EAT_Burger", 3.00, 0, 0, 0, 0, 0);
			            GivePlayerMoney(playerid,15);
			            fome[plid] --;
			            udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
						return 1;
					    }
					    else{
							SendClientMessage(playerid, COR_VERMELHO, "Você deve estar numa moto de entrega para usar esse comando");
							return 1;
							}
						}
					    else{
							SendClientMessage(playerid, COR_VERMELHO, "Você não esta em um veiculo.");
							return 1;
							}
						}
					    else{
							SendClientMessage(playerid, COR_VERMELHO, "Você não pode vender para você mesmo");
							return 1;
							}
					}
					else{
					    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado/logado!");
						return 1;
					}
				}
				else{
				    SendClientMessage(playerid, COR_VERMELHO, "Você está muito longe, chegue mais perto para entregar a bebida.");
					return 1;
				}
			}
		}
		if(Profissao[playerid] != ENTREGADOR_PIZZA){
		    SendClientMessage(playerid, COR_VERMELHO, "Você não é Sorveteiro!");
			return 1;
		}
		return 1;
	}

//---------------------------- COMANDOS DE SORVETEIRO ----------------------------//
	if(strcmp(cmd, "/sellsorvete", true) == 0) {
        if(Profissao[playerid] == SORVETEIRO || IsPlayerAdmin(playerid)){
            new string[256];
			new tmp[256];
			new plid, sabor;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COR_VERMELHO, "/sellsorvete [id] [sabor]");
				return 1;
			}
		    plid = strval(tmp);
    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/sellsorvete [id] [sabor]");
				return 1;
			}
			sabor = strval(tmp);
			if(sabor < 1 || sabor > 7){
			    SendClientMessage(playerid, COR_VERMELHO, "Sabor Invalido, Os sabores são de 1 a 7.");
				return 1;
			}
			strval(tmp);
			if(GetPlayerMoney(plid) < 5){
	        SendClientMessage(playerid, COR_VERMELHO, "O Jogador não tem dinheiro em mãos.");
			return 1;
			}
			else{
			    if(GetDistanceBetweenPlayers(playerid, plid) <= 20){
					if(IsPlayerConnected(plid)){
                      if(plid != playerid){
                      if(IsPlayerInAnyVehicle(playerid)){
                        new modelo = GetVehicleModel(GetPlayerVehicleID(playerid));
	                    if(modelo == VEH_MRWHOOPE){
	                    if(qtsorvete[playerid] > 0){
					    Sorvete[plid] = sabor;
						format(string, sizeof(string), "%s te vendeu um sorvete de %s", PlayerName(playerid),SaborName[sabor]);
			            SendClientMessage(plid, COR_VERDE, string);
			            SetPlayerHealth(plid,100);
			            GivePlayerMoney(plid,-5);
               			format(string, sizeof(string), "Você vendeu um sorvete de %s para %s", SaborName[sabor],PlayerName(plid));
			            SendClientMessage(playerid, COR_VERDE, string);
			            ApplyAnimation(plid, "FOOD", "EAT_Burger", 3.00, 0, 0, 0, 0, 0);
			            GivePlayerMoney(playerid,5);
			            fome[plid] --;
			            udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
						return 1;
				        }
				        else{
							SendClientMessage(playerid, COR_VERMELHO, "Você não possue nenhuma bola de sorvete vá na sorveteria buscar algumas");
							return 1;
							}
						}
				        else{
						  SendClientMessage(playerid, COR_VERMELHO, "Você tem que estar num carro de sorvetes para usar esse comando");
						  return 1;
						  }
					  }
					  else{
							SendClientMessage(playerid, COR_VERMELHO, "Você não esta em um veiculo.");
							return 1;
							}
					  }
				      else{
						  SendClientMessage(playerid, COR_VERMELHO, "Você não pode vender para você mesmo");
						  return 1;
						  }
					}
					else{
					    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado/logado!");
						return 1;
					}
				}
				else{
				    SendClientMessage(playerid, COR_VERMELHO, "Você está muito longe, chegue mais perto para entregar a bebida.");
					return 1;
				}
			}
		}
		if(Profissao[playerid] != SORVETEIRO){
		    SendClientMessage(playerid, COR_VERMELHO, "Você não é Sorveteiro!");
			return 1;
		}
		return 1;
	}
    if(strcmp(cmd, "/pegarsorvete", true) == 0) {
      if(Profissao[playerid] == SORVETEIRO || IsPlayerAdmin(playerid)){
		 new tmp[256];
		 new quant;
		 tmp = strtok(cmdtext,idx);
		 quant = strval(tmp);
		 if(!strlen(tmp)){
		 SendClientMessage(playerid, COR_VERMELHO, "/pegarsorvete [bolas]");
		 return 1;
		 }
		 if(qtsorvete[playerid] + quant <= 10 && quant <= 10){
		 if(AreaSorveteria[playerid] == 1){
		 if(GetPlayerMoney(playerid) >= quant*5){
		 qtsorvete[playerid] = qtsorvete[playerid] + quant;
		 GivePlayerMoney(playerid,quant*5);
		 new msg[256];
		 format(msg,sizeof(msg),"Você pegou mais %d Bolas de sorvete e pagou %d! agora va vende-las",quant,quant*5);
		 SendClientMessage(playerid, COR_VERDE,msg);
		 return 1;
		 }
		 else{
			 SendClientMessage(playerid, COR_VERMELHO, "Você não tem dinheiro! São $5 cada bola");
			 return 1;
			 }
		 }
		 else{
			 SendClientMessage(playerid, COR_VERMELHO, "Você não está na sorveteria");
			 return 1;
			 }
		 }
		 else{
			 SendClientMessage(playerid, COR_VERMELHO, "Você não pode ter mais que isso de bolas contando com o que você ja tem");
			 return 1;
			 }
		 }
		 else{
			 SendClientMessage(playerid, COR_VERMELHO, "Você não é Sorveteiro");
			 return 1;
			 }
	}
//--------------------------------- DROGAS E BEBIDAS -----------------------------//
	if(strcmp(cmd, "/beber", true) == 0) {
	    new msg[256];
	    new tmp[256];
	    new quantia;
	    tmp = strtok(cmdtext, idx);
     	if(!strlen(tmp)){
      		SendClientMessage(playerid, COR_VERMELHO,"/beber [latas]");
			return 1;
		}
		quantia = strval(tmp);
		if(quantia > QtCerveja[playerid]){
		    SendClientMessage(playerid, COR_VERMELHO, "Você não tem todas estas latas.");
			return 1;
		}
    	if(QtCerveja[playerid] == 0){
	       	SendClientMessage(playerid, COR_VERMELHO, "Você não tem nenhuma lata, como poderá beber?");
	       	return 1;
		} else {
		    QtCerveja[playerid] = quantia;
		    Bebida[playerid] = quantia;
		    ApplyAnimation(playerid,"PED", "WALK_DRUNK",4.0,1,1,1,1,1);
			format(msg,sizeof(msg),"Você tomou %d latas de cerveja.",quantia);
			SendClientMessage(playerid, COR_VERDE, msg);
			QtCerveja[playerid]--;
			Bebida[playerid]++;
			return 1;
		}
	}
	
	if(strcmp(cmd, "/fumar", true) == 0) {
	    new msg[256];
	    new tmp[256];
	    new quantia;
	    tmp = strtok(cmdtext, idx);
     	if(!strlen(tmp)){
      		SendClientMessage(playerid, COR_VERMELHO,"/fumar [cigarros]");
			return 1;
		}
    	if(QtMaconha[playerid] == 0){
	       	SendClientMessage(playerid, COR_VERMELHO, "Você não tem nenhum cigarro, como poderá fumar?");
	       	return 1;
		} else {
		    QtMaconha[playerid] = quantia;
		    ApplyAnimation(playerid,"SMOKING", "M_smklean_loop", 4.0, 1, 1, 1, 1, 1);
			format(msg,sizeof(msg),"Você fumou %d cigarro de maconha.",quantia);
			SendClientMessage(playerid, COR_VERDE, msg);
			QtMaconha[playerid]--;
			Maconha[playerid]++;
			return 1;
		}
	}
	
	if(strcmp(cmd, "/cherar", true) == 0) {
	    new msg[256];
	    new tmp[256];
	    new quantia;
	    tmp = strtok(cmdtext, idx);
     	if(!strlen(tmp)){
      		SendClientMessage(playerid, COR_VERMELHO,"/cherar [gramas]");
			return 1;
		}
    	if(QtCocaina[playerid] == 0){
	       	SendClientMessage(playerid, COR_VERMELHO, "Você não cocaina, como poderá cherar?");
	       	return 1;
		} else {
		    QtCocaina[playerid] = quantia;
		   	ApplyAnimation(playerid,"CRACK", "crckdeth1", 4.0, 1, 1, 1, 1, 1);
			format(msg,sizeof(msg),"Você cherou %d gramas de cocaina.",quantia);
			SendClientMessage(playerid, COR_VERDE, msg);
			QtCocaina[playerid]--;
			Cocaina[playerid]++;
			return 1;
		}
	}
//------------------------------- COMANDOS DE TRANSPORTE DE VALORES ----------------------------------//
	if(strcmp(cmd, "/pegarvalores", true) == 0) {
	 if(Profissao[playerid] == TRANSPORTE_VALORES || IsPlayerAdmin(playerid)){
	   new modelo = GetVehicleModel(GetPlayerVehicleID(playerid));
	   if(modelo == VEH_CARROFORTE){
	   if(valorespegos[GetPlayerVehicleID(playerid)] == 0){
	   valorespegos[GetPlayerVehicleID(playerid)] = 1;
	   new valor = random(5);
	   if(bolsadevalores[playerid] == 0){
	   if(IsPlayerInAnyVehicle(playerid)){
	   if(valor == 0){
	   SendClientMessage(playerid, COR_BRANCO, "Há nessa bolsa R$500 agora entregue ela ao banco");
	   bolsadevalores[playerid] = 500;
	   return 1;
	   }
	   else if(valor == 1){
	   SendClientMessage(playerid, COR_BRANCO, "Há nessa bolsa R$1000 agora entregue ela ao banco");
	   bolsadevalores[playerid] = 1000;
	   return 1;
	   }
	   else if(valor == 2){
	   SendClientMessage(playerid, COR_BRANCO, "Há nessa bolsa R$1500 agora entregue ela ao banco");
	   bolsadevalores[playerid] = 1500;
	   return 1;
	   }
	   else if(valor == 3){
	   SendClientMessage(playerid, COR_BRANCO, "Há nessa bolsa R$1750 agora entregue ela ao banco");
	   bolsadevalores[playerid] = 1750;
	   return 1;
	   }
	   else if(valor == 4){
	   SendClientMessage(playerid, COR_BRANCO, "Há nessa bolsa R$2000 agora entregue ela ao banco");
	   bolsadevalores[playerid] = 2000;
	   return 1;
	   }
	   else if(valor == 5){
	   SendClientMessage(playerid, COR_BRANCO, "Há nessa bolsa R$2500 agora entregue ela ao banco");
	   bolsadevalores[playerid] = 2500;
	   return 1;
	   }
	}
	   else{
		   SendClientMessage(playerid, COR_VERMELHO, "Você não esta em um veiculo");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COR_VERMELHO, "Você já possue uma bolsa de valores! Entregue essa ao banco primeiro.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COR_VERMELHO, "Já foi pega a bolsa de valores desse veiculo!.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COR_VERMELHO, "Você tem que estar em um carro forte.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão.");
		   return 1;
		   }
    }
    if(strcmp(cmd, "/verbolsa", true) == 0) {
      if(Profissao[playerid] == TRANSPORTE_VALORES || IsPlayerAdmin(playerid)){
	   if(bolsadevalores[playerid] != 0){
	   new string[256];
	   format(string,sizeof(string),"Você possue %d em sua bolsa de valores!",bolsadevalores[playerid]);
	   SendClientMessage(playerid, COR_BRANCO, string);
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, COR_VERMELHO, "Você não possue bolsa de valores.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão.");
		   return 1;
		   }
	}
    if(strcmp(cmd, "/entregarvalores", true) == 0) {
	 if(Profissao[playerid] == TRANSPORTE_VALORES || IsPlayerAdmin(playerid)){
	  if(IsPlayerInAnyVehicle(playerid)){
      new modelo = GetVehicleModel(GetPlayerVehicleID(playerid));
      if(modelo == VEH_CARROFORTE){
	  if(bolsadevalores[playerid] != 0){
	  SendClientMessage(playerid, COR_VERDE, "Bolsa de valores entregue você recebeu 25 por cento dela");
	  GivePlayerMoney(playerid,bolsadevalores[playerid]/4);
	  bolsadevalores[playerid] = 0;
	  udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
	  return 1;
	  }
	  else{
		  SendClientMessage(playerid, COR_VERMELHO, "Você não possue uma bolsa de valores.");
		  return 1;
		  }
	  }
	  else{
		  SendClientMessage(playerid, COR_VERMELHO, "Você tem que estar em um carro forte.");
		  return 1;
		  }
	  }
	  else{
		  SendClientMessage(playerid, COR_VERMELHO, "Você não está em um veiculo.");
		  return 1;
		  }
	  }
	  else{
		  SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão.");
		  return 1;
		  }
    }
//------------------------------- COMANDOS DE TRAFICANTE E LIDER DE TRAFICO --------------------------//
	if(strcmp(cmd,"/meusbags",true) == 0) {
	  if(Profissao[playerid] == TRAFICANTE || IsPlayerAdmin(playerid)){
	   if(bagulho[playerid] > 0){
	   new string[256];
	   format(string,256,"Você possue %d bagulhos",bagulho[playerid]);
	   SendClientMessage(playerid, COR_JUIZ, string);
	   return 1;
	   }
	   else{
		   SendClientMessage(playerid, COR_VERMELHO, "Você não possue nenhum bagulho.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão.");
		   return 1;
		   }
    }
    if(strcmp(cmd,"/comprarbagulho",true) == 0){
	  if(Profissao[playerid] == TRAFICANTE || IsPlayerAdmin(playerid)){
	   new tmp[256];
	   new quant;
	   tmp = strtok(cmdtext,idx);
	   quant = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COR_VERMELHO, "/comprarbagulho [quantia]");
	   return 1;
	   }
	   if(AreaTrafico[playerid] == 0){
	   SendClientMessage(playerid, COR_VERMELHO, "Você tem que estar na area de tráfico.");
	   return 1;
	   }
	   if(bagulho[playerid] + quant > 15){
	   SendClientMessage(playerid, COR_VERMELHO, "Você já possue bagulho suficiente para carregar.");
	   return 1;
	   }
	   if(quant == 0){
	   SendClientMessage(playerid, COR_VERMELHO, "Você poderia invés de comprar 0 bagulhos nem ter vindo aqui.");
	   return 1;
	   }
	   if(GetPlayerMoney(playerid) < quant*15){
	   SendClientMessage(playerid, COR_VERMELHO, "Você não possue dinheiro.");
	   return 1;
	   }
	   else{
		   bagulho[playerid] = bagulho[playerid] + quant;
		   GivePlayerMoney(playerid,0-15*quant);
		   new string[256];
		   format(string,sizeof(string),"Você comprou %d bagulhos.",quant);
		   SendClientMessage(playerid, COR_JUIZ, string);
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão.");
		   return 1;
		   }
	}
	if(strcmp(cmd,"/selldroga",true) == 0) {
	  if(Profissao[playerid] == TRAFICANTE || IsPlayerAdmin(playerid)){
	   new tmp[256];
	   new plid;
	   new drogaid;
	   new doses;
	   tmp = strtok(cmdtext,idx);
	   plid = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COR_VERMELHO, "/selldroga [id] [id da droga] [doses]");
	   return 1;
	   }
	   tmp = strtok(cmdtext,idx);
	   drogaid = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COR_VERMELHO, "/selldroga [id] [id da droga] [doses]");
	   return 1;
	   }
	   tmp = strtok(cmdtext,idx);
	   doses = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COR_VERMELHO, "/selldroga [id] [id da droga] [doses]");
	   return 1;
	   }
	   if(!IsPlayerConnected(plid)){
	   SendClientMessage(playerid, COR_VERMELHO, "Jogador não conectado/logado.");
	   return 1;
	   }
	   if(drogaid < 0 || drogaid > 4){
	   SendClientMessage(playerid, COR_VERMELHO, "Droga inválida. As drogas são de 1 a 4.");
	   return 1;
	   }
	   if(doses < 0 || doses > 7){
	   SendClientMessage(playerid, COR_VERMELHO, "Doses de 1 a 7.");
	   return 1;
	   }
	   if(bagulho[playerid] < doses){
	   SendClientMessage(playerid, COR_VERMELHO, "Você não possue bagulho.");
	   return 1;
	   }
	   else{
	   if(drogaid == 1)
	   {
	   Maconha[plid] = Maconha[plid] + doses;
	   SendClientMessage(playerid, COR_JUIZ, "Maconha vendida.");
	   new msg[256];
	   format(msg,sizeof(msg),"Foram adicionados %d doses de maconha em seu sangue.",doses);
	   SendClientMessage(plid, COR_JUIZ,msg);
	   return 1;
	   }
	   else if(drogaid == 2)
	   {
	   Cocaina[plid] = Cocaina[plid] + doses;
	   SendClientMessage(playerid, COR_JUIZ, "Cocaína vendida.");
	   new msg[256];
	   format(msg,sizeof(msg),"Foram adicionados %d doses de cocaína em seu sangue.",doses);
	   SendClientMessage(plid, COR_JUIZ,msg);
	   return 1;
	   }
	   else if(drogaid == 3)
	   {
	   Heroina[plid] = Heroina[plid] + doses;
	   SendClientMessage(playerid, COR_JUIZ, "Heroína vendida.");
	   new msg[256];
	   format(msg,sizeof(msg),"Foram adicionados %d doses de heroína em seu sangue.",doses);
	   SendClientMessage(plid, COR_JUIZ,msg);
	   return 1;
	   }
	   else if(drogaid == 4)
	   {
	   Crack[plid] = Crack[plid] + doses;
	   SendClientMessage(playerid, COR_JUIZ, "Crack vendido.");
	   new msg[256];
	   format(msg,sizeof(msg),"Foram adicionados %d doses de crack em seu sangue.",doses);
	   SendClientMessage(plid, COR_JUIZ,msg);
	   return 1;
	   }
	}
 }
	    else{
            SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão.");
		    return 1;
		    }
	}
    if(strcmp(cmd, "/pdrogas", true) == 0) {
	  if(Profissao[playerid] == LIDER_DE_TRAFICO){
	  if(bagulho[playerid] <= 4){
	  if(IsPlayerInAnyVehicle(playerid)){
	  if(drogasplantadas[GetPlayerVehicleID(playerid)] == 0){
	  bagulho[playerid] = bagulho[playerid] - 4;
	  drogasplantadas[GetPlayerVehicleID(playerid)] = 1;
	  udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
	  return 1;
	  }
	  else{
		  SendClientMessage(playerid, COR_VERMELHO, "Este carro ja tem drogas plantadas");
		  return 1;
		  }
	  }
	  else{
		  SendClientMessage(playerid, COR_VERMELHO, "Você não está em um veiculo");
		  return 1;
		  }
	  }
	  else{
		  SendClientMessage(playerid, COR_VERMELHO, "Você não possue bagulho suficiente para plantar drogas num veiculo");
		  return 1;
		  }
	  }
	  else{
		  SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão");
		  return 1;
		  }
	}
//-------------------------------------- PEDIDOS -----------------------------------//
	if(strcmp(cmd,"/gorjeta",true)==0){
        if(Profissao[playerid] == TAXISTA || Profissao[playerid] == ENTREGADOR_PIZZA || Profissao[playerid] == VENDEDOR_LANCHE){
	    	new tmp[256];
	    	new msg[256];
            new plid;
	    	strmid(tmp,cmdtext,8,strlen(cmdtext));
            plid = strval(tmp);
	    	if(!strlen(tmp)) {
	        	SendClientMessage(playerid,COR_VERMELHO,"Uso: /gorjeta [id]");
		    	return 1;
			    }
            if(IsPlayerConnected(plid)){
				format(msg,sizeof(msg),"%s está lhe pedindo gorjeta.", PlayerName(playerid));
			    SendClientMessage(plid, COR_VERDE,msg);
       		}
			else{
			    SendClientMessage(playerid, COR_VERMELHO, "ID inválido");
				return 1;
			}
		}
		else{
   			SendClientMessage(playerid, COR_VERMELHO, "Você não é Taxista/Entregador de Pizza/Vendedor de Lanches.");
			return 1;
		}
	}

	if(strcmp(cmd,"/almento",true)==0){
        if(Profissao[playerid] == MOTORISTA_PARTICULAR || Profissao[playerid] == SEGURANÇA){
	    	new tmp[256];
	    	new msg[256];
            new plid;
	    	strmid(tmp,cmdtext,8,strlen(cmdtext));
            plid = strval(tmp);
	    	if(!strlen(tmp)) {
	        	SendClientMessage(playerid,COR_VERMELHO,"Uso: /almento [id]");
		    	return 1;
			    }
            if(IsPlayerConnected(plid)){
				format(msg,sizeof(msg),"%s está lhe pedindo almento.", PlayerName(playerid));
			    SendClientMessage(plid, COR_VERDE,msg);
       		}
			else{
			    SendClientMessage(playerid, COR_VERMELHO, "ID inválido");
				return 1;
			}
		}
		else{
    		SendClientMessage(playerid, COR_VERMELHO, "Você não é Motorista Particular/Segurança.");
			return 1;
		}
	}
	
	if(strcmp(cmd,"/esmola",true)==0){
        if(Profissao[playerid] == MENDIGO || Profissao[playerid] == SEGURANÇA){
	    	new tmp[256];
	    	new msg[256];
            new plid;
	    	strmid(tmp,cmdtext,8,strlen(cmdtext));
            plid = strval(tmp);
	    	if(!strlen(tmp)) {
	        	SendClientMessage(playerid,COR_VERMELHO,"Uso: /esmola [id]");
		    	return 1;
			    }
            if(IsPlayerConnected(plid)){
				format(msg,sizeof(msg),"%s está lhe pedindo aesmola.", PlayerName(playerid));
			    SendClientMessage(plid, COR_VERDE,msg);
       		}
			else{
			    SendClientMessage(playerid, COR_VERMELHO, "ID inválido");
				return 1;
			}
		}
		else{
    		SendClientMessage(playerid, COR_VERMELHO, "Você não é Mendigo.");
			return 1;
		}
	}
	
//------------------------------- FIANÇA E RESGATE --------------------------------//

	if(strcmp(cmd,"/resgate",true) == 0){
    	if(Sequestro[playerid] == 0){
			SendClientMessage(playerid,COR_VERMELHO,"Você não está sequestrado!");
			return 1;
			} else {
			if(Sequestro[playerid] == 1){
			SendClientMessage(playerid,COR_VERDE,"Você pagou resgate e foi solto.");
			GivePlayerMoney(playerid,-500);
			SetPlayerPos(playerid, -2080.8171,-2449.7710,30.6250);
			TogglePlayerControllable(playerid, 1);
			Sequestro[playerid] = 0;
			return 1;
			}
		}
	}
	
//----------------------------------- DIVERSOS ------------------------------------//
    if(strcmp(cmd,"/entregarlata",true)==0){
	   new tmp[256];
	   new plid;
	   new distance;
	   tmp = strtok(cmdtext,idx);
	   plid = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COR_VERMELHO, "/entregarlata [id]");
	   return 1;
	   }
	   distance = GetDistanceBetweenPlayers(playerid,plid);
	   if(distance <= 10){
	   if(Profissao[plid] == MENDIGO || Profissao[plid] == SERVICO_RECICLAGEM || IsPlayerAdmin(plid)){
	   if(IsPlayerConnected(plid)){
	   if(Latas[playerid] > 1){
	   Latas[plid] ++;
	   Latas[playerid] --;
	   SendClientMessage(playerid, COR_VERDE, "Você acabou de colaborar na luta contra a poluição! Está latinha foi um bom arrecadamento.");
	   new msg[256];
	   format(msg,sizeof(msg),"%s lhe entregou uma latinha!",PlayerName(playerid));
	   SendClientMessage(plid, COR_VERDE,msg);
	   return 1;
	   }
	   else{
            SendClientMessage(playerid, COR_VERMELHO, "Você não possue latinha");
	        return 1;
			}
	   }
	   else{
            SendClientMessage(playerid, COR_VERMELHO, "Jogador não conectado/logado");
	        return 1;
			}
	   }
	   else{
            SendClientMessage(playerid, COR_VERMELHO, "Você só pode entregar latinhas a mendingos e a trabalhadores do serviço de reciclagens");
	        return 1;
			}
	   }
	   else{
            SendClientMessage(playerid, COR_VERMELHO, "Você esta muito longe! Chegue mais perto");
	        return 1;
			}
    }
	if(strcmp(cmd, "/tomarsorvete", true) == 0) {
	   new tmp[256];
	   new sabor;
	   tmp = strtok(cmdtext,idx);
	   sabor = strval(tmp);
	   if(!strlen(tmp)){
	   SendClientMessage(playerid, COR_VERMELHO, "/tomarsorvete [sabor]");
	   return 1;
	   }
	   if(AreaSorveteria[playerid] == 1){
	   if(sabor >= 1 || sabor <= 7){
	   new string[256];
	   format(string, sizeof(string), "Você recebeu um sorvete de %s! Aproveite",SaborName[sabor]);
       SendClientMessage(playerid, COR_VERDE, string);
       GivePlayerMoney(playerid,0-5);
       ApplyAnimation(playerid, "FOOD", "EAT_Burger", 3.00, 0, 0, 0, 0, 0);
       fome[playerid] --;
       return 1;
       }
       else{
		   SendClientMessage(playerid, COR_VERMELHO, "Sabor invalido! Os sabores são de 1 a 7");
		   return 1;
		   }
	   }
       else{
		   SendClientMessage(playerid, COR_VERMELHO, "Você não está na sorveteria");
		   return 1;
		   }
	}
	if(strcmp(cmd, "/hotel", true) == 0) {
	   if(AreaHotel[playerid] == 1){
	   if(GetPlayerMoney(playerid) >= 1500){
       new Float:X, Float:Y, Float:Z;
       new Float:ang;
	   GetPlayerPos(playerid, X, Y, Z);
	   GetPlayerFacingAngle(playerid,ang);
	   udb_setPosition(PlayerName(playerid), X, Y, Z);
       udb_setAng(PlayerName(playerid),ang);
       GivePlayerMoney(playerid,0-1500);
       SendClientMessage(playerid, COR_BRANCO, "Você se hospedou em um hotel. Ele poderá ser útil até você comprar uma casa");
       return 1;
       }
       else{
		   SendClientMessage(playerid, COR_VERMELHO,"Você não possue dinheiro para se hospedar.");
		   return 1;
		   }
	   }
	   else{
		   SendClientMessage(playerid, COR_VERMELHO, "Você não esta em um hotel.");
		   return 1;
		   }
	}
	


	if(strcmp(cmd,"/rcbaron",true)==0){
    	if(IsPlayerAdmin(playerid)){
    	    new Float:X,Float:Y,Float:Z,Float:ang;
    	    GetPlayerPos(playerid,X,Y,Z);
			GetPlayerFacingAngle(playerid,ang);
    	    Veiculo[playerid] = CreateVehicle(464,X,Y,Z,ang,3,3,90000);
    	    PutPlayerInVehicle(playerid,Veiculo[playerid],0);
    	    SendClientMessage(playerid,COR_VERDE,"Para você brincar! xD");
    	    printf("%s pegou um rc baron",PlayerName(playerid));
    	    return 1;
		} else {
    		SendClientMessage(playerid,COR_VERMELHO,"Apenas admins!");
			return 1;
		}
	}

	if(strcmp(cmd,"/rcraider",true)==0){
 		new Float:X,Float:Y,Float:Z,Float:ang;
   		GetPlayerPos(playerid,X,Y,Z);
		GetPlayerFacingAngle(playerid,ang);
  		Veiculo[playerid] = CreateVehicle(465,X,Y,Z,ang,3,3,90000);
	   	PutPlayerInVehicle(playerid,Veiculo[playerid],0);
	    SendClientMessage(playerid,COR_VERDE,"Para você brincar! xD");
	    printf("%s pegou um rc raider",PlayerName(playerid));
		return 1;
	}

	if(strcmp(cmd,"/rcbandit",true)==0){
 		new Float:X,Float:Y,Float:Z,Float:ang;
   	    GetPlayerPos(playerid,X,Y,Z);
		GetPlayerFacingAngle(playerid,ang);
        Veiculo[playerid] = CreateVehicle(441,X,Y,Z,ang,3,3,90000);
        PutPlayerInVehicle(playerid,Veiculo[playerid],0);
        SendClientMessage(playerid,COR_VERDE,"Para você brincar! xD");
        printf("%s pegou um rc bandit",PlayerName(playerid));
        return 1;
	}

	if(strcmp(cmd,"/rcglobim",true)==0){
    	new Float:X,Float:Y,Float:Z,Float:ang;
	    GetPlayerPos(playerid,X,Y,Z);
		GetPlayerFacingAngle(playerid,ang);
        Veiculo[playerid] = CreateVehicle(501,X,Y,Z,ang,3,3,90000);
   	    PutPlayerInVehicle(playerid,Veiculo[playerid],0);
        SendClientMessage(playerid,COR_VERDE,"Para você brincar! xD");
        printf("%s pegou um rc globim",PlayerName(playerid));
        return 1;
	}
	if(strcmp(cmd,"/rctiger",true)==0){
    	if(IsPlayerAdmin(playerid)){
    	    new Float:X,Float:Y,Float:Z,Float:ang;
    	    GetPlayerPos(playerid,X,Y,Z);
			GetPlayerFacingAngle(playerid,ang);
    	    Veiculo[playerid] = CreateVehicle(564,X,Y,Z,ang,3,3,90000);
    	    PutPlayerInVehicle(playerid,Veiculo[playerid],0);
    	    SendClientMessage(playerid,COR_VERDE,"Para você brincar! xD");
            printf("%s pegou um rc tiger",PlayerName(playerid));
    	    return 1;
		} else {
    		SendClientMessage(playerid,COR_VERMELHO,"Apenas admins!");
			return 1;
		}
	}
	if(strcmp(cmd,"/rccam",true)==0){
    	if(IsPlayerAdmin(playerid)){
    	    new Float:X,Float:Y,Float:Z,Float:ang;
    	    GetPlayerPos(playerid,X,Y,Z);
			GetPlayerFacingAngle(playerid,ang);
    	    Veiculo[playerid] = CreateVehicle(594,X,Y,Z,ang,3,3,90000);
    	    PutPlayerInVehicle(playerid,Veiculo[playerid],0);
    	    SendClientMessage(playerid,COR_VERDE,"Para você brincar! xD");
    	    printf("%s pegou um rc cam",PlayerName(playerid));
    	    return 1;
		} else {
    		SendClientMessage(playerid,COR_VERMELHO,"Apenas admins!");
			return 1;
		}
	}

	if(strcmp(cmd,"/monstermpa",true)==0 && IsPlayerAdmin(playerid)){
        new Float:X,Float:Y,Float:Z,Float:ang;
        GetPlayerPos(playerid,X,Y,Z);
		GetPlayerFacingAngle(playerid,ang);
   	    Veiculo[playerid] = CreateVehicle(444,X,Y,Z,ang,3,3,1000);
        PutPlayerInVehicle(playerid,Veiculo[playerid],0);
     	SendClientMessage(playerid,COR_BRANCO,"Você fez o cheat do monster!");
     	printf("%s fez o cheat do monster",PlayerName(playerid));
   		return 1;
	}

	if(strcmp(cmd,"/vidempa",true)==0 && IsPlayerAdmin(playerid)){
 		SetPlayerHealth(playerid, 100);
 		SetVehicleHealth(GetPlayerVehicleID(playerid), 1000);
   		GivePlayerMoney(playerid, 250000);
	    SendClientMessage(playerid,COR_BRANCO,"Você fez o cheat de vida e dinheiro!");
	    printf("%s fez o cheat de vida e dinheiro",PlayerName(playerid));
		return 1;
	}
	
	if(strcmp(cmd,"/trem",true)==0){
    	if(IsPlayerAdmin(playerid)){
    	    new Float:X,Float:Y,Float:Z,Float:ang;
    	    GetPlayerPos(playerid,X,Y,Z);
			GetPlayerFacingAngle(playerid,ang);
    	    Veiculo[playerid] = CreateVehicle(538,X,Y,Z,ang,3,3,90000);
    	    PutPlayerInVehicle(playerid,Veiculo[playerid],0);
    	    SendClientMessage(playerid,COR_VERDE,"Agora você pode andar de trem!");
    	    printf("%s fez um trem",PlayerName(playerid));
    	    return 1;
		} else {
    		SendClientMessage(playerid,COR_VERMELHO,"Apenas admins!");
			return 1;
		}
	}
	
	if(strcmp(cmd,"/bonde",true)==0){
    	if(IsPlayerAdmin(playerid)){
    	    new Float:X,Float:Y,Float:Z,Float:ang;
    	    GetPlayerPos(playerid,X,Y,Z);
			GetPlayerFacingAngle(playerid,ang);
    	    Veiculo[playerid] = CreateVehicle(449,X,Y,Z,ang,3,3,90000);
    	    PutPlayerInVehicle(playerid,Veiculo[playerid],0);
    	    SendClientMessage(playerid,COR_VERDE,"Belo Bonde! xD");
    	    printf("%s fez um bonde",PlayerName(playerid));
    	    return 1;
		} else {
    		SendClientMessage(playerid,COR_VERMELHO,"Apenas admins!");
			return 1;
		}
	}

	if(strcmp(cmd, "/sair", true) == 0) {
		if(stopaluguel[playerid] == 1){
			if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER){
				RemovePlayerFromVehicle(playerid);
				TogglePlayerControllable(playerid, 1);
				return 1;
			}
			else{
				SendClientMessage(playerid, COR_VERMELHO, "Você precisa estar em um veículo para usar este comando.");
				return 1;
			}
		}
    	else{
			SendClientMessage(playerid, COR_VERMELHO, "Você está paralisado não por estar em um carro de aluguel então não poderá usar esse comando.");
			return 1;
		}
	}
	
	
	if (strcmp(cmd, "/say", true)==0){
		new tmp[256];
		new string[256];
	    strmid(tmp, cmdtext, 4, strlen(cmdtext));
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COR_VERMELHO, "/say [texto]");
			return 1;
		}
		else{
		    for(new i=0; i<MAX_PLAYERS; i++){
		        if(GetDistanceBetweenPlayers(playerid, i) < 10){
					format(string, sizeof(string), "%s: %s", PlayerName(playerid), tmp);
					SendClientMessage(i, COR_CINZA, string);
					SendClientMessage(playerid, COR_CINZA, string);
					return 1;
				}
			}
			return 1;
		}
	}
	
	if(strcmp(cmd, "/apostar", true)==0){
		new tmp[256];
		new val;
		tmp = strtok(cmdtext,idx);
		val = strval(tmp);
		if(!strlen(tmp)){
		SendClientMessage(playerid, COR_BRANCO, "/apostar [numero]");
		return 1;
		}
		if(AreaBanco[playerid] == 1){
		if(aposta[playerid] == false){
		if(val <= 20){
		if(GetPlayerMoney(playerid) >= 100){
		numeroapostado[playerid] = val;
		aposta[playerid] = true;
		GivePlayerMoney(playerid,0-100);
		moneyloteria = moneyloteria + 100;
		new string[256];
		format(string,sizeof(string),"Você apostou no número %d! Boa sorte.",val);
		SendClientMessage(playerid, COR_JUIZ,string);
		return 1;
		}
		else{
			SendClientMessage(playerid, COR_VERMELHO, "Você não possue $100 para apostar");
			return 1;
			}
		}
		else{
			SendClientMessage(playerid, COR_VERMELHO, "Número Invalido! Números de 1 a 20");
			return 1;
			}
		}
		else{
			SendClientMessage(playerid, COR_VERMELHO, "Você ja apostou! Espere o sorteio para apostar novamente");
			return 1;
			}
		}
		else{
			SendClientMessage(playerid, COR_VERMELHO, "Você tem que estar no banco para apostar");
			return 1;
			}
	}
	if(strcmp(cmd, "/guinchar", true)==0){
		new tmp[256];
		new car;
		new plid;
		new distancia;
		distancia = GetDistanceBetweenPlayers(playerid,plid);
		tmp = strtok(cmdtext,idx);
		plid = strval(tmp);
		if(!strlen(tmp)){
		SendClientMessage(playerid, COR_BRANCO, "/guinchar [id]");
		return 1;
		}
		car = GetPlayerVehicleID(plid);
		new modelo;
		cGetVehicleModelID(GetPlayerVehicleID(playerid),modelo);
		if(modelo == VEH_REBOQUE){
		if(IsPlayerInVehicle(plid,car)){
		if(distancia < 5){
		GetVehicleTrailer(GetPlayerVehicleID(playerid));
		AttachTrailerToVehicle(GetPlayerVehicleID(playerid),car);
		SendClientMessage(playerid, COR_MECANICO, "Guinchado com sucesso");
		SendClientMessage(plid, COR_MECANICO, "Seu carro foi guinchado");
		return 1;
		}
		else{
			SendClientMessage(playerid, COR_MECANICO, "Chegue mais perto");
			return 1;
			}
		}
		else{
			SendClientMessage(playerid, COR_MECANICO, "O jogador não está num veiculo");
			return 1;
			}
		}
		else{
			SendClientMessage(playerid, COR_MECANICO, "Você tem que estar num carro guincho");
			return 1;
		}
	}
	
	if(strcmp(cmd, "/irtrabalho", true) == 0) {
		if(Profissao[playerid] == DESEMPREGADO) {
			SetPlayerColor(playerid, COR_DESEMPREGADO); // Cinza
			return 1;
		}
		else if(Profissao[playerid] == ENTREGADOR_PIZZA) {
			SetPlayerColor(playerid, COR_ENTREGADOR_PIZZA); // Beje
			SetPlayerPos(playerid, -1805.1130,948.6368,24.8906);
			SetPlayerSkin(playerid, 155);
			udb_setSkin(PlayerName(playerid), 155);
			GameTextForPlayer(playerid, "~y~Entregador de Pizza",1500,4);
			return 1;
		}
		else if(Profissao[playerid] == BARMAN) {
			SetPlayerColor(playerid, COR_BARMAN); // Bege
			SetPlayerPos(playerid, -2244.1035,-89.8179,35.3203);
			SetPlayerSkin(playerid, 240);
			udb_setSkin(PlayerName(playerid), 240);
			GameTextForPlayer(playerid, "~y~Barman",1500,4);
			return 1;
		}
		else if(Profissao[playerid] == SORVETEIRO) {
			SetPlayerColor(playerid, COR_SORVETEIRO); // Bege
			SetPlayerPos(playerid, -2097.6360,-2348.1455,30.6250);
			GameTextForPlayer(playerid, "~y~Sorveteiro",1500,4);
			return 1;
		}
   		else if(Profissao[playerid] == VENDEDOR_LANCHE) {
			SetPlayerColor(playerid, COR_VENDEDOR_LANCHES); // Bege
			SetPlayerPos(playerid, -2333.7896,-167.2186,35.5547);
			GameTextForPlayer(playerid, "~y~Vendedor de Lanches",1500,4);
			return 1;
			}
		else if(Profissao[playerid] == PARAMEDICO) {
			SetPlayerColor(playerid, COR_PARAMEDICO); // Gold
			SetPlayerPos(playerid, -2620.2874,629.6313,14.4531);
			SetPlayerSkin(playerid, 70);
			udb_setSkin(PlayerName(playerid), 70);
			GameTextForPlayer(playerid, "~y~Paramedico",1500,4);
			return 1;
   		}
   		else if(Profissao[playerid] == INSTRUTOR_DE_DIRECAO) {
			SetPlayerColor(playerid, COR_INSTRUTOR); // Vermelho Claro
			SetPlayerPos(playerid, -2026.2343,-98.7060,35.1641);
			GameTextForPlayer(playerid, "~y~Instrutor de Direcao",1500,4);
			return 1;
		}
		else if(Profissao[playerid] == FRENTISTA) {
			SetPlayerColor(playerid, COR_FRENTISTA); // Cinza
			SetPlayerPos(playerid, -1675.9708,431.7278,7.1797);
			GameTextForPlayer(playerid, "~y~Frentista",1500,4);
			return 1;
		}
		else if(Profissao[playerid] == TAXISTA) {
			SetPlayerColor(playerid, COR_TAXISTA); // Amarelo
			SetPlayerPos(playerid, -1754.8579,961.1520,24.8828);
			GameTextForPlayer(playerid, "~y~Taxista",1500,4);
			return 1;
		}
		else if(Profissao[playerid] == MOTO_TAXI) {
			SetPlayerColor(playerid, COR_TAXISTA); // Amarelo
			SetPlayerPos(playerid, -1754.8579,961.1520,24.8828);
			GameTextForPlayer(playerid, "~y~Moto-Taxi",1500,4);
			return 1;
		}
		else if(Profissao[playerid] == TAXI_AEREO) {
			SetPlayerColor(playerid, COR_TAXI_AEREO); // Amarelo
			SetPlayerPos(playerid, -1754.8579,961.1520,24.8828);
			GameTextForPlayer(playerid, "~y~Taxi Aereo",1500,4);
			return 1;
		}
		else if(Profissao[playerid] == SEQUESTRADOR) {
			SetPlayerColor(playerid, COR_SEQUESTRADOR); // Amarelo
			GameTextForPlayer(playerid, "~y~Sequestrador",1500,4);
			return 1;
		}
		else if(Profissao[playerid] == ASSASSINO) {
			SetPlayerColor(playerid, COR_ASSASSINO); // Vermelho
			GameTextForPlayer(playerid, "~y~Assassino",1500,4);
			return 1;
		}
		else if(Profissao[playerid] == ASSALTANTE) {
			SetPlayerColor(playerid, COR_ASSALTANTE); // Azul Mar
			GameTextForPlayer(playerid, "~y~Assaltante",1500,4);
			return 1;
		}
		else if(Profissao[playerid] == LADRAO_CARROS) {
			SetPlayerColor(playerid, COR_LADRAO_CARROS); // Vermelho
			SetPlayerPos(playerid, -365.7678,1166.3445,19.7422);
			GameTextForPlayer(playerid, "~y~Ladrao de Carros",1500,4);
			return 1;
		}
		else if(Profissao[playerid] == TRAFICANTE) {
			SetPlayerColor(playerid, COR_TRAFICANTE); // Vermelho
			GameTextForPlayer(playerid, "~y~Traficante",1500,4);
			return 1;
		}
		else if(Profissao[playerid] == VENDEDOR_DE_ARMAS) {
			SetPlayerColor(playerid, COR_VENDEDOR_ARMAS); // Vermelho
			GameTextForPlayer(playerid, "~y~Vendedor de Armas",1500,4);
			return 1;
		}
		else if(Profissao[playerid] == CACADOR) {
			SetPlayerColor(playerid, COR_CACADOR); // Bege
			GameTextForPlayer(playerid, "~y~Cacador",1500,4);
			return 1;
		}
		else if(Profissao[playerid] == PESCADOR) {
			SetPlayerColor(playerid, COR_PESCADOR); // Bege
			GameTextForPlayer(playerid, "~y~Pescador",1500,4);
			return 1;
		}
		else if(Profissao[playerid] == AGRICULTOR) {
			SetPlayerColor(playerid, COR_AGRICULTOR); // Bege
			GameTextForPlayer(playerid, "~y~Agricutor",1500,4);
			return 1;
		}
		else if(Profissao[playerid] == COP_CIVIL) {
			SetPlayerColor(playerid, COR_COP_CIVIL); // Azul
			SetPlayerPos(playerid, -1605.3073,718.3339,11.9387);
			SetPlayerSkin(playerid, 280);
			udb_setSkin(PlayerName(playerid), 280);
			GameTextForPlayer(playerid, "~y~Policial Civil",1500,4);
			return 1;
		}
		else if(Profissao[playerid] == COP_RODOVIARIO) {
			SetPlayerColor(playerid, COR_COP_RODOVIARIO); // Azul
			SetPlayerPos(playerid, -211.6215,980.4658,19.3253);
			SetPlayerSkin(playerid, 283);
			udb_setSkin(PlayerName(playerid), 283);
			GameTextForPlayer(playerid, "~y~Policial Rodoviario",1500,4);
			return 1;
		}
		else if(Profissao[playerid] == COP_ELITE) {
			SetPlayerColor(playerid, COR_COP_ELITE); // Azul Claro
			SetPlayerPos(playerid, 1552.9604,-1675.1140,16.1953);
			SetPlayerSkin(playerid, 285);
			udb_setSkin(PlayerName(playerid), 285);
			GameTextForPlayer(playerid, "~y~S.W.A.T.",1500,4);
			return 1;
		}
		else if(Profissao[playerid] == DELEGADO) {
			SetPlayerColor(playerid, COR_DELEGADO); // Azul Escuro
			SetPlayerPos(playerid, -1605.3073,718.3339,11.9387);
			SetPlayerSkin(playerid, 125);
			udb_setSkin(PlayerName(playerid),  125);
			GameTextForPlayer(playerid, "~y~Delegado",1500,4);
			return 1;
		}
		else if(Profissao[playerid] == JUIZ) {
			SetPlayerColor(playerid, COR_JUIZ); // verde claro
			SetPlayerPos(playerid, -1605.3073,718.3339,11.9387);
			SetPlayerSkin(playerid, 59);
			udb_setSkin(PlayerName(playerid), 59);
			GameTextForPlayer(playerid, "~y~Juiz",1500,4);
			return 1;
		}
		else if(Profissao[playerid] == NARCOTICOS) {
			SetPlayerColor(playerid, COR_JUIZ); //
			SetPlayerPos(playerid, 1552.9604,-1675.1140,16.1953);
			SetPlayerSkin(playerid, 46);
			udb_setSkin(PlayerName(playerid), 46);
			GameTextForPlayer(playerid, "~y~Narcoticos",1500,4);
			return 1;
		}
		else if(Profissao[playerid] == POLICIA_FLORESTAL) {
			SetPlayerColor(playerid, COR_POLICIA_FLORESTAL); // verde azul
			SetPlayerPos(playerid, -2163.1667,-2387.7739,30.6250);
			SetPlayerSkin(playerid, 127);
			udb_setSkin(PlayerName(playerid), 127);
			GameTextForPlayer(playerid, "~y~Policia Florestal",1500,4);
			return 1;
		}
		else if(Profissao[playerid] == IBAMA) {
			SetPlayerColor(playerid, COR_IBAMA); // Azul Claro
			SetPlayerPos(playerid, -2163.1667,-2387.7739,30.6250);
			SetPlayerSkin(playerid, 98);
			udb_setSkin(PlayerName(playerid), 98);
			GameTextForPlayer(playerid, "~y~Ibama",1500,4);
			return 1;
		}
		else if(Profissao[playerid] == EXERCITO) {
			SetPlayerColor(playerid, COR_EXERCITO); // Verde Escuro
			SetPlayerPos(playerid, -1310.9027,472.2223,7.1875);
			SetPlayerSkin(playerid, 287);
			udb_setSkin(PlayerName(playerid), 287);
			GameTextForPlayer(playerid, "~y~Exercito",1500,4);
			return 1;
		}
		else if(Profissao[playerid] == ADVOGADO) {
			SetPlayerColor(playerid, COR_ADVOGADO); // Roxo
			SetPlayerPos(playerid, -1938.5940,569.9607,35.2899);
			SetPlayerSkin(playerid, 147);
			udb_setSkin(PlayerName(playerid), 147);
			GameTextForPlayer(playerid, "~y~Advogado",1500,4);
			return 1;
		}
		else if(Profissao[playerid] == SEGURANÇA) {
			SetPlayerColor(playerid, COR_SEGURANÇA); // Azul super claro
			SetPlayerPos(playerid, -2180.6013,-2401.2395,30.6250);
			SetPlayerSkin(playerid, 165);
			udb_setSkin(PlayerName(playerid), 165);
			GameTextForPlayer(playerid, "~y~Seguranca",1500,4);
			return 1;
		}
		else if(Profissao[playerid] == MOTORISTA_PARTICULAR) {
			SetPlayerColor(playerid, COR_MOTORISTA); // Laranja
			SetPlayerPos(playerid, -1754.8579,961.1520,24.8828);
			SetPlayerSkin(playerid, 255);
			udb_setSkin(PlayerName(playerid), 255);
			GameTextForPlayer(playerid, "~y~Motorista Particular",1500,4);
			return 1;
		}
		else if(Profissao[playerid] == MOTORISTA_DE_ONIBUS) {
			SetPlayerColor(playerid, COR_MOTORISTA_ONIBUS); // Claro
			SetPlayerPos(playerid, -1938.5940,569.9607,35.2899);
			GameTextForPlayer(playerid, "~y~Motorista de Onibus",1500,4);
			return 1;
		}
		else if(Profissao[playerid] == MENDIGO ) {
			SetPlayerColor(playerid, COR_MENDIGO ); // Claro
			SetPlayerPos(playerid, -2085.4712,-2448.2737,30.6250);
			GameTextForPlayer(playerid, "~y~Mendingo",1500,4);
			return 1;
		}
		else if(Profissao[playerid] == VENDEDOR_DE_CARROS) {
			SetPlayerColor(playerid, COR_VENDEDOR); // Verde
			SetPlayerPos(playerid, -1652.3525,1207.9297,7.2500);
			SetPlayerSkin(playerid, 120);
			udb_setSkin(PlayerName(playerid), 120);
			GameTextForPlayer(playerid, "~y~Vendedor de Carros",1500,4);
			return 1;
		}
		else if(Profissao[playerid] == CORRETOR) {
			SetPlayerColor(playerid, COR_CORRETOR); // Marfin
			SetPlayerSkin(playerid, 126);
			udb_setSkin(PlayerName(playerid), 126);
			GameTextForPlayer(playerid, "~y~Corretor",1500,4);
			return 1;
		}
		else if(Profissao[playerid] == SEGURADOR) {
			SetPlayerColor(playerid, COR_SEGURADOR); // Bege
			GameTextForPlayer(playerid, "~y~Segurador",1500,4);
			SetPlayerPos(playerid, 1153.8121,-1770.8701,16.5992);
			SetPlayerSkin(playerid, 117);
			udb_setSkin(PlayerName(playerid), 117);
			return 1;
		}
		else if(Profissao[playerid] == JORNALISTA) {
			SetPlayerColor(playerid, COR_JORNALISTA); // Bege
			GameTextForPlayer(playerid, "~y~Jornalista",1500,4);
			SetPlayerPos(playerid, -2521.2449,-624.7714,132.7831);
			SetPlayerSkin(playerid, 186);
			udb_setSkin(PlayerName(playerid), 186);
			return 1;
		}
		else if(Profissao[playerid] == CAMINHONEIRO) {
			SetPlayerColor(playerid, COR_CAMINHONEIRO); // Gold
			SetPlayerPos(playerid, -2097.3877,-2255.6489,30.6250);
			GameTextForPlayer(playerid, "~y~Caminhoneiro",1500,4);
			return 1;
		}
		else if(Profissao[playerid] == TRANSPORTE_GAS) {
			SetPlayerColor(playerid, COR_TRANSPORTE_GAS);
			SetPlayerPos(playerid, 295.6498,1385.6342,10.1560);
			GameTextForPlayer(playerid, "~y~Transporte de Combustivel",1500,4);
			return 1;
			}
		}

//--------------------------- FINAL DOS COMANDOS ---------------------------------//
	SendClientMessage(playerid,COR_VERMELHO,"Comando desconhecido!");
	return 1;
}
public OnPlayerInfoChange(playerid)
{
	printf("OnPlayerInfoChange(%d)");
	return 1;
}
public faminto()
{
   for(new i=0; i<MAX_PLAYERS; i++){
   if(fome[i] == 5){
   if(tempofome == 6){
   new Float: vidaid;
   new vida;
   new vidaperdida;
   vida = GetPlayerHealth(i,vidaid);
   vidaperdida = vida - 20;
   SendClientMessage(i, COR_VERMELHO, "Você está com fome e ira perdendo vida cada vez mais se não decidir comer");
   SetPlayerHealth(i,vidaperdida);
   }
  }
 }
}
public semaluguel(playerid)
{
TogglePlayerControllable(playerid,0);
stopaluguel[playerid] = 1;
}
public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	if(vehicleid == carroaluguel || vehicleid == carroaluguel2 || vehicleid == carroaluguel3 || vehicleid == carroaluguel4 || vehicleid == carroaluguel5 || vehicleid == carroaluguel6 || vehicleid == carroaluguel7 || vehicleid == carroaluguel8){
 	  if(CarroAlugado[playerid] != vehicleid && Profissao[playerid] != ALUGUEL_DE_CARROS){
		SendClientMessage(playerid, COR_VERMELHO, "Esse é um carro de aluguel peça a um locador para alugar ele ou");
		SendClientMessage(playerid, COR_VERMELHO, "então digite /sair para sair do veiculo.");
		SetTimerEx("semaluguel",5000,false,"d",playerid);
		return 1;
		}
	}
    for(new i=0; i<MAX_PLAYERS; i++){
		new Float:X,Float:Y,Float:Z;
		GetPlayerPos(playerid,X,Y,Z);
    	if(Alarme[GetPlayerVehicleID(i)] == 1){
    	    SendClientMessage(playerid, COR_VERMELHO,"Este veículo está protegido com o Sistema de Alarmes MPA®, as portas");
    	    SendClientMessage(playerid, COR_VERMELHO,"foram trancadas e só poderá sair quando algum Policial te liberar!");
    	    printf("O Jogador %s(id: %d) entrou em um veiculo(id: %d) mais estava trancado.", PlayerName(playerid),playerid, vehicleid);
    	    TogglePlayerControllable(playerid, 0);
    	    new string[256];
    	    PlayerPlaySound(i,41800,X,Y,Z);
			if(Profissao[i] == COP_CIVIL || Profissao[i] == COP_RODOVIARIO || Profissao[i] == COP_ELITE){
				format(string, sizeof(string), "%s entrou em um veículo trancado!", PlayerName(playerid));
				SendClientMessage(i, COR_COP_ELITE, string);
				return 0;
			} else {
    			return 1;
			}
		}
	}
	printf("O Jogador %s(id: %d) entrou em um %s", PlayerName(playerid),playerid, VehicleName[GetPlayerVehicleID(playerid)]);
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	printf("O Jogador %s(id: %d) saiu de um veiculo(id: %d)", PlayerName(playerid),playerid, vehicleid);
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	new modelo;
	cGetVehicleModelID(GetPlayerVehicleID(playerid),modelo);
	if(IsPlayerConnected(playerid) == 1 && modelo != 510 && modelo != 509){
		if(newstate == PLAYER_STATE_DRIVER){
			if(GPV[GetPlayerVehicleID(playerid)] == 0){
				TogglePlayerControllable(playerid, 0);
				SendClientMessage(playerid, COR_VERMELHO, "Este veículo não tem combustivel! Vá até o posto e compre um galão de combustível.");
				SendClientMessage(playerid, COR_VERMELHO, "Digite '/sair' para  do veiculo ou digite '/colocar' para colocar um galao de combustivel neste veiculo.");
    	    	return 1;
			}
		}
	}
	if(newstate == PLAYER_STATE_ONFOOT){
	    if(Taximetro[playerid][0] == 1){
			SendClientMessage(playerid, COR_VERDE, "Taxi pago.");
			SendClientMessage(Taximetro[playerid][1], COR_VERMELHO, "Você recebeu o valor da corrida até aqui.");
			GivePlayerMoney(playerid, 0 - PrecoCorrida[playerid]);
			GivePlayerMoney(Taximetro[playerid][1], PrecoCorrida[playerid]);
			PrecoCorrida[playerid] = 0;
			Taximetro[playerid][1] = 0;
			Taximetro[playerid][0] = 0;
			return 1;
		}
	}
	return 1;
}


public PhoneCut()
{
	for (new i = 0; i < MAX_PLAYERS; i++)
	{
		if (IsPlayerConnected(i))
		{
			if (Calling[i] > -1 && Answered[i] == 1 && Callerid[i] == 1)
			{
			    if(udb_getnumcell(PlayerName(i)) > 0){
			        udb_setnumcell(PlayerName(i),udb_getnumcell(PlayerName(i)) - 1);
			    }
				if (GetPlayerMoney(i) >= CallCost)
				{
					GivePlayerMoney(i, -CallCost);
				}
				if (GetPlayerMoney(i) < CallCost)
				{
					SendClientMessage(i, COR_VERMELHO, "CHAMADA PERDIDA: Você não possue mais dinheiro para continuar essa ligação");
					SendClientMessage(Calling[i], COR_VERMELHO, "CHAMADA PERDIDA: O telefone de quem estava na outra chamada foi desligado por falta de dinheiro");
					Calling[Calling[i]] = -1;
					Answered[Calling[i]] = 0;
					Calling[i] = -1;
					Answered[i] = 0;
					Callerid[i] = 0;
				}
				if (udb_getnumcell(PlayerName(i)) <= 0)
				{
					SendClientMessage(i, COR_VERMELHO, "CHAMADA PERDIDA: Você não possue mais créditos para continuar essa ligação");
					SendClientMessage(Calling[i], COR_VERMELHO, "CHAMADA PERDIDA: O telefone de quem estava na outra chamada foi desligado por falta de créditos");
					Calling[Calling[i]] = -1;
					Answered[Calling[i]] = 0;
					Calling[i] = -1;
					Answered[i] = 0;
					Callerid[i] = 0;
				}
			}
		}
	}
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
  printf("Jogador de ID %d (%s) entrou em um checkpoint",playerid, PlayerName(playerid));
  switch (gPlayerCheckpointStatus[playerid])
	{
	case CHECKPOINT_REVISAO :
	{
	if(IsPlayerInAnyVehicle(playerid)){
	new modelo = GetVehicleModel(GetPlayerVehicleID(playerid));
	if(modelo == VEH_LIMOSINE){
	new Float: carhealth;
	GetVehicleHealth(GetPlayerVehicleID(playerid),carhealth);
	if(carhealth >= 70){
	SendClientMessage(playerid, COR_BRANCO, "Sua limosine não está muito danificada então sua companhia não pensou em gastar dinheiro ainda.");
	DisablePlayerCheckpoint(playerid);
    SetPlayerCheckpoint(playerid, -2437.4282,1030.0270,50.3906, 3.0);
    gPlayerCheckpointStatus[playerid] = CHECKPOINT_REVISAO2;
    SendClientMessage(playerid, COR_BRANCO, "Agora vá revisar se sua limosine está limpa.");
	return 1;
	}
	else{
		SendClientMessage(playerid, COR_BRANCO, "Sua companhia resolveu consertar a limosine pois ela estava quebrada.");
		SetVehicleHealth(GetPlayerVehicleID(playerid),100);
		DisablePlayerCheckpoint(playerid);
        SetPlayerCheckpoint(playerid, -2437.4282,1030.0270,50.3906, 3.0);
        gPlayerCheckpointStatus[playerid] = CHECKPOINT_REVISAO2;
        SendClientMessage(playerid, COR_BRANCO, "Agora vá revisar se sua limosine está limpa.");
		return 1;
		}
	}
	else{
		GameTextForPlayer(playerid,"~w~Voce tem que ~n~ estar em uma ~n~~r~Limosine",4000,4);
		return 1;
		}
	}
	else{
		GameTextForPlayer(playerid,"~w~Voce tem que ~n~ estar em um ~n~~g~Veiculo",4000,4);
		return 1;
		}
	}
	case CHECKPOINT_REVISAO2 :
	{
	if(IsPlayerInAnyVehicle(playerid)){
	new modelo = GetVehicleModel(GetPlayerVehicleID(playerid));
	if(modelo == VEH_LIMOSINE){
	if(lavagem[GetPlayerVehicleID(playerid)] == 0){
	lavagem[GetPlayerVehicleID(playerid)] = 1;
	SendClientMessage(playerid, COR_BRANCO, "Sua limosine estava suja e sua companhia pagou a limpeza agora ela está brilhando novamente.");
	DisablePlayerCheckpoint(playerid);
    SetPlayerCheckpoint(playerid, -1670.9293,415.5903,7.1797, 3.0);
    gPlayerCheckpointStatus[playerid] = CHECKPOINT_REVISAO3;
    SendClientMessage(playerid, COR_BRANCO, "Vá revisar o combústivel de sua limosine no posto.");
	return 1;
	}
	else{
		SendClientMessage(playerid, COR_BRANCO, "Sua limosine está limpa não irá precisar lava-la.");
		DisablePlayerCheckpoint(playerid);
        SetPlayerCheckpoint(playerid, -1670.9293,415.5903,7.1797, 3.0);
        gPlayerCheckpointStatus[playerid] = CHECKPOINT_REVISAO3;
        SendClientMessage(playerid, COR_BRANCO, "Vá revisar o combústivel de sua limosine no posto.");
		return 1;
		}
	}
	else{
		GameTextForPlayer(playerid,"~w~Voce tem que ~n~ estar em uma ~n~~r~Limosine",4000,4);
		return 1;
		}
	}
	else{
		GameTextForPlayer(playerid,"~w~Voce tem que ~n~ estar em um ~n~~g~Veiculo",4000,4);
		return 1;
		}
	}
	case CHECKPOINT_REVISAO3 :
	{
	if(IsPlayerInAnyVehicle(playerid)){
	new modelo = GetVehicleModel(GetPlayerVehicleID(playerid));
	if(modelo == VEH_LIMOSINE){
	if(GPV[GetPlayerVehicleID(playerid)] <= 50){
	SendClientMessage(playerid, COR_BRANCO, "Sua limosine estava com pouco combustível então sua companhia decidiu encher o tanque.");
	GPV[GetPlayerVehicleID(playerid)] = 100;
	DisablePlayerCheckpoint(playerid);
    SendClientMessage(playerid, COR_BRANCO, "Limosine revisada seu chefe lhe depositou R$400 em sua conta.");
    udb_setBankMoney(PlayerName(playerid),udb_getBankMoney(PlayerName(playerid)) + 400);
    udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
    gPlayerCheckpointStatus[playerid] = CHECKPOINT_NONE;
    limorevisada[GetPlayerVehicleID(playerid)] = 1;
	return 1;
	}
	else{
		SendClientMessage(playerid, COR_BRANCO, "Sua limosine está com o tanque cheio ainda então não será necessário abastecer.");
		DisablePlayerCheckpoint(playerid);
        SendClientMessage(playerid, COR_BRANCO, "Vá revisar o combústivel de sua limosine no posto.");
		return 1;
		}
	}
	else{
		GameTextForPlayer(playerid,"~w~Voce tem que ~n~ estar em uma ~n~~r~Limosine",4000,4);
		return 1;
		}
	}
	else{
		GameTextForPlayer(playerid,"~w~Voce tem que ~n~ estar em um ~n~~g~Veiculo",4000,4);
		return 1;
		}
	}
	case CHECKPOINT_TERMINAL :
	{
	DisablePlayerCheckpoint(playerid);
	SetPlayerCheckpoint(playerid,-2679.8501,558.8384,14.5030,2.5);
	SendClientMessage(playerid, COR_AMARELOB, "Otimo! agora chegue ate o proximo terminal");
	gPlayerCheckpointStatus[playerid] = CHECKPOINT_TERMINAL2;
	}
    case CHECKPOINT_TERMINAL2 :
	{
	DisablePlayerCheckpoint(playerid);
	SetPlayerCheckpoint(playerid,-2246.3533,-136.8764,35.3203,2.5);
	SendClientMessage(playerid, COR_AMARELOB, "Otimo! agora chegue ate o proximo terminal");
	gPlayerCheckpointStatus[playerid] = CHECKPOINT_TERMINAL3;
	}
    case CHECKPOINT_TERMINAL3 :
	{
	DisablePlayerCheckpoint(playerid);
	SetPlayerCheckpoint(playerid,-1975.9673,-751.0164,32.2266,2.5);
	SendClientMessage(playerid, COR_AMARELOB, "Muito bem! Seu chefe lhe deu $150 pelo bom trabalho");
	GivePlayerMoney(playerid,150);
	gPlayerCheckpointStatus[playerid] = CHECKPOINT_TERMINAL4;
	}
	case CHECKPOINT_TERMINAL4 :
	{
	DisablePlayerCheckpoint(playerid);
	SetPlayerCheckpoint(playerid,-2174.8452,-46.8932,35.3125,2.5);
	SendClientMessage(playerid, COR_AMARELOB, "Otimo! agora chegue ate o proximo terminal");
	gPlayerCheckpointStatus[playerid] = CHECKPOINT_TERMINAL5;
	}
	case CHECKPOINT_TERMINAL5 :
	{
	DisablePlayerCheckpoint(playerid);
	SetPlayerCheckpoint(playerid,-2154.7961,252.1680,35.3125,2.5);
	SendClientMessage(playerid, COR_AMARELOB, "Otimo! agora chegue ate o proximo terminal");
	gPlayerCheckpointStatus[playerid] = CHECKPOINT_TERMINAL6;
	}
	case CHECKPOINT_TERMINAL6 :
	{
	DisablePlayerCheckpoint(playerid);
	SetPlayerCheckpoint(playerid,-1986.2688,141.6903,27.6875,2.5);
	SendClientMessage(playerid, COR_AMARELOB, "Otimo! agora chegue ate o proximo terminal");
	gPlayerCheckpointStatus[playerid] = CHECKPOINT_TERMINAL7;
	}
	case CHECKPOINT_TERMINAL7 :
	{
	DisablePlayerCheckpoint(playerid);
	SendClientMessage(playerid, COR_AMARELOB, "Muito bem! Seu chefe lhe deu $150 pelo bom trabalho");
	GivePlayerMoney(playerid,150);
	gPlayerCheckpointStatus[playerid] = CHECKPOINT_NONE;
	udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
	}
	case CHECKPOINT_TERMINAL8 :
	{
	DisablePlayerCheckpoint(playerid);
    SetPlayerCheckpoint(playerid,-2624.0498,1181.1068,35.0233,2.5);
	SendClientMessage(playerid, COR_AMARELOB, "Otimo! agora chegue ate o proximo terminal");
	gPlayerCheckpointStatus[playerid] = CHECKPOINT_TERMINAL9;
	}
	case CHECKPOINT_TERMINAL9 :
	{
	DisablePlayerCheckpoint(playerid);
    SetPlayerCheckpoint(playerid,-2442.3325,489.0844,30.0878,2.5);
	SendClientMessage(playerid, COR_AMARELOB, "Otimo! agora chegue ate o proximo terminal");
	gPlayerCheckpointStatus[playerid] = CHECKPOINT_TERMINAL10;
	}
	case CHECKPOINT_TERMINAL10 :
	{
	DisablePlayerCheckpoint(playerid);
    SetPlayerCheckpoint(playerid,-2054.0764,-65.3922,35.1719,2.5);
	SendClientMessage(playerid, COR_AMARELOB, "Otimo! agora chegue ate o proximo terminal");
	gPlayerCheckpointStatus[playerid] = CHECKPOINT_TERMINAL11;
	}
	case CHECKPOINT_TERMINAL11 :
	{
	DisablePlayerCheckpoint(playerid);
    SetPlayerCheckpoint(playerid,-1587.9775,829.2391,7.6323,2.5);
	SendClientMessage(playerid, COR_AMARELOB, "Otimo! agora chegue ate o proximo terminal");
	gPlayerCheckpointStatus[playerid] = CHECKPOINT_TERMINAL12;
	}
	case CHECKPOINT_TERMINAL12 :
	{
	DisablePlayerCheckpoint(playerid);
	SendClientMessage(playerid, COR_AMARELOB, "Muito bem! Seu chefe lhe deu $150 pelo bom trabalho");
    GivePlayerMoney(playerid,150);
	gPlayerCheckpointStatus[playerid] = CHECKPOINT_NONE;
	udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
	}

	case CHECKPOINT_VIAGEMSFLV :
	{
	DisablePlayerCheckpoint(playerid);
	SetPlayerCheckpoint(playerid,1434.8029,2611.4238,10.8203,2.5);
	SendClientMessage(playerid, COR_AMARELOB, "Va agora para a rodoviaria de Las Venturas");
	gPlayerCheckpointStatus[playerid] = CHECKPOINT_VIAGEMSFLV2;
	}
	case CHECKPOINT_VIAGEMSFLV2 :
	{
	DisablePlayerCheckpoint(playerid);
	SendClientMessage(playerid, COR_AMARELOB, "Otimo agora você recebeu $150 e mais o dinheiro dos passageiros");
	gPlayerCheckpointStatus[playerid] = CHECKPOINT_NONE;
	GivePlayerMoney(playerid,150);
	}
	case CHECKPOINT_VIAGEMLVSF :
	{
	DisablePlayerCheckpoint(playerid);
	SetPlayerCheckpoint(playerid,-1977.7321,-860.4664,32.0312,2.5);
	SendClientMessage(playerid, COR_AMARELOB, "Va ate a rodoviaria de San Fierro agora");
	gPlayerCheckpointStatus[playerid] = CHECKPOINT_VIAGEMLVSF2;
	GivePlayerMoney(playerid,150);
	}
	case CHECKPOINT_VIAGEMLVSF2 :
	{
	DisablePlayerCheckpoint(playerid);
	SendClientMessage(playerid, COR_AMARELOB, "Otimo agora você recebeu $150 e mais o dinheiro dos passageiros");
	gPlayerCheckpointStatus[playerid] = CHECKPOINT_NONE;
	GivePlayerMoney(playerid,150);
	}
	case CHECKPOINT_EMPRESA :
	{
	new vehicleid = GetPlayerVehicleID(playerid);
	new modelo = GetVehicleModel(playerid);
	new trailer = GetVehicleTrailer(vehicleid);
	for(new i;i<MAX_PLAYERS;i++){
		if(Profissao[i] != CAMINHONEIRO) return 1;
		if(Empresa <= 4){
			    if(modelo == VEH_LINERUN || modelo == VEH_TANKER || modelo == VEH_RDTRAIN && trailer == VEH_TANKTRAILER){
			    	DisablePlayerCheckpoint(playerid);
			    	SetTimerEx("CarregandoComb", 10000, false, "fff", playerid,trailer,vehicleid);
			    	SendClientMessage(playerid,COR_VERDE,"Espere enquanto carregamos o tanque, dentro de 10s pedorá partir.");
			    	Missao[i] = 0;
				} else {
   					SendClientMessage(playerid,COR_VERMELHO,"Você não está engatado. Engate a carrega tanque em seu caminhão para carregar");
				}
			}
		}
	}
	case CHECKPOINT_POSTO :
	{
		new vehicleid = GetPlayerVehicleID(playerid);
		new modelo = GetVehicleModel(playerid);
		new trailer = GetVehicleTrailer(vehicleid);
		if(IsTrailerAttachedToVehicle(vehicleid)){
			if(modelo == VEH_LINERUN || modelo == VEH_TANKER || modelo == VEH_RDTRAIN && trailer == VEH_TANKTRAILER){
		    	if(Carregamento[GetPlayerVehicleID(trailer)] == 1){
		    		DisablePlayerCheckpoint(playerid);
		    		SetTimerEx("DescarregandoComb", 10000, false, "fff", playerid,trailer,vehicleid);
		    		SendClientMessage(playerid,COR_VERDE,"Aguarde, estamos desatrelando o tanque, dentro de 15s poderá partir.");
				}
				else {
   					SendClientMessage(playerid,COR_VERMELHO,"Seu veículo não está carregado.");
    			}
    		}
			else {
				SendClientMessage(playerid,COR_VERMELHO,"O veículo em que você está não é de combústivel.");
			}
		}
		else {
			SendClientMessage(playerid,COR_VERMELHO,"Você não está engatado.");
		}
	}
	case CHECKPOINT_CATANDOLATAS :
	{
	if(CatarLatinha[playerid] == 1){
	    if(IsPlayerInAnyVehicle(playerid)){
	    	SendClientMessage(playerid,COR_VERMELHO,"Você tem que estar à pé");
			return 1;
	    }
	    else{
    		SendClientMessage(playerid,COR_VERMELHO,"Latinha coletada.");
	    	DisablePlayerCheckpoint(playerid);
	    	new rt = random(23);
	    	SetPlayerCheckpoint(playerid,Latinhas[rt][0],Latinhas[rt][1],Latinhas[rt][2],3.0);
	    	SendClientMessage(playerid,COR_VERMELHO,"Colete mais latinhas ou pare com /pararcoleta.");
	    	Latas[playerid]++;
	    }
      }
    }
  }
  return 1;
}


public OnPlayerLeaveCheckpoint(playerid)
{
	printf("O Jogador %s(%d) saiu de um checkpoint.", PlayerName(playerid),playerid);
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return 1;
}
public votacaoon(plid1,plid2)
{
      for(new i=0; i<MAX_PLAYERS; i++) {
	  votosabertos[plid1] = 1;
	  votosabertos[plid2] = 2;
	  temporadavotos[i] = 1;
	  SetTimerEx("fimvotacao",10000,1,"dd",plid1,plid2);
	  }
}
public fimvotacao(plid1,plid2,vencedor)
{
      for(new i=0; i<MAX_PLAYERS; i++) {
	  if(votosabertos[plid1] == 1){
      if(votosabertos[plid2] == 1){
      }
      if(IsPlayerConnected(i)){
	  if(Qtvotos[plid1] < Qtvotos[plid2]){
	  plid2 = vencedor;
	  return 1;
	  }
	  if(Qtvotos[plid1] > Qtvotos[plid2]){
	  plid1 = vencedor;
	  return 1;
      }
      new msg[256];
      format(msg,sizeof(msg),"O vencedor foi:%s.",PlayerName(vencedor));
      SendClientMessageToAll(COR_BRANCO,msg);
      temporadavotos[i] = 0;
      voto[i] = 0;
      votosabertos[plid1] = 0;
      votosabertos[plid2] = 0;
      return 1;
      }
      if(Qtvotos[plid2] == Qtvotos[plid1]){
      SendClientMessage(i, COR_BRANCO, "Nenhum Vencedor nestá temporada de votaçoes. Depois sera feita outra eleição para decidir");
      temporadavotos[i] = 0;
      voto[i] = 0;
      votosabertos[plid1] = 0;
      votosabertos[plid2] = 0;
      }
    }
  }
      return 1;
}
public OnRconCommand(cmd[])
{
	return 1;
}
public consertar(vehicle,plid,angulo)
{
   new Float:X, Float:Y, Float:Z;
   GetPlayerPos(plid,X,Y,Z);
   if(IsPlayerConnected(plid)){
   SetVehiclePos(vehicle,X + 2.5, Y, Z + 1.0);
   SetVehicleZAngle(vehicle,angulo);
   SendClientMessage(plid, COR_MECANICO, "Seu veiculo foi consertado.");
   }
}
public OnObjectMoved(objectid)
{
	return 1;
}
public locar(plid,car)
{
      if(Profissao[plid] != ALUGUEL_DE_CARROS){
	  if(Aluguel[plid] == 1){
	  Aluguel[plid] = 0;
	  CarroAlugado[plid] = 0;
	  RemovePlayerFromVehicle(plid);
	  SendClientMessage(plid, COR_ALUGUEL_DE_CARROS, "Seu tempo acabou se quiser mais peça a um locador de carros");
	  }
   }
}
public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	new Menu:Current = GetPlayerMenu(playerid);
	if(Current == radares) {
    	switch(row){
	    case 0:{HideMenuForPlayer(Current, playerid);radaron();TogglePlayerControllable(playerid, true);}
	    case 1:{HideMenuForPlayer(Current, playerid);radaroff();TogglePlayerControllable(playerid, true);}
    	case 2:{HideMenuForPlayer(Current, playerid);TogglePlayerControllable(playerid, true);}
		}
    }
 	else if(Current == Terminais) {
    	switch(row){
	    case 0:{HideMenuForPlayer(Current, playerid);ligarterminal(playerid);TogglePlayerControllable(playerid, true);}
	    case 1:{HideMenuForPlayer(Current, playerid);ligarterminal2(playerid);TogglePlayerControllable(playerid, true);}
	    case 2:{HideMenuForPlayer(Current, playerid);TogglePlayerControllable(playerid, true);}
	    }
	}
	else if(Current == cardapio) {
    	switch(row){
	    case 0:{HideMenuForPlayer(Current, playerid);XBACON(playerid);TogglePlayerControllable(playerid, true);}
	    case 1:{HideMenuForPlayer(Current, playerid);XBURGUER(playerid);TogglePlayerControllable(playerid, true);}
	    case 2:{HideMenuForPlayer(Current, playerid);XSALADA(playerid);TogglePlayerControllable(playerid, true);}
		case 3:{HideMenuForPlayer(Current, playerid);HOTDOG(playerid);TogglePlayerControllable(playerid, true);}
		case 4:{HideMenuForPlayer(Current, playerid);FRITA(playerid);TogglePlayerControllable(playerid, true);}
		case 5:{HideMenuForPlayer(Current, playerid);REFRIGERANTE(playerid);TogglePlayerControllable(playerid, true);}
		case 6:{HideMenuForPlayer(Current, playerid);CERVEJA(playerid);TogglePlayerControllable(playerid, true);}
		case 7:{HideMenuForPlayer(Current, playerid);SUCO(playerid);TogglePlayerControllable(playerid, true);}
		case 8:{HideMenuForPlayer(Current, playerid);TogglePlayerControllable(playerid, true);}
	    }
	}

	else if(Current == level0) {
    	switch(row){
	    case 0:{HideMenuForPlayer(Current, playerid);xlnecessario[playerid] = 0;profselection[playerid] = 2;ShowMenuForPlayer(acceptprof, playerid);TogglePlayerControllable(playerid, false);}
	    case 1:{HideMenuForPlayer(Current, playerid);xlnecessario[playerid] = 0;profselection[playerid] = 4;ShowMenuForPlayer(acceptprof, playerid);TogglePlayerControllable(playerid, false);}
	    case 2:{HideMenuForPlayer(Current, playerid);xlnecessario[playerid] = 0;profselection[playerid] = 9;ShowMenuForPlayer(acceptprof, playerid);TogglePlayerControllable(playerid, false);}
	    case 3:{HideMenuForPlayer(Current, playerid);xlnecessario[playerid] = 0;profselection[playerid] = 34;ShowMenuForPlayer(acceptprof, playerid);TogglePlayerControllable(playerid, false);}
	    case 4:{HideMenuForPlayer(Current, playerid);xlnecessario[playerid] = 0;profselection[playerid] = 33;ShowMenuForPlayer(acceptprof, playerid);TogglePlayerControllable(playerid, false);}
		case 5:{HideMenuForPlayer(Current, playerid);TogglePlayerControllable(playerid, true);}
	    }
    }

    else if(Current == level5) {
    	switch(row){
	    case 0:{HideMenuForPlayer(Current, playerid);xlnecessario[playerid] = 5;profselection[playerid] = 3;ShowMenuForPlayer(acceptprof, playerid);TogglePlayerControllable(playerid, false);}
	    case 1:{HideMenuForPlayer(Current, playerid);xlnecessario[playerid] = 5;profselection[playerid] = 19;ShowMenuForPlayer(acceptprof, playerid);TogglePlayerControllable(playerid, false);}
	    case 2:{HideMenuForPlayer(Current, playerid);xlnecessario[playerid] = 5;profselection[playerid] = 5;ShowMenuForPlayer(acceptprof, playerid);TogglePlayerControllable(playerid, false);}
	    case 3:{HideMenuForPlayer(Current, playerid);xlnecessario[playerid] = 5;profselection[playerid] = 39;ShowMenuForPlayer(acceptprof, playerid);TogglePlayerControllable(playerid, false);}
	    case 4:{HideMenuForPlayer(Current, playerid);ShowMenuForPlayer(level0,playerid);TogglePlayerControllable(playerid, false);}
		case 5:{HideMenuForPlayer(Current, playerid);TogglePlayerControllable(playerid, true);}
	    }
    }
    else if(Current == level10) {
    	switch(row){
	    case 0:{HideMenuForPlayer(Current, playerid);xlnecessario[playerid] = 10;profselection[playerid] = 20;ShowMenuForPlayer(acceptprof, playerid);TogglePlayerControllable(playerid, false);}
	    case 1:{HideMenuForPlayer(Current, playerid);xlnecessario[playerid] = 10;profselection[playerid] = 18;ShowMenuForPlayer(acceptprof, playerid);TogglePlayerControllable(playerid, false);}
	    case 2:{HideMenuForPlayer(Current, playerid);xlnecessario[playerid] = 10;profselection[playerid] = 32;ShowMenuForPlayer(acceptprof, playerid);TogglePlayerControllable(playerid, false);}
	    case 3:{HideMenuForPlayer(Current, playerid);xlnecessario[playerid] = 10;profselection[playerid] = 40;ShowMenuForPlayer(acceptprof, playerid);TogglePlayerControllable(playerid, false);}
	    case 4:{HideMenuForPlayer(Current, playerid);ShowMenuForPlayer(level5,playerid);TogglePlayerControllable(playerid, false);}
		case 5:{HideMenuForPlayer(Current, playerid);TogglePlayerControllable(playerid, true);}
	    }
    }
    else if(Current == level15) {
    	switch(row){
	    case 0:{HideMenuForPlayer(Current, playerid);xlnecessario[playerid] = 15;profselection[playerid] = 8;ShowMenuForPlayer(acceptprof, playerid);TogglePlayerControllable(playerid, false);}
	    case 1:{HideMenuForPlayer(Current, playerid);xlnecessario[playerid] = 15;profselection[playerid] = 6;ShowMenuForPlayer(acceptprof, playerid);TogglePlayerControllable(playerid, false);}
	    case 2:{HideMenuForPlayer(Current, playerid);xlnecessario[playerid] = 15;profselection[playerid] = 13;ShowMenuForPlayer(acceptprof, playerid);TogglePlayerControllable(playerid, false);}
	    case 3:{HideMenuForPlayer(Current, playerid);ShowMenuForPlayer(level10,playerid);TogglePlayerControllable(playerid, false);}
		case 4:{HideMenuForPlayer(Current, playerid);TogglePlayerControllable(playerid, true);}
	    }
    }
    else if(Current == level20) {
    	switch(row){
	    case 0:{HideMenuForPlayer(Current, playerid);xlnecessario[playerid] = 20;profselection[playerid] = 7;ShowMenuForPlayer(acceptprof, playerid);TogglePlayerControllable(playerid, false);}
	    case 1:{HideMenuForPlayer(Current, playerid);xlnecessario[playerid] = 20;profselection[playerid] = 16;ShowMenuForPlayer(acceptprof, playerid);TogglePlayerControllable(playerid, false);}
	    case 2:{HideMenuForPlayer(Current, playerid);xlnecessario[playerid] = 20;profselection[playerid] = 14;ShowMenuForPlayer(acceptprof, playerid);TogglePlayerControllable(playerid, false);}
	    case 3:{HideMenuForPlayer(Current, playerid);xlnecessario[playerid] = 20;profselection[playerid] = 31;ShowMenuForPlayer(acceptprof, playerid);TogglePlayerControllable(playerid, false);}
	    case 4:{HideMenuForPlayer(Current, playerid);ShowMenuForPlayer(level15,playerid);TogglePlayerControllable(playerid, false);}
		case 5:{HideMenuForPlayer(Current, playerid);TogglePlayerControllable(playerid, true);}
	    }
    }
    else if(Current == level25) {
    	switch(row){
	    case 0:{HideMenuForPlayer(Current, playerid);xlnecessario[playerid] = 25;profselection[playerid] = 42;ShowMenuForPlayer(acceptprof, playerid);TogglePlayerControllable(playerid, false);}
	    case 1:{HideMenuForPlayer(Current, playerid);xlnecessario[playerid] = 25;profselection[playerid] = 37;ShowMenuForPlayer(acceptprof, playerid);TogglePlayerControllable(playerid, false);}
	    case 2:{HideMenuForPlayer(Current, playerid);xlnecessario[playerid] = 25;profselection[playerid] = 21;ShowMenuForPlayer(acceptprof, playerid);TogglePlayerControllable(playerid, false);}
	    case 3:{HideMenuForPlayer(Current, playerid);xlnecessario[playerid] = 25;profselection[playerid] = 15;ShowMenuForPlayer(acceptprof, playerid);TogglePlayerControllable(playerid, false);}
	    case 4:{HideMenuForPlayer(Current, playerid);ShowMenuForPlayer(level20,playerid);TogglePlayerControllable(playerid, false);}
		case 5:{HideMenuForPlayer(Current, playerid);TogglePlayerControllable(playerid, true);}
	    }
    }
    else if(Current == level30) {
    	switch(row){
	    case 0:{HideMenuForPlayer(Current, playerid);xlnecessario[playerid] = 30;profselection[playerid] = 22;ShowMenuForPlayer(acceptprof, playerid);TogglePlayerControllable(playerid, false);}
	    case 1:{HideMenuForPlayer(Current, playerid);xlnecessario[playerid] = 30;profselection[playerid] = 11;ShowMenuForPlayer(acceptprof, playerid);TogglePlayerControllable(playerid, false);}
	    case 2:{HideMenuForPlayer(Current, playerid);xlnecessario[playerid] = 30;profselection[playerid] = 17;ShowMenuForPlayer(acceptprof, playerid);TogglePlayerControllable(playerid, false);}
	    case 3:{HideMenuForPlayer(Current, playerid);xlnecessario[playerid] = 30;profselection[playerid] = 12;ShowMenuForPlayer(acceptprof, playerid);TogglePlayerControllable(playerid, false);}
	    case 4:{HideMenuForPlayer(Current, playerid);ShowMenuForPlayer(level25,playerid);TogglePlayerControllable(playerid, false);}
		case 5:{HideMenuForPlayer(Current, playerid);TogglePlayerControllable(playerid, true);}
	    }
    }
    else if(Current == level35) {
    	switch(row){
	    case 0:{HideMenuForPlayer(Current, playerid);xlnecessario[playerid] = 35;profselection[playerid] = 41;ShowMenuForPlayer(acceptprof, playerid);TogglePlayerControllable(playerid, false);}
	    case 1:{HideMenuForPlayer(Current, playerid);xlnecessario[playerid] = 35;profselection[playerid] = 28;ShowMenuForPlayer(acceptprof, playerid);TogglePlayerControllable(playerid, false);}
	    case 2:{HideMenuForPlayer(Current, playerid);xlnecessario[playerid] = 35;profselection[playerid] = 43;ShowMenuForPlayer(acceptprof, playerid);TogglePlayerControllable(playerid, false);}
	    case 3:{HideMenuForPlayer(Current, playerid);ShowMenuForPlayer(level30,playerid);TogglePlayerControllable(playerid, false);}
		case 4:{HideMenuForPlayer(Current, playerid);TogglePlayerControllable(playerid, true);}
	    }
    }
    else if(Current == level40) {
    	switch(row){
	    case 0:{HideMenuForPlayer(Current, playerid);xlnecessario[playerid] = 40;profselection[playerid] = 30;ShowMenuForPlayer(acceptprof, playerid);TogglePlayerControllable(playerid, false);}
	    case 1:{HideMenuForPlayer(Current, playerid);xlnecessario[playerid] = 40;profselection[playerid] = 26;ShowMenuForPlayer(acceptprof, playerid);TogglePlayerControllable(playerid, false);}
	    case 2:{HideMenuForPlayer(Current, playerid);xlnecessario[playerid] = 40;profselection[playerid] = 27;ShowMenuForPlayer(acceptprof, playerid);TogglePlayerControllable(playerid, false);}
	    case 3:{HideMenuForPlayer(Current, playerid);ShowMenuForPlayer(level35,playerid);TogglePlayerControllable(playerid, false);}
		case 4:{HideMenuForPlayer(Current, playerid);TogglePlayerControllable(playerid, true);}
	    }
    }
    else if(Current == level45) {
    	switch(row){
	    case 0:{HideMenuForPlayer(Current, playerid);xlnecessario[playerid] = 45;profselection[playerid] = 23;ShowMenuForPlayer(acceptprof, playerid);TogglePlayerControllable(playerid, false);}
	    case 1:{HideMenuForPlayer(Current, playerid);xlnecessario[playerid] = 45;profselection[playerid] = 36;ShowMenuForPlayer(acceptprof, playerid);TogglePlayerControllable(playerid, false);}
	    case 2:{HideMenuForPlayer(Current, playerid);ShowMenuForPlayer(level40,playerid);TogglePlayerControllable(playerid, false);}
		case 3:{HideMenuForPlayer(Current, playerid);TogglePlayerControllable(playerid, true);}
	    }
    }
    else if(Current == level50) {
    	switch(row){
	    case 0:{HideMenuForPlayer(Current, playerid);xlnecessario[playerid] = 50;profselection[playerid] = 29;ShowMenuForPlayer(acceptprof, playerid);TogglePlayerControllable(playerid, false);}
	    case 1:{HideMenuForPlayer(Current, playerid);xlnecessario[playerid] = 50;profselection[playerid] = 35;ShowMenuForPlayer(acceptprof, playerid);TogglePlayerControllable(playerid, false);}
	    case 2:{HideMenuForPlayer(Current, playerid);ShowMenuForPlayer(level45,playerid);TogglePlayerControllable(playerid, false);}
		case 3:{HideMenuForPlayer(Current, playerid);TogglePlayerControllable(playerid, true);}
	    }
    }
    else if(Current == level55) {
    	switch(row){
	    case 0:{HideMenuForPlayer(Current, playerid);xlnecessario[playerid] = 55;profselection[playerid] = 25;ShowMenuForPlayer(acceptprof, playerid);TogglePlayerControllable(playerid, false);}
	    case 1:{HideMenuForPlayer(Current, playerid);xlnecessario[playerid] = 55;profselection[playerid] = 24;ShowMenuForPlayer(acceptprof, playerid);TogglePlayerControllable(playerid, false);}
	    case 2:{HideMenuForPlayer(Current, playerid);ShowMenuForPlayer(level50,playerid);TogglePlayerControllable(playerid, false);}
		case 3:{HideMenuForPlayer(Current, playerid);TogglePlayerControllable(playerid, true);}
	    }
    }

   
    else if(Current == acceptprof) {
    	switch(row){
	    case 0:{HideMenuForPlayer(Current, playerid);adicionarprofissao(playerid);TogglePlayerControllable(playerid, true);}
		case 1:{HideMenuForPlayer(Current, playerid);TogglePlayerControllable(playerid, true);}
	    }
    }
}

stock adicionarprofissao(playerid)
{
new NM;
NM = udb_getNM(PlayerName(playerid));
if(NM == 0){
new Level;
Level = udb_getXP(PlayerName(playerid));
if(Level >= xlnecessario[playerid]){
udb_setProf(PlayerName(playerid), profselection[playerid]);
udb_setSkin(PlayerName(playerid),ProfSkin[profselection[playerid]]);
LogarPlayer(playerid);
SpawnPlayer(playerid);
SetPlayerPos(playerid,ProfPos[profselection[playerid]][0],ProfPos[profselection[playerid]][1],ProfPos[profselection[playerid]][2]);
udb_setNM(PlayerName(playerid),1);
SendClientMessage(playerid, COR_VERDE, "Você mudou de profissao digite /profissao para ver os comandos da sua profissao");
new string[256];
format(string,sizeof(string),"~w~%s",ProfName[profselection[playerid]]);
GameTextForPlayer(playerid,string,3000,0);
}
else{
	SendClientMessage(playerid, COR_VERMELHO, "Você não possue XL suficiente para esta profissão");
	return 1;
	}
}
else{
	SendClientMessage(playerid, COR_VERMELHO, "Espere chegar até o próximo nível para trocar sua profissão");
	return 1;
	}
return 1;
}

stock XBACON(playerid)
{
ApplyAnimation(playerid, "FOOD", "EAT_Burger", 3.00, 0, 0, 0, 0, 0);
SendClientMessage(playerid, COR_MECANICO, "Você pediu um X-Bacon. Bom Lanche!");
GivePlayerMoney(playerid,0-5);
fome[playerid] --;

}
stock XBURGUER(playerid)
{
ApplyAnimation(playerid, "FOOD", "EAT_Burger", 3.00, 0, 0, 0, 0, 0);
SendClientMessage(playerid, COR_MECANICO, "Você comeu um X-Burguer. Bom Lanche!");
GivePlayerMoney(playerid,0-6);
fome[playerid] --;
}
stock XSALADA(playerid)
{
ApplyAnimation(playerid, "FOOD", "EAT_Burger", 3.00, 0, 0, 0, 0, 0);
SendClientMessage(playerid, COR_MECANICO, "Você comeu um X-Salada. Bom Lanche");
GivePlayerMoney(playerid,0-4);
fome[playerid] --;
}
stock HOTDOG(playerid)
{
ApplyAnimation(playerid, "FOOD", "EAT_Burger", 3.00, 0, 0, 0, 0, 0);
SendClientMessage(playerid, COR_MECANICO, "Você comeu um Cachorro Quente. Bom Lanche!");
GivePlayerMoney(playerid,0-6);
fome[playerid] --;
}
stock FRITA(playerid)
{
ApplyAnimation(playerid, "FOOD", "EAT_Burger", 3.00, 0, 0, 0, 0, 0);
SendClientMessage(playerid, COR_MECANICO, "Você comeu uma porção de Batata Frita.");
GivePlayerMoney(playerid,0-10);
fome[playerid] --;
}
stock REFRIGERANTE(playerid)
{
ApplyAnimation(playerid, "FOOD", "EAT_Burger", 3.00, 0, 0, 0, 0, 0);
SendClientMessage(playerid, COR_MECANICO, "Você tomou uma lata refrigerante!");
GivePlayerMoney(playerid,0-5);
fome[playerid] --;
}
stock CERVEJA(playerid)
{
ApplyAnimation(playerid, "FOOD", "EAT_Burger", 3.00, 0, 0, 0, 0, 0);
SendClientMessage(playerid, COR_MECANICO, "Você bebeu uma lata de cerveja! Beba com moderação.");
GivePlayerMoney(playerid,0-5);
fome[playerid] --;
}
stock SUCO(playerid)
{
ApplyAnimation(playerid, "FOOD", "EAT_Burger", 3.00, 0, 0, 0, 0, 0);
SendClientMessage(playerid, COR_MECANICO, "Você bebeu um copo de suco!");
GivePlayerMoney(playerid,0-4);
fome[playerid] --;
}
stock ligarterminal(playerid)
{
  DisablePlayerCheckpoint(playerid);
  SetPlayerCheckpoint(playerid,-1750.8685,955.9368,24.7422,2.5);
  gPlayerCheckpointStatus[playerid] = CHECKPOINT_TERMINAL;
  SendClientMessage(playerid, COR_AZUL, "Siga até os checkpoints para ir aos terminais");
}
stock ligarterminal2(playerid)
{
  DisablePlayerCheckpoint(playerid);
  SetPlayerCheckpoint(playerid,-1996.9480,145.3480,27.6875,2.5);
  gPlayerCheckpointStatus[playerid] = CHECKPOINT_TERMINAL8;
  SendClientMessage(playerid, COR_AZUL, "Siga até os checkpoints para ir aos terminais");
}
stock radaron()
{
    for(new i=0; i<MAX_PLAYERS; i++){
    Radaron[i] = 1;
    SendClientMessage(i,COR_CONFISCADOR, "Os radares da cidade foram ligados se alguem andar em alta velocidade pela rua sera multado");
	}
}
stock radaroff()
{
    for(new i=0; i<MAX_PLAYERS; i++){
    Radaron[i] = 0;
    SendClientMessage(i, COR_CONFISCADOR, "Os radares da cidade foram desligados agora todos podem preparar os nitros de seus carros a vontade");
	}
}
public OnPlayerExitedMenu(playerid)
{
    TogglePlayerControllable(playerid, true);
	return 1;
}

stock PlayerName(playerid)
{
	new name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, name, MAX_PLAYER_NAME);
 	new tmp[MAX_STRING];
  	set(tmp,udb_encode(name));
	return tmp;

}
 public assaltar(playerid)
{
    if(IsPlayerConnected(playerid)){
    if(assalto[playerid] == 1){
    assalto[playerid] = 0;
    SendClientMessage(playerid, COR_ASSALTANTE, "AVISO: você ja pode assaltar o banco ou o mercado novamente");
    }
  }
}
public alugarlimo(playerid,car)
{
  if(devolucao[playerid] > 0){
  SendClientMessage(playerid, COR_MOTORISTA, "Sua Limosine não foi devolvida ainda se você não devolver logo poderá ser preso");
  SetTimerEx("atraso",300000,false,"dd",playerid,car);
  }
}
public atraso(playerid,car)
{
  if(devolucao[playerid] > 0){
  SendClientMessage(playerid, COR_MOTORISTA, "Você não devolveu a limosine e foi botado na lista dos procurados");
  new string[256];
  format(string, sizeof(string), "%s foi posto na lista dos procurados por roubar uma limosine", PlayerName(playerid));
  SendClientMessageToAll(COR_COP_ELITE,string);
  Procurados[playerid] = 1;
  }
}
public Bancos()
{
	new Float:X, Float:Y, Float:Z;
	for(new i=0; i<MAX_PLAYERS; i++){
		GetPlayerPos(i, X, Y, Z);
	    if(IsPlayerConnected(i)) {
			if(X >= 2315.3018 && X <= 2317.3018 && Y >= -13.7580 && Y <= -11.7580){//banco sf
			    if(AreaBanco[i] == 0) {
			        if(Missao[i] == 1) {
						SendClientMessage(i, COR_COP_ELITE, "Banco Central:");
						SendClientMessage(i, COR_AMARELO_CLARO, "/retirar [valor] ou /sacar [valor] : Retira dinheiro de sua conta bancaria. ");
						SendClientMessage(i, COR_AMARELO_CLARO, "/depositar [valor] : Deposita em sua conta bancaria");
						SendClientMessage(i, COR_AMARELO_CLARO, "/saldo : Vê o saldo de sua conta bancaria.");
						SendClientMessage(i, COR_AMARELO_CLARO, "/saldocel : Vê o saldo de sua conta bancaria pelo celular.");
						SendClientMessage(i, COR_LARANJA, "Para visualizar novamente os comandos digite /bancoinfo");
					}
					else{
						SendClientMessage(i, COR_VERMELHO, "Você está no meio de uma missão não pode acessar o banco!");
					}
					AreaBanco[i] = 1;
				}
			}
			else if(X >= -2671.2031 && X <= -2665.3457 && Y >= 631.8643 && Y <= 640.1569){//caixa eletronico hospital
				if(AreaBanco[i] == 0) {
				    if(Missao[i] == 1) {
						DisablePlayerCheckpoint(i);
						SetPlayerCheckpoint(i, -2670.0745,636.9832,14.4531, 1.0);
						SendClientMessage(i, COR_COP_ELITE, "Caixa Eletrônico do Hospital:");
						SendClientMessage(i, COR_AMARELO_CLARO, "/retirar [valor] ou /sacar [valor] : Retira dinheiro de sua conta bancaria. ");
						SendClientMessage(i, COR_AMARELO_CLARO, "/depositar [valor] : Deposita em sua conta bancaria");
						SendClientMessage(i, COR_AMARELO_CLARO, "/saldo : Vê o saldo de sua conta bancaria.");
						SendClientMessage(i, COR_AMARELO_CLARO, "/saldocel : Vê o saldo de sua conta bancaria pelo celular.");
						SendClientMessage(i, COR_LARANJA, "Para visualizar novamente os comandos digite /bancoinfo");
					}
					else{
						SendClientMessage(i, COR_VERMELHO, "Você está no meio de uma missão não pode acessar o banco!");
					}
					AreaBanco[i] = 1;

				}
			}
			else if(X >= -1986.5660 && X <= -1980.6200 && Y >= 161.8643 && Y <= 169.9125){//caixa eletronico rodoviaria
				if(AreaBanco[i] == 0) {
				    if(Missao[i] == 1) {
						DisablePlayerCheckpoint(i);
						SetPlayerCheckpoint(i, -1981.4067,165.7179,27.6875, 1.0);
						SendClientMessage(i, COR_COP_ELITE, "Caixa Eletrônico da Rodoviaria:");
						SendClientMessage(i, COR_AMARELO_CLARO, "/retirar [valor] ou /sacar [valor] : Retira dinheiro de sua conta bancaria. ");
						SendClientMessage(i, COR_AMARELO_CLARO, "/depositar [valor] : Deposita em sua conta bancaria");
						SendClientMessage(i, COR_AMARELO_CLARO, "/saldo : Vê o saldo de sua conta bancaria.");
						SendClientMessage(i, COR_AMARELO_CLARO, "/saldocel : Vê o saldo de sua conta bancaria pelo celular.");
						SendClientMessage(i, COR_LARANJA, "Para visualizar novamente os comandos digite /bancoinfo");
					}
					else{
						SendClientMessage(i, COR_VERMELHO, "Você está no meio de uma missão não pode acessar o banco!");
					}
					AreaBanco[i] = 1;

				}
			}
			else if(X >= 1704.3108 && X <= 1710.7142 && Y >= -1687.7231 && Y <= -1682.6393){//caixa eletronico ls principal
				if(AreaBanco[i] == 0) {
				    if(Missao[i] == 1) {
						DisablePlayerCheckpoint(i);
						SetPlayerCheckpoint(i, 1707.6603,-1683.2781,13.5469, 1.0);
						SendClientMessage(i, COR_COP_ELITE, "Caixa Eletrônico de Los Santos:");
						SendClientMessage(i, COR_AMARELO_CLARO, "/retirar [valor] ou /sacar [valor] : Retira dinheiro de sua conta bancaria. ");
						SendClientMessage(i, COR_AMARELO_CLARO, "/depositar [valor] : Deposita em sua conta bancaria");
						SendClientMessage(i, COR_AMARELO_CLARO, "/saldo : Vê o saldo de sua conta bancaria.");
						SendClientMessage(i, COR_AMARELO_CLARO, "/saldocel : Vê o saldo de sua conta bancaria pelo celular.");
						SendClientMessage(i, COR_LARANJA, "Para visualizar novamente os comandos digite /bancoinfo");
					}
					else{
						SendClientMessage(i, COR_VERMELHO, "Você está no meio de uma missão não pode acessar o banco!");
					}
					AreaBanco[i] = 1;
				}
			}
			else if(X >= 392.0194 && X <= 399.6201 && Y >= -1806.2046 && Y <= -1800.3202){//caixa eletronico ls secuntario
				if(AreaBanco[i] == 0) {
				    if(Missao[i] == 1) {
						DisablePlayerCheckpoint(i);
						SetPlayerCheckpoint(i, 395.8569,-1805.9064,7.8380, 1.0);
						SendClientMessage(i, COR_COP_ELITE, "Caixa Eletrônico da Praia de Santa Maria:");
						SendClientMessage(i, COR_AMARELO_CLARO, "/retirar [valor] ou /sacar [valor] : Retira dinheiro de sua conta bancaria. ");
						SendClientMessage(i, COR_AMARELO_CLARO, "/depositar [valor] : Deposita em sua conta bancaria");
						SendClientMessage(i, COR_AMARELO_CLARO, "/saldo : Vê o saldo de sua conta bancaria.");
						SendClientMessage(i, COR_AMARELO_CLARO, "/saldocel : Vê o saldo de sua conta bancaria pelo celular.");
						SendClientMessage(i, COR_LARANJA, "Para visualizar novamente os comandos digite /bancoinfo");
					}
					else{
						SendClientMessage(i, COR_VERMELHO, "Você está no meio de uma missão não pode acessar o banco!");
					}
					AreaBanco[i] = 1;
				}
			}
			else if(X >= 1580.2050 && X <= 1583.5479 && Y >= 1757.5045 && Y <= 1761.8827){//caixa eletronico hospital lv
				if(AreaBanco[i] == 0) {
        			if(Missao[i] == 1) {
						DisablePlayerCheckpoint(i);
						SetPlayerCheckpoint(i, 1582.7406,1757.4973,10.8203, 1.0);
						SendClientMessage(i, COR_COP_ELITE, "Caixa Eletrônico do Hospital de Las Venturas:");
						SendClientMessage(i, COR_AMARELO_CLARO, "/retirar [valor] ou /sacar [valor] : Retira dinheiro de sua conta bancaria. ");
						SendClientMessage(i, COR_AMARELO_CLARO, "/depositar [valor] : Deposita em sua conta bancaria");
						SendClientMessage(i, COR_AMARELO_CLARO, "/saldo : Vê o saldo de sua conta bancaria.");
						SendClientMessage(i, COR_AMARELO_CLARO, "/saldocel : Vê o saldo de sua conta bancaria pelo celular.");
						SendClientMessage(i, COR_LARANJA, "Para visualizar novamente os comandos digite /bancoinfo");
					}
					else{
						SendClientMessage(i, COR_VERMELHO, "Você está no meio de uma missão não pode acessar o banco!");
					}
					AreaBanco[i] = 1;
				}
			}
			else if(X >= -183.1262 && X <= -179.1874 && Y >= 1134.7365 && Y <= 1140.8806){//caixa eletronico fc
				if(AreaBanco[i] == 0) {
				    if(Missao[i] == 1) {
						DisablePlayerCheckpoint(i);
						SetPlayerCheckpoint(i, -181.5996,1137.5221,19.7422, 1.0);
						SendClientMessage(i, COR_COP_ELITE, "Caixa Eletrônico de Forst Carson:");
						SendClientMessage(i, COR_AMARELO_CLARO, "/retirar [valor] ou /sacar [valor] : Retira dinheiro de sua conta bancaria. ");
						SendClientMessage(i, COR_AMARELO_CLARO, "/depositar [valor] : Deposita em sua conta bancaria");
						SendClientMessage(i, COR_AMARELO_CLARO, "/saldo : Vê o saldo de sua conta bancaria.");
						SendClientMessage(i, COR_AMARELO_CLARO, "/saldocel : Vê o saldo de sua conta bancaria pelo celular.");
						SendClientMessage(i, COR_LARANJA, "Para visualizar novamente os comandos digite /bancoinfo");
					}
					else{
						SendClientMessage(i, COR_VERMELHO, "Você está no meio de uma missão não pode acessar o banco!");
					}
					AreaBanco[i] = 1;
				}
			}
			else if(X >= -2208.0637 && X <= -2202.5322 && Y >= -2292.6494 && Y <= -2286.9622){//caixa eletronico ap
				if(AreaBanco[i] == 0) {
				    if(Missao[i] == 1) {
						DisablePlayerCheckpoint(i);
						SetPlayerCheckpoint(i, -2206.0032,-2290.7778,30.6250, 1.0);
						SendClientMessage(i, COR_COP_ELITE, "Caixa Eletrônico do Hospital de Angel Pine:");
						SendClientMessage(i, COR_AMARELO_CLARO, "/retirar [valor] ou /sacar [valor] : Retira dinheiro de sua conta bancaria. ");
						SendClientMessage(i, COR_AMARELO_CLARO, "/depositar [valor] : Deposita em sua conta bancaria");
						SendClientMessage(i, COR_AMARELO_CLARO, "/saldo : Vê o saldo de sua conta bancaria.");
						SendClientMessage(i, COR_AMARELO_CLARO, "/saldocel : Vê o saldo de sua conta bancaria pelo celular.");
						SendClientMessage(i, COR_LARANJA, "Para visualizar novamente os comandos digite /bancoinfo");
					}
					else{
						SendClientMessage(i, COR_VERMELHO, "Você está no meio de uma missão não pode acessar o banco!");
					}
					AreaBanco[i] = 1;
				}
			}
			else if(X >= -2431.1711 && X <= -2429.1912 && Y >= 64.9186 && Y <= 69.0973){//banco sf entrada
			    if(Missao[i] == 1) {
			    	SetPlayerPos(i,2307.3384, -16.1068, 26.7496);
			    	SendClientMessage(i,COR_AMARELO_SCLARO, "Você entrou no banco");
			    	SendClientMessage(i,COR_VERMELHO, "Vá até o checkpoint marcado em seu mapa.");
			    	GameTextForPlayer(i, "~y~Banco", 1000, 1);
					SetPlayerCheckpoint(i, 2316.3018, -12.7580, 26.7422, 1.0);
					SetPlayerMapIcon(i,0,316.3018, -12.7580, 26.7422,52,0xFFFFFFFF);
					AddStaticPickup(1274,1,316.3018, -12.7580, 26.7422);
				}
				else{
					SendClientMessage(i, COR_VERMELHO, "Você está no meio de uma missão não pode acessar o banco!");
				}
			}
			else if(X >= 2304.6868 && X <= 2306.0764 && Y >= -17.3533 && Y <= -14.2469){//banco sf saida
			    SetPlayerPos(i,-2426.4385,66.4771,35.1719);
			    DisablePlayerCheckpoint(i);
			}
			else if(X >= -229.1006 && X <= -222.3829 && Y >= 1393.7872 && Y <= 1412.1816 || X >= 488.2628 && X <= 512.0616 && Y >= -88.5894 && Y <= -67.7595){
			    GameTextForPlayer(i,"~g~Bar",1000,1);
			    AreaBar[i] = 1;
			}
			else if(X >= -2112.7395 && X <= -2090.7546 && Y >= -2247.9727 && Y <= -2222.8323){//carga ap
			    GameTextForPlayer(i,"Reload Logistica",1000,4);
			    AreaLogistica[i] = 1;
			}
			else if(X >= -2158.9739 && Y <= -2435.3933 && X <= -2133.7820&& Y >= -2458.7314){//taxi ap
      			GameTextForPlayer(i,"~y~Cooperativa de Taxi",3000,1);
			}
			else if(X >= 1536.8982 && Y >= -1679.9175 && X <= 1538.9469&& Y <= -1677.3486){
				DisablePlayerCheckpoint(i);
				GameTextForPlayer(i,"~g~Aeroporto de Los Santos",3000,1);
				SendClientMessage(i, COR_AZUL, "Os policiais te deixaram no aeroporto, compre uma passagem para San Fierro.");
				SetPlayerCheckpoint(i, 1642.0026,-2335.2190,13.5469, 1.7);
				SetPlayerPos(i,1652.1752,-2326.0659,13.5469);
			}
			else if(X >= 1640.7946 && Y >= -2335.4839 && X <= 1643.2434 && Y <= -2334.0049){
				if(AreaAeroLS[i] == 0) {
					GameTextForPlayer(i,"~w~Caixa",3000,1);
					SendClientMessage(i, COR_AZUL, "Você entrou no Caixa do Aeroporto de Los Santos.");
					SendClientMessage(i, COR_AMARELO_CLARO, "Digite /passagemsf comprar uma passagem para San Fierro.");
					AreaAeroLS[i] = 1;
				}
			}
			else if(X >= 1737.6990 && Y <= -2018.7426 && X <= 1812.3337 && Y >= -2076.6140 || X >= -2095.3232 && Y <= -103.8250 && X <= -2012.2542 && Y >= -280.0541 || X >= -150.0648 && Y <= 1137.7106 && X <= -134.8052 && Y >= 1108.8424 || X >= -2152.9187 && Y <= -2239.6670 && X <= -2117.0593 && Y >= -2272.0034){
			    if(AreaEscola[i] == 0) {
					GameTextForPlayer(i,"~y~Auto-Escola",3000,1);
					SendClientMessage(i, COR_AMARELO, "Você entrou em uma Auto-Escola.");
					SendClientMessage(i, COR_AMARELO_CLARO, "Digite /autoinfo para mais informações.");
					AreaEscola[i] = 1;
				}
			}
			else if(X >= -2218.7876 && Y <= -2283.6938 && X <= -2196.2480 && Y >= -2302.9141){//hospital ap
			    GameTextForPlayer(i,"~r~Hospital",3000,1);
			}
			else if(X >= -2199.4460 && Y <= -2251.7737 && X <= -2189.1111 && Y >= -2261.1230){//hotel ap
			    GameTextForPlayer(i,"~g~Hotel",3000,1);
			    AreaHotel[i] = 1;
			}
			else if(X >= -1610.9099 && X <= -1496.5111 && Y >= 1279.2794 && Y <= 1295.2489){
				if(AreaCoopPesca[i] == 0) {
					GameTextForPlayer(i,"~b~Cooperativa de Pesca",1000,1);
					SendClientMessage(i, COR_AZUL, "Você entrou na Coopertiva de Pesca.");
					SendClientMessage(i, COR_AMARELO_CLARO, "Digite /pescainfo para mais informações.");
					AreaCoopPesca[i] = 1;
				}
			}
			else if(X >= -1194.7273 && X <= -1007.1719 && Y >= -1064.6096 && Y <= -915.6717){
			    GameTextForPlayer(i,"Plantacao da Fazenda",1000,4);
			    AreaFazenda[i] = 1;
			}
			else if(X >= -1118.8129 && X <= -1027.5986 && Y >= -1319.42541 && Y <= -1120.223){
			    GameTextForPlayer(i,"Fazenda, VENDA do Milho",1000,4);
			    AreaCoopFazenda[i] = 1;
			}
			else if(X >= -2824.2483 && X <= -2801.2568 && Y >= -1534.1261 && Y <= -1510.1261){
			    if(AreaCoopCaca[i] == 0) {
					GameTextForPlayer(i,"~b~Cooperativa de Caca",1000,1);
					SendClientMessage(i, COR_AZUL, "Você entrou na Coopertiva de Caça.");
					SendClientMessage(i, COR_AMARELO_CLARO, "Digite /cacainfo para mais informações.");
					AreaCoopCaca[i] = 1;
				}
			}
			else if((X >= -364.4092 && Y <= 1202.5830 && X <= -357.1573 && Y >= 1194.7305 || X >= -375.7656 && Y <= 1192.6091  && X <= -345.4589 && Y >= 1156.0710)){//desmanchar fs
    			if(AreaDesmanche[i] == 0) {
					GameTextForPlayer(i,"~g~Desmanche",3000,1);
					SendClientMessage(i,COR_VERMELHO, "Digite /desmanchar para desmanchar este veículo.");
					AreaDesmanche[i] = 1;
				}
			}
			else if((X >= 110.7788 && Y <= 1484.3899  && X <= 288.1017 && Y >= 1336.3016)){//refinaria lv
				if(AreaRefinaria[i] == 0) {
					GameTextForPlayer(i,"~r~Refinaria",3000,1);
					SendClientMessage(i, COR_VERMELHO, "Você entrou na Refinaria:");
					SendClientMessage(i, COR_AMARELO_CLARO, "Digite /refinariainfo para mais informações.");
					AreaRefinaria[i] = 1;
				}
			}
			else if((X >= -1496.1409 && Y <= 1884.1014 && X <= -1449.3982 && Y >= 1851.1890) || (X >= 608.2354 && X <= 619.7912 && Y >= 1851.1890 && Y <= 1884.1014) || (X >= -1332.9951 && X <= -1324.0493 && Y >= 2669.6433 && Y <= 2685.6675)){
				if(AreaPosto[i] == 0) {
					GameTextForPlayer(i,"~r~Posto",3000,1);
					SendClientMessage(i, COR_VERMELHO, "Você entrou em um Posto.");
					SendClientMessage(i, COR_AMARELO_CLARO, "Digite /postoinfo para mais informações.");
					AreaPosto[i] = 1;
				}
			}
			else if((X >= -1643.8086 && Y <= -2685.7473 && X <= -1515.1466 && Y >= -2579.6660 || X >= -2785.4309 && Y <= -2542.8059 && X <= -2221.5046 && Y >= -2579.6660 || X >= 651.7850 && X <= 661.3630 && Y >= -577.0740 && Y <= -555.3830) || (X >= 2131.2070 && X <= 2161.8208 && Y >= 2735.4387 && Y <= 2762.3884) || (X >= -1615.1073 && X <= -1601.3243 && Y >= -2733.9380 && Y <= -2692.7102) || (X >= 1587.0552 && X <= 1605.8910 && Y >= 2189.7161 && Y <= 2208.1714)){
		 		if(AreaPosto[i] == 0) {
					GameTextForPlayer(i,"~r~Posto",3000,1);
					SendClientMessage(i, COR_VERMELHO, "Você entrou em um Posto.");
					SendClientMessage(i, COR_AMARELO_CLARO, "Digite /postoinfo para mais informações.");
					AreaPosto[i] = 1;
				}
			}
			else if((X >= 996.3851 && X <= 1011.8171 && Y >= -943.7941 && Y <= -930.1505) || (X >= -107.9445 && X <= -77.7968 && Y >= -1178.9248 && Y <= -1163.9293) || (X >= -2420.0505 && X <= -2400.0459 && Y >= 958.4067 && Y <= 997.0031) || (X >= -1703.8510 && X <= -1644.2720 && Y >= 408.3849 && Y <= 427.6900) || (X >= 2104.0168 && X <= 2136.1519 && Y >= 901.5171 && Y <= 947.6444)){
			    if(AreaPosto[i] == 0) {
					GameTextForPlayer(i,"~r~Posto",3000,1);
					SendClientMessage(i, COR_VERMELHO, "Você entrou em um Posto.");
					SendClientMessage(i, COR_AMARELO_CLARO, "Digite /postoinfo para mais informações.");
					AreaPosto[i] = 1;
				}
			}
			else if((X >= -1695.3916 && X <= -1659.0499 && Y >= 412.7228 && Y <= 414.0763) || (X >= -1675.6531 && X <= -1675.1965 && Y >= 398.1009 && Y <= 434.0430) || (X >= 1932.0310 && X <= 1948.1785 && Y >= -1783.5273 && Y <= -1764.2950) || (X >= 992.8317 && X <= 1016.6620 && Y >= -945.4556 && Y <= -929.5608) || (X >= 2189.5925 && X <= 2213.6421 && Y >= 2463.2566 && Y <= 2487.5833)){
       			if(AreaPosto[i] == 0) {
					GameTextForPlayer(i,"~r~Posto",3000,1);
					SendClientMessage(i, COR_VERMELHO, "Você entrou em um Posto.");
					SendClientMessage(i, COR_AMARELO_CLARO, "Digite /postoinfo para mais informações.");
					AreaPosto[i] = 1;
				}
			}
			else if(X >= -2106.3938 && X <= -2037.6825 && Y >= 203.8713 && Y <= 279.2211){
       			if(AreaPedreira[i] == 0) {
					GameTextForPlayer(i,"~w~Pedreira",3000,1);
					SendClientMessage(i, COR_VERMELHO, "Você entrou na Pedreira. Cuidado os trabalhadores aqui não gostam muito de distraição.");
					AreaPedreira[i] = 1;
				}
			}
			else if(X >= 526.3201 && X <= 699.0590 && Y >= 848.5513 && Y <= 940.3968){
       			if(AreaObra[i] == 0) {
					GameTextForPlayer(i,"~g~Obra de construcao",3000,1);
					AreaObra[i] = 1;
				}
			}
			else if(X >= -1610.9099 && X <= -1496.5111 && Y >= 1279.2794 && Y <= 1295.2489){
				if(AreaCoopPesca[i] == 0) {
					GameTextForPlayer(i,"~b~Cooperativa de Pesca",1000,1);
					SendClientMessage(i, COR_AZUL, "Você entrou na Coopertiva de Pesca.");
					SendClientMessage(i, COR_AMARELO_CLARO, "Digite /pescainfo para mais informações.");
					AreaCoopPesca[i] = 1;
				}
			}
			else if(X >= -2689.9836 && X <= -2638.4956 && Y >= 1388.9476 && Y <= 1431.6681){
				if(AreaBalada[i] == 0) {
					GameTextForPlayer(i,"~b~Balada",1000,1);
					balada[i] = 1;
					SendClientMessage(i, COR_AZUL, "Você entrou na Balada Reload.");
					SendClientMessage(i, COR_AMARELO_CLARO, "Digite /baladainfo para mais informações.");
					AreaBalada[i] = 1;
				}
            }
            else if(X >= -1555.4890 && X <= -1542.7485 && Y >= -440.4771 && Y <= -426.9335){
				if(AreaAeroporto[i] == 0) {
                    GameTextForPlayer(i,"~y~AEROPORTO",3000,1);
					AreaAeroporto[i] = 1;
				}
			}
			else if(X >= -2606.4307 && X <= -2594.6824 && Y >= 1327.9158 && Y <= 1339.5546){
				if(AreaRadar[i] == 0) {
				    GameTextForPlayer(i,"~b~RADAR",3000,1);
					AreaRadar[i] = 1;/*1*/
				}
			}
			else if(X >= -2215.0361 && X <= -2208.7178 && Y >= 1324.7434 && Y <= 1339.7783){
				if(AreaRadar[i] == 0) {
				    GameTextForPlayer(i,"~b~RADAR",3000,1);
					AreaRadar[i] = 1;/*2*/
				}
			}
			else if(X >= -1978.4377 && X <= -1973.3818 && Y >= 1288.7751 && Y <= 1288.9655){
				if(AreaRadar[i] == 0) {
				    GameTextForPlayer(i,"~b~RADAR",3000,1);
					AreaRadar[i] = 1;/*3*/
				}
			}
			else if(X >= -1978.1754 && X <= -1972.3431 && Y >= 1279.7661 && Y <= 1285.8601){
				if(AreaRadar[i] == 0) {
				    GameTextForPlayer(i,"~b~RADAR",3000,1);
					AreaRadar[i] = 1;/*4*/
				}
			}
			else if(X >= -1890.7643 && X <= -1877.3749 && Y >= 1132.4297 && Y <= 1133.8512){
				if(AreaRadar[i] == 0) {
				    GameTextForPlayer(i,"~b~RADAR",3000,1);
					AreaRadar[i] = 1;/*5*/
				}
			}
			else if(X >= -2011.6628 && X <= -1997.0009 && Y >= 782.1808 && Y <= 782.8787){
				if(AreaRadar[i] == 0) {
				    GameTextForPlayer(i,"~b~RADAR",3000,1);
					AreaRadar[i] = 1;/*6*/
				}
			}
			else if(X >= -2151.3376 && X <= -2134.8833 && Y >= 526.5551 && Y <= 530.8201){
				if(AreaRadar[i] == 0) {
				    GameTextForPlayer(i,"~b~RADAR",3000,1);
					AreaRadar[i] = 1;/*7*/
				}
			}
			else if(X >= -2108.3706 && X <= -2103.7710 && Y >= 315.8866 && Y <= 324.7085){
				if(AreaRadar[i] == 0) {
				    GameTextForPlayer(i,"~b~RADAR",3000,1);
					AreaRadar[i] = 1;/*8*/
				}
			}
			else if(X >= -2010.4415 && X <= -1997.2301 && Y >= 363.0030 && Y <= 363.8209){
				if(AreaRadar[i] == 0) {
				    GameTextForPlayer(i,"~b~RADAR",3000,1);
					AreaRadar[i] = 1;/*9*/
				}
			}
			else if(X >= -2781.1699 && X <= -2774.7734 && Y >= 462.9915 && Y <= 463.0585){
				if(AreaRadar[i] == 0) {
				    GameTextForPlayer(i,"~b~RADAR",3000,1);
					AreaRadar[i] = 1;/*10*/
				}
			}
			else if(X >= -2721.5723 && X <= -2715.2126 && Y >= 572.7213 && Y <= 558.7436){
				if(AreaRadar[i] == 0) {
				    GameTextForPlayer(i,"~b~RADAR",3000,1);
					AreaRadar[i] = 1;/*11*/
				}
			}
			else if(X >= -2548.7087 && X <= -2543.7185 && Y >= 703.9271 && Y <= 712.9588){
				if(AreaRadar[i] == 0) {
				    GameTextForPlayer(i,"~b~RADAR",3000,1);
					AreaRadar[i] = 1;/*12*/
				}
			}
			else if(X >= -2531.5413 && X <= -2521.7644 && Y >= 821.6251 && Y <= 827.0449){
				if(AreaRadar[i] == 0) {
				    GameTextForPlayer(i,"~b~RADAR",3000,1);
					AreaRadar[i] = 1;/*13*/
				}
			}
			else if(X >= -2479.9121 && X <= -2475.7048 && Y >= 912.9851 && Y <= 913.1282){
				if(AreaRadar[i] == 0) {
				    GameTextForPlayer(i,"~b~RADAR",3000,1);
					AreaRadar[i] = 1;/*14*/
				}
			}
			else if(X >= -1765.1848 && X <= -1759.5828 && Y >= 911.2502 && Y <= 938.1314){
				if(AreaRadar[i] == 0) {
				    GameTextForPlayer(i,"~b~RADAR",3000,1);
					AreaRadar[i] = 1;/*15*/
				}
			}
			else if(X >= -1721.6741 && X <= -1706.9513 && Y >= 805.0636 && Y <= 805.1318){
				if(AreaRadar[i] == 0) {
				    GameTextForPlayer(i,"~b~RADAR",3000,1);
					AreaRadar[i] = 1;/*16*/
				}
			}
			else if(X >= -1608.3539 && X <= -1604.9110 && Y >= 724.1099 && Y <= 738.5641){
				if(AreaRadar[i] == 0) {
				    GameTextForPlayer(i,"~b~RADAR",3000,1);
					AreaRadar[i] = 1;/*17*/
				}
			}
			else if(X >= -2011.5265 && X <= -1996.7944 && Y >= 582.7819 && Y <= 588.7749){
				if(AreaRadar[i] == 0) {
				    GameTextForPlayer(i,"~b~RADAR",3000,1);
					AreaRadar[i] = 1;/*18*/
				}
			}
			else if(X >= -1625.8806 && X <= -1604.9390 && Y >= 427.4234 && Y <= 447.9202){
				if(AreaRadar[i] == 0) {
				    GameTextForPlayer(i,"~b~RADAR",3000,1);
					AreaRadar[i] = 1;/*19*/
				}
			}
			else if(X >= -8.7048 && X <= -2.5727 && Y >= 1203.1498 && Y <= 1203.2510){
				if(AreaRadar[i] == 0) {
				    GameTextForPlayer(i,"~b~RADAR",3000,1);
					AreaRadar[i] = 1;/*20*/
				}
			}
			else if(X >= -70.2448 && X <= -60.7134 && Y >= 1179.2515 && Y <= 1179.7310){
				if(AreaRadar[i] == 0) {
				    GameTextForPlayer(i,"~b~RADAR",3000,1);
					AreaRadar[i] = 1;/*21*/
				}
			}
			else if(X >= -42.0447 && X <= -34.8634 && Y >= 1093.6133 && Y <= 1103.2422){
				if(AreaRadar[i] == 0) {
				    GameTextForPlayer(i,"~b~RADAR",3000,1);
					AreaRadar[i] = 1;/*22*/
				}
			}
			else if(X >= -20.4331 && X <= -10.7560 && Y >= 1042.2537 && Y <= 1043.3009){
				if(AreaRadar[i] == 0) {
				    GameTextForPlayer(i,"~b~RADAR",3000,1);
					AreaRadar[i] = 1;/*23*/
				}
			}
			else if(X >= -305.8265 && X <= -295.4340 && Y >= 1053.7714 && Y <= 1058.4374){
				if(AreaRadar[i] == 0) {
				    GameTextForPlayer(i,"~b~RADAR",3000,1);
					AreaRadar[i] = 1;/*24*/
				}
			}
			else if(X >= -334.8043 && X <= -328.7150 && Y >= 1143.3896 && Y <= 1143.5027){
				if(AreaRadar[i] == 0) {
				    GameTextForPlayer(i,"~b~RADAR",3000,1);
					AreaRadar[i] = 1;/*25*/
				}
			}
			else if(X >= -829.6514 && X <= -826.8742 && Y >= 1437.7278 && Y <= 1437.9860){
			    	if(AreaHotel[i] == 0) {
					GameTextForPlayer(i,"~r~HOTEL",3000,1);
					SendClientMessage(i, COR_BRANCO, "Você está em um hotel digite /hotel para ficar aqui");
                    AreaHotel[i] = 1;
				}
			}
			else if(X >= -1848.1218 && X <= -1831.0234 && Y >= 117.0933 && Y <= 134.7023){
			    	if(AreaVenda[i] == 0) {
					GameTextForPlayer(i,"~g~area de venda",3000,1);
                    AreaVenda[i] = 1;
				}
			}
			else if(X >= -2133.2539 && X <= -2121.0898 && Y >= -87.0582 && Y <= -76.2424){
			    	if(AreaPortao[i] == 0) {
					GameTextForPlayer(i,"~w~Portoes Abertos",3000,1);
					StopObject(portaotrafico);
					MoveObject(portaotrafico,-2112.549805, -80.643799, 36.044720, 2);
                    AreaPortao[i] = 1;
				}
			}
			else if(X >= -1775.2002 && X <= -1763.3048 && Y >= 974.2687 && Y <= 993.1309){
			    	if(AreaEstacionamento[i] == 0) {
					GameTextForPlayer(i,"~w~Portoes Abertos",3000,1);
					StopObject(portao1);
					StopObject(portao2);
					MoveObject(portao1,-1770.123779, 975.467773, 24.213446, 2);
	   				MoveObject(portao2,-1770.137329, 994.080383, 24.182503, 2);
                    AreaEstacionamento[i] = 1;
				}
			}
			else if(X >= -2189.6699 && X <= -2139.2532 && Y >= -241.4000 && Y <= -226.4995){
			    	if(AreaTrafico[i] == 0) {
					GameTextForPlayer(i,"~r~area de trafico",3000,1);
                    AreaTrafico[i] = 1;
				}
			}
			else if(X >= -1987.1302 && X <= -1917.1047 && Y >= 639.5455 && Y <= 723.5545){
			    	if(AreaLimosine[i] == 0) {
					GameTextForPlayer(i,"~p~companhia de limosine",3000,1);
                    AreaLimosine[i] = 1;
				}
			}
			else if(X >= -1680.2588 && X <= -1644.0610 && Y >= 1202.5491 && Y <= 1223.7969){
			    	if(AreaAluguel[i] == 0) {
					GameTextForPlayer(i,"~p~area de aluguel",3000,1);
                    AreaAluguel[i] = 1;
				}
			}
			else if(X >= -2672.4089 && X <= -2613.1201 && Y >= 631.0959 && Y <= 631.2515){
			    	if(AreaHospital[i] == 0) {
					GameTextForPlayer(i,"~y~Hospital",3000,1);
                    AreaHospital[i] = 1;
				}
			}
			else if(X >= -1640.4901 && X <= -1573.1110 && Y >= 687.5545 && Y <= 687.6561){
			    	if(AreaDelegacia[i] == 0) {
					GameTextForPlayer(i,"~r~Delegacia",3000,1);
                    AreaDelegacia[i] = 1;
				}
			}
			else if(X >= -323.9807 && X <= -309.9444 && Y >= 1061.5651 && Y <= 1062.4645){
			    	if(AreaHospital[i] == 0) {
					GameTextForPlayer(i,"~y~Hospital",3000,1);
                    AreaHospital[i] = 1;
				}
			}
			else if(X >= -2107.2751 && X <= -2103.8931 && Y >= -2343.5574 && Y <= -2338.5144){
					if(AreaSorveteria[i] == 0) {
					GameTextForPlayer(i,"~b~Sorveteria",3000,1);
					AreaSorveteria[i] = 1;
					SendClientMessage(i, COR_VERMELHO, "Digite /tomarsorvete [sabor] para tomar sorvete!");
					}
		    }
			else if(X >= -93.6182 && X <= -85.6024 && Y >= 1225.5551 && Y <= 1229.1606){
			    	if(AreaHotel[i] == 0) {
					GameTextForPlayer(i,"~p~Hotel",3000,1);
					SendClientMessage(i, COR_VERMELHO, "Você está num hotel para se hospedar digite /hotel");
					SendClientMessage(i, COR_VERMELHO, "OBS: Você ira pagando $700 de despeja");
                    AreaHotel[i] = 1;
				}
			}
			else if(X >= 10.1433 && X <= 12.7759 && Y >= 1218.0850 && Y <= 1226.6731){
			    	if(AreaHotel[i] == 0) {
					GameTextForPlayer(i,"~p~Hotel",3000,1);
					SendClientMessage(i, COR_VERMELHO, "Você está num hotel para se hospedar digite /hotel");
					SendClientMessage(i, COR_VERMELHO, "OBS: Você ira pagando $700 de despeja");
                    AreaHotel[i] = 1;
				}
			}
			else if(X >= 86.3387 && X <= 89.8250 && Y >= 1180.8751 && Y <= 1184.8682){
			    	if(AreaHotel[i] == 0) {
					GameTextForPlayer(i,"~p~Hotel",3000,1);
					SendClientMessage(i, COR_VERMELHO, "Você está num hotel para se hospedar digite /hotel");
					SendClientMessage(i, COR_VERMELHO, "OBS: Você ira pagando $700 de despeja");
                    AreaHotel[i] = 1;
				}
			}
			else if((X >= -1564.6642 && Y <= 481.7943  && X <= -1327.8732 && Y >= 308.5811)){
				if(Areacop[i] == 0) {
					GameTextForPlayer(i,"~g~Base do Exercito",3000,1);
					if(Profissao[i] != EXERCITO || !IsPlayerAdmin(i)){
						SendClientMessage(i, COR_VERMELHO, "Você entrou em uma área não autorizada e por isso foi morto.");
						SetPlayerHealth(i, 0);
						Areacop[i] = 1;
					}
				}
			}
			else if((X >= -1640.5190 && Y <= 687.6575  && X <= -1573.1179 && Y >= 647.1256)){
    			if(Areacop[i] == 0) {
					GameTextForPlayer(i,"~b~Departamento de Policia",3000,1);
					Areacop[i] = 1;
				}
			}
			else {
				if(AreaBanco[i] == 1) {
					DisablePlayerCheckpoint(i);
					AreaBanco[i] = 0;
				}
				if(AreaHotel[i] == 1){
   					AreaHotel[i] = 0;
				}
				if(AreaBar[i] == 1){
   					AreaBar[i] = 0;
				}
				if(AreaLogistica[i] == 1){
    				AreaLogistica[i] = 0;
				}
				if(AreaPosto[i] == 1) {
				    AreaPosto[i] = 0;
				}
				if(AreaCoopPesca[i] == 1) {
				    AreaCoopPesca[i] = 0;
				}
				if(AreaFazenda[i] == 1) {
				    AreaFazenda[i] = 0;
				}
				if(AreaCoopFazenda[i] == 1) {
				    AreaCoopFazenda[i] = 0;
				}
				if(AreaRefinaria[i] == 1) {
				    AreaRefinaria[i] = 0;
				}
				if(AreaPedreira[i] == 1) {
				    AreaPedreira[i] = 0;
				}
				if(AreaObra[i] == 1) {
				    AreaObra[i] = 0;
				}
				if(AreaBalada[i] == 1) {
                    balada[i] = 0;
				    AreaBalada[i] = 0;
                }
                if(AreaPortao[i] == 1) {
					StopObject(portaotrafico);
                    MoveObject(portaotrafico,-2122.220703, -80.644669, 36.037155, 2);
				    AreaPortao[i] = 0;
				}
				if(AreaEstacionamento[i] == 1) {
					StopObject(portao1);
					StopObject(portao2);
                    MoveObject(portao1,-1770.112793, 979.835083, 24.182503, 2);
	  			    MoveObject(portao2,-1770.122803, 988.664185, 24.182503, 2);
				    AreaEstacionamento[i] = 0;
				}
				if(AreaEscola[i] == 1) {
				    AreaEscola[i] = 0;
				}
				if(AreaDesmanche[i] == 1) {
				    AreaDesmanche[i] = 0;
                }
				if(AreaAeroporto[i] == 1) {
				    AreaAeroporto[i] = 0;
                }
				if(AreaRadar[i] == 1) {
				    AreaRadar[i] = 0;
                }
				if(AreaHotel[i] == 1) {
				    AreaHotel[i] = 0;
                }
                if(AreaTrafico[i] == 1) {
				    AreaTrafico[i] = 0;
                }
				if(AreaVenda[i] == 1) {
				    AreaVenda[i] = 0;
                }
				if(AreaHospital[i] == 1) {
				    AreaHospital[i] = 0;
                }
				if(AreaDelegacia[i] == 1) {
				    AreaDelegacia[i] = 0;
                }
				if(AreaAluguel[i] == 1) {
				    AreaAluguel[i] = 0;
                }
                if(AreaMercado[i] == 1) {
				    AreaMercado[i] = 0;
                }
				if(AreaLimosine[i] == 1) {
				    AreaLimosine[i] = 0;
				}
				if(Areacop[i] == 1) {
				    Areacop[i] = 0;
				}
				if(AreaAeroLS[i] == 1) {
				    AreaAeroLS[i] = 0;
				}
				if(AreaSorveteria[i] == 1) {
				    AreaSorveteria[i] = 0;
				}
			}
		}
	}
}

public Megasena()
{
   for(new i=0; i<MAX_PLAYERS; i++){
   aposta[i] = false;
   new numerosorteado = random(21);
   if(numeroapostado[i] == numerosorteado){
   SendClientMessageToAll(COR_JUIZ,"Loteria's Reload. Sorteio!");
   new string[256];
   format(string,sizeof(string),"%s ganhou o sorteio! O número apostado foi %d",PlayerName(i),numerosorteado);
   SendClientMessageToAll(COR_JUIZ,string);
   GivePlayerMoney(i,moneyloteria);
   numeroapostado[i] = false;
   return 1;
   }
   else if(numeroapostado[i] != numerosorteado){
   SendClientMessageToAll(COR_JUIZ,"Loteria's Reload. Sorteio!");
   moneyloteria = moneyloteria + 2000;
   numeroapostado[i] = false;
   new msg[256];
   format(msg,sizeof(msg),"Nenhum vencedor. Talvez na próxima! O numero sorteado foi %d. O premio foi acumulado para R$%d",numerosorteado,moneyloteria);
   SendClientMessageToAll(COR_JUIZ,msg);
   return 1;
   }
}
   return 1;
}


public MoneyGrubScoreUpdate()
{
	new CashScore;
	for(new i=0; i<MAX_PLAYERS; i++){
		if (IsPlayerConnected(i)){
   			CashScore = GetPlayerMoney(i);
			SetPlayerScore(i, CashScore);
		}
	}
}


public CheckFuel()
{
new str[32];
for(new i=0;i<MAX_PLAYERS;i++)
{
if(IsPlayerConnected(i) == 1 && IsPlayerInAnyVehicle(i) == 1)
{
if(GetPlayerState(i) == PLAYER_STATE_DRIVER)
{
new Vi = GetPlayerVehicleID(i);
if(GPV[Vi] == -1)
{
return 1;
}
GPV[Vi]--;
format(str,sizeof(str),"~r~Combust¢vel: ~s~%d~b~l",GPV[Vi]);
GameTextForPlayer(i,str,1000,1);
}
}
}
return 1;
}
public LogarPlayer(playerid)
{
    new Float:X, Float:Y, Float:Z, Float:ang;
	GivePlayerMoney(playerid, udb_getAccState(PlayerName(playerid)) - GetPlayerMoney(playerid));
	udb_getPosition(PlayerName(playerid), X, Y, Z);
	udb_getAng(PlayerName(playerid), ang);
	SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), X, Y, Z, ang, 0, 0, 0, 0, 0, 0);
	Profissao[playerid] = udb_getProf(PlayerName(playerid));

	if(Profissao[playerid] == DESEMPREGADO) {
		SetPlayerColor(playerid, COR_DESEMPREGADO); // Cinza
	}
	else if(Profissao[playerid] == ENTREGADOR_PIZZA) {
		SetPlayerColor(playerid, COR_ENTREGADOR_PIZZA); // Beje
	}
	else if(Profissao[playerid] == BARMAN) {
		SetPlayerColor(playerid, COR_BARMAN); // Bege
	}
	else if(Profissao[playerid] == SORVETEIRO) {
		SetPlayerColor(playerid, COR_SORVETEIRO);
	}
	else if(Profissao[playerid] == VENDEDOR_LANCHE) {
		SetPlayerColor(playerid, COR_VENDEDOR_LANCHES); // Beje
	}
	else if(Profissao[playerid] == PARAMEDICO) {
		SetPlayerColor(playerid, COR_PARAMEDICO);
	}
	else if(Profissao[playerid] == INSTRUTOR_DE_DIRECAO) {
		SetPlayerColor(playerid, COR_INSTRUTOR); // VClaro
	}
	else if(Profissao[playerid] == FRENTISTA) {
		SetPlayerColor(playerid, COR_FRENTISTA); // Claro
	}
	else if(Profissao[playerid] == TAXISTA) {
		SetPlayerColor(playerid, COR_TAXISTA); // Amarelo
	}
	else if(Profissao[playerid] == MOTO_TAXI) {
		SetPlayerColor(playerid, COR_MOTO_TAXI); // Amarelo
	}
	else if(Profissao[playerid] == TAXI_AEREO) {
		SetPlayerColor(playerid, COR_TAXI_AEREO); // Amarelo
	}
	else if(Profissao[playerid] == SEQUESTRADOR) {
		SetPlayerColor(playerid, COR_TAXISTA); // Amarelo
	}
	else if(Profissao[playerid] == ASSASSINO) {
		SetPlayerColor(playerid, COR_ASSASSINO); // Vermelho
	}
	else if(Profissao[playerid] == ASSALTANTE) {
		SetPlayerColor(playerid, COR_ASSALTANTE); // Beje
	}
	else if(Profissao[playerid] == LADRAO_CARROS) {
		SetPlayerColor(playerid, COR_LADRAO_CARROS); // Vermelho
	}
	else if(Profissao[playerid] == TRAFICANTE) {
		SetPlayerColor(playerid, COR_TRAFICANTE); // Vermelho
	}
	else if(Profissao[playerid] == VENDEDOR_DE_ARMAS) {
		SetPlayerColor(playerid, COR_VENDEDOR_ARMAS); // Vermelho
	}
	else if(Profissao[playerid] == CACADOR) {
		SetPlayerColor(playerid, COR_CACADOR);
	}
	else if(Profissao[playerid] == PESCADOR) {
		SetPlayerColor(playerid, COR_PESCADOR);
	}
	else if(Profissao[playerid] == AGRICULTOR) {
		SetPlayerColor(playerid, COR_AGRICULTOR);
	}
	else if(Profissao[playerid] == COP_CIVIL) {
		SetPlayerColor(playerid, COR_COP_CIVIL); // Azul
	}
	else if(Profissao[playerid] == COP_RODOVIARIO) {
		SetPlayerColor(playerid, COR_COP_RODOVIARIO); // Azul
	}
	else if(Profissao[playerid] == COP_ELITE) {
		SetPlayerColor(playerid, COR_COP_ELITE); // Azul Claro
	}
	else if(Profissao[playerid] == DELEGADO) {
		SetPlayerColor(playerid, COR_DELEGADO); // Azul Escuro
	}
	else if(Profissao[playerid] == JUIZ) {
		SetPlayerColor(playerid, COR_JUIZ); // verde
	}
	else if(Profissao[playerid] == NARCOTICOS) {
		SetPlayerColor(playerid, COR_NARCOTICOS);
	}
	else if(Profissao[playerid] == POLICIA_FLORESTAL) {
		SetPlayerColor(playerid, COR_POLICIA_FLORESTAL); // verde azul
	}
	else if(Profissao[playerid] == IBAMA) {
		SetPlayerColor(playerid, COR_IBAMA); // azul
	}
	else if(Profissao[playerid] == EXERCITO) {
		SetPlayerColor(playerid, COR_EXERCITO); // verde
	}
	else if(Profissao[playerid] == ADVOGADO) {
		SetPlayerColor(playerid, COR_ADVOGADO); // roxo
	}
	else if(Profissao[playerid] == SEGURANÇA) {
		SetPlayerColor(playerid, COR_SEGURANÇA); // Azul claro
	}
	else if(Profissao[playerid] == MOTORISTA_PARTICULAR) {
		SetPlayerColor(playerid, COR_MOTORISTA); // Laranja
	}
	else if(Profissao[playerid] == MOTORISTA_DE_ONIBUS) {
		SetPlayerColor(playerid, COR_MOTORISTA_ONIBUS); // Claro
	}
	else if(Profissao[playerid] == MENDIGO ) {
		SetPlayerColor(playerid, COR_MENDIGO ); // Verde
	}
	else if(Profissao[playerid] == VENDEDOR_DE_CARROS) {
		SetPlayerColor(playerid, COR_VENDEDOR); // Verde
	}
	else if(Profissao[playerid] == CORRETOR) {
		SetPlayerColor(playerid, COR_CORRETOR); // Marfin
	}
	else if(Profissao[playerid] == SEGURADOR) {
		SetPlayerColor(playerid, COR_SEGURADOR);
	}
	else if(Profissao[playerid] == JORNALISTA) {
		SetPlayerColor(playerid, COR_JORNALISTA);
	}
	else if(Profissao[playerid] == CAMINHONEIRO) {
		SetPlayerColor(playerid, COR_CAMINHONEIRO);
	}
	else if(Profissao[playerid] == TRANSPORTE_GAS) {
		SetPlayerColor(playerid, COR_TRANSPORTE_GAS);
	}
	else if(Profissao[playerid] == CONFISCADOR) {
		SetPlayerColor(playerid, COR_CONFISCADOR);
	}
	else if(Profissao[playerid] == MECANICO) {
		SetPlayerColor(playerid, COR_MECANICO);
	}
	else if(Profissao[playerid] == CONTRABANDISTA) {
		SetPlayerColor(playerid, COR_CONTRABANDISTA);
	}
	else if(Profissao[playerid] == RECEITA_FEDERAL) {
		SetPlayerColor(playerid, COR_RECEITA_FEDERAL);
	}
	else if(Profissao[playerid] == JUSTICA_FEDERAL) {
		SetPlayerColor(playerid, COR_JUSTICA_FEDERAL);
	}
	else if(Profissao[playerid] == LIDER_DE_TRAFICO) {
		SetPlayerColor(playerid, COR_LIDER_DE_TRAFICO);
	}
	else if(Profissao[playerid] == PREFEITO) {
		SetPlayerColor(playerid, COR_PREFEITO);
	}
	else if(Profissao[playerid] == GOVERNADOR) {
		SetPlayerColor(playerid, COR_GOVERNADOR);
	}
	else if(Profissao[playerid] == PRESIDENTE) {
		SetPlayerColor(playerid, COR_PRESIDENTE);
	}
	else if(Profissao[playerid] == PROMOTER) {
		SetPlayerColor(playerid, COR_PROMOTER);
	}
	else if(Profissao[playerid] == PEDREIRO) {
		SetPlayerColor(playerid, COR_PEDREIRO);
	}
	else if(Profissao[playerid] == VENDEDOR_DE_BOMBAS) {
		SetPlayerColor(playerid, COR_VENDEDOR_DE_BOMBAS);
	}
	else if(Profissao[playerid] == PROSTITUTA) {
		SetPlayerColor(playerid, COR_PROSTITUTA);
	}
	else if(Profissao[playerid] == XERIFE) {
		SetPlayerColor(playerid, COR_XERIFE);
	}
	else if(Profissao[playerid] == TRANSPORTE_VALORES) {
		SetPlayerColor(playerid, COR_TRANSPORTE_VALORES);
	}



	if(udb_getPrisao(PlayerName(playerid)) == 1){
	    SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), 263.7124, 77.7232, 1001.0391, 277.6703, 0, 0, 0, 0, 0, 0);
	    Procurados[playerid] = 0;
	}
    else{
	    SpawnPlayer(playerid);
	    }
}

public sacar(playerid){
  if(IsPlayerConnected(playerid)){
  TogglePlayerControllable(playerid,1);
  return 1;
  }
  return 1;
}
public depositar(playerid){
  if(IsPlayerConnected(playerid)){
  TogglePlayerControllable(playerid,1);
  return 1;
  }
  return 1;
}
public GetDistanceBetweenPlayers(playerid,playerid2)
{
	new Float:x1,Float:y1,Float:z1,Float:x2,Float:y2,Float:z2;
	new Float:dis;
	GetPlayerPos(playerid,x1,y1,z1);
	GetPlayerPos(playerid2,x2,y2,z2);
	dis = floatsqroot(floatpower(floatabs(floatsub(x2,x1)),2)+floatpower(floatabs(floatsub(y2,y1)),2)+floatpower(floatabs(floatsub(z2,z1)),2));
	return floatround(dis);
}

public Taxi()
{
	for(new i=0; i<MAX_PLAYERS; i++){
		if(Taximetro[i][0] == 1){
			if(GetPlayerMoney(i) > PrecoCorrida[i] + 3){
			    new string[256];
				PrecoCorrida[i] = PrecoCorrida[i] + 3;
				format(string, sizeof(string), "O taxímetro mostra: R$%d", PrecoCorrida[i]);
				SendClientMessage(i, COR_VERDE, string);
				SendClientMessage(Taximetro[i][1], COR_VERDE, string);
			}
			if(GetPlayerMoney(i) < PrecoCorrida[i] + 3){
				SendClientMessage(i, COR_VERMELHO, "Seu dinheiro para o taxi acabou, vai ficar aqui");
				SendClientMessage(Taximetro[i][1], COR_VERMELHO, "Seu passageiro ficou sem dinheiro e por isso foi deixado aqui.");
				GivePlayerMoney(i, 0 - PrecoCorrida[i]);
				GivePlayerMoney(Taximetro[i][1], PrecoCorrida[i]);
				RemovePlayerFromVehicle(i);
				PrecoCorrida[i] = 0;
				Taximetro[i][1] = 0;
				Taximetro[i][0] = 0;
			}
		}
	}
}
public tirandograna(playerid,plid,car)
{
        if(Sexo[playerid] == 1){
        if(Sexo[plid] == 1){
        if(GetPlayerMoney(plid) >= 2){
        GivePlayerMoney(playerid,2);
        GivePlayerMoney(plid,0-2);
        }
	    if(GetPlayerMoney(plid) < 2){
	    TogglePlayerControllable(playerid,1);
	    TogglePlayerControllable(plid,1);
	    Sexo[playerid] = 0;
	    Sexo[plid] = 0;
	    FazendoSexo[playerid] = 0;
	    FazendoSexo[plid] = 0;
	    SendClientMessage(playerid, COR_VERMELHO, "O sexo acabou pois o outro jogador ficou sem grana.");
	    SendClientMessage(plid, COR_VERMELHO, "Sexo terminado pois seu dinheiro acabou.");
	    }
    }
  }
}
public contagem1()
{
   GameTextForAll("~y~4",2000,6);
   SetTimer("contagem2",2000,false);
   return 1;
}

public contagem2()
{
       GameTextForAll("~y~3",2000,6);
       SetTimer("contagem3",2000,false);
       return 1;
}
public contagem3()
{
 GameTextForAll("~y~2",2000,6);
 SetTimer("contagem4",2000,false);
 return 1;
}
public contagem4()
{
 GameTextForAll("~y~1",2000,6);
 SetTimer("contagem5",2000,false);
 return 1;
}
public contagem5()
{
 GameTextForAll("~r~GO",2000,6);
 return 1;
}

public Balada()
{
	for(new i=0; i<MAX_PLAYERS; i++){
		new Float: X, Float: Y, Float: Z;
		GetPlayerPos(i,X,Y,Z);
		if(IsPlayerConnected(i)){
			if(balada[i] == 1){
				if(tocando == 0){
					PlayerPlaySound(i,1088,X,Y,Z);
					SendClientMessage(i, COR_INSTRUTOR, "Trocando Música");
					PlayerPlaySound(i,1062,X,Y,Z);
				}
				if(tocando == 7){
					PlayerPlaySound(i,1063,X,Y,Z);
					SendClientMessage(i, COR_INSTRUTOR, "Trocando Música");
					PlayerPlaySound(i,1068,X,Y,Z);
				}
  				if(tocando == 14){
  					PlayerPlaySound(i,1069,X,Y,Z);
  					SendClientMessage(i, COR_INSTRUTOR, "Trocando Música");
  					PlayerPlaySound(i,1076,X,Y,Z);
  				}
  				if(tocando == 21){
  					PlayerPlaySound(i,1077,X,Y,Z);
  					SendClientMessage(i, COR_INSTRUTOR, "Trocando Música");
					PlayerPlaySound(i,1097,X,Y,Z);
  				}
  				if(tocando == 28){
  					PlayerPlaySound(i,1098,X,Y,Z);
					SendClientMessage(i, COR_INSTRUTOR, "Trocando Música");
  					PlayerPlaySound(i,1183,X,Y,Z);
  				}
			 	if(tocando == 35){
  					PlayerPlaySound(i,1084,X,Y,Z);
  					SendClientMessage(i, COR_INSTRUTOR, "Trocando Música");
  					PlayerPlaySound(i,1185,X,Y,Z);
  				}
  				if(tocando == 42){
  					PlayerPlaySound(i,1086,X,Y,Z);
  					SendClientMessage(i, COR_INSTRUTOR, "Trocando Música");
  					PlayerPlaySound(i,1187,X,Y,Z);
  				}
			}else{
    	  		PlayerPlaySound(i,1086,X,Y,Z);
    	  		PlayerPlaySound(i,1084,X,Y,Z);
    	  		PlayerPlaySound(i,1098,X,Y,Z);
 				PlayerPlaySound(i,1077,X,Y,Z);
    	  		PlayerPlaySound(i,1069,X,Y,Z);
    	  		PlayerPlaySound(i,1063,X,Y,Z);
    	  		PlayerPlaySound(i,1088,X,Y,Z);
			}
		}
	}
}

public MTaxi()
{
	for(new i=0; i<MAX_PLAYERS; i++){
		if(MTaximetro[i][0] == 1){
			if(GetPlayerMoney(i) > PrecoCorrida[i] + 1){
			    new string[256];
				PrecoCorrida[i] = PrecoCorrida[i] + 1;
				format(string, sizeof(string), "Preço do Moto Taxi: R$%d", PrecoCorrida[i]);
				SendClientMessage(i, COR_VERDE, string);
				SendClientMessage(Taximetro[i][1], COR_VERDE, string);
			}
			if(GetPlayerMoney(i) < PrecoCorrida[i] + 1){
				SendClientMessage(i, COR_VERMELHO, "Você não tem mais dinheiro para o taxi, vai ficar aqui.");
				SendClientMessage(Taximetro[i][1], COR_VERMELHO, "Seu passageiro ficou sem dinheiro e por isso foi deixado aqui.");
				GivePlayerMoney(i, 0 - PrecoCorrida[i]);
				GivePlayerMoney(Taximetro[i][1], PrecoCorrida[i]);
				RemovePlayerFromVehicle(i);
				PrecoCorrida[i] = 0;
				MTaximetro[i][1] = 0;
				MTaximetro[i][0] = 0;
			}
		}
	}
}
public ATaxi()
{
	for(new i=0; i<MAX_PLAYERS; i++){
		if(ATaximetro[i][0] == 1){
			if(GetPlayerMoney(i) > PrecoCorrida[i] + 15){
			    new string[256];
				PrecoCorrida[i] = PrecoCorrida[i] + 15;
				format(string, sizeof(string), "O aero-taxímetro mostra: R$%d", PrecoCorrida[i]);
				SendClientMessage(i, COR_VERDE, string);
				SendClientMessage(Taximetro[i][1], COR_VERDE, string);
			}
			if(GetPlayerMoney(i) < PrecoCorrida[i] + 15){
				SendClientMessage(i, COR_VERMELHO, "Você não tem mais dinheiro para o taxi, vai ficar aqui.");
				SendClientMessage(Taximetro[i][1], COR_VERMELHO, "Seu passageiro ficou sem dinheiro e por isso foi deixado aqui.");
				GivePlayerMoney(i, 0 - PrecoCorrida[i]);
				GivePlayerMoney(Taximetro[i][1], PrecoCorrida[i]);
				RemovePlayerFromVehicle(i);
				PrecoCorrida[i] = 0;
				ATaximetro[i][1] = 0;
				ATaximetro[i][0] = 0;
			}
		}
	}
}

public Cheat()
{
	SendClientMessageToAll(COR_VERMELHO, "- Denuncie o uso de cheater /report [id] [rasão] -");
}

public TempoPrisao()
{
	for(new i=0; i<MAX_PLAYERS; i++){
	    if(Presos[i] == 1){
	        if(TempoPreso[i] == 180){
	            TempoPreso[i] = 0;
				udb_setPrisao(PlayerName(i), 0);
				Presos[i] = 0;
				SetSpawnInfo(i,0,udb_getSkin(PlayerName(i)),-1605.3073,718.3339,11.9387,0,0,0,0,0,0,0);
	    		SpawnPlayer(i);
	            SendClientMessage(i, COR_AMARELO, "Sua Sentença acabou, não cometa mais crimes, ou será preso novamente.");
			}
			else {
			    TempoPreso[i]++;
			}
		}
	}
}


public SetCar(modelid,Float:X,Float:Y,Float:Z,Float:ang,Cor1,Cor2) CreateVehicle(modelid,X,Y,Z,ang,Cor1,Cor2,-1);

public SetCasa(Float:X,Float:Y,Float:Z) AddStaticPickup(1272,1,X,Y,Z);

public SetCone(Float:X,Float:Y,Float:Z) CreateObject(1238,X,Y,Z-200,0,0,0);

public Prisao(plid) SetPlayerPos(plid, 262.9540, 78.4339, 1002.0391), ApplyAnimation(plid,"BEACH", "ParkSit_M_loop", 4.0, 1, 0, 0, 0, 0);

forward Text();
public Text() {
	TextDrawDestroy(TextAll);
}
forward Desmanchado();
public Desmanchado(){
	for(new i=0; i<MAX_PLAYERS; i++){
		if(IsPlayerConnected(i) == 1 && Desmanche[i] == 1){
			Locado[i] = 0;
		}
	}
}


forward CarroLocado();
public CarroLocado(){
	for(new i=0; i<MAX_PLAYERS; i++){
		if(IsPlayerConnected(i) == 1 && Locado[GetPlayerVehicleID(i)] == 1){
			SendClientMessage(i,COR_VERMELHO,"O tempo de aluguel do carro acabou!");
			SetVehicleToRespawn(GetPlayerVehicleID(i));
			Locado[GetPlayerVehicleID(i)] = 0;
		}
	}
}

forward PassagemSF(playerid);
public PassagemSF(playerid){
    SetPlayerInterior(playerid, 0);
    SetPlayerPos(playerid,-1425.0415,-289.4514,14.1484);
    SetPlayerFacingAngle(playerid, 90.000);
    DisablePlayerCheckpoint(playerid);
	SendClientMessage(playerid, COR_AZUL_CLARO, "Você acabou de chegar em San Fierro.");
	SendClientMessage(playerid, COR_AZUL_CLARO, "Procure emprego e uma casa para morar.");
	SendClientMessage(playerid, COR_LARANJA, "Você têm R$5000 no banco, pode retirar quando quiser.");
}

forward Segurado();
public Segurado(){
	for(new i=0; i<MAX_PLAYERS; i++){
		if(IsPlayerConnected(i) == 1 && Seguro[i] == 1){
			SendClientMessage(i,COR_VERMELHO,"O seu seguro de vida acabou!");
			Seguro[i] = 0;
		}
	}
}
stock SaveColors(vehicleid,color1,color2)
{
new contagem = 1;
new tmp[256];
format(tmp,256,"%d.vinfo",contagem);
new tmp2[256];
format(tmp2,256,"cor1");
new tmp3[256];
format(tmp3,256,"cor2");
if(!fexist(tmp))return 0;
dini_IntSet(tmp,tmp2,color1);
dini_IntSet(tmp,tmp3,color2);
contagem ++;
format(tmp,256,"%d.vinfo",contagem);
}
stock LoadColors(color1,color2)
{
new tmp[256];
new contagem = 1;
format(tmp,256,"%d.vinfo",contagem);
while(fexist(tmp)){
color1[contagem] = dini_Int(tmp,"cor1");
color2[contagem] = dini_Int(tmp,"cor2");
ChangeVehicleColor(contagem,color1[contagem],color2[contagem]);
contagem ++;
format(tmp,256,"%d.vinfo",contagem);
}

public OnVehiclePaintjob(vehicleid,paintjobid)
{
new tmp[256];
format(tmp,256,"%d.vinfo",vehicleid);
new tmp2[256];
format(tmp2,256,"cor1");
new tmp3[256];
format(tmp3,256,"cor2");
if(!fexist(tmp))return 0;
dini_IntSet(tmp,tmp2,paintjobid);
dini_IntSet(tmp,tmp3,paintjobid);
return 1;
}
public OnVehicleRespray(vehicleid, color1, color2)
{
new tmp[256];
format(tmp,256,"%d.vinfo",vehicleid);
new tmp2[256];
format(tmp2,256,"cor1");
new tmp3[256];
format(tmp3,256,"cor2");
dini_IntSet(tmp,tmp2,color1);
dini_IntSet(tmp,tmp3,color2);
}
public OnVehicleMod(vehicleid, componentid)//By [MPA]Rafael
{
new slot = 1;
new tmp2[5];
format(tmp2,5,"tun%d",slot);
new tmp[256];
format(tmp,256,"%d.vinfo",vehicleid);
if(!fexist(tmp))return 0;
dini_IntSet(tmp,tmp2,componentid);
slot ++;
format(tmp2,5,"tun%d",slot);
return 1;
}
stock SaveTuning(vehicleid,slot,componentid)//By [MPA]matraka
{
	new tmp[256],tmp2[5];
	format(tmp,256,"%d.vinfo",vehicleid);
	if(!fexist(tmp)) return 0;
	format(tmp2,5,"tun%d",slot);
	dini_IntSet(tmp,tmp2,componentid);
	return 1;
}
stock LoadTuning(vehicleid,slot,componentid)
{
    new tmp[256];
    new tmp2[5];
    new contagem = 1;
    format(tmp,256,"%d.vinfo",contagem);
    format(tmp2,"tun%d",slot);
    while(fexist(tmp)){
    componentid[contagem] = dini_Int(tmp,tmp2);
    AddVehicleComponent(contagem,componentid);
    contagem ++;
    format(tmp,256,"%d.vinfo",contagem);
    }
}
public SaveFiles()//By [MPA]matraka
{
	new pattern[256];
	new contagem = 1;
	format(pattern,256,"%d.vinfo",contagem);
	while(fexist(pattern)){
	    dini_IntSet(pattern,"gasolina",GPV[contagem]);
	    contagem++;
	    format(pattern,256,"%d.vinfo",contagem);
	}
	return 1;
}
public CreateStartupFiles()//By [MPA]matraka e [MPA]Rafael
{
	new tmp[256];
	for(new v=1;v<QTCARS+1;v++){
	    format(tmp,256,"%d.vinfo",v);
	    if(fexist(tmp))return 0;
	    dini_Create(tmp);
		switch(GetVehicleModel(v)){
		    case 481,509,510,594,523:
		        {
		            dini_IntSet(tmp,"gasolina",-1);
		            GPV[v]=-1;
				}
			default:
			    {
			        dini_IntSet(tmp,"gasolina",100);
			        GPV[v]=100;
				}
			}
		}
	return 1;
	}
public LoadFiles()//By [MPA]matraka
{
	new pattern[256];
	new contagem = 1;
	format(pattern,256,"%d.vinfo",contagem);
	while(fexist(pattern)){
	    GPV[contagem] = dini_Int(pattern,"gasolina");
	    contagem++;
	    format(pattern,256,"%d.vinfo",contagem);
	}
	return 1;
}
public Pesca() {
	for(new i=0; i<MAX_PLAYERS; i++){
		if(IsPlayerConnected(i) == 1 && PescaInProgress[i] == 1){
			QtPescas[i]++;
			PescaInProgress[i] = 0;
			SendClientMessage(i,COR_VERDE,"Sua rede voltou. Se quiser continuar pescando, fique a vontade.");
			SendClientMessage(i,COR_VERDE,"Se não, vá a cooperativa de pescas e venda seu pescado.");
			udb_setED(PlayerName(i),udb_getED(PlayerName(i)) + 1);
		}
	}
}
public Radar(){
    for(new i=0;i<MAX_PLAYERS;i++){
    new Float:x,Float:y,Float:z;
    new
    Float:xOff = ppos[i][0] - x,
    Float:yOff = ppos[i][1] - y,
    Float:zOff = ppos[i][2] - z,
    Float:dis = floatsqroot((xOff * xOff) + (yOff * yOff) + (zOff * zOff));
    if(AreaRadar[i] == 1){
    if(Radaron[i] == 1){
    Velocidade[i] = floatround(((dis/1000.0)*60.0)*60.0);
    if(Velocidade[i] > 130 && GetPlayerState(i) == PLAYER_STATE_DRIVER){
    SendClientMessage(i,COR_VERMELHO,"Você levou multa de $50 por passar em alta velocidade em um radar.");
    GivePlayerMoney(i,-50);
				    }
		  }
    ppos[i][0] = x;
    ppos[i][1] = y;
    ppos[i][2] = z;
	 }
 }
}
public Caca() {
	for(new i=0; i<MAX_PLAYERS; i++){
	    if(IsPlayerConnected(i) == 1 && CacaInProgress[i] == 1){
			QtCacas[i]++;
			CacaInProgress[i] = 0;
			SendClientMessage(i,COR_VERDE,"Sua caça está pronta para ser vendida!");
			SendClientMessage(i,COR_VERDE,"Se quiser continuar caçando, fique a vontade.");
			SendClientMessage(i,COR_VERDE,"Se não, vá a cooperativa de caça e venda sua caça.");
			udb_setED(PlayerName(i),udb_getED(PlayerName(i)) + 1);
		}
	}
}

public Platacao() {
	for(new i=0; i<MAX_PLAYERS; i++){
	    if(IsPlayerConnected(i) == 1 && MilhoInProgress[i] == 1){
	    	Milho[i]++;
			MilhoInProgress[i] = 0;
			SendClientMessage(i,COR_VERDE,"Sua platação está pronta para ser vendida!");
			SendClientMessage(i,COR_VERDE,"Colha o milho platando e venda a Fazenda.");
		}
	}
}


public OnPlayerPrivmsg(playerid, recieverid, text[])
{
    SendClientMessage(playerid, COR_VERMELHO,"|-------------------------ATENÇÃO--------------------------|");
	SendClientMessage(playerid, COR_VERMELHO,"O comando /pm foi desabilitado!");
	SendClientMessage(playerid, COR_COP_ELITE,"Use /ligar ou /sms para mensagens privadas");
	return 0;
}
public verificacao()
{
   tempoverificacao++;
   tempoverificacao%=24;
   SetWorldTime(tempoverificacao);

   for(new i=0; i<MAX_PLAYERS; i++) {
   if(tempoverificacao==0){
   new exdiaria;
   exdiaria = udb_getED(PlayerName(i));
   if(exdiaria >= 10){
   new xl;
   xl = udb_getXP(PlayerName(i));
   if(xl != 4 || xl != 9 || xl != 14 || xl != 19 || xl != 24 || xl != 29 || xl != 34 || xl != 39 || xl != 44 || xl != 49 || xl != 54 || xl != 59 || xl != 64 || xl != 69 || xl != 74 || xl !=79 || xl != 84 || xl != 89 || xl != 94 || xl != 99){
   SendClientMessage(i, COR_MECANICO, "Verificação de Level : Parabens você ganhou um XL pelo bom esforço no trabalho.");
   udb_setXP(PlayerName(i),udb_getXP(PlayerName(i)) + 1);
   udb_setED(PlayerName(i),udb_getED(PlayerName(i)) - 10);
   return 1;
   }
   else if(xl == 4 || xl == 9 || xl == 14 || xl == 19 || xl == 24 || xl == 29 || xl == 34 || xl == 39 || xl == 44 || xl == 49 || xl == 54 || xl == 59 || xl == 64 || xl == 69 || xl == 74 || xl ==79 || xl == 84 || xl == 89 || xl == 94 || xl == 99){
   SendClientMessage(i, COR_MECANICO, "Verificação de Level : Parabens você ganhou um XL pelo bom esforço no trabalho.");
   SendClientMessage(i, COR_MECANICO, "Muito bem! Agora você terá novas profissões para escolher em seu menu e terá permissão para usar uma delas. Boa Sorte.");
   udb_setXP(PlayerName(i),udb_getXP(PlayerName(i)) + 1);
   udb_setED(PlayerName(i),udb_getED(PlayerName(i)) - 10);
   udb_setNM(PlayerName(i),0);
   return 1;
   }
}
   else{
       SendClientMessage(i, COR_MECANICO, "Verificação de Level : Você não trabalhou o suficiente portanto nada de XL");
       return 1;
       }
   }
}
   return 1;
}

public Semana()
{
    dias++;
    dias%=48;
	SetWorldTime(dias);
	
	for(new i=0; i<MAX_PLAYERS; i++) {

		if(dias==0){
		GameTextForPlayer(i,"~b~SEGUNDA FEIRA",10000,0);
		segunda[i] = 1;
		}
		if(dias==7){
		GameTextForPlayer(i,"~b~TERCA FEIRA",10000,0);
		terca[i] = 1;
		}
		if(dias==14){
		GameTextForPlayer(i,"~b~QUARTA FEIRA",10000,0);
		quarta[i] = 1;
		}
		if(dias==21){
		GameTextForPlayer(i,"~b~QUINTA FEIRA",10000,0);
		quinta[i] = 1;
		}
		if(dias==28){
		GameTextForPlayer(i,"~b~SEXTA FEIRA",10000,0);
		sexta[i] = 1;
		}
		if(dias==35){
		GameTextForPlayer(i,"~b~SABADO",10000,0);
		sabado[i] = 1;
		}
		if(dias==42){
		GameTextForPlayer(i,"~b~DOMINGO",10000,0);
		domingo[i] = 1;
		}
	 }
 }
public quefome()
{
   	tempofome%=12;
	SetWorldTime(tempofome);

	for(new i=0; i<MAX_PLAYERS; i++) {
	if(tempofome==0){
	fome[i] ++;
	}
  }
}

stock salario()
{
	for(new i; i<MAX_PLAYERS; i++) {
	    if(IsPlayerConnected(i)) {
			SendClientMessage(i, COR_BRANCO, "Dia de pagamento.");
			SendClientMessage(i, ProfCores[Profissao[i]], Salarios[Profissao[i]]);
			udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + ValorSalarios[Profissao[i]]);
		}
	}

}

public Tempo()
{
	if(worldMinute > 59){
		worldMinute = 0;
		worldTime++;
		worldTime%=24;
	}
	if(worldMinute < 60){
	    worldMinute++;
	}
	SetWorldTime(worldTime);
	if(worldMinute==1){
	    switch(worldTime)
	    {
			case 0:
			    {
			        salario();
			    }
			}
		}
	}

forward GetPlayerDistanceToPointEx(playerid,Float:x,Float:y,Float:z);
forward IsPlayerInSphere(playerid,Float:x,Float:y,Float:z,radius);
forward GetPlayerDistanceToPoint(playerid,Float:x,Float:y);
forward IsPlayerInCircle(playerid,Float:x,Float:y,radius);
forward GetClosestHospital(playerid);

public GetClosestHospital(playerid)
{
	if(!IsPlayerConnected(playerid)){
	    return -1;
	}
	new Float:prevdist = 100000.000;
	new prevhosp;
	for(new hospid = 0; hospid <= 4; hospid++){
	    new Float:dist;
	    if(hospid == 0){
            dist = GetPlayerDistanceToPoint(playerid,-2651.6501,634.1177);
		}
		else if(hospid == 1){
		    dist = GetPlayerDistanceToPoint(playerid,1173.5842,-1324.5615);
		}
		else if(hospid == 2){
		    dist = GetPlayerDistanceToPoint(playerid,2031.9415,-1404.3578);
		}
		else if(hospid == 3){
		    dist = GetPlayerDistanceToPoint(playerid,1582.5615,1768.7921);
		}
		else if(hospid == 4){
		    dist = GetPlayerDistanceToPoint(playerid,-319.0593,1061.6935);
		}
		if((dist < prevdist)){
		    prevdist = dist;
		    prevhosp = hospid;
		}
	}
	return prevhosp;
}

public IsPlayerInCircle(playerid,Float:x,Float:y,radius) //By Sacky
{
if(GetPlayerDistanceToPoint(playerid,x,y) < radius){
return 1;
}
return 0;
}

public GetPlayerDistanceToPoint(playerid,Float:x,Float:y) //By Sacky
{
new Float:x1,Float:y1,Float:z1;
new Float:tmpdis;
GetPlayerPos(playerid,x1,y1,z1);
tmpdis = floatsqroot(floatpower(floatabs(floatsub(x,x1)),2)+floatpower(floatabs(floatsub(y,y1)),2));
return floatround(tmpdis);
}

public IsPlayerInSphere(playerid,Float:x,Float:y,Float:z,radius) //By Sacky
{
if(GetPlayerDistanceToPointEx(playerid,x,y,z) < radius){
return 1;
}
return 0;
}

public GetPlayerDistanceToPointEx(playerid,Float:x,Float:y,Float:z) //By Sacky
{
new Float:x1,Float:y1,Float:z1;
new Float:tmpdis;
GetPlayerPos(playerid,x1,y1,z1);
tmpdis = floatsqroot(floatpower(floatabs(floatsub(x,x1)),2)+floatpower(floatabs(floatsub(y,y1)),2)+floatpower(floatabs(floatsub(z,z1)),2));
return floatround(tmpdis);
}


public IsPlayerInArea(playerid, Float:minx, Float:maxx, Float:miny, Float:maxy)
{
        new Float:x, Float:y, Float:z;
        GetPlayerPos(playerid, x, y, z);
        if (x > minx && x < maxx && y > miny && y < maxy) return 1;
        return 0;
}
public InicioTribunal(plid,plid2)
{
new msg[256];
format(msg,sizeof(msg),"O Tribunal entre %s e %s começou a partir de agora!",PlayerName(plid),PlayerName(plid2));
SendClientMessageToAll(COR_BRANCO,msg);
SendClientMessageToAll(COR_BRANCO,"Agora os dois estão abertos para declarações de juizes.");
declaracoesabertas[plid] = 1;
declaracoesabertas[plid2] = 1;
}
public BUM(carid)
{
    if(DinamitePlantada[carid] == 1){
    SetVehicleHealth(carid,0);
    SendClientMessageToAll(COR_VERMELHO,"NOTÍCIA: Um carro acaba de explodir há provas de que foi plantada uma dinamite nele, o criminoso não");
    SendClientMessageToAll(COR_VERMELHO,"esta mais no local! Vejam se algum vendedor de bombas pode informar quem andou comprando dinamites.");
    DinamitePlantada[carid] = 0;
	}
}
public update_zones() {
	new line1[10];
	new line2[10];
	for(new i=0; i<MAX_PLAYERS; i++) {
		if(IsPlayerConnected(i) && zoneupdates[i] == 1) {
	   		if(IsPlayerInZone(i,player_zone[i])) {  }
	   		else {
				new player_zone_before;
	    		player_zone_before = player_zone[i];
	    		player_zone[i] = -1;
				for(new j=0; j<sizeof(zones);j++) {
	     			if(IsPlayerInZone(i,j) && player_zone[i] == -1) {
	   					if(player_zone_before == -1) GameTextForPlayer(i,zones[j][zone_name],1500,1);
						else  if(strcmp(zones[j][zone_name],zones[player_zone_before][zone_name],true) != 0) GameTextForPlayer(i,zones[j][zone_name],1500,1);
						player_zone[i] = j;
						format(line1,10,"p%dzone",i);
						format(line2,10,"%d",j);
						}
 					}
				if(player_zone[i] == -1) player_zone[i] = player_zone_before;
			}
		}
	}
}

IsPlayerInZone(playerid, zoneid) {
 if(zoneid == -1) return 0;
 new Float:x, Float:y, Float:z;
 GetPlayerPos(playerid,x,y,z);
 if(x >= zones[zoneid][zone_minx] && x < zones[zoneid][zone_maxx]
 && y >= zones[zoneid][zone_miny] && y < zones[zoneid][zone_maxy]
 && z >= zones[zoneid][zone_minz] && z < zones[zoneid][zone_maxz]
 && z < 900.0) return 1;
 return 0;
}

public GetPlayerZone(playerid) {
 new line[10];
 format(line,10,"p%dzone",playerid);
 new zoneid = strval(line);
 return zoneid;
}
public Fimcamuflagem(playerid,plid)
{
	  new profissao;
	  profissao = udb_getProf(PlayerName(plid));
      if(IsPlayerConnected(plid)){
      if(IsPlayerConnected(playerid)){
        SendClientMessage(plid, COR_BRANCO, "Seu tempo de camuflagem acabou!");
        new string[256];
        format(string,sizeof(string),"O Tempo de %s acabou! Seu chefe sugeriu que ofereça mais tempo a ele.",PlayerName(plid));
        SendClientMessage(playerid, COR_BRANCO,string);
        SetPlayerColor(plid,ProfCores[profissao]);
        }
    }
}
public Desarme(playerid,carro)
{
    if(IsPlayerInVehicle(playerid,carro)){
    TogglePlayerControllable(playerid,1);
    DinamitePlantada[carro] = 0;
    SendClientMessage(playerid, COR_BRANCO, "Dinamite desarmada com sucesso.");
    udb_setED(PlayerName(playerid),udb_getED(PlayerName(playerid)) + 1);
    }
}

