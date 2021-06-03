#include <a_samp>
#include <core>
#include <float>

new glob0[200];

new glob884[700][1];

new glob4A24[162];

new glob4CAC[8][1] = {
	"Invalido",
	"Morango",
	"Leite Condensado",
	"Flocos",
	"Creme",
	"Doce de Leite",
	"Coco",
	"Tutti-frutti"
};

new glob4E08[58][1] = {
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

new glob5B2C[58] = { 0, 350, 850, 850, 350, 650, 650, 600, 650, 900, 650, 1050, 550, 650, 750, 550, 550, 700, 750, 650, 850, 1200, 1200, 2500, 3000, 3200, 2800, 1100, 1100, 3500, 1600, 850, 800, 900, 200, 600, 600, 600, 950, 650, 600, 1000, 800, 600, 800, 2800, 4000, 2000, 2500, 3500, 5000, 900, 800, 550, 400, 3000, 1800, 1400 };

new glob5C14[58][1] = {
	"Invalido",
	"O Governo depositou seu Seguro Desemprego: R$350",
	"A Pizzaria depositou seu salário: R$850",
	"O Bar depositou seu salário: R$850",
	"A Sorveteria depositou seu salário: R$350",
	"A Lancheteria Pine depositou seu salário: R$650",
	"O Hospital depositou seu salário: R$650",
	"A Auto-Escola depositou seu salário: R$600",
	"O Posto de Gasolina depositou seu salário: R$650",
	"A Cooperativa de Taxistas de San Andreas depositou seu salário: R$900",
	"A Cooperativa de Taxistas de San Andreas depositou seu salário: R$650",
	"A Cooperativa de Taxistas de San Andreas depositou seu salário: R$1050",
	"O seu chefe depositou seu salário: R$550",
	"O seu chefe depositou sua porcentagem: R$650",
	"O seu chefe depositou sua porcentagem: R$750",
	"O desmanche depositou a sua porcentagem: R$550",
	"O chefe da boca de fumo depositou a sua porcentagem: R$550",
	"A Ammu-Nattion depositou seu salário: R$700",
	"A Cooperativa de caça de San Andreas depositou seu salário: R$750",
	"A Cooperativa de Pesca San Andreas depositou seu salário: R$650",
	"A Fazenda depositou seu salário: R$850",
	"O Governo depositou seu salário: R$1200",
	"O Governo depositou seu salário: R$1200",
	"O Governo depositou seu salário: R$2500",
	"O Governo depositou seu salário: R$3000",
	"O Governo depositou seu salário: R$3200",
	"O Governo depositou seu salário: R$2800",
	"O Governo depositou seu salário: R$1100",
	"O Governo depositou seu salário: R$1100",
	"O Governo depositou seu salário: R$3500",
	"O Escritorio de Advogacia depositou seu salário: R$1600",
	"A Reload Seguros depositou seu salário: R$850",
	"O Sindicato dos Motorista de San Andreas depositou seu salário: R$800",
	"A Angel Pine Turismo depositou seu salário: R$900",
	"O Governo depositou seu seguro mendigo: R$200",
	"A Consecionaria depositou seu salário: R$600",
	"A Imobiliaria depositou deu salário: R$600",
	"A Reload Seguros SA depositou deu salário: R$600",
	"O Departamento de Imprensa e Propaganda depositou deu salário: R$950",
	"A Cooperativa de cargas de Angel Pine depositou seu salário: R$650",
	"A Refinaria depositou seu salário: R$600",
	"A Agencia de Locador de Carros lhe depositou seu salario: R$1000",
	"A Oficina lhe depositou seu salario: R$800",
	"A Agencia de transito lhe depositou seu salario: R$600",
	"Você recebeu o dinheiro dos contrabandos: R$800",
	"O Governo depositou seu salário: R$2800",
	"O Governo depositou seu salário: R$4000",
	"Você recebeu os lucros do trafico de drogas da cidade: R$2000",
	"O Governo depositou seu salário: R$2500",
	"O Governo depositou seu salário: R$3500",
	"O Governo depositou seu salário: R$5000",
	"O Governo depositou seu salário: R$900",
	"A empresa de reciclagens lhe depositou seu salário: R$800",
	"A empresa de construção de imóveis lhe depositou seu salário: R$550",
	"A loja de dinamites lhe depositou seu salário: R$400",
	"O Clube lhe depositou seu salário: R$3000",
	"A delegacia de Angel Pine depositou seu salário: R$1800",
	"O Governo depositou seu salário: R$1400"
};

new glob8888[57] = { -875836502, -878678, -1292135766, -7213910, -1109832449, -7237121, -9305857, 1713514751, -261974, -1010760278, -960143702, -10878806, -769391958, -26719233, -836097281, -649968897, -1404022529, -1423061078, -392495190, -1694507606, -1632370774, 1281536938, 1232142250, 2403498, 1971699882, -673185878, 16771839, 78343850, 460980650, 1560280490, -2119455830, 751594666, 1726209962, -1047461718, -1375793494, 2006006442, -285227862, -16778582, -1398013697, 1145324799, 12349354, -18389590, -1131442262, 883082922, 885435562, -952757078, -1690628950, 14688426, -1897922390, -1493238358, 634296490, -50438998, -488447318, -273989718, -47976278, 1784946346, 1367092906 };

new Float:glob896C[58][3] = {
	{ 0, 0, 0 },
	{ 0, 0, 0 },
	{ -1805.1131, 948.6367, 24.8906 },
	{ -2244.1036, -89.818, 35.3203 },
	{ -2097.636, -2348.1456, 30.625 },
	{ -2333.7896, -167.2186, 35.5546 },
	{ -2620.2874, 629.6312, 14.4531 },
	{ -2026.2343, -98.7061, 35.1641 },
	{ -1675.9709, 431.7278, 7.1796 },
	{ -1754.858, 961.1519, 24.8827 },
	{ -1754.858, 961.1519, 24.8827 },
	{ -1754.858, 961.1519, 24.8827 },
	{ -365.7678, 1166.3444, 19.7422 },
	{ -365.7678, 1166.3444, 19.7422 },
	{ -365.7678, 1166.3444, 19.7422 },
	{ -365.7678, 1166.3444, 19.7422 },
	{ -365.7678, 1166.3444, 19.7422 },
	{ -365.7678, 1166.3444, 19.7422 },
	{ -1605.3073, 718.3339, 11.9386 },
	{ -1605.3073, 718.3339, 11.9386 },
	{ -1605.3073, 718.3339, 11.9386 },
	{ -1605.3073, 718.3339, 11.9386 },
	{ -1605.3073, 718.3339, 11.9386 },
	{ -1605.3073, 718.3339, 11.9386 },
	{ -1605.3073, 718.3339, 11.9386 },
	{ -1605.3073, 718.3339, 11.9386 },
	{ -1605.3073, 718.3339, 11.9386 },
	{ -2163.1668, -2387.774, 30.625 },
	{ -2163.1668, -2387.774, 30.625 },
	{ -1310.9028, 472.2222, 7.1875 },
	{ -1938.594, 569.9606, 35.2899 },
	{ -2180.6014, -2401.2396, 30.625 },
	{ -1754.858, 961.1519, 24.8827 },
	{ -1938.594, 569.9606, 35.2899 },
	{ -2085.4712, -2448.2737, 30.625 },
	{ -1652.3526, 1207.9296, 7.25 },
	{ -1652.3526, 1207.9296, 7.25 },
	{ -1652.3526, 1207.9296, 7.25 },
	{ -2521.2449, -624.7715, 132.783 },
	{ -2097.3877, -2255.649, 30.625 },
	{ 295.6498, 1385.6341, 10.156 },
	{ -1652.3526, 1207.9296, 7.25 },
	{ -1652.3526, 1207.9296, 7.25 },
	{ -1652.3526, 1207.9296, 7.25 },
	{ -365.7678, 1166.3444, 19.7422 },
	{ -1605.3073, 718.3339, 11.9386 },
	{ -1605.3073, 718.3339, 11.9386 },
	{ -365.7678, 1166.3444, 19.7422 },
	{ -1605.3073, 718.3339, 11.9386 },
	{ -1605.3073, 718.3339, 11.9386 },
	{ -1605.3073, 718.3339, 11.9386 },
	{ -1605.3073, 718.3339, 11.9386 },
	{ -1605.3073, 718.3339, 11.9386 },
	{ -2061.9742, 266.4559, 35.6282 },
	{ -365.7678, 1166.3444, 19.7422 },
	{ -365.7678, 1166.3444, 19.7422 },
	{ -2163.1668, -2387.774, 30.625 },
	{ -2873.9322, 1049.4136, 33.3147 }
};

new glob8D0C[58] = { 0, 0, 155, 240, 188, 98, 70, 250, 184, 234, 234, 234, 66, 101, 28, 22, 19, 101, 133, 35, 160, 280, 288, 285, 125, 59, 46, 127, 98, 287, 147, 165, 255, 124, 200, 147, 187, 126, 186, 124, 125, 187, 50, 71, 121, 240, 228, 28, 59, 186, 17, 60, 16, 27, 230, 246, 34, 120 };

new Float:glob8DF4[23][3] = {
	{ -2226.9998, -114.1161, 35.3203 },
	{ -2579.2798, 240.0269, 9.5312 },
	{ -2451.9454, 974.6096, 45.2969 },
	{ -2283.1307, 1220.6293, 48.9928 },
	{ -1706.0125, 1209.361, 25.1072 },
	{ -1678.4209, 438.6347, 7.1796 },
	{ -1981.3371, 148.3874, 27.6875 },
	{ -2289.4852, 556.9442, 36.5136 },
	{ -2718.1558, 459.5444, 4.3545 },
	{ -2759.8331, 556.6085, 14.5546 },
	{ -2520.9822, 637.6674, 28.2126 },
	{ -2535.0242, 720.1594, 28.1156 },
	{ -2535.5618, 837.4431, 49.9767 },
	{ -2534.9986, 936.6038, 65.0912 },
	{ -2536.5247, 1084.729, 55.7266 },
	{ -2650.9134, 53.4095, 4.1722 },
	{ -2655.3956, 71.694, 4.1054 },
	{ -2652.3042, 92.5401, 4.096 },
	{ -2655.65, 114.9717, 4.1045 },
	{ -2652.9666, 132.9273, 4.1796 },
	{ -2656.7049, 135.3327, 4.1796 },
	{ -2278.0525, 655.892, 49.4453 },
	{ -2277.6912, 697.3953, 49.4453 }
};

new glob8F64[5][1] = {
	"Invalido",
	"Você comeu um X-Bacon. Bom Lanche!",
	"Você comeu um X-Burguer. Bom Lanche!",
	"Você comeu um X-Salada. Bom Lanche!",
	"Você comeu um X-Tudo. Bom Lanche!"
};

new glob91D4[5][1] = {
	"Invalida",
	"Coca Cola",
	"Sukita",
	"Guaraná",
	"Soda"
};

new glob9284[5][1] = {
	"Invalido",
	"4 Queijos",
	"Calabresa",
	"Frango Catupiry",
	"Presunto e Queijo"
};

new glob9394[4][1] = {
	"Invalida",
	"Terreste",
	"Aerea",
	"Nautica"
};

new glob9424[2][1] = {
	"NÃO",
	"SIM"
};

new glob944C[365][33] = {
	"'The Big Ear'",
	"Aldea Malvada",
	"Angel Pine",
	"Arco del Oeste",
	"Avispa Country Club",
	"Avispa Country Club",
	"Avispa Country Club",
	"Avispa Country Club",
	"Avispa Country Club",
	"Avispa Country Club",
	"Back o Beyond",
	"Battery Point",
	"Bayside",
	"Bayside Marina",
	"Beacon Hill",
	"Blackfield",
	"Blackfield",
	"Blackfield Chapel",
	"Blackfield Chapel",
	"Blackfield Intersection",
	"Blackfield Intersection",
	"Blackfield Intersection",
	"Blackfield Intersection",
	"Blueberry",
	"Blueberry",
	"Blueberry Acres",
	"Caligula's Palace",
	"Caligula's Palace",
	"Calton Heights",
	"Chinatown",
	"City Hall",
	"Come-A-Lot",
	"Commerce",
	"Commerce",
	"Commerce",
	"Commerce",
	"Commerce",
	"Commerce",
	"Conference Center",
	"Conference Center",
	"Cranberry Station",
	"Creek",
	"Dillimore",
	"Doherty",
	"Doherty",
	"Downtown",
	"Downtown",
	"Downtown",
	"Downtown",
	"Downtown",
	"Downtown",
	"Downtown Los Santos",
	"Downtown Los Santos",
	"Downtown Los Santos",
	"Downtown Los Santos",
	"Downtown Los Santos",
	"Downtown Los Santos",
	"Downtown Los Santos",
	"Downtown Los Santos",
	"Downtown Los Santos",
	"East Beach",
	"East Beach",
	"East Beach",
	"East Beach",
	"East Los Santos",
	"East Los Santos",
	"East Los Santos",
	"East Los Santos",
	"East Los Santos",
	"East Los Santos",
	"East Los Santos",
	"Easter Basin",
	"Easter Basin",
	"Easter Bay Airport",
	"Easter Bay Airport",
	"Easter Bay Airport",
	"Easter Bay Airport",
	"Easter Bay Airport",
	"Easter Bay Airport",
	"Easter Bay Airport",
	"Easter Bay Airport",
	"Easter Bay Chemicals",
	"Easter Bay Chemicals",
	"El Castillo del Diablo",
	"El Castillo del Diablo",
	"El Castillo del Diablo",
	"El Corona",
	"El Corona",
	"El Quebrados",
	"Esplanade East",
	"Esplanade East",
	"Esplanade East",
	"Esplanade North",
	"Esplanade North",
	"Esplanade North",
	"Fallen Tree",
	"Fallow Bridge",
	"Fern Ridge",
	"Financial",
	"Fisher's Lagoon",
	"Flint Intersection",
	"Flint Range",
	"Fort Carson",
	"Foster Valley",
	"Foster Valley",
	"Foster Valley",
	"Foster Valley",
	"Frederick Bridge",
	"Gant Bridge",
	"Gant Bridge",
	"Ganton",
	"Ganton",
	"Garcia",
	"Garcia",
	"Garver Bridge",
	"Garver Bridge",
	"Garver Bridge",
	"Glen Park",
	"Glen Park",
	"Glen Park",
	"Green Palms",
	"Greenglass College",
	"Greenglass College",
	"Hampton Barns",
	"Hankypanky Point",
	"Harry Gold Parkway",
	"Hashbury",
	"Hilltop Farm",
	"Hunter Quarry",
	"Idlewood",
	"Idlewood",
	"Idlewood",
	"Idlewood",
	"Idlewood",
	"Idlewood",
	"Jefferson",
	"Jefferson",
	"Jefferson",
	"Jefferson",
	"Jefferson",
	"Jefferson",
	"Julius Thruway East",
	"Julius Thruway East",
	"Julius Thruway East",
	"Julius Thruway East",
	"Julius Thruway North",
	"Julius Thruway North",
	"Julius Thruway North",
	"Julius Thruway North",
	"Julius Thruway North",
	"Julius Thruway North",
	"Julius Thruway North",
	"Julius Thruway North",
	"Julius Thruway South",
	"Julius Thruway South",
	"Julius Thruway West",
	"Julius Thruway West",
	"Juniper Hill",
	"Juniper Hollow",
	"K.A.C.C. Military Fuels",
	"Kincaid Bridge",
	"Kincaid Bridge",
	"Kincaid Bridge",
	"King's",
	"King's",
	"King's",
	"LVA Freight Depot",
	"LVA Freight Depot",
	"LVA Freight Depot",
	"LVA Freight Depot",
	"LVA Freight Depot",
	"Las Barrancas",
	"Las Brujas",
	"Las Colinas",
	"Las Colinas",
	"Las Colinas",
	"Las Colinas",
	"Las Colinas",
	"Las Colinas",
	"Las Colinas",
	"Las Payasadas",
	"Aeroporto de Las Venturas",
	"Aeroporto de Las Venturas",
	"Aeroporto de Las Venturas",
	"Aeroporto de Las Venturas",
	"Last Dime Motel",
	"Leafy Hollow",
	"Lil' Probe Inn",
	"Linden Side",
	"Linden Station",
	"Linden Station",
	"Little Mexico",
	"Little Mexico",
	"Los Flores",
	"Los Flores",
	"Aeroporto de Los Santos ",
	"Aeroporto de Los Santos ",
	"Aeroporto de Los Santos ",
	"Aeroporto de Los Santos ",
	"Aeroporto de Los Santos ",
	"Aeroporto de Los Santos ",
	"Marina",
	"Marina",
	"Marina",
	"Market",
	"Market",
	"Market",
	"Market",
	"Market Station",
	"Martin Bridge",
	"Missionary Hill",
	"Montgomery",
	"Montgomery",
	"Montgomery Intersection",
	"Montgomery Intersection",
	"Mulholland",
	"Mulholland",
	"Mulholland",
	"Mulholland",
	"Mulholland",
	"Mulholland",
	"Mulholland",
	"Mulholland",
	"Mulholland",
	"Mulholland",
	"Mulholland",
	"Mulholland",
	"Mulholland",
	"Mulholland Intersection",
	"North Rock",
	"Ocean Docks",
	"Ocean Docks",
	"Ocean Docks",
	"Ocean Docks",
	"Ocean Docks",
	"Ocean Docks",
	"Ocean Docks",
	"Ocean Flats",
	"Ocean Flats",
	"Ocean Flats",
	"Octane Springs",
	"Old Venturas Strip",
	"Palisades",
	"Palomino Creek",
	"Paradiso",
	"Pershing Square",
	"Pilgrim",
	"Pilgrim",
	"Pilson Intersection",
	"Pirates in Men's Pants",
	"Playa del Seville",
	"Prickle Pine",
	"Prickle Pine",
	"Prickle Pine",
	"Prickle Pine",
	"Queens",
	"Queens",
	"Queens",
	"Marina Tio Hitler MPA Race",
	"JT-R Loja de Carros",
	"Redsands East",
	"Redsands East",
	"Redsands East",
	"Redsands West",
	"Redsands West",
	"Redsands West",
	"Redsands West",
	"Regular Tom",
	"Richman",
	"Richman",
	"Richman",
	"Richman",
	"Richman",
	"Richman",
	"Richman",
	"Richman",
	"Richman",
	"Richman",
	"Robada Intersection",
	"Roca Escalante",
	"Roca Escalante",
	"Rockshore East",
	"Rockshore West",
	"Rockshore West",
	"Rodeo",
	"Rodeo",
	"Rodeo",
	"Rodeo",
	"Rodeo",
	"Rodeo",
	"Rodeo",
	"Rodeo",
	"Rodeo",
	"Rodeo",
	"Rodeo",
	"Rodeo",
	"Royal Casino",
	"San Andreas Sound",
	"Santa Flora",
	"Santa Maria Beach",
	"Santa Maria Beach",
	"Shady Cabin",
	"Shady Creeks",
	"Shady Creeks",
	"Sobell Rail Yards",
	"Spinybed",
	"Starfish Casino",
	"Starfish Casino",
	"Starfish Casino",
	"Temple",
	"Temple",
	"Temple",
	"Temple",
	"Temple",
	"Temple",
	"The Camel's Toe",
	"The Clown's Pocket",
	"The Emerald Isle",
	"The Farm",
	"The Four Dragons Casino",
	"The High Roller",
	"The Mako Span",
	"The Panopticon",
	"The Pink Swan",
	"The Sherman Dam",
	"The Strip",
	"The Strip",
	"The Strip",
	"The Strip",
	"The Visage",
	"The Visage",
	"Unity Station",
	"Valle Ocultado",
	"Verdant Bluffs",
	"Verdant Bluffs",
	"Verdant Bluffs",
	"Verdant Meadows",
	"Verona Beach",
	"Verona Beach",
	"Verona Beach",
	"Verona Beach",
	"Verona Beach",
	"Vinewood",
	"Vinewood",
	"Vinewood",
	"Vinewood",
	"Whitewood Estates",
	"Whitewood Estates",
	"Willowfield",
	"Willowfield",
	"Willowfield",
	"Willowfield",
	"Willowfield",
	"Willowfield",
	"Willowfield",
	"Yellow Bell Station",
	"Los Santos",
	"Las Venturas",
	"Bone County",
	"Tierra Robada",
	"Tierra Robada",
	"San Fierro",
	"Red County",
	"Flint County",
	"Whetstone"
};

new glob15634[212][1] = {
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
	"Trailer",
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
	"Trailer",
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
	"Hotring Racer",
	"Hotring Racer",
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
	"Tanker",
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
	"Firetruck",
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
	"Monster Truck",
	"Monster Truck",
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
	"Freight",
	"Trailer",
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
	"Trailer",
	"Emperor",
	"Wayfarer",
	"Euros",
	"Hotdog",
	"Club",
	"Trailer",
	"Trailer",
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
	"Luggage Trailer",
	"Luggage Trailer",
	"Stair Trailer",
	"Boxville",
	"Farm Plow",
	"Utility Trailer"
};

new glob175F4[200];

new glob17914;

new glob17918[11] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11 };

new glob17944[11][1] = {
	"Gasolina",
	"Diesel",
	"Bio-Diesel",
	"Gas-Veicular(GNV)",
	"Moveis",
	"Equipamentos Eletrônicos",
	"Utecilios Domésticos",
	"Mamona para Bio-Diesel",
	"Soja",
	"Milho",
	"Feijão"
};

new glob17B9C[11][1] = {
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

new Float:glob17DB4[11][3] = {
	{ 251.5558, 1395.9693, 10.1557 },
	{ 251.5558, 1395.9693, 10.1557 },
	{ 251.5558, 1395.9693, 10.1557 },
	{ 251.5558, 1395.9693, 10.1557 },
	{ -2112.7396, -2247.9727, 30.2733 },
	{ -2112.7396, -2247.9727, 30.2733 },
	{ -2112.7396, -2247.9727, 30.2733 },
	{ -2112.7396, -2247.9727, 30.2733 },
	{ -2112.7396, -2247.9727, 30.2733 },
	{ -2112.7396, -2247.9727, 30.2733 },
	{ -2112.7396, -2247.9727, 30.2733 }
};

new Float:glob17E64[4][3] = {
	{ 626.2227, 1663.3148, 6.7692 },
	{ -1660.0427, 447.7219, 6.9072 },
	{ -2405.0899, 991.8399, 45.0037 },
	{ -2242.9947, -2568.168, 31.489 }
};

new glob17EA4[200];

new glob181C4[4] = { 0, 1, 2, 3 };

new glob181D4[4][1] = {
	"Fierro",
	" antes da refinaria",
	"efinaria",
	"mo ao hospital"
};

new glob181E4[4][1] = {
	"Las Venturas",
	"San Fierro",
	"San Fierro",
	"Angel Pine"
};

new glob182AC[4][1] = {
	"Saida para Fort Carson, antes da refinaria",
	"Próximo a base do exercito",
	"Próximo ao hospital",
	"Saida"
};

new glob1843C[200];

new glob1875C[5] = { 18000, 27000, 25000, 23000, 15000 };

new glob18770 = 438;

new glob18774 = 597;

new glob18778 = 599;

new glob1877C = 475;

new glob18780 = 420;

new glob18784 = 410;

new glob18788 = 428;

new glob1878C = 409;

new glob18790 = 411;

new glob18794 = 416;

new glob18798 = 448;

new glob1879C = 435;

new glob187A0 = 584;

new glob187A4 = 403;

new glob187A8 = 515;

new glob187AC = 514;

new glob187B0 = 487;

new glob187B4 = 588;

new glob187B8 = 437;

new glob187BC = 423;

new glob187C0 = 525;

new glob187C4 = 581;

new glob187C8 = 406;

new glob187CC[200];

new glob18AEC[200];

new glob18E0C[200];

new glob1912C[200];

new Float:glob1944C[200][3];

new glob1A0CC[200];

new glob1A3EC[200];

new glob1A70C[200];

new glob1AA2C;

new glob1AA30;

new glob1AA34;

new glob1AA38[200];

new glob1AD58[200];

new glob1B078[700];

new glob1BB68[200];

new glob1BE88[200];

new glob1C1A8[700];

new glob1CC98[200];

new glob1CFB8[200];

new glob1D2D8;

new glob1D2DC[200];

new glob1D5FC[200];

new Menu:glob1D91C;

new glob1D920[200];

new glob1DC40[200];

new glob1DF60[200];

new glob1E280[200];

new glob1E5A0[200];

new glob1E8C0;

new Menu:glob1E8C4;

new glob1E8C8[700];

new glob1F3B8[200];

new glob1F6D8[200];

new glob1F9F8[700];

new glob204E8[200];

new glob20808[200];

new glob20B28[200];

new glob20E48[200];

new glob21168[200];

new glob21488[200];

new glob217A8;

new glob217AC[200];

new glob21ACC[200];

new glob21DEC[200];

new glob2210C[200];

new glob2242C[200];

new glob2274C[200];

new glob22A6C;

new glob22A70[200];

new glob22D90[200];

new glob230B0[200];

new glob233D0[200];

new glob236F0[200];

new glob23A10[700];

new glob24500[200];

new glob24820[200];

new Menu:glob24B40;

new glob24B44;

new glob24B48;

new glob24B4C;

new glob24B50[200];

new glob24E70[200];

new glob25190[200];

new glob254B0[200];

new glob257D0[200];

new glob25AF0[200];

new glob25E10;

new glob25E14[200];

new glob26134[200];

new glob26454[200];

new glob26774[200];

new glob26A94[200];

new glob26DB4[200];

new glob270D4[200];

new glob273F4;

new glob273F8[200];

new glob27718[200];

new glob27A38[200];

new glob27D58[200];

new glob28078;

new glob2807C;

new glob28080;

new glob28084;

new glob28088;

new glob2808C[200];

new glob283AC[200];

new glob286CC[200];

new glob289EC[200];

new glob28D0C[200];

new glob2902C[200];

new glob2934C[200];

new Text:glob2966C;

new glob29670;

new glob29674;

new glob29678;

new Text:glob2967C;

new glob29680[200];

new glob299A0[200];

new glob29CC0;

new glob29CC4;

new glob29CC8;

new glob29CCC[200];

new glob29FEC[200];

new glob2A30C[200];

new glob2A62C[200];

new glob2A94C[200];

new glob2AC6C[200];

new glob2AF8C[200];

new glob2B2AC[200];

new glob2B5CC[200];

new glob2B8EC[200][2];

new glob2C24C[200][2];

new glob2CBAC[200][2];

new glob2D50C[200];

new glob2D82C[200];

new glob2DB4C;

new glob2DB50;

new glob2DB54[200];

new glob2DE74[200];

new glob2E194[200];

new glob2E4B4[200];

new glob2E7D4[200];

new glob2EAF4[200];

new glob2EE14;

new glob2EE18;

new glob2EE1C[200];

new glob2F13C[200];

new glob2F45C[200];

new glob2F77C;

new glob2F780;

new glob2F784;

new glob2F788;

new glob2F78C;

new glob2F790;

new glob2F794;

new glob2F798;

new glob2F79C[200];

new glob2FABC[200];

new glob2FDDC[200];

new glob300FC[200];

new glob3041C[200];

new glob3073C[200];

new glob30A5C[200];

new glob30D7C[200];

new glob3109C[200];

new glob313BC[200];

new glob316DC[200];

new glob319FC[200];

new glob31D1C[200];

new Menu:glob3203C;

new Menu:glob32040;

new Menu:glob32044;

new Menu:glob32048;

new Menu:glob3204C;

new Menu:glob32050;

new Menu:glob32054;

new Menu:glob32058;

new Menu:glob3205C;

new Menu:glob32060;

new Menu:glob32064;

new Menu:glob32068;

new Menu:glob3206C;

new glob32070[200];

new glob32390[200];

new glob326B0[700];

new Text:glob331A0;

new glob331A4[700];

new glob33C94[200];

new glob33FB4[200];

new glob342D4[200][2];

new glob34C34[200];

new glob34F54;

new glob34F58;

new glob34F5C;

new glob34F60[200];

new glob35280[200];

new glob355A0[200];

new glob358C0[200];

new glob35BE0[700];

new glob366D0[200];

new glob369F0[700];

new glob374E0[200];

new glob37800[200];

new glob37B20[200];

new glob37E40[700];

new glob38930[200];


public isNumeric(arg0)
{
	new var0 = strlen(arg0);
	for(new var1 = 0; var1 < var0; var1++)
	{
		if(arg0[var1] > 57 || arg0[var1] < 48)
		{
			return 0;
		}
	}
	return 1;
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

public ValidEmail(arg0)
{
	new var0 = strlen(arg0);
	new var1 = 0;
	new var2 = 0;
	for(var2 = 0; var2 < var0; var2++)
	{
		if(((!var1 || var1 == 1) && (arg0[var2] >= 65 && arg0[var2] <= 90)) || (arg0[var2] >= 97 && arg0[var2] <= 122) || arg0[var2] == 46 || arg0[var2] == 45 || arg0[var2] == 95)
		{
		}
		else if(!var1 && arg0[var2] == 64)
		{
			var1 = 1;
		}
		else
		{
			return 0;
		}
	}
	if(var1 < 1)
	{
		return 0;
	}
	if(var0 < 6)
	{
		return 0;
	}
	if(arg0[var0 - 3] == 46 || arg0[var0 - 4] == 46 || arg0[var0 - 5] == 46)
	{
		return 1;
	}
	return 0;
}

public Time()
{
	new var0 = 0, var1 = 0, var2 = 0;
	new var3 = 0, var4 = 0, var5 = 0;
	gettime(var0, var1, var2);
	getdate(var3, var4, var5);
	return mktime(var0, var1, var2, var5, var4, var3);
}

functionBA8(playerid, arg1)
{
	glob0[playerid] = arg1;
	GivePlayerMoney(playerid, arg1 - GetPlayerMoney(playerid));
	return 0;
}

functionC3C(arg0, arg1)
{
	new File:var0 = 0, File:var1 = 0;
	if(!fexist(arg0))
	{
		return 0;
	}
	var0 = fopen(arg0, 0);
	var1 = fopen(arg1, 1);
	new var2[255];
	while(fread(var0, var2, 255))
	{
		StripNewLine(var2);
		format(var2, 255, "%s\r\n", var2);
		fwrite(var1, var2);
	}
	fclose(var0);
	fclose(var1);
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

function107C(arg0, arg1, arg2)
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

function1A10(arg0, &arg1, arg2)
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
		set(arg0, glob394);
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
		set(arg0, glob398);
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
	return var1 + (var2 << 16);
}

function2268(arg0, arg1, arg2)
{
	new var0 = 0;
	new var1[255];
	new var2[255];
	set(var1, arg2);
	var0 = strfind(var1, arg0, false, 0);
	var2[0] = 0;
	while(0 <= var0)
	{
		strcat(var2, function107C(var1, 0, var0), 255);
		strcat(var2, arg1, 255);
		var1 = function107C(var1, var0 + strlen(arg0), strlen(var1) - var0);
		var0 = strfind(var1, arg0, false, 0);
	}
	strcat(var2, var1, 255);
	return var2;
}

function2554(arg0)
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
	return var1 + (var2 << 16);
}

function2858(arg0)
{
	new var0[255];
	set(var0, arg0);
	var0 = function2268("/", " 03", var0);
	var0 = function2268("\\", " 04", var0);
	var0 = function2268("?", " 07", var0);
	var0 = function2268("*", " 09", var0);
	var0 = function2268("<", " 10", var0);
	var0 = function2268(">", " 11", var0);
	var0 = function2268(":", " 14", var0);
	var0 = function2268("|", " 15", var0);
	return var0;
}

public udb_Exists(arg0)
{
	new var0[255];
	new var1[255];
	set(var1, function2858(arg0));
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
	set(var1, function2858(arg0));
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

public udb_Save(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15, arg16, arg17, arg18, arg19, arg20, arg21, arg22, arg23, arg24, arg25)
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
	valstr(var1, arg11, false);
	strcat(var0, var1, 255);
	strcat(var0, ";", 255);
	valstr(var1, arg12, false);
	strcat(var0, var1, 255);
	strcat(var0, ";", 255);
	valstr(var1, arg13, false);
	strcat(var0, var1, 255);
	strcat(var0, ";", 255);
	valstr(var1, arg14, false);
	strcat(var0, var1, 255);
	strcat(var0, ";", 255);
	valstr(var1, arg15, false);
	strcat(var0, var1, 255);
	strcat(var0, ";", 255);
	valstr(var1, arg16, false);
	strcat(var0, var1, 255);
	strcat(var0, ";", 255);
	valstr(var1, arg23, false);
	strcat(var0, var1, 255);
	strcat(var0, ";", 255);
	valstr(var1, arg24, false);
	strcat(var0, var1, 255);
	strcat(var0, ";", 255);
	valstr(var1, arg25, false);
	strcat(var0, var1, 255);
	strcat(var0, ";", 255);
	strcat(var0, arg17, 255);
	format(var0, 255, "%s;%f;%f;%f;%f;%f", var0, arg18, arg19, arg20, arg21, arg22);
	new var3[255];
	new var4[255];
	new var5[255];
	set(var3, function2858(arg0));
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

public udb_Load(arg0, &arg1, &arg2, &arg3, &arg4, &arg5, &arg6, &arg7, &arg8, &arg9, &arg10, &arg11, &arg12, &arg13, &arg14, &arg15, &arg16, arg17, &arg18, &arg19, &arg20, &arg21, &arg22, &arg23, &arg24, &arg25)
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
	arg20 = 0;
	arg21 = 0;
	arg22 = 0;
	arg23 = 0;
	arg24 = 0;
	arg25 = 0;
	new File:var1 = 0;
	new var2[255];
	new var3[255];
	set(var2, function2858(arg0));
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
		arg1 = strval(function1A10(var0, var4, 59));
		arg2 = strval(function1A10(var0, var4, 59));
		arg3 = strval(function1A10(var0, var4, 59));
		arg4 = strval(function1A10(var0, var4, 59));
		arg5 = strval(function1A10(var0, var4, 59));
		arg6 = strval(function1A10(var0, var4, 59));
		arg7 = strval(function1A10(var0, var4, 59));
		arg8 = strval(function1A10(var0, var4, 59));
		arg9 = strval(function1A10(var0, var4, 59));
		arg10 = strval(function1A10(var0, var4, 59));
		arg11 = strval(function1A10(var0, var4, 59));
		arg12 = strval(function1A10(var0, var4, 59));
		arg13 = strval(function1A10(var0, var4, 59));
		arg14 = strval(function1A10(var0, var4, 59));
		arg15 = strval(function1A10(var0, var4, 59));
		arg16 = strval(function1A10(var0, var4, 59));
		set(arg17, function1A10(var0, var4, 59));
		arg18 = floatstr(function1A10(var0, var4, 59));
		arg19 = floatstr(function1A10(var0, var4, 59));
		arg20 = floatstr(function1A10(var0, var4, 59));
		arg21 = floatstr(function1A10(var0, var4, 59));
		arg22 = floatstr(function1A10(var0, var4, 59));
		arg23 = strval(function1A10(var0, var4, 59));
		arg24 = strval(function1A10(var0, var4, 59));
		arg25 = strval(function1A10(var0, var4, 59));
		return 1;
	}
	return 0;
}

public udb_getPwdHash(arg0)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10 = 0, var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16[255], var17 = 0, var18 = 0, var19 = 0, var20 = 0, var21 = 0, var22 = 0, var23 = 0, var24 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18, var19, var20, var21, var22, var23, var24))
	{
		return var0;
	}
	return 0;
}

public udb_getCreditos(arg0)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10 = 0, var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16[255], var17 = 0, var18 = 0, var19 = 0, var20 = 0, var21 = 0, var22 = 0, var23 = 0, var24 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18, var19, var20, var21, var22, var23, var24))
	{
		return var1;
	}
	return -1;
}

public udb_getAccState(arg0)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10 = 0, var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16[255], var17 = 0, var18 = 0, var19 = 0, var20 = 0, var21 = 0, var22 = 0, var23 = 0, var24 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18, var19, var20, var21, var22, var23, var24))
	{
		return var2;
	}
	return -1;
}

public udb_getPosition(arg0, arg1, arg2, arg3)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10 = 0, var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16[255], var17 = 0, var18 = 0, var19 = 0, var20 = 0, var21 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, arg1, arg2, arg3, var17, var18, var19, var20, var21))
	{
		return 1;
	}
	return 0;
}

public udb_getAng(arg0, arg1)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10 = 0, var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16[255], var17 = 0, var18 = 0, var19 = 0, var20 = 0, var21 = 0, var22 = 0, var23 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18, var19, arg1, var20, var21, var22, var23))
	{
		return 1;
	}
	return 0;
}

public udb_getSkin(arg0)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10 = 0, var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16[255], var17 = 0, var18 = 0, var19 = 0, var20 = 0, var21 = 0, var22 = 0, var23 = 0, var24 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18, var19, var20, var21, var22, var23, var24))
	{
		return var3;
	}
	return 0;
}

public udb_getBankMoney(arg0)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10 = 0, var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16[255], var17 = 0, var18 = 0, var19 = 0, var20 = 0, var21 = 0, var22 = 0, var23 = 0, var24 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18, var19, var20, var21, var22, var23, var24))
	{
		return var4;
	}
	return 0;
}

public udb_getHealth(arg0, arg1)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10 = 0, var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16[255], var17 = 0, var18 = 0, var19 = 0, var20 = 0, var21 = 0, var22 = 0, var23 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18, var19, var20, arg1, var21, var22, var23))
	{
		return 1;
	}
	return 0;
}

public udb_getseguro(arg0)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10 = 0, var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16[255], var17 = 0, var18 = 0, var19 = 0, var20 = 0, var21 = 0, var22 = 0, var23 = 0, var24 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18, var19, var20, var21, var22, var23, var24))
	{
		return var5;
	}
	return 0;
}

public udb_getXP(arg0)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10 = 0, var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16[255], var17 = 0, var18 = 0, var19 = 0, var20 = 0, var21 = 0, var22 = 0, var23 = 0, var24 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18, var19, var20, var21, var22, var23, var24))
	{
		return var11;
	}
	return 0;
}

public udb_getED(arg0)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10 = 0, var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16[255], var17 = 0, var18 = 0, var19 = 0, var20 = 0, var21 = 0, var22 = 0, var23 = 0, var24 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18, var19, var20, var21, var22, var23, var24))
	{
		return var10;
	}
	return 0;
}

public udb_getcell(arg0)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10 = 0, var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16[255], var17 = 0, var18 = 0, var19 = 0, var20 = 0, var21 = 0, var22 = 0, var23 = 0, var24 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18, var19, var20, var21, var22, var23, var24))
	{
		return var12;
	}
	return 0;
}

public udb_getnumcell(arg0)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10 = 0, var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16[255], var17 = 0, var18 = 0, var19 = 0, var20 = 0, var21 = 0, var22 = 0, var23 = 0, var24 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18, var19, var20, var21, var22, var23, var24))
	{
		return var13;
	}
	return 0;
}

public udb_getNM(arg0)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10 = 0, var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16[255], var17 = 0, var18 = 0, var19 = 0, var20 = 0, var21 = 0, var22 = 0, var23 = 0, var24 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18, var19, var20, var21, var22, var23, var24))
	{
		return var14;
	}
	return 0;
}

public udb_getHabaerea(arg0)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10 = 0, var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16[255], var17 = 0, var18 = 0, var19 = 0, var20 = 0, var21 = 0, var22 = 0, var23 = 0, var24 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18, var19, var20, var21, var22, var23, var24))
	{
		return var6;
	}
	return 0;
}

public udb_gethabterre(arg0)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10 = 0, var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16[255], var17 = 0, var18 = 0, var19 = 0, var20 = 0, var21 = 0, var22 = 0, var23 = 0, var24 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18, var19, var20, var21, var22, var23, var24))
	{
		return var7;
	}
	return 0;
}

public udb_getHabnauti(arg0)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10 = 0, var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16[255], var17 = 0, var18 = 0, var19 = 0, var20 = 0, var21 = 0, var22 = 0, var23 = 0, var24 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18, var19, var20, var21, var22, var23, var24))
	{
		return var8;
	}
	return 0;
}

public udb_getPrisao(arg0)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10 = 0, var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16[255], var17 = 0, var18 = 0, var19 = 0, var20 = 0, var21 = 0, var22 = 0, var23 = 0, var24 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18, var19, var20, var21, var22, var23, var24))
	{
		return var9;
	}
	return 0;
}

public udb_getProf(arg0)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10 = 0, var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16[255], var17 = 0, var18 = 0, var19 = 0, var20 = 0, var21 = 0, var22 = 0, var23 = 0, var24 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18, var19, var20, var21, var22, var23, var24))
	{
		return var15;
	}
	return 0;
}

public udb_getValorFinanciamento(arg0)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10 = 0, var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16[255], var17 = 0, var18 = 0, var19 = 0, var20 = 0, var21 = 0, var22 = 0, var23 = 0, var24 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18, var19, var20, var21, var22, var23, var24))
	{
		return var22;
	}
	return 0;
}

public udb_getVesesFinanciamento(arg0)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10 = 0, var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16[255], var17 = 0, var18 = 0, var19 = 0, var20 = 0, var21 = 0, var22 = 0, var23 = 0, var24 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18, var19, var20, var21, var22, var23, var24))
	{
		return var24;
	}
	return 0;
}

public udb_getFaltandoFinanciamento(arg0)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10 = 0, var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16[255], var17 = 0, var18 = 0, var19 = 0, var20 = 0, var21 = 0, var22 = 0, var23 = 0, var24 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18, var19, var20, var21, var22, var23, var24))
	{
		return var23;
	}
	return 0;
}

public udb_setClantag(arg0, arg1)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10 = 0, var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16[255], var17 = 0, var18 = 0, var19 = 0, var20 = 0, var21 = 0, var22 = 0, var23 = 0, var24 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18, var19, var20, var21, var22, var23, var24))
	{
		udb_Save(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, arg1, var17, var18, var19, var20, var21, var22, var23, var24);
		return 1;
	}
	return 0;
}

public udb_setPwdHash(arg0, arg1)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10 = 0, var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16[255], var17 = 0, var18 = 0, var19 = 0, var20 = 0, var21 = 0, var22 = 0, var23 = 0, var24 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18, var19, var20, var21, var22, var23, var24))
	{
		udb_Save(arg0, arg1, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18, var19, var20, var21, var22, var23, var24);
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
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10 = 0, var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16[255], var17 = 0, var18 = 0, var19 = 0, var20 = 0, var21 = 0, var22 = 0, var23 = 0, var24 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18, var19, var20, var21, var22, var23, var24))
	{
		udb_Save(arg0, var0, var1, arg1, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18, var19, var20, var21, var22, var23, var24);
		return 1;
	}
	return 0;
}

public udb_CheckLogin(arg0, arg1)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10 = 0, var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16[255], var17 = 0, var18 = 0, var19 = 0, var20 = 0, var21 = 0, var22 = 0, var23 = 0, var24 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18, var19, var20, var21, var22, var23, var24) && udb_hash(arg1) == var0)
	{
		return 1;
	}
	return 0;
}

public udb_Create(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15, arg16, arg17, arg18, arg19, arg20, arg21, arg22, arg23, arg24, arg25)
{
	if(udb_Exists(arg0))
	{
		return 0;
	}
	udb_Save(arg0, udb_hash(arg1), arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15, arg16, arg17, arg18, arg19, arg20, arg21, arg22, arg23, arg24, arg25);
	return 1;
}

public udb_setPosition(arg0, arg1, arg2, arg3)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10 = 0, var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16[255], var17 = 0, var18 = 0, var19 = 0, var20 = 0, var21 = 0, var22 = 0, var23 = 0, var24 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18, var19, var20, var21, var22, var23, var24))
	{
		udb_Save(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, arg1, arg2, arg3, var20, var21, var22, var23, var24);
		return 1;
	}
	return 0;
}

public udb_setAng(arg0, arg1)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10 = 0, var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16[255], var17 = 0, var18 = 0, var19 = 0, var20 = 0, var21 = 0, var22 = 0, var23 = 0, var24 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18, var19, var20, var21, var22, var23, var24))
	{
		udb_Save(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18, var19, arg1, var21, var22, var23, var24);
		return 1;
	}
	return 0;
}

public udb_setCreditos(arg0, arg1)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10 = 0, var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16[255], var17 = 0, var18 = 0, var19 = 0, var20 = 0, var21 = 0, var22 = 0, var23 = 0, var24 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18, var19, var20, var21, var22, var23, var24))
	{
		udb_Save(arg0, var0, arg1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18, var19, var20, var21, var22, var23, var24);
		return 1;
	}
	return 0;
}

public udb_setSkin(arg0, arg1)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10 = 0, var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16[255], var17 = 0, var18 = 0, var19 = 0, var20 = 0, var21 = 0, var22 = 0, var23 = 0, var24 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18, var19, var20, var21, var22, var23, var24))
	{
		udb_Save(arg0, var0, var1, var2, arg1, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18, var19, var20, var21, var22, var23, var24);
		return 1;
	}
	return 0;
}

public udb_setBankMoney(arg0, arg1)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10 = 0, var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16[255], var17 = 0, var18 = 0, var19 = 0, var20 = 0, var21 = 0, var22 = 0, var23 = 0, var24 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18, var19, var20, var21, var22, var23, var24))
	{
		udb_Save(arg0, var0, var1, var2, var3, arg1, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18, var19, var20, var21, var22, var23, var24);
		return 1;
	}
	return 0;
}

public udb_setHealth(arg0, arg1)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10 = 0, var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16[255], var17 = 0, var18 = 0, var19 = 0, var20 = 0, var21 = 0, var22 = 0, var23 = 0, var24 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18, var19, var20, var21, var22, var23, var24))
	{
		udb_Save(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18, var19, var20, arg1, var22, var23, var24);
		return 1;
	}
	return 0;
}

public udb_setseguro(arg0, arg1)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10 = 0, var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16[255], var17 = 0, var18 = 0, var19 = 0, var20 = 0, var21 = 0, var22 = 0, var23 = 0, var24 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18, var19, var20, var21, var22, var23, var24))
	{
		udb_Save(arg0, var0, var1, var2, var3, var4, arg1, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18, var19, var20, var21, var22, var23, var24);
		return 1;
	}
	return 0;
}

public udb_setHabaerea(arg0, arg1)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10 = 0, var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16[255], var17 = 0, var18 = 0, var19 = 0, var20 = 0, var21 = 0, var22 = 0, var23 = 0, var24 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18, var19, var20, var21, var22, var23, var24))
	{
		udb_Save(arg0, var0, var1, var2, var3, var4, var5, arg1, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18, var19, var20, var21, var22, var23, var24);
		return 1;
	}
	return 0;
}

public udb_setHabterre(arg0, arg1)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10 = 0, var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16[255], var17 = 0, var18 = 0, var19 = 0, var20 = 0, var21 = 0, var22 = 0, var23 = 0, var24 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18, var19, var20, var21, var22, var23, var24))
	{
		udb_Save(arg0, var0, var1, var2, var3, var4, var5, var6, arg1, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18, var19, var20, var21, var22, var23, var24);
		return 1;
	}
	return 0;
}

public udb_setHabnauti(arg0, arg1)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10 = 0, var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16[255], var17 = 0, var18 = 0, var19 = 0, var20 = 0, var21 = 0, var22 = 0, var23 = 0, var24 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18, var19, var20, var21, var22, var23, var24))
	{
		udb_Save(arg0, var0, var1, var2, var3, var4, var5, var6, var7, arg1, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18, var19, var20, var21, var22, var23, var24);
		return 1;
	}
	return 0;
}

public udb_setPrisao(arg0, arg1)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10 = 0, var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16[255], var17 = 0, var18 = 0, var19 = 0, var20 = 0, var21 = 0, var22 = 0, var23 = 0, var24 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18, var19, var20, var21, var22, var23, var24))
	{
		udb_Save(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, arg1, var10, var11, var12, var13, var14, var15, var16, var17, var18, var19, var20, var21, var22, var23, var24);
		return 1;
	}
	return 0;
}

public udb_setProf(arg0, arg1)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10 = 0, var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16[255], var17 = 0, var18 = 0, var19 = 0, var20 = 0, var21 = 0, var22 = 0, var23 = 0, var24 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18, var19, var20, var21, var22, var23, var24))
	{
		udb_Save(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, arg1, var16, var17, var18, var19, var20, var21, var22, var23, var24);
		return 1;
	}
	return 0;
}

public udb_setXP(arg0, arg1)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10 = 0, var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16[255], var17 = 0, var18 = 0, var19 = 0, var20 = 0, var21 = 0, var22 = 0, var23 = 0, var24 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18, var19, var20, var21, var22, var23, var24))
	{
		udb_Save(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, arg1, var15, var12, var13, var14, var16, var17, var18, var19, var20, var21, var22, var23, var24);
		return 1;
	}
	return 0;
}

public udb_setED(arg0, arg1)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10 = 0, var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16[255], var17 = 0, var18 = 0, var19 = 0, var20 = 0, var21 = 0, var22 = 0, var23 = 0, var24 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18, var19, var20, var21, var22, var23, var24))
	{
		udb_Save(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, arg1, var11, var12, var13, var14, var15, var16, var17, var18, var19, var20, var21, var22, var23, var24);
		return 1;
	}
	return 0;
}

public udb_setcell(arg0, arg1)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10 = 0, var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16[255], var17 = 0, var18 = 0, var19 = 0, var20 = 0, var21 = 0, var22 = 0, var23 = 0, var24 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18, var19, var20, var21, var22, var23, var24))
	{
		udb_Save(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, arg1, var13, var14, var15, var16, var17, var18, var19, var20, var21, var22, var23, var24);
		return 1;
	}
	return 0;
}

public udb_setnumcell(arg0, arg1)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10 = 0, var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16[255], var17 = 0, var18 = 0, var19 = 0, var20 = 0, var21 = 0, var22 = 0, var23 = 0, var24 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18, var19, var20, var21, var22, var23, var24))
	{
		udb_Save(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, arg1, var14, var15, var16, var17, var18, var19, var20, var21, var22, var23, var24);
		return 1;
	}
	return 0;
}

public udb_setNM(arg0, arg1)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10 = 0, var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16[255], var17 = 0, var18 = 0, var19 = 0, var20 = 0, var21 = 0, var22 = 0, var23 = 0, var24 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18, var19, var20, var21, var22, var23, var24))
	{
		udb_Save(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, arg1, var15, var16, var17, var18, var19, var20, var21, var22, var23, var24);
		return 1;
	}
	return 0;
}

public udb_setValorFinanciamento(arg0, arg1)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10 = 0, var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16[255], var17 = 0, var18 = 0, var19 = 0, var20 = 0, var21 = 0, var22 = 0, var23 = 0, var24 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18, var19, var20, var21, var22, var23, var24))
	{
		udb_Save(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18, var19, var20, var21, arg1, var23, var24);
		return 1;
	}
	return 0;
}

public udb_setFaltandoFinanciamento(arg0, arg1)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10 = 0, var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16[255], var17 = 0, var18 = 0, var19 = 0, var20 = 0, var21 = 0, var22 = 0, var23 = 0, var24 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18, var19, var20, var21, var22, var23, var24))
	{
		udb_Save(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18, var19, var20, var21, var22, arg1, var24);
		return 1;
	}
	return 0;
}

public udb_setVesesFinanciamento(arg0, arg1)
{
	new var0 = 0, var1 = 0, var2 = 0, var3 = 0, var4 = 0, var5 = 0, var6 = 0, var7 = 0, var8 = 0, var9 = 0, var10 = 0, var11 = 0, var12 = 0, var13 = 0, var14 = 0, var15 = 0, var16[255], var17 = 0, var18 = 0, var19 = 0, var20 = 0, var21 = 0, var22 = 0, var23 = 0, var24 = 0;
	if(udb_Load(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18, var19, var20, var21, var22, var23, var24))
	{
		udb_Save(arg0, var0, var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18, var19, var20, var21, var22, var23, arg1);
		return 1;
	}
	return 0;
}

functionCA14(arg0, &arg1)
{
	if(arg0 < 1 || arg0 > 700 || arg0 > glob4A24)
	{
		return 0;
	}
	arg1 = glob884[arg0][0];
	return 1;
}

functionCAD4(arg0)
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

functionCB94(arg0)
{
	new var0[255];
	var0[0] = 0;
	if(strfind(arg0, "=", true, 0) == -1)
	{
		return var0;
	}
	set(var0, function2554(function107C(arg0, 0, strfind(arg0, "=", true, 0))));
	return var0;
}

functionCD28(arg0)
{
	new var0[255];
	var0[0] = 0;
	if(strfind(arg0, "=", true, 0) == -1)
	{
		return var0;
	}
	set(var0, function107C(arg0, strfind(arg0, "=", true, 0) + 1, strlen(arg0)));
	return var0;
}

functionCEB4(arg0, arg1, arg2)
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
		if(!var2 && equal(functionCB94(var3), arg1, true))
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
	if(functionC3C(var3, arg0))
	{
		return fremove(var3);
	}
	return 0;
}

functionD36C(arg0, arg1, arg2)
{
	new var0[255];
	format(var0, 255, "%d", arg2);
	return functionCEB4(arg0, arg1, var0);
}

functionD404(arg0, arg1)
{
	return strval(functionD464(arg0, arg1));
}

functionD464(arg0, arg1)
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
		if(equal(functionCB94(var1), arg1, true))
		{
			var2[0] = 0;
			strcat(var2, functionCD28(var1), 255);
			fclose(var0);
			return var2;
		}
	}
	fclose(var0);
	return var1;
}

functionD714(arg0, arg1)
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
		if(equal(functionCB94(var1), arg1, true))
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
	print("\n___________________________________________________");
	print("               >>> MPA Reload RPG <<<         ");
	print("___________________________________________________");
	print(" ");
	print("  Uma Parceria entre MPA Furious e MPA Reload RPG    ");
	print("---------------------- CODDERS --------------------");
	print("[MPA]Guilherme                          [MPA]Rafael");
	print("                    [MPA]Rodrigo");
	print("____________________________________________________\n");
	glob2DB4C = 12;
	return 0;
}

public Entrega()
{
	for(new var0 = 0; var0 < 200; var0++)
	{
		if(39 != glob2AF8C[var0])
		{
			return 1;
		}
		new var1[256];
		new var2 = random(11);
		format(var1, 256, "Precisamos de um caminhão para entregar %s. Carregar na %s.", glob17944[var2][0], glob17B9C[var2][0]);
		SendClientMessage(var0, 0x33AA33AA, var1);
		SendClientMessage(var0, 0x33AA33AA, "Digite /recusar para recusar o convite");
		glob17914 = glob17918[var2];
		SetPlayerCheckpoint(var0, glob17DB4[var2][0], glob17DB4[var2][1], glob17DB4[var2][2], 5.0);
		glob187CC[var0] = 27;
		glob175F4[var0] = 1;
		glob1912C[var0] = 5;
	}
	return 1;
}

public CarregandoComb(playerid, playerid2)
{
	new var0[256];
	new var1 = random(4);
	new var2 = random(5);
	glob1843C[playerid] = glob1875C[var2];
	glob17EA4[playerid] = glob181C4[var1];
	format(var0, 256, "Foram carregados %d litros de %s terá que entregar em %s no posto próximo %s. Você receberá R$%d pela viagem.", 99388, glob17944[glob17914][0], glob181E4[var1][0], glob182AC[var1][0], 98772);
	SendClientMessage(playerid, 0x33AA33AA, var0);
	glob187CC[playerid] = 28;
	SetPlayerCheckpoint(playerid, glob17E64[var1][0], glob17E64[var1][1], glob17E64[var1][2], 5.0);
	glob1F9F8[GetPlayerVehicleID(playerid2)] = 1;
	glob175F4[playerid] = 1;
	return 1;
}

public DescarregandoComb(playerid, playerid2, arg2)
{
	new var0[256];
	glob175F4[playerid] = 0;
	glob1F9F8[GetPlayerVehicleID(playerid2)] = 0;
	DetachTrailerFromVehicle(arg2);
	functionBA8(playerid, glob181D4[glob17EA4[playerid]]);
	format(var0, 256, "Você entregou %d litros de %s em %s. Te pagaram R$%d pela viagem.", 99388, glob17944[glob17914][0], glob181E4[glob17EA4[playerid]][0], 98772);
	SendClientMessage(playerid, 0x33AA33AA, var0);
	GivePlayerMoney(playerid, glob181D4[glob17EA4[playerid]]);
	glob1843C[playerid] = 0;
	glob17EA4[playerid] = 0;
	return 1;
}

public OnGameModeInit()
{
	print("Carregando MPA Reload RPG");
	SetGameModeText("MPA® Reload RPG™");
	AddPlayerClass(60, 768.272, -36.8625, 1000.6865, 186.46, 0, 0, 0, 0, 0, 0);
	UsePlayerPedAnims();
	ShowNameTags(true);
	EnableTirePopping(true);
	CreateVehicle(463, -2210.6514, -2255.1766, 30.2733, 319.5423, 0, 1, -1);
	CreateVehicle(508, -2205.6443, -2251.7271, 31.0835, 48.4874, 1, 1, -1);
	CreateVehicle(glob18798, -2100.7054, -2345.9402, 30.2115, 53.735, 3, 1, -1);
	CreateVehicle(glob18798, -2157.8841, -2460.8802, 30.1954, 225.4416, 3, 1, -1);
	CreateVehicle(glob18788, -2187.9341, -2399.1441, 30.3243, 143.0973, 86, 86, -1);
	CreateVehicle(glob1878C, -2175.7059, -2336.1524, 30.3269, 322.0567, 1, 1, -1);
	CreateVehicle(glob1878C, -2181.1004, -2343.181, 30.3293, 322.2348, 1, 1, -1);
	CreateVehicle(525, -2115.6961, -2469.0262, 30.3416, 47.3265, 1, 0, -1);
	CreateVehicle(408, -2092.65, -2304.0359, 30.2595, 142.9992, 86, 0, -1);
	CreateVehicle(600, -2183.2251, -2502.2171, 30.2689, 233.124, 3, 3, -1);
	CreateVehicle(597, -2156.0496, -2396.8077, 30.3125, 54.008, 0, 1, -1);
	CreateVehicle(597, -2161.9847, -2392.3926, 30.3055, 53.103, 0, 1, -1);
	CreateVehicle(glob18778, -2168.1014, -2387.7903, 30.7226, 51.534, 0, 1, -1);
	CreateVehicle(523, -2174.1709, -2383.6321, 30.0387, 130.91, 0, 1, -1);
	CreateVehicle(523, -2172.5047, -2384.6919, 30.0389, 141.8291, 0, 1, -1);
	CreateVehicle(glob187B8, -2074.2454, -2462.0308, 30.68, 49.9911, 95, 16, -1);
	CreateVehicle(glob187B8, -2083.2657, -2454.6644, 30.677, 52.3799, 98, 20, -1);
	CreateVehicle(glob18780, -2142.7491, -2447.0286, 30.4074, 323.7562, 6, 1, -1);
	CreateVehicle(glob18780, -2144.8958, -2445.4551, 30.4074, 323.7562, 6, 1, -1);
	CreateVehicle(glob18780, -2149.1502, -2441.9424, 30.4053, 322.3453, 6, 1, -1);
	CreateVehicle(581, -2146.4854, -2442.7918, 30.2113, 139.5587, 6, 6, -1);
	CreateVehicle(581, -2150.2867, -2439.1634, 30.2164, 144.2821, 6, 6, -1);
	CreateVehicle(glob1877C, -2123.3309, -2255.6534, 30.3456, 232.2825, 6, 6, -1);
	CreateVehicle(glob1877C, -2133.3716, -2247.7283, 30.3481, 232.527, 6, 6, -1);
	CreateVehicle(glob1877C, -2144.3084, -2254.167, 30.4276, 321.2896, 6, 6, -1);
	CreateVehicle(487, -2133.1822, -2258.0247, 30.8092, 50.5889, 6, 0, -1);
	CreateVehicle(461, -2140.8577, -2259.0567, 30.6319, 305.4985, 6, 0, -1);
	CreateVehicle(glob18794, -2201.9024, -2294.8243, 30.7744, 317.3577, 1, 3, -1);
	CreateVehicle(glob1879C, -2102.5416, -2228.6207, 30.7583, 140.1956, 1, 1, -1);
	CreateVehicle(glob1879C, -2099.5257, -2230.4441, 30.8355, 139.7521, 1, 1, -1);
	CreateVehicle(glob1879C, -2097.0062, -2232.6524, 30.9025, 140.5417, 1, 1, -1);
	CreateVehicle(403, -2090.9935, -2241.9666, 30.7345, 53.5008, 3, 3, -1);
	CreateVehicle(403, -2093.8887, -2245.9402, 30.4708, 53.8578, 1, 1, -1);
	CreateVehicle(403, -2097.0799, -2250.073, 30.4281, 55.1502, 0, 0, -1);
	CreateVehicle(glob187B8, -156.9283, 1194.6168, 19.7814, 270.8334, 71, 87, -1);
	CreateVehicle(glob187B8, -171.1785, 1194.6578, 19.739, 269.4512, 55, 83, -1);
	CreateVehicle(581, -141.9811, 1187.3343, 19.3211, 342.5776, 66, 1, -1);
	CreateVehicle(509, -143.9406, 1187.5908, 19.2548, 9.9856, 16, 1, -1);
	CreateVehicle(509, -146.351, 1187.3356, 19.2544, 349.8418, 74, 1, -1);
	CreateVehicle(543, -96.0623, 1193.3948, 19.4804, 273.0895, 67, 8, -1);
	CreateVehicle(510, -94.3977, 1209.6837, 19.3278, 208.9741, 46, 46, -1);
	CreateVehicle(508, -101.3297, 1222.5194, 20.1273, 359.1907, 1, 1, -1);
	CreateVehicle(463, -94.3122, 1222.7695, 19.2793, 356.6828, 84, 84, -1);
	CreateVehicle(531, -48.721, 1113.5156, 19.7271, 174.3213, 91, 2, -1);
	CreateVehicle(525, -33.5872, 1086.4548, 19.634, 3.2091, 18, 20, -1);
	CreateVehicle(glob18780, -214.4731, 1094.4625, 19.3708, 269.9807, 6, 1, -1);
	CreateVehicle(glob18780, -222.1834, 1094.5258, 19.3668, 267.937, 6, 1, -1);
	CreateVehicle(438, -229.883, 1094.5428, 19.579, 270.5586, 6, 76, -1);
	CreateVehicle(glob18794, -328.5625, 1063.7592, 19.8952, 267.435, 1, 3, -1);
	CreateVehicle(478, -290.0368, 1163.1853, 19.6832, 88.2329, 40, 1, -1);
	CreateVehicle(glob1877C, -143.5765, 1111.9803, 19.554, 1.4575, 6, 6, -1);
	CreateVehicle(glob1877C, -147.2038, 1114.4742, 19.5471, 358.3854, 6, 6, -1);
	CreateVehicle(glob1877C, -147.249, 1128.8909, 19.5438, 0.4013, 6, 6, -1);
	CreateVehicle(521, -137.7813, 1127.7448, 19.2954, 59.6575, 6, 6, -1);
	CreateVehicle(523, -211.0403, 973.765, 18.6284, 266.1498, 0, 1, -1);
	CreateVehicle(glob18774, -211.5761, 984.4426, 19.5219, 271.6648, 0, 1, -1);
	CreateVehicle(glob18778, -211.4822, 988.6226, 19.6184, 269.0335, 0, 1, -1);
	CreateVehicle(glob18778, -211.0508, 993.4312, 19.6986, 265.8233, 0, 1, -1);
	CreateVehicle(584, 284.0437, 1349.0656, 10.1556, 355.0104, 0, 1, -1);
	CreateVehicle(514, 280.6498, 1385.6341, 10.156, 270.3432, 0, 1, -1);
	CreateVehicle(478, -359.5845, 1179.4849, 19.7376, 227.5946, 40, 1, -1);
	CreateVehicle(444, 364.6567, 2536.4775, 17.04, 186.9105, -1, -1, -1);
	CreateVehicle(487, 328.2084, 2539.6591, 17.1777, 160.0904, -1, -1, -1);
	CreateVehicle(493, 435.8223, 2528.5095, 17.249, 89.6305, 3, 6, -1);
	CreateVehicle(glob18788, -2862.6038, 1067.8721, 31.5436, 271.4576, 0, 93, -1);
	CreateVehicle(glob18788, -2859.0481, 1054.9222, 32.7858, 107.107, 0, 93, -1);
	CreateVehicle(glob18788, -2865.8396, 1043.918, 34.096, 184.6118, 0, 93, -1);
	CreateVehicle(glob18780, -1446.8503, -280.6407, 13.795, 63.8306, 6, 6, -1);
	CreateVehicle(582, -2516.9234, -602.1368, 132.9338, 359.6379, 1, 0, -1);
	CreateVehicle(566, -2397.5792, -610.8218, 133.0196, 213.7984, 1, 1, -1);
	CreateVehicle(404, -2498.1954, -602.0826, 132.9338, 359.6086, -1, -1, -1);
	CreateVehicle(glob18798, -1806.0667, 951.5512, 24.8906, 176.8831, 3, 1, -1);
	CreateVehicle(glob18798, -2330.649, -164.3958, 35.5546, 267.6751, 3, 1, -1);
	CreateVehicle(537, -1942.8453, 167.4841, 27.2245, 356.7457, 1, 1, -1);
	CreateVehicle(449, -2264.8333, 547.5076, 35.5182, 180.4091, 3, 3, -1);
	CreateVehicle(glob18774, -1607.5646, 724.4724, 12.0493, 268.6695, 0, 1, -1);
	CreateVehicle(glob18774, -1588.248, 748.0393, -5.4904, 359.9997, 0, 1, -1);
	CreateVehicle(523, -1584.0218, 749.491, -5.6656, 180.9965, 0, 0, -1);
	CreateVehicle(523, -1579.8461, 749.0731, -5.6572, 181.8757, 0, 0, -1);
	CreateVehicle(glob18774, -1574.2565, 742.4982, -5.5206, 88.9996, 0, 1, -1);
	CreateVehicle(523, -1573.5986, 734.6491, -5.669, 90.0025, 0, 0, -1);
	CreateVehicle(497, -1679.5951, 706.1431, 30.7954, 90.5113, 0, 1, -1);
	CreateVehicle(437, -1988.5008, 162.0946, 27.6508, 0.0, 1, 1, -1);
	CreateVehicle(437, -1988.336, 131.3477, 27.6942, 0.0, 1, 1, -1);
	CreateVehicle(glob18784, -2089.6644, -83.5934, 34.7975, 359.9729, 6, 6, -1);
	CreateVehicle(glob18784, -2081.2825, -83.4889, 34.8086, 4.09, 6, 6, -1);
	CreateVehicle(461, -2022.3978, -124.3721, 34.7831, 179.9716, 6, 6, -1);
	CreateVehicle(487, -2032.246, -155.6209, 35.4655, 0.006, 6, 0, -1);
	CreateVehicle(glob1877C, -2088.8313, -156.0123, 35.0983, 359.9812, 6, 6, -1);
	CreateVehicle(glob1877C, -2092.4036, -145.2735, 35.0985, 0.0399, 6, 6, -1);
	CreateVehicle(glob1877C, -2092.3504, -132.4997, 35.0965, 0.4675, 6, 6, -1);
	CreateVehicle(487, -1829.1175, 1300.2818, 59.8816, 204.0558, 54, 29, -1);
	CreateVehicle(453, -1556.1756, 1260.8344, -0.5926, 234.7669, 69, 69, -1);
	CreateVehicle(453, -1565.1834, 1259.7523, -0.5379, 227.8784, 69, 69, -1);
	CreateVehicle(453, -1578.2353, 1260.0367, -0.0552, 228.0563, 69, 69, -1);
	CreateVehicle(493, -1474.4727, 687.5855, -0.2038, 268.8839, 6, 6, -1);
	CreateVehicle(453, -1473.3943, 703.5045, -0.4342, 272.7461, 6, 6, -1);
	CreateVehicle(glob18780, -1703.0906, 1003.9793, 17.3777, 91.1513, 6, 1, -1);
	CreateVehicle(glob18780, -1687.7857, 999.6074, 17.3444, 270.719, 6, 1, -1);
	CreateVehicle(glob18780, -1696.9394, 977.3001, 17.3661, 180.7286, 6, 1, -1);
	CreateVehicle(glob18780, -1687.5577, 983.2572, 17.3647, 269.0692, 6, 1, -1);
	CreateVehicle(glob18780, -1410.9571, -309.9072, 13.7718, 34.9766, 6, 6, -1);
	CreateVehicle(581, -1687.7793, 995.4088, 17.3665, 90.666, 6, 1, -1);
	CreateVehicle(glob18780, -1703.6135, 1012.2395, 17.3647, 91.3087, 6, 1, -1);
	CreateVehicle(glob1878C, -1816.4678, 1311.4034, 50.2891, 275.5557, 1, 1, -1);
	CreateVehicle(glob1878C, -1829.7209, 1289.6336, 50.2512, 110.5457, 1, 1, -1);
	CreateVehicle(glob1878C, -1734.8969, 1011.9638, 17.3659, 89.319, 1, 1, -1);
	CreateVehicle(glob1878C, -1734.9292, 1020.299, 17.3647, 90.4921, 1, 1, -1);
	CreateVehicle(glob1878C, -1756.8874, 951.8206, 24.9183, 90.0569, 1, 1, -1);
	CreateVehicle(433, -1307.1634, 456.9035, 7.5908, 89.9428, 0, 0, -1);
	CreateVehicle(433, -1306.519, 463.9993, 7.6435, 89.6542, 0, 0, -1);
	CreateVehicle(433, -1306.5568, 460.6202, 7.6451, 90.4466, 0, 0, -1);
	CreateVehicle(433, -1309.4953, 444.8434, 7.6132, 55.0, 0, 0, -1);
	CreateVehicle(433, -1307.2222, 447.7583, 7.5936, 54.9896, 0, 0, -1);
	CreateVehicle(470, -1241.5156, 445.2167, 7.1592, 326.9935, 44, 44, -1);
	CreateVehicle(470, -1232.7764, 451.6961, 7.168, 89.998, 0, 0, -1);
	CreateVehicle(425, -1403.2001, 465.2319, 7.7642, 181.0, 0, 0, -1);
	CreateVehicle(425, 308.9299, 1990.3327, 18.2169, 180.0702, 0, 0, -1);
	CreateVehicle(425, 309.5914, 2056.1018, 18.1975, 180.0104, 0, 0, -1);
	CreateVehicle(592, -1632.3605, -265.8032, 15.3416, 12.1936, 1, 1, -1);
	CreateVehicle(519, -1626.1269, -219.8978, 15.0672, 339.8286, 1, 1, -1);
	CreateVehicle(593, -1708.3001, -247.4316, 14.6091, 360.0, 0, 0, -1);
	CreateVehicle(403, -1732.9802, -110.8736, 5.0921, 40.0861, 3, 3, -1);
	CreateVehicle(glob1879C, -1720.1995, -63.6686, 3.6879, 133.0924, 3, 3, -1);
	CreateVehicle(glob1879C, -1723.554, -59.6139, 3.6882, 134.0422, 3, 3, -1);
	CreateVehicle(glob1879C, -1728.0134, -55.9081, 3.6879, 132.7225, 3, 3, -1);
	CreateVehicle(glob1879C, -1731.6532, -52.2449, 3.6879, 132.5402, 3, 3, -1);
	CreateVehicle(glob1879C, -1735.1478, -96.0247, 3.6821, 38.6315, 3, 3, -1);
	CreateVehicle(glob1879C, -1726.1198, -87.0243, 3.6875, 46.7878, 3, 3, -1);
	CreateVehicle(glob1879C, -1723.2844, -84.4416, 3.6882, 44.7653, 3, 3, -1);
	CreateVehicle(584, -2414.3238, 952.5922, 44.9534, 269.1495, 1, 1, -1);
	CreateVehicle(glob18794, -2573.1768, 632.486, 14.1799, 90.0, 1, 3, -1);
	CreateVehicle(glob18794, -2625.6329, 629.8737, 14.1801, 270.0, 1, 3, -1);
	CreateVehicle(glob18794, -2592.8675, 660.9832, 27.5316, 90.0, 1, 3, -1);
	glob2F77C = CreateVehicle(504, -1665.7111, 1224.1818, 20.9465, 40.9238, 0, 0, -1);
	glob2F780 = CreateVehicle(492, -1680.5042, 1210.2413, 20.9379, 50.2592, 0, 0, -1);
	glob2F784 = CreateVehicle(491, -1658.3174, 1206.0847, 20.8698, 2.0899, 0, 0, -1);
	glob2F788 = CreateVehicle(glob18790, -1678.6065, 1210.7204, 13.401, 44.3841, 4, 4, -1);
	glob2F78C = CreateVehicle(415, -1667.7878, 1222.8989, 13.4468, 282.5328, 1, 1, -1);
	glob2F790 = CreateVehicle(402, -1646.4025, 1206.4597, 13.5069, 234.7826, 6, 6, -1);
	glob2F794 = CreateVehicle(421, -1659.4151, 1219.4539, 13.5543, 301.7943, 0, 0, -1);
	glob2F798 = CreateVehicle(474, -1668.8803, 1206.8923, 7.0173, 320.107, 0, 0, -1);
	glob2EE14 = CreateVehicle(451, -2714.3953, 196.1324, 4.035, 179.7362, 0, 0, -1);
	CreateVehicle(538, 801.0977, -1354.3145, -0.1563, 48.3636, 1, 1, -1);
	CreateVehicle(glob18774, 1602.5103, -1700.1235, 6.0782, 89.8648, 0, 1, -1);
	CreateVehicle(glob18774, 1535.6339, -1677.9896, 13.1037, 1.2791, 0, 1, -1);
	CreateVehicle(glob18780, 1658.3229, -1719.1973, 20.2618, 356.5259, 6, 1, -1);
	CreateVehicle(glob18794, 1179.6992, -1338.669, 14.1709, 272.5163, 1, 3, -1);
	CreateVehicle(407, 1749.5993, -1455.1705, 13.677, 270.4327, 3, 1, -1);
	CreateVehicle(577, 2007.9968, -2452.5191, 13.478, 114.4148, 0, 1, -1);
	CreateVehicle(592, 1929.8413, -2420.5665, 14.7363, 151.3047, 1, 1, -1);
	CreateVehicle(519, 1880.5739, -2415.2833, 14.4735, 211.5915, 1, 1, -1);
	CreateVehicle(519, 1860.9816, -2419.2339, 14.4755, 222.8972, 1, 1, -1);
	CreateVehicle(593, 1989.0895, -2394.1893, 14.0093, 120.8235, 0, 0, -1);
	CreateVehicle(608, 1992.5628, -2465.118, 15.7895, 22.8656, 0, 0, -1);
	CreateVehicle(glob18774, 1652.7618, -2323.6194, 13.1833, 269.5071, 0, 1, -1);
	CreateVehicle(glob18794, 1571.583, 1739.2962, 11.1163, 3.2084, 1, 3, -1);
	CreateObject(16477, 2463.2739, -58.5999, 25.62, 0.0, 0.0, 101.5);
	CreateObject(1686, 2461.1142, -40.5481, 25.68, 0.0, 0.0, 90.0);
	CreateObject(1686, 2464.1423, -40.548, 25.68, 0.0, 0.0, 90.0);
	CreateObject(1686, 2463.7863, -46.5849, 25.68, 0.0, 0.0, 90.0);
	CreateObject(1686, 2460.6364, -46.5517, 25.68, 0.0, 0.0, 90.0);
	CreateObject(2754, -2671.3177, 636.8947, 14.4531, 0.0, 0.0, 180.0);
	CreateObject(2754, -1980.0176, 165.6947, 27.6875, 0.0, 0.0, 0.0);
	CreateObject(2754, 1707.5577, -1682.1521, 13.449, 0.0, 0.0, 90.0);
	CreateObject(2754, 395.8685, -1806.7111, 7.6653, 0.0, 0.0, 270.0);
	CreateObject(2754, 1582.9049, 1756.6982, 10.7224, 0.0, 0.0, 270.0);
	CreateObject(2754, -180.6799, 1137.5229, 19.6501, 0.0, 0.0, 0.0);
	CreateObject(2754, -2206.7649, -2291.5945, 30.5346, 0.0, 0.0, 230.2339);
	CreateObject(1238, -2063.9046, -178.4728, 34.8203, 0.0, 0.0, 0.0);
	CreateObject(1238, -2064.4002, -186.0514, 34.8203, 0.0, 0.0, 0.0);
	CreateObject(1238, -2063.2491, -192.754, 34.8203, 0.0, 0.0, 0.0);
	CreateObject(1238, -2067.5438, -195.1632, 34.8203, 0.0, 0.0, 0.0);
	CreateObject(1238, -2073.2283, -195.8198, 34.8203, 0.0, 0.0, 0.0);
	CreateObject(1238, -2078.1802, -191.3293, 34.8203, 0.0, 0.0, 0.0);
	CreateObject(1238, -2084.4642, -186.5284, 34.8203, 0.0, 0.0, 0.0);
	CreateObject(17573, -2333.3543, -1638.3593, 483.2702, 0.0, 0.0, 130.0);
	CreateObject(1238, -2175.2144, -2382.9856, 29.8687, 0.0, 0.0, 0.0);
	CreateObject(1238, -2151.5982, -2400.7254, 29.8687, 0.0, 0.0, 0.0);
	CreateObject(16361, -1990.1261, -36.749, 34.2619, 0.0, 0.0, 270.0);
	CreateObject(640, -1996.4844, -41.7521, 35.0107, 0.0, 0.0, 180.0);
	CreateObject(640, -1996.585, -48.5938, 35.0173, 0.0, 0.0, 180.0);
	CreateObject(640, -1996.5943, -30.9312, 34.9414, 0.0, 0.0, 180.0);
	CreateObject(640, -1996.5969, -23.8965, 34.9057, 0.0, 0.0, 180.0);
	CreateObject(678, -1996.9991, -44.9852, 34.4314, 0.0, 0.0, 33.75);
	CreateObject(634, -1995.189, -45.1417, 34.3364, 0.0, 0.0, 0.0);
	CreateObject(634, -1995.3926, -27.576, 34.2309, 0.0, 0.0, 0.0);
	CreateObject(669, -1992.9211, -3.0173, 33.9314, 0.0, 0.0, 0.0);
	CreateObject(1696, -1990.6355, -28.9343, 38.9965, 0.0, 0.0, 180.0);
	CreateObject(1696, -1990.2419, -42.8988, 38.9965, 0.0, 0.0, 180.0);
	CreateObject(14665, -1989.9627, -36.3658, 21.8969, 0.0, 0.0, 0.0);
	CreateObject(16378, -1993.4793, -44.9558, 20.6417, 0.0, 0.0, 270.0);
	CreateObject(16154, -1992.5903, -28.2613, 19.9863, 0.0, 0.0, 180.0);
	CreateObject(14493, -1995.2669, -38.7836, 22.1899, 0.0, 0.0, 90.0);
	CreateObject(18092, -1992.7563, -34.3017, 20.4119, 0.0, 0.0, 180.0);
	CreateObject(1671, -1992.4573, -33.1247, 20.3727, 0.0, 0.0, 22.5);
	CreateObject(1721, -1993.3854, -29.9805, 19.9257, 0.0, 0.0, 0.0);
	CreateObject(1723, -1994.5781, -40.8129, 19.9106, 0.0, 0.0, 90.0);
	CreateObject(1723, -1991.5607, -41.9031, 19.9106, 0.0, 0.0, 180.0);
	CreateObject(2180, -1990.2403, -39.8864, 19.9103, 0.0, 0.0, 90.0);
	CreateObject(2605, -1988.5575, -46.6786, 20.311, 0.0, 0.0, 180.0);
	CreateObject(1721, -1988.2823, -45.4821, 19.9257, 0.0, 0.0, 157.5);
	CreateObject(7191, -2010.7015, -31.1203, 21.8872, 0.0, 0.0, 270.0);
	CreateObject(7191, -2016.1055, -38.0648, 21.9122, 0.0, 0.0, 270.0);
	CreateObject(7191, -1990.4632, -38.1601, 7.3872, 90.2408, 358.281, 270.0);
	CreateObject(7191, -1988.5848, -40.1568, 7.4122, 90.2408, 339.3735, 199.5263);
	CreateObject(7191, -1988.621, -40.6317, 7.3872, 90.2408, 339.3735, 199.5263);
	CreateObject(7191, -2011.2812, -42.5885, 21.8622, 0.0, 0.0, 90.0);
	CreateObject(7191, -1988.6302, -7.3212, 21.8872, 0.0, 0.0, 180.0);
	CreateObject(7191, -1988.6388, -27.1688, 24.3872, 0.0, 0.0, 180.0);
	CreateObject(1502, -1992.4715, -38.0291, 19.9553, 0.0, 0.0, 180.0);
	CreateObject(1502, -1988.6423, -31.0161, 19.9035, 0.0, 0.0, 90.0);
	CreateObject(7191, -1988.5666, -38.3413, 24.3789, 0.0, 0.0, 267.6625);
	CreateObject(7191, -1984.991, -38.5102, 21.8872, 90.2407, 354.8434, 272.819);
	CreateObject(1502, -1988.4738, -38.4436, 19.9035, 0.0, 0.0, 0.0);
	CreateObject(7191, -1988.7159, -33.1817, 21.8872, 268.1445, 16.3292, 196.9481);
	CreateObject(1532, -1995.4148, -37.9264, 19.9064, 0.0, 0.0, 90.0);
	CreateObject(1532, -1995.4584, -34.9122, 19.9064, 0.0, 0.0, 269.9999);
	CreateObject(1518, -1990.2277, -39.5158, 20.9921, 0.0, 0.0, 281.25);
	CreateObject(7191, -1964.9163, -29.2229, 21.8872, 0.0, 0.0, 90.0);
	CreateObject(1502, -1988.5973, -29.2818, 19.9035, 0.0, 0.0, 0.0);
	CreateObject(7191, -1988.5416, -29.26, 24.3802, 0.0, 0.0, 92.3369);
	CreateObject(2836, -1993.6026, -36.0733, 19.9121, 0.0, 0.0, 0.0);
	CreateObject(2833, -1993.9314, -39.0594, 19.9121, 0.0, 0.0, 270.0);
	CreateObject(14527, -1992.8554, -39.8636, 21.2949, 0.0, 0.0, 0.0);
	CreateObject(2833, -1992.8383, -39.0618, 19.9121, 0.0, 0.0, 270.0);
	CreateObject(2738, -1984.9227, -26.8405, 20.5154, 0.0, 0.0, 270.0);
	CreateObject(2524, -1986.1949, -28.6507, 19.9125, 0.0, 0.0, 180.0);
	CreateObject(2835, -1987.196, -27.6235, 19.9106, 0.0, 0.0, 0.0);
	CreateObject(2834, -1986.9965, -32.2134, 19.9121, 0.0, 0.0, 270.0);
	CreateObject(2833, -1991.3167, -44.4349, 19.9121, 0.0, 0.0, 270.0);
	CreateObject(2833, -1987.1412, -42.604, 19.9121, 0.0, 0.0, 270.0);
	CreateObject(2596, -1994.388, -31.548, 22.7999, 0.0, 0.0, 0.0);
	CreateObject(2229, -1989.8519, -41.1695, 19.9125, 0.0, 0.0, 270.0);
	CreateObject(2190, -1991.7776, -34.8838, 20.908, 0.0, 0.0, 180.0);
	CreateObject(2028, -1990.3716, -38.7874, 20.7953, 0.0, 0.0, 270.0);
	CreateObject(1318, -1995.7166, -36.4943, 35.2602, 0.0, 0.0, 0.0);
	CreateObject(1318, -1994.8101, -36.4, 20.736, 0.0, 0.0, 0.0);
	CreateObject(1239, -1992.3936, -35.1001, 20.457, 0.0, 0.0, 0.0);
	CreateObject(2690, -1995.097, -34.6713, 21.884, 0.0, 0.0, 101.25);
	AddStaticPickup(1274, 1, -2425.2386, 66.477, 35.1719);
	CreateObject(4859, 3923.0163, -315.826, 31.3513, 0.1963, 0.0, 0.0);
	CreateObject(5812, 3926.8513, -346.6359, 30.4684, -1.7672, 0.0, 0.0);
	CreateObject(1612, 3917.2644, -280.4958, 38.3342, 1.3744, 0.0, 0.0);
	glob273F4 = CreateObject(7657, -2122.2208, -80.6447, 36.0371, 0.0, 0.0, 0.0);
	glob29CC4 = CreateObject(975, -1770.1128, 979.835, 24.1825, 0.0, 0.0, 270.0);
	glob29CC8 = CreateObject(975, -1770.1229, 988.6641, 24.1825, 0.0, 0.0, 270.0);
	AddVehicleComponent(glob2EE14, 1010);
	AddVehicleComponent(glob2EE14, 1087);
	glob28078 = GangZoneCreate(3301530910, 1151330545, 3300593755, 1151461367);
	glob2807C = GangZoneCreate(3298121542, 3297055618, 3296447232, 3294948093);
	glob28080 = GangZoneCreate(3297499651, 3299143069, 3296752424, 3297511203);
	glob28084 = GangZoneCreate(3308291065, 3300901897, 3308196892, 3300705289);
	glob2966C = TextDrawCreate(320.0, 200.0, "~r~Bem-vindo ao ~n~ ~b~MPA Reload RPG");
	TextDrawColor(glob2966C, 0xFFF000FF);
	TextDrawAlignment(glob2966C, 2);
	TextDrawFont(glob2966C, 0);
	TextDrawLetterSize(glob2966C, 2.5, 2.5);
	glob29670 = TextDrawCreate(320.0, 240.0, "~w~Comandos: ~n~ /ajuda - Ajuda sobre o RPG ~n~ /aprender - Aprenda mais sobre gamemode RPG ~n~ /profissoes - Lista de profiss¨es disponiveis ~n~ Para mais comandos, digite /comandos ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~b~Visite o nosso site: WWW.GTABRASIL.NET");
	TextDrawColor(glob29670, 0x0099FFAA);
	TextDrawAlignment(glob29670, 2);
	TextDrawFont(glob29670, 1);
	TextDrawSetOutline(glob29670, 1);
	TextDrawSetShadow(glob29670, 0);
	glob29674 = TextDrawCreate(320.0, 400.0, "Visite nosso site: WWW.GTABRASIL.NET ~n~WWW.MPACLAN.COM ~n~ WWW.INFERNUSGROUP.COM");
	TextDrawColor(glob29674, 0xD7DFFFAA);
	TextDrawSetOutline(glob29674, 1);
	TextDrawSetShadow(glob29674, 1);
	TextDrawAlignment(glob29674, 2);
	glob29CC0 = 2000;
	for(new var0 = 0; var0 < 157; var0++)
	{
		new var1[256];
		format(var1, 256, "%d.vinfo", var0);
		if(!fexist(var1))
		{
			if(functionD714(var1, "gasolina"))
			{
				glob1C1A8[var0] = functionD404(var1, "gasolina");
			}
		}
		new var2[256];
		new var3 = 0;
		format(var2, 256, "%d.vinfo", var0);
		new var4[256];
		format(var4, 256, "tun%d", var3);
		if(fexist(var4))
		{
			AddVehicleComponent(var0, var3);
		}
		new var5 = 0;
		var5 = functionD404(var2, "cor1");
		new var6 = 0;
		var6 = functionD404(var2, "cor2");
		ChangeVehicleColor(var0, var5, var6);
	}
	new var0 = 0;
	new var1 = 0;
	new File:var2 = 0;
	new var3 = 0;
	new var4[256];
	new var5 = 0, Float:var6 = 0.0, Float:var7 = 0.0, Float:var8 = 0.0, Float:var9 = 0.0, var10 = 0, var11 = 0;
	var2 = fopen("reloadrpg.carros", 2);
	while(fread(var2, var4))
	{
		var3 = 0;
		var5 = strval(function1A10(var4, var3, 32));
		var6 = floatstr(function1A10(var4, var3, 32));
		var7 = floatstr(function1A10(var4, var3, 32));
		var8 = floatstr(function1A10(var4, var3, 32));
		var9 = floatstr(function1A10(var4, var3, 32));
		var10 = strval(function1A10(var4, var3, 32));
		var11 = strval(function1A10(var4, var3, 32));
		CreateVehicle(var5, var6, var7, var8, var9, var10, var11, -1);
		var0++;
	}
	fclose(var2);
	var2 = fopen("reloadrpg.casas", 2);
	while(fread(var2, var4))
	{
		var3 = 0;
		var6 = floatstr(function1A10(var4, var3, 32));
		var7 = floatstr(function1A10(var4, var3, 32));
		var8 = floatstr(function1A10(var4, var3, 32));
		AddStaticPickup(1272, 1, var6, var7, var8);
		var1++;
	}
	fclose(var2);
	SetTimer("Bancos", 1000, true);
	SetTimer("MoneyGrubScoreUpdate", 1000, true);
	SetTimer("TempoPrisao", 1000, true);
	SetTimer("Taxi", 5000, true);
	SetTimer("MTaxi", 5000, true);
	SetTimer("ATaxi", 5000, true);
	SetTimer("Tempo", 60000, true);
	SetTimer("tirandograna", 2000, true);
	SetTimer("CheckFuel", 50000, true);
	SetTimer("Speed", 250, true);
	SetTimer("verificacao", 50000, true);
	SetTimer("Semana", 140000, false);
	SetTimer("Cheat", 600000, true);
	SetTimer("Megasena", 600000, true);
	SetTimer("balada", 1000, true);
	SetTimer("quefome", 30000, true);
	SetTimer("CreateStartupFiles", 1000, true);
	SetTimer("SaveFiles", 1000, true);
	SetTimer("LoadFiles", 1000, true);
	glob331A0 = TextDrawCreate(214.0, 170.0, "Detonado!");
	TextDrawAlignment(glob331A0, 0);
	TextDrawBackgroundColor(glob331A0, 0x000000FF);
	TextDrawFont(glob331A0, 0);
	TextDrawLetterSize(glob331A0, 2.0, 3.0);
	TextDrawColor(glob331A0, 0xFF000066);
	TextDrawSetOutline(glob331A0, 1);
	TextDrawSetProportional(glob331A0, true);
	TextDrawSetShadow(glob331A0, 1);
	TextDrawUseBox(glob2967C, true);
	TextDrawBoxColor(glob2967C, 0x000000FF);
	TextDrawFont(glob2967C, 5);
	glob1D91C = CreateMenu("Radares", 1, 30.0, 140.0, 220.0, 0.0);
	AddMenuItem(glob1D91C, 0, "Ativar Radares da Cidade");
	AddMenuItem(glob1D91C, 0, "Desativar Radares da Cidade");
	AddMenuItem(glob1D91C, 0, "Sair");
	glob1E8C4 = CreateMenu("Terminais", 1, 30.0, 140.0, 220.0, 0.0);
	AddMenuItem(glob1E8C4, 0, "Circuito de SF");
	AddMenuItem(glob1E8C4, 0, "Circuito de SF 2");
	AddMenuItem(glob1E8C4, 0, "Sair");
	glob3206C = CreateMenu(" ", 1, 30.0, 140.0, 220.0, 0.0);
	SetMenuColumnHeader(glob3206C, 0, 238432);
	AddMenuItem(glob3206C, 0, "Aceitar");
	AddMenuItem(glob3206C, 0, "Recusar");
	glob24B40 = CreateMenu("Cardapio", 1, 30.0, 140.0, 220.0, 0.0);
	if(IsValidMenu(glob24B40))
	{
		SetMenuColumnHeader(glob24B40, 0, 238624);
		SetMenuColumnHeader(glob24B40, 1, 238664);
		AddMenuItem(glob24B40, 0, "X-Bacon");
		AddMenuItem(glob24B40, 1, "R$5");
		AddMenuItem(glob24B40, 0, "X-Burguer");
		AddMenuItem(glob24B40, 1, "R$6");
		AddMenuItem(glob24B40, 0, "X-Salada");
		AddMenuItem(glob24B40, 1, "R$4");
		AddMenuItem(glob24B40, 0, "Cachorro quente");
		AddMenuItem(glob24B40, 1, "R$6");
		AddMenuItem(glob24B40, 0, "Batata Frita");
		AddMenuItem(glob24B40, 1, "R$10");
		AddMenuItem(glob24B40, 0, "Refrigerante");
		AddMenuItem(glob24B40, 1, "R$5");
		AddMenuItem(glob24B40, 0, "Cerveja");
		AddMenuItem(glob24B40, 1, "R$5");
		AddMenuItem(glob24B40, 0, "Suco");
		AddMenuItem(glob24B40, 1, "R$4");
		AddMenuItem(glob24B40, 0, "Sair");
	}
	glob3203C = CreateMenu("Profissoes", 1, 30.0, 140.0, 220.0, 0.0);
	AddMenuItem(glob3203C, 0, "Entregador de Pizza");
	AddMenuItem(glob3203C, 0, "Sorveteiro");
	AddMenuItem(glob3203C, 0, "Taxista");
	AddMenuItem(glob3203C, 0, "Mendingo");
	AddMenuItem(glob3203C, 0, "Motorista de Onibus");
	AddMenuItem(glob3203C, 0, "Cancelar");
	glob32040 = CreateMenu("Profissoes", 1, 30.0, 140.0, 220.0, 0.0);
	AddMenuItem(glob32040, 0, "Barman");
	AddMenuItem(glob32040, 0, "Pescador");
	AddMenuItem(glob32040, 0, "Vendedor de Lanches");
	AddMenuItem(glob32040, 0, "Caminhoneiro");
	AddMenuItem(glob32040, 0, "Anterior<<");
	AddMenuItem(glob32040, 0, "Cancelar");
	glob32044 = CreateMenu("Profissoes", 1, 30.0, 140.0, 220.0, 0.0);
	AddMenuItem(glob32044, 0, "Agricultor");
	AddMenuItem(glob32044, 0, "Cacador");
	AddMenuItem(glob32044, 0, "Motorista Particular");
	AddMenuItem(glob32044, 0, "Transporte de combustivel");
	AddMenuItem(glob32044, 0, "Anterior<<");
	AddMenuItem(glob32044, 0, "Cancelar");
	glob32048 = CreateMenu("Profissoes", 1, 30.0, 140.0, 220.0, 0.0);
	AddMenuItem(glob32048, 0, "Frentista");
	AddMenuItem(glob32048, 0, "Paramedico");
	AddMenuItem(glob32048, 0, "Assassino");
	AddMenuItem(glob32048, 0, "<Anterior");
	AddMenuItem(glob32048, 0, "Cancelar");
	glob3204C = CreateMenu("Profissoes", 1, 30.0, 140.0, 220.0, 0.0);
	AddMenuItem(glob3204C, 0, "Instrutor");
	AddMenuItem(glob3204C, 0, "Traficante");
	AddMenuItem(glob3204C, 0, "Assaltante");
	AddMenuItem(glob3204C, 0, "Seguranca");
	AddMenuItem(glob3204C, 0, "<Anterior");
	AddMenuItem(glob3204C, 0, "Cancelar");
	glob32050 = CreateMenu("Profissoes", 1, 30.0, 140.0, 220.0, 0.0);
	AddMenuItem(glob32050, 0, "Mecanico");
	AddMenuItem(glob32050, 0, "Segurador");
	AddMenuItem(glob32050, 0, "Policia Civil");
	AddMenuItem(glob32050, 0, "Ladrao de carros");
	AddMenuItem(glob32050, 0, "<Anterior");
	AddMenuItem(glob32050, 0, "Cancelar");
	glob32054 = CreateMenu("Profissoes", 1, 30.0, 140.0, 220.0, 0.0);
	AddMenuItem(glob32054, 0, "Policia Rodoviaria");
	AddMenuItem(glob32054, 0, "Taxi-Aereo");
	AddMenuItem(glob32054, 0, "Vendedor de Armas");
	AddMenuItem(glob32054, 0, "Sequestrador");
	AddMenuItem(glob32054, 0, "<Anterior");
	AddMenuItem(glob32054, 0, "Cancelar");
	glob32058 = CreateMenu("Profissoes", 1, 30.0, 140.0, 220.0, 0.0);
	AddMenuItem(glob32058, 0, "Locador de Carros");
	AddMenuItem(glob32058, 0, "IBAMA");
	AddMenuItem(glob32058, 0, "Confiscador");
	AddMenuItem(glob32058, 0, "<Anterior");
	AddMenuItem(glob32058, 0, "Cancelar");
	glob3205C = CreateMenu("Profissoes", 1, 30.0, 140.0, 220.0, 0.0);
	AddMenuItem(glob3205C, 0, "Advogado");
	AddMenuItem(glob3205C, 0, "Narcoticos");
	AddMenuItem(glob3205C, 0, "Policia Florestal");
	AddMenuItem(glob3205C, 0, "<Anterior");
	AddMenuItem(glob3205C, 0, "Cancelar");
	glob32060 = CreateMenu("Profissoes", 1, 30.0, 140.0, 220.0, 0.0);
	AddMenuItem(glob32060, 0, "Policia de Elite");
	AddMenuItem(glob32060, 0, "Corretor de Imoveis");
	AddMenuItem(glob32060, 0, "<Anterior");
	AddMenuItem(glob32060, 0, "Cancelar");
	glob32064 = CreateMenu("Profissoes", 1, 30.0, 140.0, 220.0, 0.0);
	AddMenuItem(glob32064, 0, "Exercito");
	AddMenuItem(glob32064, 0, "Vendedor de Carros");
	AddMenuItem(glob32064, 0, "<Anterior");
	AddMenuItem(glob32064, 0, "Cancelar");
	glob32068 = CreateMenu("Profissoes", 1, 30.0, 140.0, 220.0, 0.0);
	AddMenuItem(glob32068, 0, "Juiz");
	AddMenuItem(glob32068, 0, "Delegado");
	AddMenuItem(glob32068, 0, "<Anterior");
	AddMenuItem(glob32068, 0, "Cancelar");
	print("Gamemode carregado com sucesso");
	printf("Foram carregados %d Carros e %d Casas", var0, var1);
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerInterior(playerid, 6);
	SetPlayerPos(playerid, 768.272, -36.8625, 1000.6865);
	SetPlayerFacingAngle(playerid, 180.0);
	SetPlayerCameraPos(playerid, 770.1793, -39.5801, 1000.6865);
	SetPlayerCameraLookAt(playerid, 768.272, -36.8625, 1000.6865);
	TextDrawShowForPlayer(playerid, glob2966C);
	TextDrawShowForPlayer(playerid, glob29670);
	TextDrawShowForPlayer(playerid, glob29674);
	SetTimerEx("textdestroy", 8000, false, "d", playerid);
	return 1;
}

public OnGameModeExit()
{
	for(new var0 = 0; var0 < 200; var0++)
	{
		if(IsPlayerConnected(var0))
		{
			if(glob1A0CC[var0] == 1)
			{
				udb_setAccState(function705E0(var0), GetPlayerMoney(var0));
				new Float:var1 = 0.0;
				GetPlayerHealth(var0, var1);
				udb_setHealth(function705E0(var0), var1);
				printf("Os dados de %s (ID: %d) foram salvos com sucesso\n", function705E0(var0), var0);
				DestroyMenu(glob1D91C);
				DestroyMenu(glob1E8C4);
				DestroyMenu(glob3206C);
				DestroyMenu(glob24B40);
				DestroyMenu(glob3203C);
				DestroyMenu(glob32040);
				DestroyMenu(glob32044);
				DestroyMenu(glob32048);
				DestroyMenu(glob3204C);
				DestroyMenu(glob32050);
				DestroyMenu(glob32054);
				DestroyMenu(glob32058);
				DestroyMenu(glob3205C);
				DestroyMenu(glob32060);
				DestroyMenu(glob32064);
				DestroyMenu(glob32068);
			}
		}
	}
	print("Saindo do MPA Reload RPG");
	return 1;
}

public OnPlayerConnect(playerid)
{
	new var0[256];
	format(var0, 256, "* %s acabou de entrar.", function705E0(playerid));
	SendClientMessageToAll(0x4C62B3AA, var0);
	TogglePlayerClock(playerid, glob2DB4C);
	SendClientMessage(playerid, 0x4C62B3AA, "MPA® Reload RPG™");
	SendClientMessage(playerid, 0x057ABDAA, "Precisa de Ajuda? /ajuda");
	SendClientMessage(playerid, 0x057ABDAA, "Quais Comandos? /comandos");
	SendClientMessage(playerid, 0x057ABDAA, "Nunca Jogou? /aprender");
	SetPlayerMapIcon(playerid, 1, -2431.1717, 67.0821, 35.1719, 52, 0xFFFFFFFF);
	SetPlayerMapIcon(playerid, 2, -1981.4068, 165.7178, 27.6875, 52, 0xFFFFFFFF);
	SetPlayerMapIcon(playerid, 3, -2670.0745, 636.9832, 14.4531, 52, 0xFFFFFFFF);
	SetPlayerMapIcon(playerid, 4, -2206.0032, -2290.7779, 30.625, 52, 0xFFFFFFFF);
	SetPlayerMapIcon(playerid, 5, 1707.6602, -1683.2781, 13.5468, 52, 0xFFFFFFFF);
	SetPlayerMapIcon(playerid, 6, 395.8569, -1805.9064, 7.8379, 52, 0xFFFFFFFF);
	SetPlayerMapIcon(playerid, 7, -181.5996, 1137.522, 19.7422, 52, 0xFFFFFFFF);
	SetPlayerMapIcon(playerid, 8, 1582.7406, 1757.4973, 10.8203, 52, 0xFFFFFFFF);
	SetPlayerMapIcon(playerid, 9, -2651.6502, 634.4509, 14.4531, 22, 0xFFFFFFFF);
	SetPlayerMapIcon(playerid, 10, -319.0593, 1061.6934, 19.7422, 22, 0xFFFFFFFF);
	SetPlayerMapIcon(playerid, 11, -1514.749, 2528.3391, 55.7214, 22, 0xFFFFFFFF);
	SetPlayerMapIcon(playerid, 12, 1173.9357, -1324.5092, 14.9921, 22, 0xFFFFFFFF);
	SetPlayerMapIcon(playerid, 13, -2025.0168, 66.8147, 28.4351, 20, 0xFFFFFFFF);
	SetPlayerMapIcon(playerid, 14, 2237.6767, 2453.6728, 10.754, 30, 0xFFFFFFFF);
	SetPlayerMapIcon(playerid, 15, -1605.3073, 718.3339, 11.9386, 30, 0xFFFFFFFF);
	SetPlayerMapIcon(playerid, 16, -213.4347, 979.4686, 19.3325, 30, 0xFFFFFFFF);
	SetPlayerMapIcon(playerid, 17, -2163.472, -2386.5975, 30.625, 30, 0xFFFFFFFF);
	SetPlayerMapIcon(playerid, 18, -142.8048, 1124.1093, 19.315, 36, 0xFFFFFFFF);
	SetPlayerMapIcon(playerid, 19, -2129.7178, -2257.4451, 30.625, 36, 0xFFFFFFFF);
	SetPlayerMapIcon(playerid, 20, -2027.2358, -93.6294, 35.1641, 36, 0xFFFFFFFF);
	SetPlayerMapIcon(playerid, 21, -2097.3877, -2255.649, 30.625, 51, 0xFFFFFFFF);
	GangZoneShowForPlayer(playerid, glob28078, 3688628223);
	GangZoneShowForPlayer(playerid, glob2807C, 862322858);
	GangZoneShowForPlayer(playerid, glob28080, 4041641130);
	GangZoneShowForPlayer(playerid, glob28084, 2855482282);
	SetPlayerTime(playerid, glob2DB4C, glob2DB50);
	if(udb_Exists(function705E0(playerid)))
	{
		SendClientMessage(playerid, 0x56EADAAA, "Você já está registrado. Faça login com /logar [senha]");
		return 1;
	}
	if(!udb_Exists(function705E0(playerid)))
	{
		SendClientMessage(playerid, 0x56EADAAA, "Você não está registrado. Registre-se com /registrar [senha]");
		return 1;
	}
	glob1A0CC[playerid] = 0;
	glob1A70C[playerid] = 0;
	glob1A3EC[playerid] = 0;
	return 0;
}

public OnPlayerDisconnect(playerid, reason)
{
	if(glob1A0CC[playerid] == 1)
	{
		glob1A0CC[playerid] = 0;
		udb_setAccState(function705E0(playerid), GetPlayerMoney(playerid));
		new Float:var0 = 0.0;
		GetPlayerHealth(playerid, var0);
		GetPlayerWeaponData(playerid, glob34F54, glob34F58, glob34F5C);
		udb_setHealth(function705E0(playerid), var0);
		new var1[256];
		switch(reason) {
			case 0:
				format(var1, 256, "* %s saiu do servidor (Queda de Conexão)", function705E0(playerid));
				SendClientMessageToAll(0x4C62B3AA, var1);
			case 1:
				format(var1, 256, "* %s saiu do servidor (Vontade Propria)", function705E0(playerid));
				SendClientMessageToAll(0x4C62B3AA, var1);
			case 2:
				format(var1, 256, "* %s saiu do servidor (Kickado/Banido)", function705E0(playerid));
				SendClientMessageToAll(0x4C62B3AA, var1);
		}
	}
	return 0;
}

public OnPlayerSpawn(playerid)
{
	glob1CC98[playerid] = 1;
	glob1CFB8[playerid] = -1;
	TextDrawHideForPlayer(playerid, glob2966C);
	TextDrawHideForPlayer(playerid, glob29670);
	TextDrawHideForPlayer(playerid, glob29674);
	if(!glob1D2D8)
	{
		glob1D2D8 = SetTimer("update_zones", 1000, false);
	}
	if(glob2AF8C[playerid] == 1)
	{
		SetPlayerColor(playerid, 0xCBCBCBAA);
		GivePlayerWeapon(playerid, 6, 0);
	}
	else if(glob2AF8C[playerid] == 2)
	{
		SetPlayerColor(playerid, 0xFFF297AA);
		GivePlayerWeapon(playerid, 2, 1);
	}
	else if(glob2AF8C[playerid] == 3)
	{
		SetPlayerColor(playerid, 0xB2FB92AA);
		GivePlayerWeapon(playerid, 2, 0);
	}
	else if(glob2AF8C[playerid] == 4)
	{
		SetPlayerColor(playerid, 0xFF91ECAA);
		GivePlayerWeapon(playerid, 8, 1);
	}
	else if(glob2AF8C[playerid] == 5)
	{
		SetPlayerColor(playerid, 0xBDD94CFF);
		GivePlayerWeapon(playerid, 5, 0);
	}
	else if(glob2AF8C[playerid] == 6)
	{
		SetPlayerColor(playerid, 0xFF9191FF);
		GivePlayerWeapon(playerid, 22, 80);
	}
	else if(glob2AF8C[playerid] == 7)
	{
		SetPlayerColor(playerid, 0xFF7200FF);
		GivePlayerWeapon(playerid, 5, 0);
	}
	else if(glob2AF8C[playerid] == 8)
	{
		SetPlayerColor(playerid, 0x662228FF);
		GivePlayerWeapon(playerid, 22, 80);
	}
	else if(glob2AF8C[playerid] == 9)
	{
		SetPlayerColor(playerid, 0xFFFC00AA);
		GivePlayerWeapon(playerid, 6, 1);
	}
	else if(glob2AF8C[playerid] == 10)
	{
		SetPlayerColor(playerid, 0xC3C105AA);
		GivePlayerWeapon(playerid, 6, 1);
	}
	else if(glob2AF8C[playerid] == 11)
	{
		SetPlayerColor(playerid, 0xC6C55EAA);
		GivePlayerWeapon(playerid, 6, 1);
		GivePlayerWeapon(playerid, 24, 80);
	}
	else if(glob2AF8C[playerid] == 12)
	{
		SetPlayerColor(playerid, 0xFF5A00AA);
		GivePlayerWeapon(playerid, 6, 1);
	}
	else if(glob2AF8C[playerid] == 13)
	{
		SetPlayerColor(playerid, 0xD22402AA);
		GivePlayerWeapon(playerid, 23, 80);
		GivePlayerWeapon(playerid, 32, 450);
		GivePlayerWeapon(playerid, 8, 1);
		GivePlayerWeapon(playerid, 25, 27);
	}
	else if(glob2AF8C[playerid] == 14)
	{
		SetPlayerColor(playerid, 0xFE684BFF);
		GivePlayerWeapon(playerid, 24, 80);
		GivePlayerWeapon(playerid, 26, 42);
		GivePlayerWeapon(playerid, 29, 500);
	}
	else if(glob2AF8C[playerid] == 15)
	{
		SetPlayerColor(playerid, 0xCE2A2AFF);
		GivePlayerWeapon(playerid, 24, 80);
		GivePlayerWeapon(playerid, 29, 500);
		GivePlayerWeapon(playerid, 2, 0);
	}
	else if(glob2AF8C[playerid] == 16)
	{
		SetPlayerColor(playerid, 0xD94242FF);
		GivePlayerWeapon(playerid, 24, 80);
		GivePlayerWeapon(playerid, 26, 42);
		GivePlayerWeapon(playerid, 29, 500);
	}
	else if(glob2AF8C[playerid] == 17)
	{
		SetPlayerColor(playerid, 0xAC5050FF);
		GivePlayerWeapon(playerid, 24, 80);
		GivePlayerWeapon(playerid, 26, 42);
		GivePlayerWeapon(playerid, 29, 500);
		GivePlayerWeapon(playerid, 42, 400);
	}
	else if(glob2AF8C[playerid] == 18)
	{
		SetPlayerColor(playerid, 0xAB2DCFAA);
		GivePlayerWeapon(playerid, 5, 0);
	}
	else if(glob2AF8C[playerid] == 19)
	{
		SetPlayerColor(playerid, 0xE89AFFAA);
		GivePlayerWeapon(playerid, 5, 0);
	}
	else if(glob2AF8C[playerid] == 20)
	{
		SetPlayerColor(playerid, 0x9AFFDDAA);
		GivePlayerWeapon(playerid, 5, 0);
	}
	else if(glob2AF8C[playerid] == 21)
	{
		SetPlayerColor(playerid, 0x9EB3FFAA);
		GivePlayerWeapon(playerid, 22, 80);
		GivePlayerWeapon(playerid, 3, 1);
	}
	else if(glob2AF8C[playerid] == 22)
	{
		SetPlayerColor(playerid, 0x4970FFAA);
		GivePlayerWeapon(playerid, 22, 80);
		GivePlayerWeapon(playerid, 3, 1);
	}
	else if(glob2AF8C[playerid] == 23)
	{
		SetPlayerColor(playerid, 0x4C62B3AA);
		GivePlayerWeapon(playerid, 3, 0);
		GivePlayerWeapon(playerid, 29, 500);
		GivePlayerWeapon(playerid, 27, 100);
	}
	else if(glob2AF8C[playerid] == 24)
	{
		SetPlayerColor(playerid, 0x0024ACAA);
		GivePlayerWeapon(playerid, 24, 80);
		GivePlayerWeapon(playerid, 3, 1);
		GivePlayerWeapon(playerid, 26, 42);
		GivePlayerWeapon(playerid, 22, 80);
	}
	else if(glob2AF8C[playerid] == 25)
	{
		SetPlayerColor(playerid, 0x7585C0AA);
		GivePlayerWeapon(playerid, 15, 0);
		GivePlayerWeapon(playerid, 22, 80);
	}
	else if(glob2AF8C[playerid] == 26)
	{
		SetPlayerColor(playerid, 0xD7DFFFAA);
		GivePlayerWeapon(playerid, 3, 0);
		GivePlayerWeapon(playerid, 29, 500);
		GivePlayerWeapon(playerid, 27, 100);
	}
	else if(glob2AF8C[playerid] == 27)
	{
		SetPlayerColor(playerid, 0x00FFEAFF);
		GivePlayerWeapon(playerid, 15, 0);
		GivePlayerWeapon(playerid, 22, 300);
	}
	else if(glob2AF8C[playerid] == 28)
	{
		SetPlayerColor(playerid, 0x04AB6EAA);
		GivePlayerWeapon(playerid, 15, 0);
		GivePlayerWeapon(playerid, 22, 300);
	}
	else if(glob2AF8C[playerid] == 29)
	{
		SetPlayerColor(playerid, 0x1B7A01AA);
		GivePlayerWeapon(playerid, 3, 0);
		GivePlayerWeapon(playerid, 29, 500);
		GivePlayerWeapon(playerid, 27, 100);
		GivePlayerWeapon(playerid, 31, 200);
	}
	else if(glob2AF8C[playerid] == 30)
	{
		SetPlayerColor(playerid, 0x5CFFFDAA);
		GivePlayerWeapon(playerid, 15, 0);
		GivePlayerWeapon(playerid, 22, 300);
	}
	else if(glob2AF8C[playerid] == 31)
	{
		SetPlayerColor(playerid, 0x81ABABAA);
		GivePlayerWeapon(playerid, 24, 400);
		GivePlayerWeapon(playerid, 26, 700);
	}
	else if(glob2AF8C[playerid] == 32)
	{
		SetPlayerColor(playerid, 0x2CCC6CAA);
		GivePlayerWeapon(playerid, 41, 900);
	}
	else if(glob2AF8C[playerid] == 33)
	{
		SetPlayerColor(playerid, 0x66E3DFAA);
		GivePlayerWeapon(playerid, 42, 400);
	}
	else if(glob2AF8C[playerid] == 34)
	{
		SetPlayerColor(playerid, 0xC19100AA);
		GivePlayerWeapon(playerid, 42, 400);
	}
	else if(glob2AF8C[playerid] == 35)
	{
		SetPlayerColor(playerid, 0xADFF0EAA);
		GivePlayerWeapon(playerid, 2, 0);
	}
	else if(glob2AF8C[playerid] == 36)
	{
		SetPlayerColor(playerid, 0x77913AAA);
		GivePlayerWeapon(playerid, 15, 0);
	}
	else if(glob2AF8C[playerid] == 37)
	{
		SetPlayerColor(playerid, 0xEEFFC4AA);
		GivePlayerWeapon(playerid, 5, 0);
	}
	else if(glob2AF8C[playerid] == 38)
	{
		SetPlayerColor(playerid, 0xFEFFFAAA);
		GivePlayerWeapon(playerid, 5, 0);
	}
	else if(glob2AF8C[playerid] == 39)
	{
		SetPlayerColor(playerid, 0xACAC00FF);
		GivePlayerWeapon(playerid, 15, 0);
		GivePlayerWeapon(playerid, 22, 300);
	}
	else if(glob2AF8C[playerid] == 40)
	{
		SetPlayerColor(playerid, 0x00000028);
		GivePlayerWeapon(playerid, 15, 0);
		GivePlayerWeapon(playerid, 22, 300);
	}
	else if(glob2AF8C[playerid] == 41)
	{
		SetPlayerColor(playerid, 0xFEE765AA);
		GivePlayerWeapon(playerid, 15, 0);
	}
	else if(glob2AF8C[playerid] == 42)
	{
		SetPlayerColor(playerid, 0x00BC6FAA);
		GivePlayerWeapon(playerid, 15, 0);
	}
	else if(glob2AF8C[playerid] == 43)
	{
		SetPlayerColor(playerid, 0xBC8F8FAA);
		GivePlayerWeapon(playerid, 15, 0);
		GivePlayerWeapon(playerid, 32, 300);
	}
	else if(glob2AF8C[playerid] == 44)
	{
		SetPlayerColor(playerid, 0x34A2C6AA);
		GivePlayerWeapon(playerid, 15, 0);
		GivePlayerWeapon(playerid, 30, 300);
	}
	else if(glob2AF8C[playerid] == 45)
	{
		SetPlayerColor(playerid, 0x34C6ACAA);
		GivePlayerWeapon(playerid, 15, 0);
	}
	else if(glob2AF8C[playerid] == 46)
	{
		SetPlayerColor(playerid, 0xC73614AA);
		GivePlayerWeapon(playerid, 15, 0);
	}
	else if(glob2AF8C[playerid] == 47)
	{
		SetPlayerColor(playerid, 0x9B3B0CAA);
		GivePlayerWeapon(playerid, 15, 0);
		GivePlayerWeapon(playerid, 24, 80);
		GivePlayerWeapon(playerid, 26, 42);
		GivePlayerWeapon(playerid, 29, 500);
	}
	else if(glob2AF8C[playerid] == 48)
	{
		SetPlayerColor(playerid, 0x00E020AA);
		GivePlayerWeapon(playerid, 15, 0);
	}
	else if(glob2AF8C[playerid] == 49)
	{
		SetPlayerColor(playerid, 0x8EE000AA);
		GivePlayerWeapon(playerid, 5, 0);
	}
	else if(glob2AF8C[playerid] == 50)
	{
		SetPlayerColor(playerid, 0xA6FEFDAA);
		GivePlayerWeapon(playerid, 5, 0);
	}
	else if(glob2AF8C[playerid] == 51)
	{
		SetPlayerColor(playerid, 0x25CE98AA);
		GivePlayerWeapon(playerid, 5, 0);
	}
	else if(glob2AF8C[playerid] == 52)
	{
		SetPlayerColor(playerid, 0xFCFE5CAA);
		GivePlayerWeapon(playerid, 5, 0);
	}
	else if(glob2AF8C[playerid] == 53)
	{
		SetPlayerColor(playerid, 0xE2E2E2AA);
		GivePlayerWeapon(playerid, 5, 0);
	}
	else if(glob2AF8C[playerid] == 54)
	{
		SetPlayerColor(playerid, 0xEFAB3FAA);
		GivePlayerWeapon(playerid, 24, 400);
		GivePlayerWeapon(playerid, 26, 700);
	}
	else if(glob2AF8C[playerid] == 55)
	{
		SetPlayerColor(playerid, 0xFD23F0AA);
		GivePlayerWeapon(playerid, 12, 400);
		GivePlayerWeapon(playerid, 24, 700);
	}
	else if(glob2AF8C[playerid] == 56)
	{
		SetPlayerColor(playerid, 0x6A641EAA);
		GivePlayerWeapon(playerid, 15, 0);
		GivePlayerWeapon(playerid, 24, 80);
		GivePlayerWeapon(playerid, 26, 700);
		GivePlayerWeapon(playerid, 30, 100);
	}
	else if(glob2AF8C[playerid] == 57)
	{
		SetPlayerColor(playerid, 0x517C2EAA);
		GivePlayerWeapon(playerid, 15, 0);
		GivePlayerWeapon(playerid, 27, 40);
	}
	else
	{
		SetPlayerColor(playerid, 0xCBCBCBAA);
	}
	glob2D50C[playerid] = 0;
	SetPlayerInterior(playerid, 0);
	if(!glob1A0CC[playerid])
	{
		SetPlayerPos(playerid, -1958.5108, 293.6747, 35.4687);
		SetPlayerFacingAngle(playerid, 90.0);
		TogglePlayerControllable(playerid, false);
		return 1;
	}
	if(udb_getPrisao(function705E0(playerid)) == 1)
	{
		SetPlayerInterior(playerid, 6);
		SendClientMessage(playerid, 0xDD0000FF, "Você cometeu algum crime e foi preso, ficará 5 minutos na cadeia.");
		SendClientMessage(playerid, 0xFFFF00AA, "Você pode pedir a um advogado para lhe oferecer uma proposta de fiança por uma grana.");
		glob2A94C[playerid] = 1;
		return 1;
	}
	TogglePlayerControllable(playerid, true);
	return 1;
}

public textdestroy(playerid)
{
	TextDrawHideForPlayer(playerid, glob331A0);
	TextDrawHideForPlayer(playerid, glob2966C);
	TextDrawHideForPlayer(playerid, glob29670);
	TextDrawHideForPlayer(playerid, glob29674);
	return 0;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	if(!GetClosestHospital(playerid))
	{
		SetSpawnInfo(playerid, 1, udb_getSkin(function705E0(playerid)), -2651.6502, 634.4509, 14.4531, 180.0, 0, 0, 0, 0, 0, 0);
	}
	else if(GetClosestHospital(playerid) == 1)
	{
		SetSpawnInfo(playerid, 1, udb_getSkin(function705E0(playerid)), 1173.5842, -1324.5616, 15.1953, 278.4624, 0, 0, 0, 0, 0, 0);
	}
	else if(GetClosestHospital(playerid) == 2)
	{
		SetSpawnInfo(playerid, 1, udb_getSkin(function705E0(playerid)), 2031.9415, -1404.3578, 17.2614, 165.8179, 0, 0, 0, 0, 0, 0);
	}
	else if(GetClosestHospital(playerid) == 3)
	{
		SetSpawnInfo(playerid, 1, udb_getSkin(function705E0(playerid)), 1582.5615, 1768.7921, 10.8203, 93.7453, 0, 0, 0, 0, 0, 0);
	}
	else if(GetClosestHospital(playerid) == 4)
	{
		SetSpawnInfo(playerid, 1, udb_getSkin(function705E0(playerid)), -319.0593, 1061.6934, 19.7422, 0.0, 0, 0, 0, 0, 0, 0);
	}
	new var0[256];
	format(var0, 256, "* %s ficou incosiente e foi levado ao hospital.", function705E0(playerid));
	SendClientMessageToAll(0x4C62B3AA, var0);
	printf("O Jogador %s(id: %d) ficou inconsiente e foi levado ao hospital.", function705E0(playerid), playerid);
	SendClientMessage(playerid, 0xDD0000FF, "Você foi encontrado quase morto e foi levado ao Hospital.");
	TextDrawShowForPlayer(playerid, glob331A0);
	SetTimerEx("textdestroy", 5000, false, "d", playerid);
	SetPlayerInterior(playerid, 0);
	if(!glob236F0[playerid])
	{
		udb_setBankMoney(function705E0(playerid), udb_getBankMoney(function705E0(playerid)) - 150);
		SendClientMessage(playerid, 0xDD0000FF, "O tratamento ficou em R$150 e foi descontado direto de sua conta bancaria.");
	}
	if(glob236F0[playerid] == 1)
	{
		udb_setBankMoney(function705E0(playerid), udb_getBankMoney(function705E0(playerid)) - 150);
		SendClientMessage(playerid, 0xDD0000FF, "O seu seguro de vida cobriu o valor do tratamento que foi de R$150.");
	}
	if(glob2B5CC[playerid] == 1)
	{
		udb_setED(function705E0(killerid), udb_getED(function705E0(killerid)) + 1);
		SendClientMessage(killerid, 0x56EADAAA, "Você ganhou 1 ponto de experiencia diária por matar alguém que estava na lista dos procurados.");
		SetSpawnInfo(playerid, 1, udb_getSkin(function705E0(playerid)), 262.954, 78.4338, 1001.0391, 270.0, 0, 0, 0, 0, 0, 0);
		udb_setPrisao(function705E0(playerid), 1);
		SetPlayerWantedLevel(playerid, 0);
	}
	if(glob2A94C[playerid] == 1)
	{
		SetSpawnInfo(playerid, 1, udb_getSkin(function705E0(playerid)), 262.954, 78.4338, 1001.0391, 270.0, 0, 0, 0, 0, 0, 0);
		udb_setPrisao(function705E0(playerid), 1);
	}
	if(glob2AF8C[killerid] == 13 || glob2AF8C[killerid] == 14 || glob2AF8C[killerid] == 15 || glob2AF8C[killerid] == 16)
	{
		udb_setED(function705E0(killerid), udb_getED(function705E0(killerid)) + 1);
		SendClientMessage(killerid, 0x56EADAAA, "Você ganhou 1 ponto de experiencia diária por matar alguém.");
	}
	if(killerid == 255)
	{
		SendDeathMessage(255, playerid, reason);
		glob2EE1C[killerid]++;
	}
	else
	{
		SendDeathMessage(killerid, playerid, reason);
		if(0 < GetPlayerMoney(playerid))
		{
			GivePlayerMoney(killerid, GetPlayerMoney(playerid));
			glob2EE1C[killerid]++;
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
	if(glob23A10[vehicleid] == 1)
	{
		SetVehicleToRespawn(vehicleid);
		glob23A10[vehicleid] = 0;
	}
	return 0;
}

public OnPlayerText(playerid, text)
{
	if(glob2AC6C[playerid] == 1)
	{
		SendClientMessage(playerid, 0x0099FFAA, "Você está silenciado!");
		return 0;
	}
	for(new var0 = 0; strlen(text) > var0; var0++)
	{
		if(0 > text[var0])
		{
			text[var0] = text[var0] + 256;
		}
	}
	if(glob2E194[playerid] > -1 && glob2E4B4[playerid] == 1)
	{
		new var0[256];
		new var1[24];
		GetPlayerName(playerid, var1, 24);
		format(var0, 256, "%s: %s", var1, text);
		SendClientMessage(glob2E194[playerid], 0xBC8F8FAA, var0);
		format(var0, 256, "%s: %s", var1, text);
		SendClientMessage(playerid, 0xBC8F8FAA, var0);
		format(var0, 256, "%s: %s", var1, text);
		print(var0);
		format(var0, 256, "%s: %s", var1, text);
		print(var0);
		return 0;
	}
	printf("%s id %d enviou uma mensagem: %s", function705E0(playerid), playerid, text);
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext)
{
	for(new var0 = 0; strlen(cmdtext) > var0; var0++)
	{
		if(0 > cmdtext[var0])
		{
			cmdtext[var0] = cmdtext[var0] + 256;
		}
	}
	new var0 = 0;
	new var1[256];
	new var2 = 0, var3 = 0, var4 = 0;
	new var5[24];
	new var6[24];
	var1 = function1A10(cmdtext, var4, 32);
	if(!strcmp(var1, "/kill", true))
	{
		if(!glob2A94C[playerid])
		{
			SetPlayerHealth(playerid, 0.0);
			printf("%s se suicidou", function705E0(playerid));
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você está preso, não pode se suicidar!");
		return 1;
	}
	if(!strcmp(var1, "/relogio", true))
	{
		new var7[256];
		if(glob2DB50 < 10)
		{
			format(var7, 256, "Agora são %d:0%d", 187212, 187216);
		}
		if(glob2DB50 > 10)
		{
			format(var7, 256, "Agora são %d:%d", 187212, 187216);
		}
		SendClientMessage(playerid, 0x0099FFAA, var7);
		return 1;
	}
	if(!strcmp(var1, "/registrar", true))
	{
		new var7[256];
		var7 = function1A10(cmdtext, var4, 32);
		if(udb_Exists(function705E0(playerid)))
		{
			SendClientMessage(playerid, 0xDD0000FF, "Você já está registrado! Entre com /logar [senha].");
			return 1;
		}
		if(glob1A0CC[playerid] == 1)
		{
			SendClientMessage(playerid, 0xDD0000FF, "Você já está registrado! Entre com /logar [senha]");
			return 1;
		}
		if(!strlen(var7))
		{
			SendClientMessage(playerid, 0xDD0000FF, "/registrar [senha]");
			return 1;
		}
		glob1A0CC[playerid] = 1;
		udb_Create(function705E0(playerid), var7, 0, 0, 60, 5000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, glob3CB2C, 3300008276, 3281041863, 1096966105, 1124891532, 1120403456, 0, 0, 0);
		new var8 = 0, var9 = 0, var10 = 0, var11 = 0;
		udb_getPosition(function705E0(playerid), var8, var9, var10);
		udb_getAng(function705E0(playerid), var11);
		SetPlayerColor(playerid, 0xCBCBCBAA);
		SetSpawnInfo(playerid, 1, udb_getSkin(function705E0(playerid)), 1552.8347, -1675.3935, 16.1952, 95.249, 0, 0, 0, 0, 0, 0);
		SpawnPlayer(playerid);
		new var12[256];
		format(var12, 256, "* %s acabou de se registrar.", function705E0(playerid));
		SendClientMessageToAll(0x4C62B3AA, var12);
		SetPlayerCheckpoint(playerid, 1537.9189, -1678.7524, 13.5468, 2.0);
		SendClientMessage(playerid, 0x7585C0AA, "Registrado e logado.");
		SendClientMessage(playerid, 0x0099FFAA, "Você acabou de sair da prisão, precisa sair da cidade até que a poeira abaixe.");
		SendClientMessage(playerid, 0x0099FFAA, "Os policiais vão te dar uma carona até o aero-porto.");
		return 1;
	}
	if(!strcmp(var1, "/logar", true) && IsPlayerConnected(playerid))
	{
		new var7[256];
		var7 = function1A10(cmdtext, var4, 32);
		if(!udb_Exists(function705E0(playerid)))
		{
			SendClientMessage(playerid, 0xDD0000FF, "Você não está registrado. Entre com /registrar [senha]");
			return 1;
		}
		if(glob1A0CC[playerid] == 1)
		{
			SendClientMessage(playerid, 0xFFFF00AA, "Você já está logado.");
			return 1;
		}
		if(!strlen(var7))
		{
			SendClientMessage(playerid, 0xDD0000FF, "Você tem uma senha. USO: /logar [senha]");
			return 1;
		}
		if(udb_CheckLogin(function705E0(playerid), var7))
		{
			glob1A0CC[playerid] = 1;
			LogarPlayer(playerid);
			new var8[256];
			format(var8, 256, "* %s acabou de logar.", function705E0(playerid));
			SendClientMessageToAll(0x4C62B3AA, var8);
			SendClientMessage(playerid, 0x7585C0AA, "Logado");
			GivePlayerWeapon(playerid, glob34F58, glob34F5C);
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Senha Incorreta");
		return 1;
	}
	if(!strcmp(var1, "/passagemsf", true))
	{
		if(glob2E7D4[playerid] == 1 && IsPlayerInCheckpoint(playerid))
		{
			SetPlayerPos(playerid, -1425.5127, -290.0228, 14.1484);
			DisablePlayerCheckpoint(playerid);
			glob187CC[playerid] = 0;
			SendClientMessage(playerid, 0x0099FFAA, "Você chegou no aeroporto de San Fierro prepare-se para começar a viver");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não está no Aeroporto de Los Santos");
		return 1;
	}
	if(!strcmp(var1, "/recolherpedras", true))
	{
		if(glob2AF8C[playerid] == 53 || IsPlayerAdmin(playerid))
		{
			if(glob1AD58[playerid] == 1)
			{
				if(IsPlayerInAnyVehicle(playerid))
				{
					if(GetVehicleModel(GetPlayerVehicleID(playerid)) == glob187C8)
					{
						if(!glob1B078[GetPlayerVehicleID(playerid)])
						{
							if(!glob1BE88[playerid])
							{
								glob1B078[GetPlayerVehicleID(playerid)] = 1;
								glob1BE88[playerid] = 1;
								SendClientMessage(playerid, 0xFFFFFFAA, "Pedras recolhidas agora entregue-as na OBRA em San Fierro!");
								return 1;
							}
							SendClientMessage(playerid, 0xDD0000FF, "Ei, você já está fazendo um carregamento.");
						}
						else
						{
							SendClientMessage(playerid, 0xDD0000FF, "Esse veiculo já possue pedras entregue essas primeiro para depois vir recolher mais.");
							return 1;
						}
					}
					else
					{
						SendClientMessage(playerid, 0xDD0000FF, "Você tem que estar em um DUMPER.");
						return 1;
					}
				}
				else
				{
					SendClientMessage(playerid, 0xDD0000FF, "Ei, esteja em um veiculo para utilizar este comando.");
					return 1;
				}
			}
			else
			{
				SendClientMessage(playerid, 0xDD0000FF, "Você tem que estar na Pedreira.");
				return 1;
			}
		}
		else
		{
			SendClientMessage(playerid, 0xDD0000FF, "Você nem devia estar mexendo nesse comando.");
			return 1;
		}
	}
	if(!strcmp(var1, "/entregarpedras", true))
	{
		if(glob2AF8C[playerid] == 53 || IsPlayerAdmin(playerid))
		{
			if(glob1AA38[playerid] == 1)
			{
				if(IsPlayerInAnyVehicle(playerid))
				{
					if(GetVehicleModel(GetPlayerVehicleID(playerid)) == glob187C8)
					{
						if(glob1B078[GetPlayerVehicleID(playerid)] == 1)
						{
							if(glob1BE88[playerid] == 1)
							{
								glob1B078[GetPlayerVehicleID(playerid)] = 0;
								GivePlayerMoney(playerid, 400);
								udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
								glob1BE88[playerid] = 0;
								SendClientMessage(playerid, 0xFFFFFFAA, "Pedras entregues! Você recebeu R$400 pelo trabalho.");
								return 1;
							}
							SendClientMessage(playerid, 0xDD0000FF, "Você não está fazendo nenhum carregamento.");
							return 1;
						}
						SendClientMessage(playerid, 0xDD0000FF, "Esse veiculo não possue nenhuma pedra.");
						return 1;
					}
					SendClientMessage(playerid, 0xDD0000FF, "Você não esta em um DUMPER.");
					return 1;
				}
				SendClientMessage(playerid, 0xDD0000FF, "Esteja em um veiculo para utilizar esse comando.");
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Você tem que estar na OBRA em San Fierro.");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você nem devia estar mexendo nesse comando.");
		return 1;
	}
	if(!strcmp(var1, "/pegarferramentas", true))
	{
		if(glob2AF8C[playerid] == 53 || IsPlayerAdmin(playerid))
		{
			if(glob1AD58[playerid] == 1)
			{
				if(!glob1BE88[playerid])
				{
					new var7 = random(24) + 1;
					new var8[256];
					format(var8, 256, "Lhe entregaram %d ferramentas agora entregue para a obra de construção em San Fierro.", var7);
					SendClientMessage(playerid, 0xFFFFFFAA, var8);
					glob1BB68[playerid] = var7;
					glob1BE88[playerid] = 1;
					return 1;
				}
				SendClientMessage(playerid, 0xDD0000FF, "Você já está num carregamento. Termine-o para começar outro.");
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Você não está na pedreira.");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não tem permissão.");
		return 1;
	}
	if(!strcmp(var1, "/entregarferramentas", true))
	{
		if(glob2AF8C[playerid] == 53 || IsPlayerAdmin(playerid))
		{
			if(glob1AA38[playerid] == 1)
			{
				if(glob1BE88[playerid] == 1)
				{
					if(0 < glob1BB68[playerid])
					{
						new var7[256];
						format(var7, 256, "Você entregou %d ferramentas e recebeu R$%d.", 113512, glob1BB68[playerid] * 20);
						GivePlayerMoney(playerid, glob1BB68[playerid] * 20);
						udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
						glob1BB68[playerid] = 0;
						glob1BE88[playerid] = 0;
						return 1;
					}
					SendClientMessage(playerid, 0xDD0000FF, "Você não possue ferramentas.");
					return 1;
				}
				SendClientMessage(playerid, 0xDD0000FF, "Você não está fazendo um carregamento de ferramentas.");
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Você não está na obra de San Fierro.");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não tem permissão.");
		return 1;
	}
	if(!strcmp(var1, "/sexo", true))
	{
		if(glob2AF8C[playerid] == 55)
		{
			new var7[256];
			new var8 = 0;
			new var9 = 0;
			var7 = function1A10(cmdtext, var4, 32);
			var8 = strval(var7);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/sexo [id]");
				return 1;
			}
			var9 = GetPlayerVehicleID(var8);
			if(IsPlayerInVehicle(var8, var9))
			{
				if(IsPlayerInVehicle(playerid, var9))
				{
					if(GetPlayerMoney(var8) > 2)
					{
						if(IsPlayerConnected(var8))
						{
							if(!glob35280[var8])
							{
								if(!glob35280[playerid])
								{
									TogglePlayerControllable(playerid, false);
									TogglePlayerControllable(var8, false);
									glob35280[playerid] = 1;
									glob35280[var8] = 1;
									glob355A0[playerid] = var8;
									glob355A0[var8] = playerid;
									udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
									SendClientMessage(playerid, 0xFFFFFFAA, "Sexo iniciado para para-lo digite /pararsexo");
									SendClientMessage(var8, 0xFFFFFFAA, "Você esta fazendo sexo com uma prostituta para-lo digite /pararsexo");
									SetTimerEx("tirandograna", 2000, false, "ddd", playerid, var8, var9);
									return 1;
								}
								SendClientMessage(playerid, 0xDD0000FF, "Você ja está fazendo sexo.");
								return 1;
							}
							SendClientMessage(playerid, 0xDD0000FF, "O outro jogador já esta fazendo sexo.");
							return 1;
						}
						SendClientMessage(playerid, 0xDD0000FF, "Jogador não conectado/logado.");
						return 1;
					}
					SendClientMessage(playerid, 0xDD0000FF, "O outro jogador não possue grana.");
					return 1;
				}
				SendClientMessage(playerid, 0xDD0000FF, "Você tem que estar no veiculo do outro jogador.");
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "O outro jogador não esta em um veiculo.");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não tem permissão.");
		return 1;
	}
	if(!strcmp(var1, "/tribunal", true))
	{
		if(glob2AF8C[playerid] == 46 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8 = 0, var9 = 0, var10 = 0;
			var7 = function1A10(cmdtext, var4, 32);
			var8 = strval(var7);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/tribunal [id 1] [id 2] [daqui a quanto tempo]");
				return 1;
			}
			var7 = function1A10(cmdtext, var4, 32);
			var9 = strval(var7);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/tribunal [id 1] [id 2] [daqui a quanto tempo]");
				return 1;
			}
			var7 = function1A10(cmdtext, var4, 32);
			var10 = strval(var7);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/tribunal [id 1] [id 2] [daqui a quanto tempo]");
				return 1;
			}
			if(IsPlayerConnected(var8))
			{
				if(IsPlayerConnected(var9))
				{
					if(!glob37800[var8])
					{
						if(!glob37800[var9])
						{
							if(0 < var10)
							{
								if(var8 != var9)
								{
									glob37800[var8] = 1;
									glob37800[var9] = 1;
									new var11[256];
									format(var11, 256, "O Tribunal entre %s e %s começará daqui a %d minutos.", function705E0(var8), function705E0(var9), var10);
									SendClientMessageToAll(0xFFFFFFAA, var11);
									SendClientMessageToAll(0xFFFFFFAA, "Até lá arrangem um advogado!");
									SetTimerEx("InicioTribunal", var10 * 60000, false, "dd", var8, var9);
									udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
									return 1;
								}
								SendClientMessage(playerid, 0xDD0000FF, "Selecione 2 jogadores e não apenas 1 duas vezes.");
								return 1;
							}
							SendClientMessage(playerid, 0xDD0000FF, "O tempo deve ser no mínimo de 1 minuto.");
							return 1;
						}
						SendClientMessage(playerid, 0xDD0000FF, "O jogador 2 já está marcado para um tribunal.");
						return 1;
					}
					SendClientMessage(playerid, 0xDD0000FF, "O jogador 1 já está marcado para um tribunal.");
					return 1;
				}
				SendClientMessage(playerid, 0xDD0000FF, "Jogador 2 não conectado/logado.");
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Jogador 1 não conectado/logado.");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não tem permissão.");
		return 1;
	}
	if(!strcmp(var1, "/fimtribunais", true))
	{
		if(glob2AF8C[playerid] == 46 || IsPlayerAdmin(playerid))
		{
			new var7 = 0;
			while(++var7 < 200)
			{
				if(glob37800[var7] == 1)
				{
					glob37800[var7] = 0;
					glob37B20[var7] = 0;
					new var8[256];
					format(var8, 256, "O Trabalhador da justiça federal %s deu um fim em todos os casos de tribunais.");
					SendClientMessageToAll(0xFFFFFFAA, var8);
					return 1;
				}
			}
		}
		else
		{
			SendClientMessage(playerid, 0xDD0000FF, "Você não tem permissão.");
			return 1;
		}
	}
	if(!strcmp(var1, "/removercontrabando", true))
	{
		if(glob2AF8C[playerid] == 45 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8 = 0;
			var7 = function1A10(cmdtext, var4, 32);
			var8 = strval(var7);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/removercontrabando [id]");
				return 1;
			}
			if(glob2AF8C[var8] == 44)
			{
				if(glob34C34[var8] == 1)
				{
					if(glob342D4[playerid][var8] == 1)
					{
						if(IsPlayerConnected(var8))
						{
							glob187CC[var8] = 0;
							DisablePlayerCheckpoint(var8);
							SendClientMessage(playerid, 0x33AA33AA, "Contrabando removido com sucesso.");
							SendClientMessage(var8, 0x33AA33AA, "Seu contrabando foi removido por um trabalhador da Receita Federal.");
							udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
							return 1;
						}
						SendClientMessage(playerid, 0xDD0000FF, "Jogador não conectado/logado.");
						return 1;
					}
					SendClientMessage(playerid, 0xDD0000FF, "Você não fez a revisão neste jogador ainda.");
					return 1;
				}
				SendClientMessage(playerid, 0xDD0000FF, "Esse jogador não esta fazendo contrabando.");
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Esse jogador não é contrabandista");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não tem permissão.");
		return 1;
	}
	if(!strcmp(var1, "/revisarcontrabando", true))
	{
		if(glob2AF8C[playerid] == 45 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8 = 0;
			var7 = function1A10(cmdtext, var4, 32);
			var8 = strval(var7);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/revisarcontrabando [id]");
				return 1;
			}
			if(glob2AF8C[var8] == 44)
			{
				if(IsPlayerConnected(var8))
				{
					if(!glob34C34[var8])
					{
						glob342D4[playerid][var8] = 1;
						SendClientMessage(playerid, 0x33AA33AA, "Esse jogador está livre! Não esta fazendo nenhum contrabando");
						return 1;
					}
					if(glob34C34[playerid] == 1)
					{
						glob342D4[playerid][var8] = 1;
						SendClientMessage(playerid, 0x33AA33AA, "Esse jogador está fazendo contrabando! Cancele esse contrabando e prenda-o");
						SendClientMessage(var8, 0xDD0000FF, "Fudeu!!! Descobriram que você estava fazendo contrabando rápido fuja antes que seja tarde.");
						return 1;
					}
				}
				else
				{
					SendClientMessage(playerid, 0xDD0000FF, "Jogador não conectado/logado");
					return 1;
				}
			}
			else
			{
				SendClientMessage(playerid, 0xDD0000FF, "Revisões só podem ser feitas em contrabandistas");
				return 1;
			}
		}
		else
		{
			SendClientMessage(playerid, 0xDD0000FF, "Você não tem permissão");
			return 1;
		}
	}
	if(!strcmp(var1, "/permitircontrabando", true))
	{
		if(glob2AF8C[playerid] == 45 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8 = 0;
			var7 = function1A10(cmdtext, var4, 32);
			var8 = strval(var7);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/permitircontrabando [id]");
				return 1;
			}
			if(glob34C34[var8] == 1)
			{
				if(glob2AF8C[var8] == 44)
				{
					if(IsPlayerConnected(var8))
					{
						SendClientMessage(playerid, 0x33AA33AA, "Você permitiu esse contrabando! Não deixe que ninguém perceba hein");
						new var9[256];
						format(var9, 256, "%s permitiu seu contrabando.", function705E0(playerid));
						SendClientMessage(var8, 0x33AA33AA, var9);
						return 1;
					}
					SendClientMessage(playerid, 0xDD0000FF, "Jogador não conectado/logado");
					return 1;
				}
				SendClientMessage(playerid, 0xDD0000FF, "Esse jogador não é contrabandista");
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Esse jogador não esta fazendo nenhum contrabando");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não tem permissão");
		return 1;
	}
	if(!strcmp(var1, "/locar", true))
	{
		if(glob2AF8C[playerid] == 41 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8 = 0;
			new var9 = 0;
			new var10 = 0;
			new var11 = 0;
			var9 = GetDistanceBetweenPlayers(playerid, var8);
			var7 = function1A10(cmdtext, var4, 32);
			var8 = strval(var7);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/locar [id] [tempo]");
				return 1;
			}
			var7 = function1A10(cmdtext, var4, 32);
			var11 = strval(var7);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/locar [id] [tempo]");
				return 1;
			}
			var10 = GetPlayerVehicleID(playerid);
			if(IsPlayerConnected(var8))
			{
				if(var9 < 10)
				{
					if(var10 == glob2F77C || var10 == glob2F780 || var10 == glob2F784 || var10 == glob2F788 || var10 == glob2F78C || var10 == glob2F790 || var10 == glob2F794 || var10 == glob2F798)
					{
						if(IsPlayerInVehicle(playerid, var10))
						{
							if(0 < var11)
							{
								glob32070[var8] = 1;
								glob2F13C[var8] = 1;
								glob2F45C[var8] = var10;
								new var12[256];
								format(var12, 256, "%s lhe locou um carro por %d minutos! Aproveite", function705E0(playerid), var11);
								SendClientMessage(var8, 0x33AA33AA, var12);
								SendClientMessage(playerid, 0x33AA33AA, "Carro locado");
								SetTimerEx("locar", var11 * 60000, false, "dd", var8, var10);
								udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
								return 1;
							}
							SendClientMessage(playerid, 0xDD0000FF, "Ei, o tempo tem que ser maior que 0.");
							return 1;
						}
						SendClientMessage(playerid, 0xDD0000FF, "Você não esta em um veiculo.");
						return 1;
					}
					SendClientMessage(playerid, 0xDD0000FF, "Você tem que estar em um carro de aluguel.");
					return 1;
				}
				SendClientMessage(playerid, 0xDD0000FF, "Você está muito longe chegue mais perto.");
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Jogador não conectado/logado.");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não tem permissao");
		return 1;
	}
	if(!strcmp(var1, "/piracema", true))
	{
		if(glob2AF8C[playerid] == 28 || IsPlayerAdmin(playerid))
		{
			if(glob217A8 == 1)
			{
				SendClientMessageToAll(0x33AA33AA, "A piracema agora está desativada. Pode pescar à vontade!");
				SendClientMessage(playerid, 0xFFFFFFAA, "Feito.");
				printf("%s desativou a piracema", function705E0(playerid));
				glob217A8 = 0;
				return 1;
			}
			SendClientMessageToAll(0xDD0000FF, "A piracema está ativada, quem for pego pescando será preso.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Você ativou a piracema.");
			printf("%s ativou a piracema", function705E0(playerid));
			glob217A8 = 1;
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não é do IBAMA!");
		return 1;
	}
	if(!strcmp(var1, "/verpesca", true))
	{
		if(glob2AF8C[playerid] == 28 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8 = 0;
			var7 = function1A10(cmdtext, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/verpesca [id]");
				return 1;
			}
			var8 = strlen(var7);
			if(IsPlayerConnected(var8) && glob1A0CC[var8] == 1)
			{
				if(!glob21ACC[var8])
				{
					SendClientMessage(playerid, 0x33AA33AA, "O jogador não tem nem uma pesca.");
					printf("%s viu a pesca de %s e não havia nem uma pesca", function705E0(playerid), function705E0(var8));
					return 1;
				}
				SendClientMessage(playerid, 0x33AA33AA, "O jogador está pescando ou já pescou.");
				printf("%s viu a pesca de %s e havia  pescas", function705E0(playerid), function705E0(var8));
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Jogador não conectado/logado");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não é do Ibama!");
		return 1;
	}
	if(!strcmp(var1, "/prenderpesca", true))
	{
		if(glob2AF8C[playerid] == 28 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8 = 0;
			var7 = function1A10(cmdtext, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/prenderpesca [id]");
				return 1;
			}
			var8 = strlen(var7);
			if(IsPlayerConnected(var8) && glob1A0CC[var8] == 1)
			{
				if(!glob217A8)
				{
					SendClientMessage(playerid, 0xDD0000FF, "A piracema não está ativada para você efetuar a prisão!");
					return 1;
				}
				if(!glob21ACC[var8])
				{
					SendClientMessage(playerid, 0xDD0000FF, "O jogador não está pescando!");
					return 1;
				}
				if(GetDistanceBetweenPlayers(var8, playerid) < 21)
				{
					SendClientMessage(playerid, 0xDD0000FF, "Chegue mais perto para efetuar a prisão!");
					return 1;
				}
				udb_setPrisao(function705E0(var8), 1);
				LogarPlayer(var8);
				udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
				printf("%s prendeu %s por pescas em temporada não autorizada", function705E0(playerid), function705E0(var8));
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Jogador não conectado/logado");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não é do Ibama!");
		return 1;
	}
	if(!strcmp(var1, "/pescar", true))
	{
		if(glob21ACC[playerid] == 1)
		{
			SendClientMessage(playerid, 0xDD0000FF, "Você já está pescando!");
		}
		if(!glob21ACC[playerid])
		{
			new Float:var7 = 0.0, Float:var8 = 0.0, Float:var9 = 0.0;
			GetPlayerPos(playerid, var7, var8, var9);
			if(var7 >= -2713.9859 && var7 <= -2628.4883 && var8 <= 1938.3077 && var8 >= 1559.1424)
			{
				SendClientMessage(playerid, 0x33AA33AA, "Você lançou a rede de pesca. Espere ela voltar para concluir a pesca.");
				printf("%s pescou", function705E0(playerid));
				glob21ACC[playerid] = 1;
				SetTimer("Pesca", 36000, false);
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Você não está na área de pesca, consulte nosso site para uma referência.");
			return 1;
		}
	}
	if(!strcmp(var1, "/sellpesca", true))
	{
		new var7[256];
		new var8 = 0;
		if(glob217AC[playerid] == 1)
		{
			if(!glob21DEC[playerid])
			{
				SendClientMessage(playerid, 0xDD0000FF, "Você não tem nenhuma pesca, como poderá vender?");
				return 1;
			}
			if(glob2AF8C[playerid] == 19)
			{
				var8 = glob21DEC[playerid] * 130;
				GivePlayerMoney(playerid, var8);
				format(var7, 256, "Você vendeu %d pesca(s) por R$130 cada e faturou R$%d com a venda.", 138732, var8);
				SendClientMessage(playerid, 0x33AA33AA, var7);
				printf("%s vendeu suas pescas", function705E0(playerid));
				glob21DEC[playerid] = 0;
				return 1;
			}
			var8 = glob21DEC[playerid] * 100;
			GivePlayerMoney(playerid, var8);
			format(var7, 256, "Você vendeu %d pesca(s) por R$100 cada e faturou R$%d com a venda.", 138732, var8);
			SendClientMessage(playerid, 0x33AA33AA, var7);
			printf("%s vendeu suas pescas", function705E0(playerid));
			glob21DEC[playerid] = 0;
			udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não está na Cooperativa de Pesca.");
		return 1;
	}
	if(!strcmp(var1, "/sellarma", true))
	{
		if(glob2AF8C[playerid] == 17 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8 = 0, var9 = 0, var10 = 0;
			var7 = function1A10(cmdtext, var4, 32);
			var8 = strval(var7);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/sellarma [id] [id da arma] [munição]");
				return 1;
			}
			var7 = function1A10(cmdtext, var4, 32);
			var9 = strval(var7);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/sellarma [id] [id da arma] [munição]");
				return 1;
			}
			var7 = function1A10(cmdtext, var4, 32);
			var10 = strval(var7);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/sellarma [id] [id da arma] [munição]");
				return 1;
			}
			if(IsPlayerConnected(var8))
			{
				if(var9 > 0 && var9 < 47)
				{
					if(var10 > 0 && var10 < 1500)
					{
						GivePlayerWeapon(var8, var9, var10);
						SendClientMessage(playerid, 0x33AA33AA, "Arma vendida");
						SendClientMessage(var8, 0x33AA33AA, "Você recebeu uma arma");
						return 1;
					}
					SendClientMessage(playerid, 0xDD0000FF, "Arma inválida");
					return 1;
				}
				SendClientMessage(playerid, 0xDD0000FF, "Munição inválida");
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Jogador não conectado/logado");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você é Vendedor de Armas");
		return 1;
	}
	if(!strcmp(var1, "/cacaon", true))
	{
		if(glob2AF8C[playerid] == 27 || IsPlayerAdmin(playerid))
		{
			if(glob217A8 == 1)
			{
				SendClientMessage(playerid, 0xDD0000FF, "A temporada de caça já está ativada!");
				return 1;
			}
			SendClientMessageToAll(0xDD0000FF, "A temporada de caça está ativada, quem for pego pescando será preso.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Você ativou a temporada de caça.");
			printf("%s ativou a temporada de caca", function705E0(playerid));
			glob22A6C = 1;
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não é do Policia Florestal!");
		return 1;
	}
	if(!strcmp(var1, "/cacaoff", true))
	{
		if(glob2AF8C[playerid] == 27 || IsPlayerAdmin(playerid))
		{
			if(glob217A8 == 1)
			{
				SendClientMessage(playerid, 0xDD0000FF, "A temporada de caça já está desativada!");
				return 1;
			}
			SendClientMessageToAll(0xDD0000FF, "A temporada de caça está desativada, pode pescar a vontade.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Você desativou a temporada de caça.");
			printf("%s desativou a temporada de caca", function705E0(playerid));
			glob22A6C = 1;
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não é da Policia Florestal!");
		return 1;
	}
	if(!strcmp(var1, "/vercaca", true))
	{
		if(glob2AF8C[playerid] == 27 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8 = 0;
			var7 = function1A10(cmdtext, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/vercaca [id]");
				return 1;
			}
			var8 = strlen(var7);
			if(IsPlayerConnected(var8) && glob1A0CC[var8] == 1)
			{
				if(!glob22D90[var8])
				{
					SendClientMessage(playerid, 0x33AA33AA, "O jogador não está caçando.");
					printf("%s viu a caca de %s e não havia nem uma cacas", function705E0(playerid), function705E0(var8));
					return 1;
				}
				SendClientMessage(playerid, 0x33AA33AA, "O jogador está caçando.");
				printf("%s viu a caca de %s e havia cacas", function705E0(playerid), function705E0(var8));
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Jogador não conectado/logado");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não é da Policia Florestal!");
		return 1;
	}
	if(!strcmp(var1, "/prendercaca", true))
	{
		if(glob2AF8C[playerid] == 27 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8 = 0;
			var7 = function1A10(cmdtext, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/prendercaca [id]");
				return 1;
			}
			var8 = strlen(var7);
			if(IsPlayerConnected(var8) && glob1A0CC[var8] == 1)
			{
				if(glob22A6C == 1)
				{
					SendClientMessage(playerid, 0xDD0000FF, "A temporada de caça está ativada, por isso você não pode prendê-lo!");
					return 1;
				}
				if(!glob22D90[var8])
				{
					SendClientMessage(playerid, 0xDD0000FF, "O jogador não está caçando!");
					return 1;
				}
				if(GetDistanceBetweenPlayers(var8, playerid) < 21)
				{
					SendClientMessage(playerid, 0xDD0000FF, "Chegue mais perto para efetuar a prisão!");
					return 1;
				}
				udb_setPrisao(function705E0(var8), 1);
				LogarPlayer(var8);
				udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
				printf("%s prendeu %s por caças em temporada não autorizada", function705E0(playerid), function705E0(var8));
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Jogador não conectado/logado");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não é da Policia Florestal!");
		return 1;
	}
	if(!strcmp(var1, "/minhaslatinhas", true))
	{
		if(glob2AF8C[playerid] == 34 || glob2AF8C[playerid] == 52 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			format(var7, 256, "Você possue %d latas!", 212916);
			SendClientMessage(playerid, 0x0099FFAA, var7);
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não é mendigo nem serviço de reciclagem portanto não possue latinhas");
		return 1;
	}
	if(!strcmp(var1, "/selllatinha", true))
	{
		if(glob2AF8C[playerid] == 34 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8 = 0;
			new var9 = 0;
			var7 = function1A10(cmdtext, var4, 32);
			var8 = strval(var7);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/selllatinha [id] [latas]");
				return 1;
			}
			var7 = function1A10(cmdtext, var4, 32);
			var9 = strval(var7);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/selllatinha [id] [latas]");
				return 1;
			}
			if(IsPlayerConnected(var8))
			{
				if(glob2AF8C[var8] == 52)
				{
					if(glob33FB4[playerid] >= var9)
					{
						glob33FB4[var8] = var9 + glob33FB4[var8];
						new var10[256];
						format(var10, 256, "Você recebeu %d latinhas de %s!", var9, function705E0(playerid));
						SendClientMessage(var8, 0x33AA33AA, var10);
						new var11[256];
						format(var11, 256, "Você entregou %d latas para %s", var9, function705E0(var8));
						SendClientMessage(playerid, 0x33AA33AA, var11);
						udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
						return 1;
					}
					SendClientMessage(playerid, 0xDD0000FF, "Você não possue tudo isso de latinhas digite /minhaslatinhas para ver quanto você tem.");
					return 1;
				}
				SendClientMessage(playerid, 0xDD0000FF, "Você só pode vender latinhas para um serviço de reciclagens.");
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Jogador não conectado/logado.");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não tem permissão.");
		return 1;
	}
	if(!strcmp(var1, "/pararcoleta", true))
	{
		if(glob2AF8C[playerid] == 34 || IsPlayerAdmin(playerid))
		{
			if(glob33C94[playerid] == 1)
			{
				DisablePlayerCheckpoint(playerid);
				glob187CC[playerid] = 0;
				glob33C94[playerid] = 0;
				SendClientMessage(playerid, 0x33AA33AA, "Você parou de coletar latinhas.");
				new var7[256];
				format(var7, 256, "Você possue %d latinhas", 212916);
				SendClientMessage(playerid, 0x33AA33AA, var7);
				glob175F4[playerid] = 0;
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Você não esta coletando latinhas.");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não tem permissão.");
		return 1;
	}
	if(!strcmp(var1, "/pegarlatinha", true))
	{
		if(glob2AF8C[playerid] == 34 || IsPlayerAdmin(playerid))
		{
			if(glob33C94[playerid] == 1)
			{
				SendClientMessage(playerid, 0xDD0000FF, "Você já está coletando latinhas!");
				return 1;
			}
			glob33C94[playerid] = 1;
			DisablePlayerCheckpoint(playerid);
			SendClientMessage(playerid, 0x33AA33AA, "Agora você terá que coletar 6 pontos de acumulo de latinhas e levar para a reciclagem.");
			new var7 = random(23);
			glob187CC[playerid] = 23;
			SetPlayerCheckpoint(playerid, glob8DF4[var7][0], glob8DF4[var7][1], glob8DF4[var7][2], 3.0);
			glob175F4[playerid] = 1;
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não é Mendigo");
		return 1;
	}
	if(!strcmp(var1, "/cacar", true))
	{
		if(glob21ACC[playerid] == 1)
		{
			SendClientMessage(playerid, 0xDD0000FF, "Sua Presa não morreu ainda!");
		}
		if(!glob21ACC[playerid])
		{
			new Float:var7 = 0.0, Float:var8 = 0.0, Float:var9 = 0.0;
			GetPlayerPos(playerid, var7, var8, var9);
			if(var7 >= -2062.2964 && var7 <= -2020.8334 && var8 >= -1616.9932 && var8 <= -1510.9994)
			{
				SendClientMessage(playerid, 0x33AA33AA, "Espere a presa exalar seus últimos minutos de vida, para poder vendê-la.");
				glob21ACC[playerid] = 1;
				printf("%s acabou de cacar", function705E0(playerid));
				SetTimer("Caca", 36000, false);
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Você não está na área de caça, consulte nosso site para uma referência.");
			return 1;
		}
	}
	if(!strcmp(var1, "/sellcaca", true))
	{
		if(glob2AF8C[playerid] == 18 || IsPlayerAdmin(playerid))
		{
			if(!glob22A70[playerid])
			{
				SendClientMessage(playerid, 0xDD0000FF, "Você não está na Cooperativa de Caça.");
				return 1;
			}
			if(!glob230B0[playerid])
			{
				SendClientMessage(playerid, 0xDD0000FF, "Você não tem caças acumuladas.");
				return 1;
			}
			new var7[256];
			new var8 = 0;
			var8 = glob230B0[playerid] * 100;
			format(var7, 256, "Você vendeu %d caça(s) por R$100 cada e faturou R$%d com a venda.", 143536, var8);
			SendClientMessage(playerid, 0x33AA33AA, var7);
			GivePlayerMoney(playerid, var8);
			printf("%s vendeu sua caca", function705E0(playerid));
			glob230B0[playerid] = 0;
			udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não tem permissão para isso!");
		return 1;
	}
	if(!strcmp(var1, "/placa", true))
	{
		if(glob2AF8C[playerid] == 42 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8 = 0;
			new var9[256];
			var7 = function1A10(cmdtext, var4, 32);
			strmid(var7, cmdtext, 6, strlen(cmdtext), 256);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0x00BC6FAA, "/placa [nome]");
				return 1;
			}
			var8 = GetPlayerVehicleID(playerid);
			if(IsPlayerInVehicle(playerid, var8))
			{
				SetVehicleNumberPlate(var8, var7);
				format(var9, 256, "Placa mudada para %s", var7);
				SendClientMessage(playerid, 0xF0E68CAA, var9);
				return 1;
			}
			SendClientMessage(playerid, 0x00BC6FAA, "Você não está em um veiculo");
			return 1;
		}
		SendClientMessage(playerid, 0x00BC6FAA, "Você não tem permissao");
		return 1;
	}
	if(!strcmp(var1, "/lavar", true))
	{
		if(glob2AF8C[playerid] == 42 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8 = 0;
			new var9 = 0;
			new var10 = 0;
			var7 = function1A10(cmdtext, var4, 32);
			var8 = strval(var7);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "Uso: /lavar [id]");
				return 1;
			}
			var10 = GetDistanceBetweenPlayers(playerid, var8);
			if(var10 > 10)
			{
				SendClientMessage(playerid, 0xDD0000FF, "Você está muito longe chegue mais perto.");
				return 1;
			}
			var9 = GetPlayerVehicleID(var8);
			if(IsPlayerInVehicle(var8, var9))
			{
				if(IsPlayerConnected(var8))
				{
					if(!glob326B0[var9])
					{
						SendClientMessage(playerid, 0x00BC6FAA, "Carro lavado.");
						SendClientMessage(var8, 0x00BC6FAA, "Seu carro foi lavado por um mecanico.");
						udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
						glob326B0[var9] = 1;
						return 1;
					}
					SendClientMessage(playerid, 0xDD0000FF, "Esse carro ja está limpo.");
					return 1;
				}
				SendClientMessage(playerid, 0xDD0000FF, "Jogador não conectado/logado.");
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "O jogador indicado não está em um carro.");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não tem permissão.");
		return 1;
	}
	if(!strcmp(var1, "/consertar", true))
	{
		if(glob2AF8C[playerid] == 42 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8 = 0;
			new var9 = 0;
			new var10 = 0;
			var7 = function1A10(cmdtext, var4, 32);
			var10 = GetDistanceBetweenPlayers(playerid, var9);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0x00BC6FAA, "/consertar [id]");
				return 1;
			}
			var8 = GetPlayerVehicleID(var9);
			var9 = strval(var7);
			if(var10 < 10)
			{
				if(IsPlayerConnected(var9))
				{
					if(IsPlayerInVehicle(var9, var8))
					{
						new Float:var11 = 0.0, Float:var12 = 0.0, Float:var13 = 0.0, Float:var14 = 0.0;
						new var15 = 0;
						GetPlayerPos(playerid, var11, var12, var13);
						var15 = GetVehicleZAngle(var8, var14);
						SetVehicleToRespawn(var8);
						SetVehicleHealth(var8, 1000.0);
						SendClientMessage(playerid, 0x00BC6FAA, "Consertando.");
						SendClientMessage(var9, 0x00BC6FAA, "Aguarde veiculo sendo arrumado.");
						SetTimerEx("consertar", 5000, false, "ddf", var8, var9, var15);
						GameTextForPlayer(var9, "ARRUMANDO", 5000, 6);
						udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
						return 1;
					}
					SendClientMessage(playerid, 0x00BC6FAA, "O jogador indicado não está em um veiculo");
					return 1;
				}
				SendClientMessage(playerid, 0x00BC6FAA, "Jogador não conectado/logado");
				return 1;
			}
			SendClientMessage(playerid, 0x00BC6FAA, "Você está muito longe chegue mais perto");
			return 1;
		}
	}
	if(!strcmp(var1, "/pintar", true))
	{
		if(glob2AF8C[playerid] == 42 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8 = 0, var9 = 0;
			var7 = function1A10(cmdtext, var4, 32);
			var8 = strval(var7);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/pintar [cor1] [cor2]");
				return 1;
			}
			var7 = function1A10(cmdtext, var4, 32);
			var9 = strval(var7);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/pintar [cor1] [cor2]");
				return 1;
			}
			if(IsPlayerInAnyVehicle(playerid))
			{
				if(var8 >= 0 && var8 <= 126)
				{
					if(var9 >= 0 && var9 <= 126)
					{
						ChangeVehicleColor(GetPlayerVehicleID(playerid), var8, var9);
						SendClientMessage(playerid, 0xFFFFFFAA, "Veiculo pintado com sucesso!");
						return 1;
					}
					SendClientMessage(playerid, 0xDD0000FF, "Cor 2 invalidá.");
					return 1;
				}
				SendClientMessage(playerid, 0xDD0000FF, "Cor 1 invalidá");
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Você não esta em um veiculo.");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não tem permissão.");
		return 1;
	}
	if(!strcmp(var1, "/plantar", true))
	{
		if(glob2AF8C[playerid] == 20 || IsPlayerAdmin(playerid))
		{
			if(glob20B28[playerid] == 1)
			{
				SendClientMessage(playerid, 0xDD0000FF, "Você já está com o campo cheio!");
			}
			if(!glob20B28[playerid])
			{
				new Float:var7 = 0.0, Float:var8 = 0.0, Float:var9 = 0.0;
				GetPlayerPos(playerid, var7, var8, var9);
				if(var7 >= -1194.7273 && var7 <= -1007.1719 && var8 >= -1064.6097 && var8 <= -915.6717)
				{
					SendClientMessage(playerid, 0x33AA33AA, "Plantado, espera o milho crescer para colher.");
					printf("%s plantou", function705E0(playerid));
					glob20B28[playerid] = 1;
					SetTimer("Plantacao", 36000, false);
					udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
					return 1;
				}
				SendClientMessage(playerid, 0xDD0000FF, "Você não está na lavoura, consulte nosso site para uma referência.");
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Você não é Agricultor!");
			return 1;
		}
	}
	if(!strcmp(var1, "/colher", true))
	{
		if(glob2AF8C[playerid] == 20 || IsPlayerAdmin(playerid))
		{
			if(!glob21ACC[playerid])
			{
				SendClientMessage(playerid, 0xDD0000FF, "Você não plantou! Como que vai colher?");
			}
			if(glob20B28[playerid] == 1)
			{
				new Float:var7 = 0.0, Float:var8 = 0.0, Float:var9 = 0.0;
				GetPlayerPos(playerid, var7, var8, var9);
				if(var7 >= -1194.7273 && var7 <= -1007.1719 && var8 >= -1064.6097 && var8 <= -915.6717)
				{
					SendClientMessage(playerid, 0x33AA33AA, "Colhido, agora vá até a fazenda para vender sua colheita.");
					glob20E48[playerid] = 1;
					printf("%s colheu sua plantacao", function705E0(playerid));
					udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
					return 1;
				}
				SendClientMessage(playerid, 0xDD0000FF, "Você não está na lavoura, consulte nosso site para uma referência.");
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Você não é Agricultor!");
			return 1;
		}
	}
	if(!strcmp(var1, "/sellmilho", true))
	{
		if(glob2AF8C[playerid] == 20 || IsPlayerAdmin(playerid))
		{
			if(!glob20808[playerid])
			{
				SendClientMessage(playerid, 0xDD0000FF, "Você não está na Fazenda.");
				return 1;
			}
			if(!glob20E48[playerid])
			{
				SendClientMessage(playerid, 0xDD0000FF, "Você não tem colheitas acumuladas.");
				return 1;
			}
			new var7[256];
			new var8 = 0;
			var8 = glob20E48[playerid] * 100;
			format(var7, 256, "Você vendeu %d colheira(s) de milho por R$100 cada e faturou R$%d com a venda.", 143536, var8);
			SendClientMessage(playerid, 0x33AA33AA, var7);
			printf("%s vendeu sua plantacao", function705E0(playerid));
			GivePlayerMoney(playerid, var8);
			glob20E48[playerid] = 0;
			udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não é Agricultor!");
		return 1;
	}
	if(!strcmp(var1, "/sequestrar", true))
	{
		if(glob2AF8C[playerid] == 12 || IsPlayerAdmin(playerid))
		{
			new var7[256], var8 = 0;
			var7 = function1A10(cmdtext, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/sequestrar [id]");
				return 1;
			}
			var8 = strlen(var7);
			if(IsPlayerConnected(var8))
			{
				if(GetDistanceBetweenPlayers(var8, playerid) > 10)
				{
					SendClientMessage(playerid, 0xDD0000FF, "Você está muito longe chegue mais perto para entregar a pizza.");
					return 1;
				}
				SendClientMessage(playerid, 0xFFFFFFAA, "Você sequestrou um jogador, seu chefe pagou o resgate adiantado.");
				SendClientMessage(var8, 0x33AA33AA, "Você foi sequestrado, ficará aqui até pagar resgate.");
				GivePlayerMoney(playerid, 500);
				SetPlayerPos(var8, 1978.7237, -1603.902, 13.5401);
				TogglePlayerControllable(var8, false);
				glob1D5FC[var8] = 1;
				udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "O jogador não está conectado!");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não é Sequestrador!");
		return 1;
	}
	if(!strcmp(var1, "/oferecerresgate", true))
	{
		if(glob2AF8C[playerid] == 12 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8 = 0;
			new var9 = 0;
			var7 = function1A10(cmdtext, var4, 32);
			var8 = strval(var7);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/oferecerresgate [id] [quantia]");
				return 1;
			}
			var7 = function1A10(cmdtext, var4, 32);
			var9 = strval(var7);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/oferecerresgate [id] [quantia]");
				return 1;
			}
			if(IsPlayerConnected(var8))
			{
				if(glob1D5FC[var8] == 1)
				{
					glob1912C[var8] = 4;
					glob1AA30 = var9;
					glob1AA34 = playerid;
					SendClientMessage(playerid, 0x33AA33AA, "Proposta de resgate oferecida");
					new var10[256];
					format(var10, 256, "%s esta lhe oferecendo uma proposta de %d para te tirar do sequestro! Digite /aceitar para aceitar e /recusar para recusar.", function705E0(playerid), 109100);
					SendClientMessage(var8, 0x33AA33AA, var10);
					return 1;
				}
				SendClientMessage(playerid, 0xDD0000FF, "Esse jogador não esta sequestrado");
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Jogador não conectado/logado");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não tem permissão");
		return 1;
	}
	if(!strcmp(var1, "/sellcomb", true))
	{
		if(glob2AF8C[playerid] == 8 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8[256];
			new var9 = 0;
			new var10 = 0, var11 = 0;
			var7 = function1A10(cmdtext, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/sellcomb [id] [litros]");
				return 1;
			}
			var10 = strval(var7);
			var7 = function1A10(cmdtext, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/sellcomb [id] [litros]");
				return 1;
			}
			var11 = strval(var7);
			if(var11 > 100 || var11 <= 0)
			{
				SendClientMessage(playerid, 0xDD0000FF, "Quantidade inválida. Os valores devem ser de 1 à 100.");
				return 1;
			}
			if(IsPlayerConnected(var10))
			{
				if(IsPlayerInAnyVehicle(var10))
				{
					if(0 > var11 + glob1C1A8[GetPlayerVehicleID(var10)])
					{
						var9 = var11 + glob1C1A8[GetPlayerVehicleID(var10)];
						glob1C1A8[GetPlayerVehicleID(var10)] = var9;
						format(var8, 256, "%s colocou %d litros de combustível para você, agora você tem %d litros de combustivel.", function705E0(playerid), var11, var9);
						SendClientMessage(var10, 0x33AA33AA, var8);
						TogglePlayerControllable(var10, true);
						GivePlayerMoney(playerid, var11);
						GivePlayerMoney(var10, -var11);
						SendClientMessage(playerid, 0x33AA33AA, "Combustível fornecido.");
						udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
						return 1;
					}
					if(0 <= var11 + glob1C1A8[GetPlayerVehicleID(var10)])
					{
						udb_setBankMoney(function705E0(playerid), udb_getBankMoney(function705E0(playerid)) - var9);
						var9 = 0 - glob1C1A8[GetPlayerVehicleID(var10)];
						glob1C1A8[GetPlayerVehicleID(var10)] = 0;
						format(var8, 256, "%s completou seu tanque, colocando %d litros", function705E0(playerid), var9);
						SendClientMessage(var10, 0x33AA33AA, var8);
						TogglePlayerControllable(var10, true);
						GivePlayerMoney(playerid, var11);
						GivePlayerMoney(var10, -var11);
						SendClientMessage(playerid, 0x33AA33AA, "Combustivel fornecido.");
						udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
						return 1;
					}
					return 1;
				}
				SendClientMessage(playerid, 0xDD0000FF, "Jogador não conectado/logado.");
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Jogador não está em um veículo!");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não é Frentista!");
		return 1;
	}
	if(!strcmp(var1, "/colocar", true))
	{
		if(GetPlayerState(playerid) == 2)
		{
			if(!glob273F8[playerid])
			{
				SendClientMessage(playerid, 0xDD0000FF, "O Galão de Combustivel está vazio!");
				return 1;
			}
			glob273F8[playerid] = 0;
			SendClientMessage(playerid, 0x33AA33AA, "Você colocou um galão de 15 litros no tanque do carro, agora vá até o posto e abasteça.");
			glob1C1A8[GetPlayerVehicleID(playerid)] = glob1C1A8[GetPlayerVehicleID(playerid)] + 15;
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você precisa estar em um veículo para usar este comando.");
		return 1;
	}
	if(!strcmp(var1, "/buygalao", true))
	{
		if(!glob273F8[playerid])
		{
			if(glob27D58[playerid] == 1)
			{
				SendClientMessage(playerid, 0x33AA33AA, "Você comprou um galão com 15 litros de combustivel.");
				SendClientMessage(playerid, 0x33AA33AA, "Para colocar entre no carro e digite '/colocar'.");
				GivePlayerMoney(playerid, -15);
				glob273F8[playerid] = 1;
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Você não está no posto!");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Seu galão de combustivel já está cheio!");
		return 1;
	}
	if(!strcmp(var1, "/abastecer", true))
	{
		if(GetPlayerState(playerid) == 2)
		{
			new var7[256];
			new var8 = 0;
			new var9[256];
			var7 = function1A10(cmdtext, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "Uso: /abastecer [litros]");
				return 1;
			}
			var8 = strval(var7);
			if(var8 <= -100 || GetPlayerMoney(playerid) < var8)
			{
				SendClientMessage(playerid, 0xDD0000FF, "Você não tem dinheiro para pagar. Ou você está querendo tirar combustível do veículo.");
				return 1;
			}
			if(glob27D58[playerid] == 1)
			{
				if(var8 + glob1C1A8[GetPlayerVehicleID(playerid)] < 100)
				{
					glob1C1A8[GetPlayerVehicleID(playerid)] = var8 + glob1C1A8[GetPlayerVehicleID(playerid)];
					format(var9, 256, "Colocamos %d litros de combustível.", var8);
					SendClientMessage(playerid, 0x33AA33AA, var9);
					return 1;
				}
				if(var8 + glob1C1A8[GetPlayerVehicleID(playerid)] >= 100)
				{
					new var10 = 0;
					var10 = 100 - glob1C1A8[GetPlayerVehicleID(playerid)];
					glob1C1A8[GetPlayerVehicleID(playerid)] = 100;
					format(var9, 256, "Enchemos o tanque, colocados %d litros.", var10);
					SendClientMessage(playerid, 0x33AA33AA, var9);
					GivePlayerMoney(playerid, -var10);
					return 1;
				}
			}
			else
			{
				SendClientMessage(playerid, 0xDD0000FF, "Você não está no posto, consulte o mapa para ver a localização do posto mais proximo.");
				return 1;
			}
		}
		else
		{
			SendClientMessage(playerid, 0xDD0000FF, "Você precisa estar em um veículo para usar este comando.");
			return 1;
		}
	}
	if(!strcmp(var1, "/ligar", true))
	{
		new var7[256];
		new var8 = 0;
		new var9[256];
		new var10 = 0;
		var10 = udb_getcell(function705E0(playerid));
		var7 = function1A10(cmdtext, var4, 32);
		if(!strlen(var7))
		{
			SendClientMessage(playerid, 0x7585C0AA, "/ligar [id]");
			return 1;
		}
		var2 = strval(var7);
		if(!IsPlayerConnected(var8))
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Você deve estar logado para ligar");
			return 1;
		}
		if(!var10)
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Você não possue celular para fazer uma ligação");
			return 1;
		}
		if(0 > GetPlayerMoney(playerid))
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Você não tem dinheiro para uma ligação");
			return 1;
		}
		if(var2 == playerid)
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Você não pode ligar para você mesmo");
			return 1;
		}
		if(!IsPlayerConnected(var2))
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Jogador não conectado/logado");
			return 1;
		}
		if(glob2E194[playerid] > -1)
		{
			GetPlayerName(glob2E194[playerid], var5, 24);
			format(var9, 256, "Você está no telefone com %s!", var5);
			SendClientMessage(playerid, 0x4C62B3AA, var9);
			return 1;
		}
		if(glob2E194[var2] > -1)
		{
			GetPlayerName(var2, var5, 24);
			format(var9, 256, "%s ja está no telefone, tente mais tarde.", var5);
			SendClientMessage(playerid, 0xFFFFFFAA, var9);
			return 1;
		}
		GetPlayerName(var2, var5, 24);
		GetPlayerName(playerid, var6, 24);
		format(var9, 256, "%s está te ligando digite /atender para atender o celular ou /desligar para desligar o celular", var6);
		SendClientMessage(var2, 0xFFFFFFAA, var9);
		format(var9, 256, "Você está falando com %s", var5);
		SendClientMessage(playerid, 0x4C62B3AA, var9);
		SetPlayerSpecialAction(playerid, 13);
		glob2E194[playerid] = var2;
		glob2E194[var2] = playerid;
		glob2EAF4[playerid] = 1;
		return 1;
	}
	if(!strcmp(var1, "/atender", true))
	{
		new var7 = 0;
		new var8[256];
		new var9[256];
		new var10 = 0;
		var10 = udb_getcell(function705E0(playerid));
		var7 = strval(var9);
		if(!IsPlayerConnected(var7))
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Você deve estar logado para atender uma chamada de telefone");
			return 1;
		}
		if(!var10)
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Como você vai atender uma ligação se não possue nenhum celular");
			return 1;
		}
		if(glob2E194[playerid] == -1)
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Ninguem está te ligando");
			return 1;
		}
		if(glob2E4B4[playerid] == 1)
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Você ja está no telefone");
			return 1;
		}
		GetPlayerName(glob2E194[playerid], var5, 24);
		GetPlayerName(playerid, var6, 24);
		format(var8, 256, "%s está te chamando", var6);
		SendClientMessage(glob2E194[playerid], 0x0099FFAA, var8);
		format(var8, 256, "Você aceitou a chamada de %s's call", var5);
		SendClientMessage(playerid, 0x0099FFAA, var8);
		SetPlayerSpecialAction(playerid, 13);
		glob2E4B4[playerid] = 1;
		glob2E4B4[glob2E194[playerid]] = 1;
		glob2EAF4[glob2E194[playerid]] = 1;
		return 1;
	}
	if(!strcmp(var1, "/desligar", true))
	{
		new var7 = 0;
		new var8[256];
		new var9[256];
		var7 = strval(var9);
		if(!IsPlayerConnected(var7))
		{
			SendClientMessage(playerid, 0x0099FFAA, "Você deve estar logado para desligar uma chamada");
			return 1;
		}
		if(glob2E194[playerid] == -1)
		{
			SendClientMessage(playerid, 0x0099FFAA, "Você não está no celular");
			return 1;
		}
		GetPlayerName(glob2E194[playerid], var5, 24);
		GetPlayerName(playerid, var6, 24);
		format(var8, 256, "%s Desligou o telefone", var6);
		SendClientMessage(glob2E194[playerid], 0xFFFFFFAA, var8);
		format(var8, 256, "Você desligou a chamada com %s", var5);
		SendClientMessage(playerid, 0xFFFFFFAA, var8);
		new var10 = glob2E194[playerid];
		glob2E194[playerid] = -1;
		glob2E4B4[playerid] = 0;
		glob2EAF4[playerid] = 0;
		glob2E194[var10] = -1;
		glob2E4B4[var10] = 0;
		glob2EAF4[var10] = 0;
		return 1;
	}
	if(!strcmp(var1, "/sms", true))
	{
		new var7[256];
		new var8 = 0;
		new var9[256];
		new var10[256];
		strmid(var10, cmdtext, 6, strlen(cmdtext), 256);
		var7 = function1A10(cmdtext, var4, 32);
		var8 = strval(var7);
		if(!strlen(var7))
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "/sms [id] [mensagem]");
			return 1;
		}
		if(GetPlayerMoney(playerid) < 5)
		{
			SendClientMessage(playerid, 0x33AA33AA, "Você não possue dinheiro para mandar uma SMS");
			return 1;
		}
		if(IsPlayerConnected(var8))
		{
			if(udb_getcell(function705E0(playerid)) == 1)
			{
				GivePlayerMoney(playerid, -5);
				SendClientMessage(playerid, 0xFFFFFFAA, "SMS enviada");
				format(var9, 256, "SMS enviada por %s.", function705E0(playerid));
				SendClientMessage(var8, 0x888888AA, var9);
				SendClientMessage(var8, 0xFFFFFAAA, var10);
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Você não possue celular para mandar uma SMS");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Jogador não conectado/logado");
		return 1;
	}
	if(!strcmp(var1, "/organizarfesta", true))
	{
		if(glob2AF8C[playerid] == 51 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			strmid(var7, cmdtext, 15, strlen(cmdtext), 256);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/organizarfesta [local]");
				return 1;
			}
			SendClientMessage(playerid, 0x33AA33AA, "Convite enviado a todos");
			for(new var8 = 0; var8 < 200; var8++)
			{
				new var9[256];
				format(var9, 256, "%s esta para fazer uma festa! Local:%s.", function705E0(playerid), var7);
				SendClientMessage(var8, 0xFFFFFFAA, var9);
				return 1;
			}
		}
		else
		{
			SendClientMessage(playerid, 0xDD0000FF, "Você não tem permissão");
			return 1;
		}
	}
	if(!strcmp(var1, "/contagem", true))
	{
		if(glob2AF8C[playerid] == 51 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8[256];
			var7 = function1A10(cmdtext, var4, 32);
			for(new var9 = 0; var9 < 200; var9++)
			{
				format(var8, 256, "Contagem feita por %s!", function705E0(playerid));
				SendClientMessage(var9, 0xFFFF00AA, var8);
				GameTextForAll("~y~5", 2000, 6);
				SetTimer("contagem", 1000, false);
				return 1;
			}
		}
		return 1;
	}
	if(!strcmp(var1, "/sellconvite", true))
	{
		if(glob2AF8C[playerid] == 51 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8 = 0;
			new var9 = 0;
			var7 = function1A10(cmdtext, var4, 32);
			var8 = strval(var7);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/sellconvite [id]");
				return 1;
			}
			var9 = GetDistanceBetweenPlayers(playerid, var8);
			if(var9 <= 10)
			{
				if(!glob34F60[var8])
				{
					if(IsPlayerConnected(var8))
					{
						if(var8 != playerid)
						{
							SendClientMessage(playerid, 0xFFFFFFAA, "Convite enviado.");
							new var10[256];
							format(var10, 256, "%s lhe vendeu um convite aproveite a festa.");
							SendClientMessage(var8, 0xFFFFFFAA, var10);
							glob34F60[var8] = 1;
							udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
							return 1;
						}
						SendClientMessage(playerid, 0xDD0000FF, "Você não pode vender convites para você mesmo.");
						return 1;
					}
					SendClientMessage(playerid, 0xDD0000FF, "Jogador não conectado/logado");
					return 1;
				}
				SendClientMessage(playerid, 0xDD0000FF, "Este jogador já possue convite.");
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Você está muito longe chegue mais perto.");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não tem permissão.");
		return 1;
	}
	if(!strcmp(var1, "/verificar", true))
	{
		if(glob2AF8C[playerid] == 51 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8 = 0;
			new var9 = 0;
			var7 = function1A10(cmdtext, var4, 32);
			var8 = strval(var7);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/verificar [id]");
				return 1;
			}
			if(IsPlayerConnected(var8))
			{
				if(var9 <= 10)
				{
					if(!glob34F60[var8])
					{
						SendClientMessage(playerid, 0xDD0000FF, "Este jogador não possue convite!");
						return 1;
					}
					if(glob34F60[var8] == 1)
					{
						SendClientMessage(playerid, 0x0099FFAA, "Este jogador possue convite.");
						return 1;
					}
				}
				else
				{
					SendClientMessage(playerid, 0xDD0000FF, "Você esta muito longe chegue mais perto.");
					return 1;
				}
			}
			else
			{
				SendClientMessage(playerid, 0xDD0000FF, "Jogador não conectado/logado.");
				return 1;
			}
		}
		else
		{
			SendClientMessage(playerid, 0xDD0000FF, "Você não tem permissão.");
			return 1;
		}
	}
	if(!strcmp(var1, "/recolherconvite", true))
	{
		if(glob2AF8C[playerid] == 51 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8 = 0;
			new var9 = 0;
			var7 = function1A10(cmdtext, var4, 32);
			var8 = strval(var7);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/recolherconvite [id]");
				return 1;
			}
			var9 = GetDistanceBetweenPlayers(playerid, var8);
			if(var9 <= 10)
			{
				if(glob34F60[var8] == 1)
				{
					if(IsPlayerConnected(var8))
					{
						if(var8 != playerid)
						{
							SendClientMessage(playerid, 0xFFFFFFAA, "Convite recolhido.");
							new var10[256];
							format(var10, 256, "%s recolheu seu convite.");
							SendClientMessage(var8, 0xFFFFFFAA, var10);
							glob34F60[var8] = 1;
							udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
							return 1;
						}
						SendClientMessage(playerid, 0xDD0000FF, "Você não pode vender convites para você mesmo.");
						return 1;
					}
					SendClientMessage(playerid, 0xDD0000FF, "Jogador não conectado/logado");
					return 1;
				}
				SendClientMessage(playerid, 0xDD0000FF, "Este jogador não possue convite.");
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Você está muito longe chegue mais perto.");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não tem permissão.");
		return 1;
	}
	if(!strcmp(var1, "/desmanchar", true))
	{
		if(glob2AF8C[playerid] == 15 || IsPlayerAdmin(playerid))
		{
			if(glob24B50[playerid] == 1)
			{
				if(GetPlayerState(playerid) == 2)
				{
					if(!glob273F8[playerid])
					{
						SendClientMessage(playerid, 0x33AA33AA, "Veículo desmanchado, pagaram R$2500 pelo veículo roubado.");
						DestroyVehicle(GetPlayerVehicleID(playerid));
						GivePlayerMoney(playerid, 2500);
						glob24E70[playerid] = 1;
						SetTimer("Desmanchado", 60000, false);
						udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
						return 1;
					}
					SendClientMessage(playerid, 0xDD0000FF, "Você precisa estar em um veículo para usar este comando!");
					return 1;
				}
				SendClientMessage(playerid, 0xDD0000FF, "Você não está no desmanche!");
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Você não é Ladrão de Carros!");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Vai com calma, algum jogador entregou um veículo a pouco tempo, espera a poeira abaixar para entregar outro veículo!");
		return 1;
	}
	if(!strcmp(var1, "/desalarme", true))
	{
		if(glob2AF8C[playerid] == 15)
		{
			if(IsPlayerInAnyVehicle(playerid))
			{
				glob1E8C8[GetPlayerVehicleID(playerid)] = 0;
				SendClientMessage(playerid, 0x33AA33AA, "Alarme destruido");
				udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Você precisa estar em um veículo para usar este comando!");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não é Ladrão de Carros!");
		return 1;
	}
	if(!strcmp(var1, "/selldinamite", true))
	{
		new var7[256];
		new var8 = 0;
		var7 = function1A10(cmdtext, var4, 32);
		var8 = strval(var7);
		if(!strlen(var7))
		{
			SendClientMessage(playerid, 0xDD0000FF, "/selldinamite [id]");
			return 1;
		}
		if(IsPlayerConnected(var8))
		{
			if(var8 != playerid)
			{
				SendClientMessage(playerid, 0x33AA33AA, "Dinamite vendida com sucesso");
				SendClientMessage(var8, 0x33AA33AA, "Você recebeu uma dinamite para explosões de veiculos! Aproveite xD");
				glob358C0[var8]++;
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Você não pode vender para você mesmo.");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Jogador não conectado/logado.");
		return 1;
	}
	if(!strcmp(var1, "/sellgranada", true))
	{
		if(glob2AF8C[playerid] == 54 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8 = 0;
			var7 = function1A10(cmdtext, var4, 32);
			var8 = strval(var7);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/sellgranada [id]");
				return 1;
			}
			if(IsPlayerConnected(var8))
			{
				if(var8 != playerid)
				{
					GivePlayerWeapon(var8, 16, 2);
					SendClientMessage(playerid, 0x33AA33AA, "Granada vendida.");
					SendClientMessage(var8, 0x33AA33AA, "Você recebeu uma granada.");
					udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
					return 1;
				}
				SendClientMessage(playerid, 0xDD0000FF, "Você não pode vender para você mesmo.");
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Jogador não conectado/logado.");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não tem permissão.");
		return 1;
	}
	if(!strcmp(var1, "/sellbombagas", true))
	{
		if(glob2AF8C[playerid] == 54 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8 = 0;
			var7 = function1A10(cmdtext, var4, 32);
			var8 = strval(var7);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/sellbombagas [id]");
				return 1;
			}
			if(IsPlayerConnected(var8))
			{
				if(var8 != playerid)
				{
					GivePlayerWeapon(var8, 17, 2);
					SendClientMessage(playerid, 0x33AA33AA, "Bomba de gas vendida.");
					SendClientMessage(var8, 0x33AA33AA, "Você recebeu uma bomba de gas.");
					udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
					return 1;
				}
				SendClientMessage(playerid, 0xDD0000FF, "Você não pode vender para você mesmo.");
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Jogador não conectado/logado.");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não tem permissão.");
		return 1;
	}
	if(!strcmp(var1, "/sellmolotov", true))
	{
		if(glob2AF8C[playerid] == 54 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8 = 0;
			var7 = function1A10(cmdtext, var4, 32);
			var8 = strval(var7);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/sellmolotov [id]");
				return 1;
			}
			if(IsPlayerConnected(var8))
			{
				if(var8 != playerid)
				{
					GivePlayerWeapon(var8, 18, 2);
					SendClientMessage(playerid, 0x33AA33AA, "Molotov vendido.");
					SendClientMessage(var8, 0x33AA33AA, "Você recebeu um molotov.");
					udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
					return 1;
				}
				SendClientMessage(playerid, 0xDD0000FF, "Você não pode vender para você mesmo.");
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Jogador não conectado/logado.");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não tem permissão.");
		return 1;
	}
	if(!strcmp(var1, "/fianca", true))
	{
		if(glob2AF8C[playerid] == 30)
		{
			new var7[256];
			new var8 = 0;
			new var9 = 0;
			new var10[256];
			var7 = function1A10(cmdtext, var4, 32);
			var8 = strval(var7);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0x5CFFFDAA, "/fianca [id] [quantia]");
				return 1;
			}
			var7 = function1A10(cmdtext, var4, 32);
			var9 = strval(var7);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0x5CFFFDAA, "/fianca [id] [quantia]");
				return 1;
			}
			if(IsPlayerConnected(var8))
			{
				if(var8 != playerid)
				{
					format(var10, 256, "O advogado %s está lhe cobrando %d para lhe tirar da prisão para aceitar faça /aceitar para recusar faça /recusar", function705E0(playerid), var9);
					SendClientMessage(var8, 0x5CFFFDAA, var10);
					SendClientMessage(playerid, 0x5CFFFDAA, "Proposta enviada");
					glob1AA34 = playerid;
					glob1AA2C = var9;
					glob1912C[var8] = 1;
					return 1;
				}
				SendClientMessage(playerid, 0x5CFFFDAA, "Você não pode se próprio fazer uma oferta");
				return 1;
			}
			SendClientMessage(playerid, 0x5CFFFDAA, "Jogador não conectado/logado");
			return 1;
		}
		SendClientMessage(playerid, 0x5CFFFDAA, "Você não tem permissao");
		return 1;
	}
	if(!strcmp(var1, "/recusar", true))
	{
		new var7[256];
		var7 = function1A10(cmdtext, var4, 32);
		switch(glob1912C[playerid]) {
			case 0:
				SendClientMessage(playerid, 0xFFFFFFAA, "Nenhuma proposta foi oferecida a você");
				return 1;
			case 1:
				SendClientMessage(playerid, 0x5CFFFDAA, "Proposta recusada");
				SendClientMessage(glob1AA34, 0x5CFFFDAA, "Sua proposta foi recusada tente diminui-la");
				glob1912C[playerid] = 0;
				return 1;
			case 3:
				SendClientMessage(playerid, 0x5CFFFDAA, "Casa recusada");
				SendClientMessage(glob1AA34, 0x5CFFFDAA, "Essa casa foi recusada.Talvez outra sirva para esse jogador!");
				glob1912C[playerid] = 0;
				return 1;
			case 2:
				SendClientMessage(playerid, 0x5CFFFDAA, "Carro recusado");
				SendClientMessage(glob1AA34, 0x5CFFFDAA, "Seu carro foi recusado.Talvez o jogador queira outro modelo");
				glob1912C[playerid] = 0;
				return 1;
			case 4:
				SendClientMessage(playerid, 0x5CFFFDAA, "Proposta de resgate recusada");
				SendClientMessage(glob1AA34, 0x5CFFFDAA, "A proposta de resgate foi recusada esse jogador talvez se acostumou com o local");
				glob1912C[playerid] = 0;
				return 1;
		}
	}
	if(!strcmp(var1, "/aceitar", true))
	{
		new var7[256];
		var7 = function1A10(cmdtext, var4, 32);
		switch(glob1912C[playerid]) {
			case 0:
				SendClientMessage(playerid, 0xFFFFFFAA, "Nenhuma proposta foi oferecida a você");
				return 1;
			case 1:
				GivePlayerMoney(playerid, 0 - glob1AA2C);
				GivePlayerMoney(glob1AA34, glob1AA2C);
				SendClientMessage(playerid, 0x5CFFFDAA, "Proposta aceita");
				SendClientMessage(glob1AA34, 0x5CFFFDAA, "Sua proposta foi aceita");
				glob1912C[playerid] = 0;
				glob2A94C[playerid] = 0;
				SetSpawnInfo(playerid, 0, udb_getSkin(function705E0(playerid)), -1605.5068, 710.3071, 13.8671, 0.0, 0, 0, 0, 0, 0, 0);
				SpawnPlayer(playerid);
				udb_setED(function705E0(glob1AA34), udb_getED(function705E0(glob1AA34)) + 1);
				return 1;
			case 3:
				new Float:var8 = 0.0, Float:var9 = 0.0, Float:var10 = 0.0, Float:var11 = 0.0;
				new File:var12 = 0;
				new File:var13 = 0;
				new var14[256];
				GetPlayerPos(glob1AA34, var8, var9, var10);
				GetPlayerFacingAngle(glob1AA34, var11);
				udb_setPosition(function705E0(playerid), var8, var9, var10);
				udb_setAng(function705E0(playerid), var11);
				SendClientMessage(glob1AA34, 0x33AA33AA, "O Jogador aceitou a casa.");
				AddStaticPickup(1272, 1, var8, var9, var10);
				format(var14, 256, "AddStaticPickup(1272,1,%f %f %f) //%s\r\n", var8, var9, var10);
				var13 = fopen("icones.ini", 3);
				fwrite(var13, var14);
				fclose(var13);
				format(var14, 256, "%s te setou uma casa, digite /mudar para mudar para sua casa nova.", function705E0(glob1AA34));
				SendClientMessage(playerid, 0x33AA33AA, var14);
				format(var14, 256, "%f %f %f // %s(vendedor: %s)\r\n", var8, var9, var10, function705E0(playerid), function705E0(glob1AA34));
				var12 = fopen("reloadrpg.casas", 3);
				fwrite(var12, var14);
				fclose(var12);
				SetTimerEx("SetCasa", 10000, false, "fff", var8, var9, var10);
				glob27718[playerid] = 1;
				udb_setED(function705E0(glob1AA34), udb_getED(function705E0(glob1AA34)) + 1);
				glob1912C[playerid] = 0;
				return 1;
			case 2:
				new var8[256];
				new File:var9 = 0;
				new Float:var10 = 0.0, Float:var11 = 0.0, Float:var12 = 0.0, Float:var13 = 0.0;
				GetPlayerPos(glob1AA34, var10, var11, var12);
				GetVehicleZAngle(GetPlayerVehicleID(glob1AA34), var13);
				format(var8, 256, "%s %d %f %f %f %f %d %d // Local:\r\n", function705E0(playerid), 150340, var10, var11, var12, var13, 150344, 150348);
				var9 = fopen("reloadrpg.carros", 3);
				fwrite(var9, var8);
				fclose(var9);
				SetTimerEx("SetCar", 10000, false, "dffffdd", 150340, var10, var11, var12, var13, 150344, 150348);
				format(var8, 256, "Você vendeu um veículo(id: %d) para %s, dentro de 10 segundos ele aparecerá.", 150340, function705E0(playerid));
				SendClientMessage(glob1AA34, 0x4C62B3AA, var8);
				format(var8, 256, "%s te vendeu um veículo(id: %d).", function705E0(glob1AA34), 150340);
				SendClientMessage(playerid, 0x33AA33AA, var8);
				format(var8, 256, "* %s setou um veículo(id: %d) para %s.", function705E0(glob1AA34), 150340, function705E0(playerid));
				SendClientMessageToAll(0x4C62B3AA, var8);
				printf("O Jogador %s setou um veiculo(id: %d) para %s.", function705E0(glob1AA34), 150340, function705E0(playerid));
				udb_setED(function705E0(glob1AA34), udb_getED(function705E0(glob1AA34)) + 1);
				glob1912C[playerid] = 0;
				return 1;
			case 4:
				SendClientMessage(playerid, 0x33AA33AA, "Você pagou o dinheiro do resgate e foi solto");
				SendClientMessage(glob1AA34, 0x33AA33AA, "Proposta de resgate aceita");
				LogarPlayer(playerid);
				GivePlayerMoney(glob1AA34, glob1AA30);
				GivePlayerMoney(playerid, 0 - glob1AA30);
				glob1912C[playerid] = 0;
				udb_setED(function705E0(glob1AA34), udb_getED(function705E0(glob1AA34)) + 1);
				return 1;
		}
	}
	if(!strcmp(var1, "/camera", true))
	{
		if(IsPlayerAdmin(playerid))
		{
			GivePlayerWeapon(playerid, 43, 100);
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não tem permissão");
		return 1;
	}
	if(!strcmp(var1, "/setprof", true) && IsPlayerConnected(playerid))
	{
		if(IsPlayerAdmin(playerid) == 1)
		{
			new var7[256];
			new var8 = 0;
			new var9 = 0;
			new var10[256];
			var7 = function1A10(cmdtext, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/setprof [id] [prof]");
				return 1;
			}
			var8 = strval(var7);
			var7 = function1A10(cmdtext, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/setprof [id] [prof]");
				return 1;
			}
			var9 = strval(var7);
			if(IsPlayerConnected(var8))
			{
				if(var9 > 0 && var9 < 61)
				{
					udb_setProf(function705E0(var8), var9);
					format(var10, 256, "Você mudou a profissão de %s para %s(id:%d)", function705E0(var8), glob4E08[var9][0], var9);
					SendClientMessage(playerid, 0x33AA33AA, var10);
					format(var10, 256, "Você mudou sua profissao para %s para mais informaçoes digite /profissao", glob4E08[var9][0]);
					SendClientMessage(var8, 0x33AA33AA, var10);
					glob2AF8C[var8] = var9;
					udb_setSkin(function705E0(var8), glob8D0C[var9]);
					LogarPlayer(var8);
					SpawnPlayer(var8);
					SetPlayerPos(var8, glob896C[var9][0], glob896C[var9][1], glob896C[var9][2]);
					return 1;
				}
				SendClientMessage(playerid, 0xDD0000FF, "Essa não é uma profisssão válida!");
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Jogador não está conectado/logado");
		}
		else
		{
			SendClientMessage(playerid, 0xDD0000FF, "Você não tem permissão para isso!");
		}
		return 1;
	}
	if(!strcmp(var1, "/seradmin", true))
	{
		SendClientMessage(playerid, 0xFFFFFFAA, "SERVER: You are logged in as admin");
		return 1;
	}
	if(!strcmp(var1, "/addxl", true))
	{
		if(IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8 = 0;
			new var9 = 0;
			var7 = function1A10(cmdtext, var4, 32);
			var8 = strval(var7);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/addxl [id] [quantia]");
				return 1;
			}
			var7 = function1A10(cmdtext, var4, 32);
			var9 = strval(var7);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/addxl [id] [quantia]");
				return 1;
			}
			if(IsPlayerConnected(var8))
			{
				udb_setXP(function705E0(var8), var9 + udb_getXP(function705E0(var8)));
				new var10[256];
				format(var10, 256, "%s aumentou %d do XL de %s", function705E0(playerid), var9, function705E0(var8));
				SendClientMessageToAll(0x33AA33AA, var10);
				udb_setNM(function705E0(var8), 0);
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Jogador não conectado/logado");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não tem permissão");
		return 1;
	}
	if(!strcmp(var1, "/tirarxl", true))
	{
		if(IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8 = 0;
			new var9 = 0;
			var7 = function1A10(cmdtext, var4, 32);
			var8 = strval(var7);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/tirarxl [id] [quantia]");
				return 1;
			}
			var7 = function1A10(cmdtext, var4, 32);
			var9 = strval(var7);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/tirarxl [id] [quantia]");
				return 1;
			}
			if(IsPlayerConnected(var8))
			{
				udb_setXP(function705E0(var8), udb_getXP(function705E0(var8)) - var9);
				new var10[256];
				format(var10, 256, "%s tirou %d do XL de %s", function705E0(playerid), var9, function705E0(var8));
				SendClientMessageToAll(0x33AA33AA, var10);
				udb_setNM(function705E0(var8), 0);
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Jogador não conectado/logado");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não tem permissão");
		return 1;
	}
	if(!strcmp(var1, "/trazer", true))
	{
		if(IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8 = 0;
			var7 = function1A10(cmdtext, var4, 32);
			var8 = strval(var7);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xFFFFFFAA, "/trazer [id]");
				return 1;
			}
			if(IsPlayerConnected(var8))
			{
				new Float:var9 = 0.0, Float:var10 = 0.0, Float:var11 = 0.0;
				GetPlayerPos(playerid, var9, var10, var11);
				SetPlayerPos(var8, var9, var10, var11);
				SendClientMessage(playerid, 0xFFFFFFAA, "Você trouxe alguem");
				SendClientMessage(var8, 0xFFFFFFAA, "Um admin lhe levou até ele");
				return 1;
			}
			SendClientMessage(playerid, 0xFFFFFFAA, "Jogador não conectado/logado");
			return 1;
		}
		SendClientMessage(playerid, 0xFFFFFFAA, "Você não tem permissão");
		return 1;
	}
	if(!strcmp(var1, "/ir", true))
	{
		if(IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8 = 0;
			var7 = function1A10(cmdtext, var4, 32);
			var8 = strval(var7);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xFFFFFFAA, "/ir [id]");
				return 1;
			}
			if(IsPlayerConnected(var8))
			{
				new Float:var9 = 0.0, Float:var10 = 0.0, Float:var11 = 0.0;
				GetPlayerPos(var8, var9, var10, var11);
				SetPlayerPos(playerid, var9, var10, var11);
				SendClientMessage(playerid, 0xFFFFFFAA, "Você foi até alguem");
				SendClientMessage(var8, 0xFFFFFFAA, "Um admin foi até você");
				return 1;
			}
			SendClientMessage(playerid, 0xFFFFFFAA, "Jogador não conectado/logado");
			return 1;
		}
		SendClientMessage(playerid, 0xFFFFFFAA, "Você não tem permissão");
		return 1;
	}
	if(!strcmp(var1, "/colete", true))
	{
		if(glob2AF8C[playerid] == 17 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8 = 0;
			var7 = function1A10(cmdtext, var4, 32);
			var8 = strval(var7);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/colete [id]");
				return 1;
			}
			if(IsPlayerConnected(var8))
			{
				if(var8 != playerid)
				{
					SetPlayerArmour(var8, 100.0);
					SendClientMessage(playerid, 0x33AA33AA, "Colete vendido");
					SendClientMessage(var8, 0x33AA33AA, "Você recebeu um colete");
					return 1;
				}
				SendClientMessage(playerid, 0xDD0000FF, "Você não pode vender colete para si mesmo");
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Jogador não conectado/logado");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não tem permissão");
		return 1;
	}
	if(!strcmp(var1, "/camuflar", true))
	{
		if(glob2AF8C[playerid] == 17 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8[256];
			new var9 = 0;
			new var10 = 0;
			var7 = function1A10(cmdtext, var4, 32);
			var9 = strval(var7);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/camuflar [id] [tempo]");
				return 1;
			}
			var7 = function1A10(cmdtext, var4, 32);
			var10 = strval(var8);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/camuflar [id] [tempo]");
				return 1;
			}
			if(IsPlayerConnected(var9))
			{
				if(var9 != playerid)
				{
					if(0 < var10)
					{
						SetPlayerColor(var9, 0x00000000);
						SendClientMessage(playerid, 0x33AA33AA, "Camuflagem feita");
						new var11[256];
						format(var11, 256, "%s lhe camuflou por %d minutos", function705E0(playerid), var10);
						SendClientMessage(var9, 0x33AA33AA, var11);
						SetTimerEx("Fimcamuflagem", var10 * 60000, false, "dd", playerid, var9);
						return 1;
					}
					SendClientMessage(playerid, 0xDD0000FF, "Tempo inválido!");
					return 1;
				}
				SendClientMessage(playerid, 0xDD0000FF, "Você não pode se auto-camuflar");
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Jogador não conectado/logado");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não tem permissão");
		return 1;
	}
	if(!strcmp(var1, "/setarma", true))
	{
		if(glob2AF8C[playerid] == 17 || IsPlayerAdmin(playerid))
		{
			new var7[256], var8[256], var9[256];
			new var10[256];
			var7 = function1A10(cmdtext, var4, 32);
			var8 = function1A10(cmdtext, var4, 32);
			var9 = function1A10(cmdtext, var4, 32);
			if(!strlen(var7) || !strlen(var8))
			{
				SendClientMessage(playerid, 0xDD0000FF, "Especifique ao menos um jogador e uma arma!");
				return 1;
			}
			if(strval(var8) < 1 || strval(var8) > 46 || strval(var8) == 39 || strval(var8) == 40)
			{
				SendClientMessage(playerid, 0xDD0000FF, "Arma inválida.");
				return 1;
			}
			if(glob2AF8C[strval(var7)] == 17)
			{
				SendClientMessage(playerid, 0xDD0000FF, "Você não pode vender armas para outro vendedor.");
				return 1;
			}
			if(!IsPlayerConnected(strval(var7)))
			{
				SendClientMessage(playerid, 0xDD0000FF, "Jogador não conectado.");
				return 1;
			}
			format(var10, 256, "%s te vendeu uma arma.", function705E0(playerid));
			SendClientMessage(strval(var7), 0x33AA33AA, var10);
			format(var10, 256, "Você vendeu uma arma para %s .", playerid);
			SendClientMessage(playerid, 0x33AA33AA, var10);
			udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
			if(!strval(var9))
			{
				GivePlayerWeapon(strval(var7), strval(var8), 100);
				return 1;
			}
			GivePlayerWeapon(strval(var7), strval(var8), strval(var9));
			udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
			return 1;
		}
	}
	if(!strcmp(cmdtext, "/limparchat", true) && IsPlayerAdmin(playerid))
	{
		SendClientMessageToAll(0xDD0000FF, " ");
		SendClientMessageToAll(0xDD0000FF, " ");
		SendClientMessageToAll(0xDD0000FF, " ");
		SendClientMessageToAll(0xDD0000FF, " ");
		SendClientMessageToAll(0xDD0000FF, " ");
		SendClientMessageToAll(0xDD0000FF, " ");
		SendClientMessageToAll(0xDD0000FF, " ");
		SendClientMessageToAll(0xDD0000FF, " ");
		SendClientMessageToAll(0xDD0000FF, " ");
		SendClientMessageToAll(0xDD0000FF, "Chat Limpado!");
		return 1;
	}
	if(!strcmp(var1, "/teleportar", true))
	{
		if(IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8 = 0, var9 = 0;
			new Float:var10 = 0.0, Float:var11 = 0.0, Float:var12 = 0.0;
			var7 = function1A10(cmdtext, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/teleportar [id] [id_destino]");
				return 1;
			}
			var8 = strlen(var7);
			var9 = strlen(var7);
			if(IsPlayerConnected(var8))
			{
				if(IsPlayerConnected(var8))
				{
					SendClientMessage(playerid, 0x33AA33AA, "Feito.");
					GetPlayerPos(var8, var10, var11, var12);
					SetPlayerPos(var9, var10, var11, var12);
					SetPlayerInterior(var9, GetPlayerInterior(var8));
					printf("%s teleportou %s a %s", function705E0(playerid), function705E0(var8), function705E0(var9));
					return 1;
				}
				SendClientMessage(playerid, 0xDD0000FF, "Jogador não conectado/logado");
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Jogador não conectado/logado");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não tem permissão!");
		return 1;
	}
	if(!strcmp(var1, "/matar", true))
	{
		if(IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8 = 0;
			var7 = function1A10(cmdtext, var4, 32);
			var8 = strval(var7);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xF0E68CAA, "/matar [id]");
				return 1;
			}
			if(IsPlayerConnected(var8))
			{
				SetPlayerHealth(var8, 0.0);
				SendClientMessage(playerid, 0xFFFFFFAA, "Morte feita");
				SendClientMessage(var8, 0xFFFFFFAA, "Você foi morto por um admin");
				return 1;
			}
		}
		else
		{
			SendClientMessage(playerid, 0x7585C0AA, "Jogador não conectado/logado");
			return 1;
		}
	}
	if(!strcmp(var1, "/dinheiro", true))
	{
		if(IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8[256];
			new var9 = 0;
			new var10 = 0;
			var7 = function1A10(cmdtext, var4, 32);
			var8 = function1A10(cmdtext, var4, 32);
			var9 = strval(var7);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xFFFFFFAA, "/dinheiro [id] [quantia]");
				return 1;
			}
			var10 = strval(var8);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xFFFFFFAA, "/dinheiro [id] [quantia]");
				return 1;
			}
			if(IsPlayerConnected(var9))
			{
				GivePlayerMoney(var9, var10);
				new var11[256];
				SendClientMessage(var9, 0xFFFFFFAA, "Um admin lhe entregou uma grana");
				SendClientMessage(playerid, 0xFFFFFFAA, "Grana entregue");
				format(var11, 256, " O admin %s deu $%d para %s", function705E0(playerid), var10, function705E0(var9));
				SendClientMessageToAll(0x4C62B3AA, var11);
				return 1;
			}
		}
		else
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Jogador não conectado/logado");
			return 1;
		}
	}
	if(!strcmp(var1, "/spvehicle", true))
	{
		if(IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8 = 0;
			new var9 = 0;
			var7 = function1A10(cmdtext, var4, 32);
			var8 = strval(var7);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xFFFFFFAA, "/spvehicle [id]");
				return 1;
			}
			var9 = GetPlayerVehicleID(var8);
			if(IsPlayerConnected(var8))
			{
				if(IsPlayerInVehicle(var8, var9))
				{
					SetVehicleToRespawn(var9);
					SendClientMessage(playerid, 0xF0E68CAA, "Carro spawnado");
					SendClientMessage(var8, 0xF0E68CAA, "Seu carro foi spawnado por um admin");
					return 1;
				}
			}
			else
			{
				SendClientMessage(playerid, 0x7585C0AA, " O jogador não está em um veiculo");
				return 1;
			}
		}
	}
	if(!strcmp(var1, "/spawnid", true))
	{
		if(IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8 = 0;
			var7 = function1A10(cmdtext, var4, 32);
			var8 = strval(var7);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xFFFFFFAA, "spawnid [id]");
				return 1;
			}
			if(IsPlayerConnected(var8))
			{
				LogarPlayer(var8);
				SendClientMessage(playerid, 0x0099FFAA, "Spawn feito");
				SendClientMessage(var8, 0x0099FFAA, "Você foi spawnado por um admin");
				return 1;
			}
		}
		else
		{
			SendClientMessage(playerid, 0x7585C0AA, "Jogador não conectado/logado");
			return 1;
		}
	}
	if(!strcmp(var1, "/destruir", true))
	{
		if(IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8 = 0;
			new var9 = 0;
			var7 = function1A10(cmdtext, var4, 32);
			var8 = strval(var7);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xFFFFFFAA, "Selecione um jogador para usar esse comando");
				return 1;
			}
			var9 = GetPlayerVehicleID(var8);
			if(IsPlayerConnected(var8))
			{
				if(IsPlayerInVehicle(var8, var9))
				{
					SetVehicleHealth(var9, 0.0);
					SendClientMessage(playerid, 0xFFFFFFAA, "Carro Destruido");
					SendClientMessage(var8, 0xFFFFFFAA, "Seu veiculo foi destruido por um admin");
					return 1;
				}
			}
			else
			{
				SendClientMessage(playerid, 0x7585C0AA, "O jogador não está em um veiculo");
				return 1;
			}
		}
		else
		{
			SendClientMessage(playerid, 0x7585C0AA, "Jogador não conectado/logado");
			return 1;
		}
	}
	if(!strcmp(var1, "/criarcarro", true))
	{
		if(IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8 = 0;
			var7 = function1A10(cmdtext, var4, 32);
			var8 = strval(var7);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xFFFFFFAA, "/criarcarro [id do carro]");
				return 1;
			}
			if(var8 > 399 && var8 < 611)
			{
				new Float:var9 = 0.0, Float:var10 = 0.0, Float:var11 = 0.0;
				GetPlayerPos(playerid, var9, var10, var11);
				CreateVehicle(var8, 2.5 + var9, var10, 1.0 + var11, 0.0, 0, 0, 0);
				SendClientMessage(playerid, 0xBC8F8FAA, "Veiculo criado");
				printf("Admin %s criou um carro (id: %d )", function705E0(playerid), var8);
				return 1;
			}
			SendClientMessage(playerid, 0x7585C0AA, "Carro Invalido");
			return 1;
		}
		SendClientMessage(playerid, 0x7585C0AA, "Você não tem permissao");
		return 1;
	}
	if(!strcmp(var1, "/admcmds", true) && IsPlayerAdmin(playerid))
	{
		SendClientMessage(playerid, 0xFFFFFFAA, "Comandos de administradores do [MPA]Furious RPG");
		SendClientMessage(playerid, 0xD7DFFFAA, "/addxl [id] [quantia] : Adiciona XL a alguem.");
		SendClientMessage(playerid, 0xD7DFFFAA, "/tirarxl [id] [quantia] : Tira XL de alguem.");
		SendClientMessage(playerid, 0xD7DFFFAA, "/calar [id] : Dexa alguem mudo.");
		SendClientMessage(playerid, 0xD7DFFFAA, "/descalar [id] : Dexa alguem falar.");
		SendClientMessage(playerid, 0xD7DFFFAA, "/matar [id] : Mata alguem.");
		SendClientMessage(playerid, 0xFFFFFFAA, "Digite /admcmds2 para mais comandos de admin");
		return 1;
	}
	if(!strcmp(var1, "/admcmds2", true) && IsPlayerAdmin(playerid))
	{
		SendClientMessage(playerid, 0xFFFFFFAA, "Comandos de administradores do [MPA]Furious RPG");
		SendClientMessage(playerid, 0xD7DFFFAA, "/paralisar: Paralisa um jogador.");
		SendClientMessage(playerid, 0xD7DFFFAA, "/desparalisar : Desparalisa um jogador.");
		SendClientMessage(playerid, 0xD7DFFFAA, "/destruir : Destroi o carro de um jogador OBS:ele tem que estar dentro dele.");
		SendClientMessage(playerid, 0xD7DFFFAA, "/spvehicle : Spawna o carro de um jogador OBS:ele tem que estar dentro dele.");
		SendClientMessage(playerid, 0xD7DFFFAA, "/spawnid : Spawna um jogador.");
		SendClientMessage(playerid, 0xFFFFFFAA, "Digite /admcmds3 para mais comandos de admin");
		return 1;
	}
	if(!strcmp(var1, "/admcmds3", true) && IsPlayerAdmin(playerid))
	{
		SendClientMessage(playerid, 0xFFFFFFAA, "Comandos de administradores do [MPA]Furious RPG");
		SendClientMessage(playerid, 0xD7DFFFAA, "/criarcarro [id do carro] : Cria um carro.");
		SendClientMessage(playerid, 0xD7DFFFAA, "/dinheiro [id] [quantia] : Da dinheiro pra alguem.");
		SendClientMessage(playerid, 0xFFFFFFAA, "Estes sao os comandos de admins do server");
		return 1;
	}
	if(!strcmp(var1, "/resetarmas", true) && IsPlayerAdmin(playerid))
	{
		new var7[256];
		new var8 = 0;
		var7 = function1A10(cmdtext, var4, 32);
		if(!strlen(var7))
		{
			SendClientMessage(playerid, 0xDD0000FF, "/resetarmas [id]");
			return 1;
		}
		SendClientMessage(playerid, 0xFFFFFFAA, "Feito.");
		SendClientMessage(var8, 0xDD0000FF, "Agora você não tem mais nem uma arma em mãos.");
		ResetPlayerWeapons(var8);
		return 1;
	}
	if(!strcmp(var1, "/textall", true) && IsPlayerAdmin(playerid))
	{
		new var7[256];
		strmid(var7, cmdtext, 8, strlen(cmdtext), 256);
		if(!strlen(var7))
		{
			SendClientMessage(playerid, 0xDD0000FF, "/textall [mensagem]");
			return 1;
		}
		SendClientMessage(playerid, 0xFFFFFFAA, "Feito.");
		format(var7, 256, "%s", var7);
		GameTextForAll(var7, 3000, 2);
		return 1;
	}
	if(!strcmp(var1, "/desparalizar", true) && IsPlayerAdmin(playerid))
	{
		new var7[256];
		new var8 = 0;
		var7 = function1A10(cmdtext, var4, 32);
		if(!strlen(var7))
		{
			SendClientMessage(playerid, 0xDD0000FF, "/desparalizar [id]");
			return 1;
		}
		if(IsPlayerConnected(var8))
		{
			glob233D0[var8] = 1;
			SendClientMessage(playerid, 0xFFFFFFAA, "Feito.");
			SendClientMessage(var8, 0xDD0000FF, "Um Admin te desparalizou, não faça mais bobagem ou será paralizado novamente.");
			TogglePlayerControllable(var8, true);
			return 1;
		}
		SendClientMessage(playerid, 0x7585C0AA, "Jogador não conectado/logado");
		return 1;
	}
	if(!strcmp(var1, "/paralizar", true) && IsPlayerAdmin(playerid))
	{
		new var7[256];
		new var8 = 0;
		var7 = function1A10(cmdtext, var4, 32);
		if(!strlen(var7))
		{
			SendClientMessage(playerid, 0xDD0000FF, "/paralizar [id]");
			return 1;
		}
		if(IsPlayerConnected(var8))
		{
			glob233D0[var8] = 1;
			SendClientMessage(playerid, 0xFFFFFFAA, "Feito.");
			SendClientMessage(var8, 0xDD0000FF, "Um Admin te paralizou, ficará assim até que te desparalize.");
			TogglePlayerControllable(var8, false);
			return 1;
		}
		SendClientMessage(playerid, 0x7585C0AA, "Jogador não conectado/logado");
		return 1;
	}
	if(!strcmp(var1, "/setskin", true))
	{
		if(IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8 = 0, var9 = 0;
			var7 = function1A10(cmdtext, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/setskin [id] [skin]");
				return 1;
			}
			var8 = strval(var7);
			var7 = function1A10(cmdtext, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/setskin [id] [skin]");
				return 1;
			}
			var9 = strval(var7);
			if(var9 >= 289)
			{
				SendClientMessage(playerid, 0xDD0000FF, "ID de skin inválido!");
				return 1;
			}
			if(IsPlayerConnected(var8))
			{
				udb_setSkin(function705E0(var8), var9);
				SendClientMessage(playerid, 0x33AA33AA, "Skin Setado.");
				SendClientMessage(var8, 0x33AA33AA, "Agora você tem um skin novo!");
				SetPlayerSkin(var8, var9);
				printf("%s(id: %d) setou a %s(id: %d) um skin novo", function705E0(playerid), playerid, function705E0(var8), var8);
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "O jogador não está conectado!");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não tem permissão para isso");
		return 1;
	}
	if(!strcmp(var1, "/assaltar", true))
	{
		if(glob2AF8C[playerid] == 14)
		{
			new var7[256];
			new var8[256];
			var7 = function1A10(cmdtext, var4, 32);
			if(glob1A70C[playerid] == 1 || glob30A5C[playerid] == 1)
			{
				if(!glob2FDDC[playerid])
				{
					GivePlayerMoney(playerid, 1000);
					glob2FDDC[playerid] = 1;
					SendClientMessage(playerid, 0xFE684BFF, "Assalto Concluido");
					format(var8, 256, "AVISO AOS POLICIAIS: %s acabou de assaltar um banco ou mercado e foi posto na lista dos procurados, é bom vocês agirem logo", function705E0(playerid));
					SendClientMessageToAll(0x4C62B3AA, var8);
					SetTimerEx("assaltar", 300000, false, "d", playerid);
					udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
					return 1;
				}
				SendClientMessage(playerid, 0xFE684BFF, "Espere mais tempo para assaltar novamente");
				return 1;
			}
			SendClientMessage(playerid, 0xFE684BFF, "Você deve estar em um banco ou mercado para usar este comando");
			return 1;
		}
		SendClientMessage(playerid, 0xFE684BFF, "Você não tem permissão");
		return 1;
	}
	if(!strcmp(var1, "/roubar", true))
	{
		if(glob2AF8C[playerid] == 14 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8 = 0, var9 = 0;
			var7 = function1A10(cmdtext, var4, 32);
			var8 = strval(var7);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/roubar [id] [quantia]");
				return 1;
			}
			var7 = function1A10(cmdtext, var4, 32);
			var9 = strval(var7);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/roubar [id] [quantia]");
				return 1;
			}
			if(IsPlayerConnected(var8))
			{
				if(GetPlayerMoney(var8) >= var9)
				{
					if(!glob300FC[playerid])
					{
						glob300FC[playerid] = 1;
						GivePlayerMoney(playerid, var9);
						GivePlayerMoney(var8, 0 - var9);
						udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
						new var10[256];
						format(var10, 256, "%s lhe assaltou roubando R$%d rápido chame a polícia.", function705E0(playerid), var9);
						SendClientMessage(var8, 0xDD0000FF, var10);
						SendClientMessage(playerid, 0xFFFFFFAA, "Roubo concluído! Agora fuja antes que o jogador indicado resolva chamar os policiais.");
						return 1;
					}
					SendClientMessage(playerid, 0xDD0000FF, "Você ja roubou alguém espere a poeira abaixar para roubar novamente.");
					return 1;
				}
				SendClientMessage(playerid, 0xDD0000FF, "O Jogador indicado não possue essa quantia de dinheiro nas mãos.");
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Jogador não conectado/logado.");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não tem permissão.");
		return 1;
	}
	if(!strcmp(var1, "/segurar", true))
	{
		if(glob2AF8C[playerid] == 37 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8 = 0, var9 = 0;
			new var10[256];
			var7 = function1A10(cmdtext, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/segurar [id] [minutos]");
				return 1;
			}
			var9 = strval(var7);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/segurar [id] [minutos]");
				return 1;
			}
			strval(var7);
			if(var9 * 20 < GetPlayerMoney(var8))
			{
				SendClientMessage(playerid, 0xDD0000FF, "O Jogador que você quer segurar não esse dinheiro em mãos.");
				return 1;
			}
			strval(var7);
			if(var9 >= 1)
			{
				SendClientMessage(playerid, 0xDD0000FF, "Tempo mínimo de 1 minuto.");
				return 1;
			}
			var8 = strlen(var7);
			if(IsPlayerConnected(var8) && glob1A0CC[var8] == 1)
			{
				if(GetDistanceBetweenPlayers(var8, playerid) > 15)
				{
					SendClientMessage(playerid, 0xDD0000FF, "Chegue mais perto.");
					return 1;
				}
				if(var8 == playerid)
				{
					SendClientMessage(playerid, 0xDD0000FF, "Você não pode vender seguros para você mesmo.");
					return 1;
				}
				glob236F0[var8] = 1;
				SendClientMessage(playerid, 0xFFF297AA, "Segurado.");
				format(var10, 256, "%s te vendeu um seguro de vida e cobrou R$500, agora quando morrer não vai mais gastar dinheiro com hospital (até o proximo gmx).", function705E0(playerid));
				SendClientMessage(var8, 0x4C62B3AA, var10);
				GivePlayerMoney(playerid, 500);
				GivePlayerMoney(var8, -500);
				SetTimer("Segurado", var9 * 60000, false);
				udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Jogador não conectado/logado");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não é Segurador!");
		return 1;
	}
	if(!strcmp(var1, "/segurarcarro", true))
	{
		if(glob2AF8C[playerid] == 37 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8 = 0;
			new var9 = 0;
			var7 = function1A10(cmdtext, var4, 32);
			var9 = strval(var7);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xEEFFC4AA, "/segurarcarro [id]");
				return 1;
			}
			var8 = GetPlayerVehicleID(var9);
			if(IsPlayerInVehicle(var9, var8))
			{
				if(!glob23A10[var8])
				{
					if(var9 != playerid)
					{
						if(GetPlayerMoney(var9) >= 400)
						{
							SendClientMessage(playerid, 0xEEFFC4AA, "Carro segurado você recebeu $400 pelo trabalho");
							SendClientMessage(var9, 0xEEFFC4AA, "Seu carro foi segurado e você pagou $400 pelo trabalho");
							GivePlayerMoney(var9, -400);
							GivePlayerMoney(playerid, 400);
							udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
							return 1;
						}
						SendClientMessage(playerid, 0xDD0000FF, "Esse jogador não possue dinheiro.");
						return 1;
					}
					SendClientMessage(playerid, 0xDD0000FF, "Você não pode vender seguros para você mesmo.");
					return 1;
				}
				SendClientMessage(playerid, 0xDD0000FF, "Este carro ja possue seguro!");
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "O jogador precisa estar em um veiculo.");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não é Segurador");
		return 1;
	}
	if(!strcmp(var1, "/selllatas", true))
	{
		if(glob2AF8C[playerid] == 52 || glob2AF8C[playerid] == 34 || IsPlayerAdmin(playerid))
		{
			if(glob374E0[playerid] == 1)
			{
				GivePlayerMoney(playerid, glob33FB4[playerid] * 100);
				new var7[256];
				format(var7, 256, "Você vendeu %d latinhas e recebeu $%d por isso", 212916, glob33FB4[playerid] * 100);
				SendClientMessage(playerid, 0xFFFFFFAA, var7);
				glob33FB4[playerid] = 0;
				udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Você não esta na area de reciclagem");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não tem permissão");
		return 1;
	}
	if(!strcmp(var1, "/socorrer", true))
	{
		if(glob2AF8C[playerid] == 6 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8 = 0;
			new var9[256];
			var7 = function1A10(cmdtext, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/socorrer [id]");
				return 1;
			}
			strval(var7);
			if(GetPlayerMoney(var8) > 20)
			{
				SendClientMessage(playerid, 0xDD0000FF, "O Jogador que você quer socorrer não tem o dinheiro da consulta em mãos.");
				return 1;
			}
			if(var8 == playerid)
			{
				SendClientMessage(playerid, 0xDD0000FF, "Você não pode vender para você mesmo");
				return 1;
			}
			var8 = strlen(var7);
			if(IsPlayerConnected(var8) && glob1A0CC[var8] == 1)
			{
				if(GetDistanceBetweenPlayers(var8, playerid) > 10)
				{
					SendClientMessage(playerid, 0xDD0000FF, "Chegue mais perto.");
					return 1;
				}
				SendClientMessage(playerid, 0xFFF297AA, "Socorrido.");
				format(var9, 256, "%s encheu sua vida e cobrou R$20.", function705E0(playerid));
				SendClientMessage(var8, 0x4C62B3AA, var9);
				GivePlayerMoney(playerid, 20);
				GivePlayerMoney(var8, -20);
				udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Jogador não conectado/logado");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não é Paramedico!");
		return 1;
	}
	if(!strcmp(var1, "/verpassagem", true))
	{
		if(glob2AF8C[playerid] == 33)
		{
			new var7[256];
			new var8 = 0;
			new var9[256];
			var7 = function1A10(cmdtext, var4, 32);
			var8 = strval(var7);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/verpassagem [id]");
				return 1;
			}
			if(IsPlayerConnected(var8))
			{
				if(!glob3041C[var8])
				{
					format(var9, 256, "Passagem de %s não encontrada.", function705E0(playerid));
					SendClientMessage(playerid, 0x33AA33AA, var9);
					return 1;
				}
				if(glob3041C[var8] == 1)
				{
					format(var9, 256, "Passagem de %s encontrada.", function705E0(playerid));
					SendClientMessage(playerid, 0x33AA33AA, var9);
					return 1;
				}
			}
			else
			{
				SendClientMessage(playerid, 0xDD0000FF, "Jogador não conectado/logado");
				return 1;
			}
			return 1;
		}
	}
	if(!strcmp(var1, "/progressosflv", true))
	{
		if(glob2AF8C[playerid] == 33)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, -182.4271, 1019.64, 19.6816, 2.5);
			glob187CC[playerid] = 19;
			SendClientMessage(playerid, 0x33AA33AA, "Vá para o checkpoint na rodoviaria de Forst Cason");
			return 1;
		}
		SendClientMessage(playerid, 0x0099FFAA, "Você não tem permissao");
		return 1;
	}
	if(!strcmp(var1, "/progressolvsf", true))
	{
		if(glob2AF8C[playerid] == 33)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, -182.4271, 1019.64, 19.6816, 2.5);
			glob187CC[playerid] = 19;
			SendClientMessage(playerid, 0x33AA33AA, "Vá para o checkpoint na rodoviaria de Forst Cason");
			return 1;
		}
		SendClientMessage(playerid, 0x0099FFAA, "Você não tem permissao");
		return 1;
	}
	if(!strcmp(var1, "/terminais", true))
	{
		if(glob2AF8C[playerid] == 33)
		{
			ShowMenuForPlayer(glob1E8C4, playerid);
			return 1;
		}
		SendClientMessage(playerid, 0xFFFFFFAA, "Você não tem permissao");
		return 1;
	}
	if(!strcmp(var1, "/passagem", true))
	{
		if(glob2AF8C[playerid] == 33 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8[256];
			new var9 = 0;
			var9 = strval(var7);
			var7 = function1A10(cmdtext, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0x66E3DFAA, "/passagem [id]");
				return 1;
			}
			if(!IsPlayerConnected(var9))
			{
				SendClientMessage(playerid, 0x66E3DFAA, "O jogador que você indicou não está conectado.");
				return 1;
			}
			if(var9 == playerid)
			{
				SendClientMessage(playerid, 0xDD0000FF, "Você não pode vender para você mesmo");
				return 1;
			}
			if(glob3041C[var9] == 1)
			{
				SendClientMessage(playerid, 0xDD0000FF, "O Jogador indicado já possue passagem");
				return 1;
			}
			if(GetDistanceBetweenPlayers(playerid, var9) > 20)
			{
				SendClientMessage(playerid, 0xDD0000FF, "Chegue mais perto para vender a passagem.");
				return 1;
			}
			glob3041C[var9] = 1;
			SendClientMessage(playerid, 0x66E3DFAA, "Passagem Vendida!");
			format(var8, 256, "Você recebeu uma passagem de %s.", function705E0(playerid));
			SendClientMessage(var9, 0xFFFFFFAA, var8);
			udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
		}
		else
		{
			SendClientMessage(playerid, 0xDD0000FF, "Você não tem permissão para isso!");
			return 1;
		}
		return 1;
	}
	if(!strcmp(var1, "/recolherpass", true))
	{
		if(glob2AF8C[playerid] == 33 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8[256];
			new var9 = 0;
			var9 = strval(var7);
			var7 = function1A10(cmdtext, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/recolherpass [id]");
				return 1;
			}
			if(!IsPlayerConnected(var9))
			{
				SendClientMessage(playerid, 0xDD0000FF, "O jogador que você indicou não está conectado.");
				return 1;
			}
			if(GetDistanceBetweenPlayers(playerid, var9) > 20)
			{
				SendClientMessage(playerid, 0xDD0000FF, "Chege mais perto para recolher a passagem.");
				return 1;
			}
			glob3041C[var9] = 0;
			SendClientMessage(playerid, 0x66E3DFAA, "Passagem Recolhida!");
			format(var8, 256, "Sua passagem foi recolhida por %s.", function705E0(playerid));
			SendClientMessage(var9, 0x33AA33AA, var8);
		}
		else
		{
			SendClientMessage(playerid, 0xDD0000FF, "Você não é Motorista de Onibus!");
			return 1;
		}
		return 1;
	}
	if(!strcmp(var1, "/ajuda", true))
	{
		SendClientMessage(playerid, 0x4C62B3AA, "Ajuda?");
		SendClientMessage(playerid, 0xF0E68CAA, "/comandos : comandos do RPG");
		SendClientMessage(playerid, 0xF0E68CAA, "/registrar [senha] : se registra");
		SendClientMessage(playerid, 0xF0E68CAA, "/logar [senha] : se loga no jogo");
		SendClientMessage(playerid, 0xF0E68CAA, "/aprender : Mostra uma breve explicação.");
		SendClientMessage(playerid, 0xF0E68CAA, "/creditos : Vê os creditos.");
		return 1;
	}
	if(!strcmp(var1, "/creditos", true))
	{
		SendClientMessage(playerid, 0x4C62B3AA, "MPA® Reload RPG™.");
		SendClientMessage(playerid, 0x81ABABAA, "Mode unido com [MPA]Furious RPG");
		SendClientMessage(playerid, 0xFFFFFFAA, "Projeto Inicial : SolidNuts, TheHitman, Luigui e DaMNeD");
		SendClientMessage(playerid, 0xFFFFFFAA, "Projeto Atual: [MPA]Guilherme, [MPA]Rodrigo e [MPA]Rafael");
		SendClientMessage(playerid, 0xFFFFFFAA, "Agradecimentos: [MPA]VanCy, JnR, [MPA]Keninho e [TMR]MtS.");
		return 1;
	}
	if(!strcmp(var1, "/aprender", true))
	{
		SendClientMessage(playerid, 0xAFAFAFAA, "MPA® Reload RPG™");
		SendClientMessage(playerid, 0xFFFFFFAA, "Este servidor é um RPG, ou seja, simula como se fosse a vida real.");
		SendClientMessage(playerid, 0xFFFFFFAA, "Nele você arranja um emprego para ganhar dinheiro para pode comprar sua casa, carros, etc.");
		SendClientMessage(playerid, 0xFFFFFFAA, "Como na vida real, existem crimes, como roubo e morte, e neste mode a policia irá te prender caso você cometa algum crime.");
		SendClientMessage(playerid, 0xFFFFFFAA, "Você também só pode dirigir com habilitação (Terrestre, Naútica e Aérea).");
		SendClientMessage(playerid, 0xFFFFFFAA, "Caso a policia te pegue andando sem habilitação, você vai tomar uma multa e poderá até ser preso.");
		SendClientMessage(playerid, 0xFFFFFFAA, "Espero que você se divirta neste servidor. Boa diversão! =)");
		SendClientMessage(playerid, 0xFF9900AA, "Digite /ajuda ou /comandos para visualizar os comandos.");
		return 1;
	}
	if(!strcmp(cmdtext, "/veiculos", true))
	{
		SendClientMessage(playerid, 0x45804FAA, "Preços dos carros:");
		SendClientMessage(playerid, 0xF0E68CAA, "Carros pesados:  /carros1");
		SendClientMessage(playerid, 0xF0E68CAA, "Carros de Luxo de 2 portas:  /carros2");
		SendClientMessage(playerid, 0xF0E68CAA, "Carros de luxo de 4 portas:  /carros3");
		SendClientMessage(playerid, 0xF0E68CAA, "Muscle cars:  /carros4");
		SendClientMessage(playerid, 0xF0E68CAA, "Carros de rua:  /carros5");
		SendClientMessage(playerid, 0xF0E68CAA, "Carros de alta performance:  /carros6");
		SendClientMessage(playerid, 0xF0E68CAA, "Caminhões:  /carros7");
		SendClientMessage(playerid, 0x45804FAA, "Para mais Carros digite /veiculos2");
		return 1;
	}
	if(!strcmp(cmdtext, "/veiculos2", true))
	{
		SendClientMessage(playerid, 0xF0E68CAA, "Lowriders:  /carros8");
		SendClientMessage(playerid, 0xF0E68CAA, "Recreacionais:  /carros9");
		SendClientMessage(playerid, 0xF0E68CAA, "Motos:  /carros10");
		SendClientMessage(playerid, 0xF0E68CAA, "Carros publicos:  /carros11");
		SendClientMessage(playerid, 0xF0E68CAA, "Carros do Governo:  /carros12");
		SendClientMessage(playerid, 0xF0E68CAA, "Veiculos Aéreos:  /carros13");
		SendClientMessage(playerid, 0xF0E68CAA, "Veiculos Navais:  /carros14");
		return 1;
	}
	if(!strcmp(cmdtext, "/carros1", true))
	{
		SendClientMessage(playerid, 0x45804FAA, "Carros pesados:");
		SendClientMessage(playerid, 0xF0E68CAA, "400 - Landstalker $10000");
		return 1;
	}
	if(!strcmp(cmdtext, "/carros2", true))
	{
		SendClientMessage(playerid, 0x45804FAA, "Carros de Luxo de 2 portas:");
		SendClientMessage(playerid, 0xF0E68CAA, "602 - Alpha $22000");
		SendClientMessage(playerid, 0xF0E68CAA, "496 - Blista Compact $12000");
		SendClientMessage(playerid, 0xF0E68CAA, "410 - Manana $6000");
		SendClientMessage(playerid, 0xF0E68CAA, "517 - Majestic $29000");
		SendClientMessage(playerid, 0xF0E68CAA, "439 - Stallion $24000");
		SendClientMessage(playerid, 0xF0E68CAA, "587 - Euros $32000");
		return 1;
	}
	if(!strcmp(cmdtext, "/carros3", true))
	{
		SendClientMessage(playerid, 0x45804FAA, "Carros de Luxo de 4 portas:");
		SendClientMessage(playerid, 0xF0E68CAA, "445 - Admiral $17000");
		SendClientMessage(playerid, 0xF0E68CAA, "405 - Sentinel $23000");
		SendClientMessage(playerid, 0xF0E68CAA, "409 - Stretch $60000");
		return 1;
	}
	if(!strcmp(cmdtext, "/carros4", true))
	{
		SendClientMessage(playerid, 0x45804FAA, "Muscle cars:");
		SendClientMessage(playerid, 0xF0E68CAA, "402 - Buffalo $35000");
		SendClientMessage(playerid, 0xF0E68CAA, "603 - Phoenix $52000");
		SendClientMessage(playerid, 0xF0E68CAA, "475 - Sabre $10000");
		return 1;
	}
	if(!strcmp(cmdtext, "/carros5", true))
	{
		SendClientMessage(playerid, 0x45804FAA, "Carros de rua:");
		SendClientMessage(playerid, 0xF0E68CAA, "559 - Jester $50000");
		SendClientMessage(playerid, 0xF0E68CAA, "560 - Sultan $42000");
		return 1;
	}
	if(!strcmp(cmdtext, "/carros6", true))
	{
		SendClientMessage(playerid, 0x45804FAA, "Carros de alta performance:");
		SendClientMessage(playerid, 0xF0E68CAA, "541 - Bullet $45000");
		SendClientMessage(playerid, 0xF0E68CAA, "415 - Cheetah $74000");
		SendClientMessage(playerid, 0xF0E68CAA, "480 - Comet $65000");
		SendClientMessage(playerid, 0xF0E68CAA, "434 - Hotknife $60000");
		SendClientMessage(playerid, 0xF0E68CAA, "411 - Infernus $90000");
		SendClientMessage(playerid, 0xF0E68CAA, "451 - Turismo $83000");
		return 1;
	}
	if(!strcmp(cmdtext, "/carros7", true))
	{
		SendClientMessage(playerid, 0x45804FAA, "Caminhões:");
		SendClientMessage(playerid, 0xF0E68CAA, "515 - RoadTrain $43000");
		return 1;
	}
	if(!strcmp(cmdtext, "/carros8", true))
	{
		SendClientMessage(playerid, 0x45804FAA, "Lowriders:");
		SendClientMessage(playerid, 0xF0E68CAA, "536 - Blade $25000");
		SendClientMessage(playerid, 0xF0E68CAA, "534 - Remington $26000");
		SendClientMessage(playerid, 0xF0E68CAA, "535 - Slamvan $30000");
		return 1;
	}
	if(!strcmp(cmdtext, "/carros9", true))
	{
		SendClientMessage(playerid, 0x45804FAA, "Recreacionais:");
		SendClientMessage(playerid, 0xF0E68CAA, "424 - BF Injection $18000");
		SendClientMessage(playerid, 0xF0E68CAA, "444 - Monster $40000");
		SendClientMessage(playerid, 0xF0E68CAA, "471 - Quad $6000");
		return 1;
	}
	if(!strcmp(cmdtext, "/carros10", true))
	{
		SendClientMessage(playerid, 0x45804FAA, "Motos:");
		SendClientMessage(playerid, 0xF0E68CAA, "461 - PCJ-600 $10000");
		SendClientMessage(playerid, 0xF0E68CAA, "521 - FCR-900 $20000");
		SendClientMessage(playerid, 0xF0E68CAA, "463 - Freeway $12000");
		SendClientMessage(playerid, 0xF0E68CAA, "468 - Sanchez $10000");
		SendClientMessage(playerid, 0xF0E68CAA, "462 - Faggio $5000");
		SendClientMessage(playerid, 0xF0E68CAA, "522 - NRG-500 $30000");
		return 1;
	}
	if(!strcmp(cmdtext, "/carros11", true))
	{
		SendClientMessage(playerid, 0x45804FAA, "Carros públicos:");
		SendClientMessage(playerid, 0xF0E68CAA, "420 - Taxi $10000");
		SendClientMessage(playerid, 0xF0E68CAA, "437 - Coach $15000");
		return 1;
	}
	if(!strcmp(cmdtext, "/carros12", true))
	{
		SendClientMessage(playerid, 0x45804FAA, "Carros do Governo:");
		SendClientMessage(playerid, 0xF0E68CAA, "433 - Barracks $30000");
		SendClientMessage(playerid, 0xF0E68CAA, "523 - HPV-1000 $10000");
		SendClientMessage(playerid, 0xF0E68CAA, "470 - Patriot $60000");
		SendClientMessage(playerid, 0xF0E68CAA, "596 - Police $10000");
		return 1;
	}
	if(!strcmp(cmdtext, "/carros13", true))
	{
		SendClientMessage(playerid, 0x45804FAA, "Veiculos Aéreos:");
		SendClientMessage(playerid, 0xF0E68CAA, "425 - Hunter $130000");
		SendClientMessage(playerid, 0xF0E68CAA, "487 - Maverick $70000");
		SendClientMessage(playerid, 0xF0E68CAA, "497 - Police Maverick $75000");
		SendClientMessage(playerid, 0xF0E68CAA, "593 - Dodo $80000");
		SendClientMessage(playerid, 0xF0E68CAA, "519 - Shamal $132000");
		return 1;
	}
	if(!strcmp(cmdtext, "/carros14", true))
	{
		SendClientMessage(playerid, 0x45804FAA, "Veiculos Navais:");
		SendClientMessage(playerid, 0xF0E68CAA, "453 - Reefer - $40000");
		SendClientMessage(playerid, 0xF0E68CAA, "493 - Jetmax $40000");
		SendClientMessage(playerid, 0xF0E68CAA, "473 - Dinghy $50000");
		return 1;
	}
	if(!strcmp(var1, "/armas", true))
	{
		SendClientMessage(playerid, 0xFFFFFFAA, "Lista de armas do [MPA]Furious RPG");
		SendClientMessage(playerid, 0x0099FFAA, "1 Brass Knuckles $120");
		SendClientMessage(playerid, 0x0099FFAA, "2 Golf Club $150|| 3 Night Stick $100");
		SendClientMessage(playerid, 0x0099FFAA, "4 Knife $150|| 5 Baseball Bat$100");
		SendClientMessage(playerid, 0x0099FFAA, "6 Shovel $50 || 7 Pool cue$50");
		SendClientMessage(playerid, 0x0099FFAA, "8 Katana $100|| 9 Chainsaw $150");
		SendClientMessage(playerid, 0xFFFFFFAA, "Para mais armas digite /armas2");
		return 1;
	}
	if(!strcmp(var1, "/armas2", true))
	{
		SendClientMessage(playerid, 0xFFFFFFAA, "Lista de armas do [MPA]Furious RPG");
		SendClientMessage(playerid, 0xDD0000FF, "10 Purple Dildo $100");
		SendClientMessage(playerid, 0xDD0000FF, "11 White Dildo $100|| 12 Long White Dildo $100");
		SendClientMessage(playerid, 0xDD0000FF, "13 White Dildo $100 || 14 Flowers $200");
		SendClientMessage(playerid, 0xDD0000FF, "15 Cane $400|| 16 Grenades $5000 ");
		SendClientMessage(playerid, 0xDD0000FF, "17 TearGas $300 || 18 Molotovs $3000");
		SendClientMessage(playerid, 0xFFFFFFAA, "Para mais armas digite /armas3");
		return 1;
	}
	if(!strcmp(var1, "/armas3", true))
	{
		SendClientMessage(playerid, 0xFFFFFFAA, "Lista de armas do [MPA]Furious RPG");
		SendClientMessage(playerid, 0x2CCC6CAA, "22 Pistol $500");
		SendClientMessage(playerid, 0x2CCC6CAA, "23 Silenced Pistol $800 || 24 Desert Eagle $700");
		SendClientMessage(playerid, 0x2CCC6CAA, "25 Shotgun $1200||26 Sawn Off Shotgun $ 1300");
		SendClientMessage(playerid, 0x2CCC6CAA, "27 Combat Shotgun $1700 || 28 Micro Uzi (Mac 10) $ 900");
		SendClientMessage(playerid, 0x2CCC6CAA, "29 MP5 $1400|| 30 AK47 $ 1500");
		SendClientMessage(playerid, 0xFFFFFFAA, "Para mais armas digite /armas4");
		return 1;
	}
	if(!strcmp(var1, "/armas4", true))
	{
		SendClientMessage(playerid, 0xFFFFFFAA, "Lista de armas do [MPA]Furious RPG");
		SendClientMessage(playerid, 0xFE684BFF, "31 M4 $1500 || 32 Tec9 $900");
		SendClientMessage(playerid, 0xFE684BFF, "33 Rifle $1200 || 34 Sniper Rifle $1000");
		SendClientMessage(playerid, 0xFFFFFFAA, "Essas sao algumas armas do nosso mode!");
		SendClientMessage(playerid, 0xFFFFFFAA, "Se quiser uma compre com um vendedor de armas mas se for bomba");
		SendClientMessage(playerid, 0xFFFFFFAA, "fale com um vendedor de bombas.");
		return 1;
	}
	if(!strcmp(var1, "/comandos", true))
	{
		SendClientMessage(playerid, 0x4C62B3AA, "Comandos:");
		SendClientMessage(playerid, 0xF0E68CAA, "/profissoes : Mostra as profissões disponiveis.");
		SendClientMessage(playerid, 0xF0E68CAA, "/docs [id] : Mostra seus ducumentos.");
		SendClientMessage(playerid, 0xF0E68CAA, "/taxi [local] : Chama um taxí.");
		SendClientMessage(playerid, 0xF0E68CAA, "/190 [denuncia] : Faz uma denuncia para todos policiais.");
		SendClientMessage(playerid, 0xF0E68CAA, "/192 [local] : Chama uma ambulancia.");
		SendClientMessage(playerid, 0xF0E68CAA, "/abastecer [litros] : Abastece seu veículo (você deve estar no posto para usar este comando).");
		SendClientMessage(playerid, 0xF0E68CAA, "/trancar : Tranca seu veículo impossibilitando que os outros jogadores possam entrar.");
		SendClientMessage(playerid, 0xF0E68CAA, "/destrancar : Destranca seu veículo.");
		SendClientMessage(playerid, 0xC73614AA, "Para mais comandos digite /comandos2.");
		return 1;
	}
	if(!strcmp(var1, "/comandos2", true))
	{
		SendClientMessage(playerid, 0x4C62B3AA, "Comandos - Parte 2:");
		SendClientMessage(playerid, 0xF0E68CAA, "/presos : Vê a lista de jogadores presos.");
		SendClientMessage(playerid, 0xF0E68CAA, "/procurados : Vê a lista de jogadores procurados.");
		SendClientMessage(playerid, 0xF0E68CAA, "/advogado : Pede um advogado.");
		SendClientMessage(playerid, 0xF0E68CAA, "/carteiras : Vê as os preços das carteiras (você precisa estar na auto-escola).");
		SendClientMessage(playerid, 0xF0E68CAA, "/skin [id da skin] : Muda sua skin.");
		SendClientMessage(playerid, 0xF0E68CAA, "/report [id] [rasão] : Denuncia o uso de cheater aos admins.");
		SendClientMessage(playerid, 0xF0E68CAA, "/armas : Ve a lista de armas.");
		SendClientMessage(playerid, 0xF0E68CAA, "/veiculos : Ve a lista dos carros do RPG.");
		SendClientMessage(playerid, 0xC73614AA, "Para mais comandos digite /comandos3.");
		return 1;
	}
	if(!strcmp(var1, "/comandos3", true))
	{
		SendClientMessage(playerid, 0x4C62B3AA, "Comandos - Parte 3:");
		SendClientMessage(playerid, 0xF0E68CAA, "/diskdroga [local] : Chama um traficante.");
		SendClientMessage(playerid, 0xF0E68CAA, "/ligar [id] : Liga do celular para alguem.");
		SendClientMessage(playerid, 0xF0E68CAA, "/atender : Atende o celular.");
		SendClientMessage(playerid, 0xF0E68CAA, "/desligar : Desliga o celular.");
		SendClientMessage(playerid, 0xF0E68CAA, "/bebidas : Vê as bebidas do RPG.");
		SendClientMessage(playerid, 0xF0E68CAA, "/sabores : Vê os sabores de sorvete do RPG.");
		SendClientMessage(playerid, 0xF0E68CAA, "/lanches : Vê os lanches do RPG.");
		SendClientMessage(playerid, 0xF0E68CAA, "/pizzas : Vê os sabores de pizzas do RPG.");
		SendClientMessage(playerid, 0xC73614AA, "para mais comandos digite /comandos4.");
		return 1;
	}
	if(!strcmp(var1, "/comandos4", true))
	{
		SendClientMessage(playerid, 0x4C62B3AA, "Comandos - Parte 3:");
		SendClientMessage(playerid, 0xF0E68CAA, "/tomarsorvete [sabor] : Toma um sorvete (Você tem que estar na sorveteria).");
		SendClientMessage(playerid, 0xF0E68CAA, "/calculadorainfo : Vê as opções de calculadora.");
		SendClientMessage(playerid, 0xF0E68CAA, "/plantardinamite : Planta a dinamite em um veiculo (Você tem que ter uma dinamite).");
		SendClientMessage(playerid, 0xF0E68CAA, "/veiculoid : Vê o id do seu veiculo.");
		SendClientMessage(playerid, 0xC73614AA, "Esses são os comandos do RPG.");
		return 1;
	}
	if(!strcmp(var1, "/bancoinfo", true))
	{
		SendClientMessage(playerid, 0x4C62B3AA, "Comandos do Banco:");
		SendClientMessage(playerid, 0xF0E68CAA, "/depositar [quantia] : Deposita dinheiro na sua conta do banco");
		SendClientMessage(playerid, 0xF0E68CAA, "/sacar [quantia] : retira dinheiro na sua conta do banco");
		SendClientMessage(playerid, 0xF0E68CAA, "/saldo : checa seu o saldo bancário..");
		SendClientMessage(playerid, 0xF0E68CAA, "/saldocel : checa seu o saldo bancário através do seu celular, custo R$20.");
		SendClientMessage(playerid, 0xFF9900AA, "Você precisa estar em um banco para usar esses comandos, menos o /saldocel.");
		return 1;
	}
	if(!strcmp(var1, "/autoinfo", true))
	{
		if(glob26134[playerid] == 1)
		{
			SendClientMessage(playerid, 0x4C62B3AA, "Comandos da Auto-Escola:");
			SendClientMessage(playerid, 0xFFFFCCAA, "/carteiras : Vê o id das carteiras.");
			SendClientMessage(playerid, 0xFFFFCCAA, "/carteira [id_da_carteira] : Pede uma carteira.");
			SendClientMessage(playerid, 0xFF00FFAA, "As Carteiras só podem ser constatadas com teste e por um Instrutor de Direção.");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não está na Auto-Escola");
		return 1;
	}
	if(!strcmp(var1, "/baladainfo", true))
	{
		if(glob25AF0[playerid] == 1)
		{
			SendClientMessage(playerid, 0xDD0000FF, "Comandos da Balada Reload:");
			SendClientMessage(playerid, 0xF0E68CAA, "/dancar [id] : Dança na balada.");
			SendClientMessage(playerid, 0xF0E68CAA, "/bebervodka [quantia] : Bebe vodca.");
			SendClientMessage(playerid, 0xF0E68CAA, "/bebercerveja [latas] : Bebe cerveja.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Enquanto você ficar em nossa balada irá ouvir músicas.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Chame um promoter caso queira organizar uma festa em nossa balada.");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não está na Balada.");
		return 1;
	}
	if(!strcmp(var1, "/carteiras", true))
	{
		if(glob26134[playerid] == 1)
		{
			SendClientMessage(playerid, 0x4C62B3AA, "ID das Cateiras:");
			SendClientMessage(playerid, 0xF0E68CAA, "1 - Terrestre:\tR$  500");
			SendClientMessage(playerid, 0xF0E68CAA, "2 - Aerea:\t\tR$ 1200");
			SendClientMessage(playerid, 0xF0E68CAA, "3 - Nautica:\tR$  800");
			SendClientMessage(playerid, 0xFF00FFAA, "As Carteiras só podem ser constatadas com teste e por um Instrutor de Direção.");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não está na Auto -Escola");
		return 1;
	}
	if(!strcmp(var1, "/postoinfo", true))
	{
		if(glob27D58[playerid] == 1)
		{
			SendClientMessage(playerid, 0xDD0000FF, "Comandos do Posto:");
			SendClientMessage(playerid, 0xF0E68CAA, "/abastecer [litros] : Abastece seu veículo.");
			SendClientMessage(playerid, 0xF0E68CAA, "/buygalao : Compra um galão de combustivel com 15 litros para colocar em seu veículo.");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não está no Posto");
		return 1;
	}
	if(!strcmp(var1, "/pescainfo", true))
	{
		if(glob27D58[playerid] == 1)
		{
			SendClientMessage(playerid, 0x0099FFAA, "Comandos de Pesca:");
			SendClientMessage(playerid, 0xF0E68CAA, "/pescar : Pesca(você precisa estar na área de pesca).");
			SendClientMessage(playerid, 0xF0E68CAA, "/sellpesca : Vende sua pesca(você precisa estar na cooperativa de pesca).");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não está no Posto");
		return 1;
	}
	if(!strcmp(var1, "/refinariainfo", true))
	{
		if(glob1F6D8[playerid] == 1)
		{
			SendClientMessage(playerid, 0xDD0000FF, "Comandos da Refinaria:");
			SendClientMessage(playerid, 0xF0E68CAA, "/carregarcomb : Carrega seu veículo(você precisa ser transportador de combustivel).");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não está na Refinaria!");
		return 1;
	}
	if(!strcmp(var1, "/cardapio", true))
	{
		if(glob24820[playerid] == 1)
		{
			TogglePlayerControllable(playerid, false);
			ShowMenuForPlayer(glob24B40, playerid);
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não está no Bar");
		return 1;
	}
	if(!strcmp(var1, "/profissoes", true))
	{
		TogglePlayerControllable(playerid, false);
		new var7 = 0;
		var7 = udb_getXP(function705E0(playerid));
		if(var7 < 5)
		{
			ShowMenuForPlayer(glob3203C, playerid);
			return 1;
		}
		if(var7 >= 5 && var7 < 10)
		{
			ShowMenuForPlayer(glob32040, playerid);
			return 1;
		}
		if(var7 >= 10 && var7 < 15)
		{
			ShowMenuForPlayer(glob32044, playerid);
			return 1;
		}
		if(var7 >= 15 && var7 < 20)
		{
			ShowMenuForPlayer(glob32048, playerid);
			return 1;
		}
		if(var7 >= 20 && var7 < 25)
		{
			ShowMenuForPlayer(glob3204C, playerid);
			return 1;
		}
		if(var7 >= 25 && var7 < 30)
		{
			ShowMenuForPlayer(glob32050, playerid);
			return 1;
		}
		if(var7 >= 30 && var7 < 35)
		{
			ShowMenuForPlayer(glob32054, playerid);
			return 1;
		}
		if(var7 >= 35 && var7 < 40)
		{
			ShowMenuForPlayer(glob32058, playerid);
			return 1;
		}
		if(var7 >= 40 && var7 < 45)
		{
			ShowMenuForPlayer(glob3205C, playerid);
			return 1;
		}
		if(var7 >= 45 && var7 < 50)
		{
			ShowMenuForPlayer(glob32060, playerid);
			return 1;
		}
		if(var7 >= 50 && var7 < 55)
		{
			ShowMenuForPlayer(glob32064, playerid);
			return 1;
		}
		if(var7 >= 55)
		{
			ShowMenuForPlayer(glob32068, playerid);
			return 1;
		}
	}
	if(!strcmp(cmdtext, "/plantardinamite", true))
	{
		new var7 = 0;
		var7 = GetPlayerVehicleID(playerid);
		if(IsPlayerInVehicle(playerid, var7))
		{
			if(0 < glob358C0[playerid])
			{
				glob35BE0[var7] = 1;
				SetTimerEx("BUM", 120000, false, "d", var7);
				SendClientMessage(playerid, 0xDD0000FF, "Bomba plantada explodirá em 1 minuto não deixe nenhum polícial desarma-la.");
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Você não possue dinamite.");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não está em um veiculo");
		return 1;
	}
	if(!strcmp(var1, "/rc", true))
	{
		SendClientMessage(playerid, 0xDD0000FF, "RC Disponiveis:");
		SendClientMessage(playerid, 0xFFFF00AA, "/rcbaron : Aviao de Controle(Apenas Admins)");
		SendClientMessage(playerid, 0xFFFF00AA, "/rcbandit : Carrinho de Controle");
		SendClientMessage(playerid, 0xFFFF00AA, "/rcraider : Helicoptero de Controle");
		SendClientMessage(playerid, 0xFFFF00AA, "/rcglobim : Helicoptero de Controle");
		SendClientMessage(playerid, 0xFFFF00AA, "/rccam : Vaso de Controle(Apenas Admins)");
		SendClientMessage(playerid, 0xFFFF00AA, "/rctiger : Tanque de Controle(Apenas Admins)");
		return 1;
	}
	if(!strcmp(var1, "/sabores", true))
	{
		SendClientMessage(playerid, 0x4C62B3AA, "Sabores de sorvetes:");
		SendClientMessage(playerid, 0xF0E68CAA, "1 - Morango.");
		SendClientMessage(playerid, 0xF0E68CAA, "2 - Leite Condensado.");
		SendClientMessage(playerid, 0xF0E68CAA, "3 - Flocos.");
		SendClientMessage(playerid, 0xF0E68CAA, "4 - Creme.");
		SendClientMessage(playerid, 0xF0E68CAA, "5 - Doce de Leite.");
		SendClientMessage(playerid, 0xF0E68CAA, "6 - Refrigerante");
		SendClientMessage(playerid, 0xF0E68CAA, "7 - Coco");
		SendClientMessage(playerid, 0xF0E68CAA, "8 - Tutti-frutti");
		SendClientMessage(playerid, 0xBDD94CFF, "Peça para um Sorveteiro te vender.");
		return 1;
	}
	if(!strcmp(var1, "/bebidas", true))
	{
		SendClientMessage(playerid, 0x4C62B3AA, "Bebidas Disponiveis:");
		SendClientMessage(playerid, 0xF0E68CAA, "1 - Coca Cola.");
		SendClientMessage(playerid, 0xF0E68CAA, "2 - Sukita.");
		SendClientMessage(playerid, 0xF0E68CAA, "3 - Guaraná.");
		SendClientMessage(playerid, 0xF0E68CAA, "4 - Soda.");
		SendClientMessage(playerid, 0xBDD94CFF, "Peça para um Vendedor de Lanches,Barman ou Entregador de pizzas lhe vender.");
		SendClientMessage(playerid, 0x00BC6FAA, "Assim que tomar a bebida entregue a latinha a um mendingo ou serviço de reciclagem com /entregarlata [id].");
		SendClientMessage(playerid, 0x00BC6FAA, "Assim estará ajudando eles e a acabar com a poluição mundial =).");
		return 1;
	}
	if(!strcmp(var1, "/calculadorainfo", true))
	{
		SendClientMessage(playerid, 0x4C62B3AA, "Comandos de calculadora");
		SendClientMessage(playerid, 0xF0E68CAA, "/dividir [numero 1] [numero 2] : Divide um número pelo outro.");
		SendClientMessage(playerid, 0xF0E68CAA, "/multiplicar [numero 1] [numero 2] : Multiplica um número pelo outro.");
		SendClientMessage(playerid, 0xF0E68CAA, "/somar [numero 1] [numero 2] : Soma um número com outro.");
		SendClientMessage(playerid, 0xF0E68CAA, "/subtrair [numero 1] [numero 2] : Subtrai um número pelo outro.");
		SendClientMessage(playerid, 0xBDD94CFF, "Para possuir uma calculadora compre um celular.");
		SendClientMessage(playerid, 0xDD0000FF, "AVISO: Números negativos serão dados resultados como 0.");
		return 1;
	}
	if(!strcmp(var1, "/lanches", true))
	{
		SendClientMessage(playerid, 0x4C62B3AA, "Lanches Disponiveis:");
		SendClientMessage(playerid, 0xF0E68CAA, "1 - X-Bacon.");
		SendClientMessage(playerid, 0xF0E68CAA, "2 - X-Burguer.");
		SendClientMessage(playerid, 0xF0E68CAA, "3 - X-Salada.");
		SendClientMessage(playerid, 0xF0E68CAA, "4 - X-Tudo.");
		SendClientMessage(playerid, 0xBDD94CFF, "Peça para um Vendedor de Lanches lhe vender.");
		return 1;
	}
	if(!strcmp(var1, "/pizzas", true))
	{
		SendClientMessage(playerid, 0x4C62B3AA, "Pizzas Disponiveis:");
		SendClientMessage(playerid, 0xF0E68CAA, "1 - 4 Queijos.");
		SendClientMessage(playerid, 0xF0E68CAA, "2 - Calabresa.");
		SendClientMessage(playerid, 0xF0E68CAA, "3 - Frango-Catupiry.");
		SendClientMessage(playerid, 0xF0E68CAA, "4 - Presunto e Queijo.");
		SendClientMessage(playerid, 0xBDD94CFF, "Peça para um Entregador de Pizza lhe vender.");
		return 1;
	}
	if(!strcmp(var1, "/drogas", true))
	{
		SendClientMessage(playerid, 0x4C62B3AA, "Drogas disponíveis:");
		SendClientMessage(playerid, 0xF0E68CAA, "1 - Maconha");
		SendClientMessage(playerid, 0xF0E68CAA, "2 - Cocaína");
		SendClientMessage(playerid, 0xF0E68CAA, "3 - Heroína");
		SendClientMessage(playerid, 0xF0E68CAA, "4 - Crack");
		SendClientMessage(playerid, 0xBDD94CFF, "Quer uma dessas? Fale com um traficante.");
		return 1;
	}
	if(!strcmp(var1, "/int", true))
	{
		SetPlayerInterior(playerid, GetPlayerInterior(playerid));
		return 1;
	}
	if(!strcmp(var1, "/profs", true))
	{
		SendClientMessage(playerid, 0x4C62B3AA, "Comando Mudado!");
		SendClientMessage(playerid, 0xFE684BFF, "Agora temos sistema de XL vá na agencia de empregos e escolha uma profissão.");
		SendClientMessage(playerid, 0xFE684BFF, "Caso não saiba onde é, peça para um taxista lhe levar ao local.");
		return 1;
	}
	if(!strcmp(var1, "/gasolina", true) || !strcmp(var1, "/buygas", true))
	{
		SendClientMessage(playerid, 0xFF7200FF, "Comando incorreto!");
		SendClientMessage(playerid, 0xFF9900AA, "Use: /abastecer [litros].");
		return 1;
	}
	if(!strcmp(var1, "/dinheiro", true) && IsPlayerAdmin(playerid))
	{
		SendClientMessage(playerid, 0xFFFFFFAA, "Feito.");
		udb_setBankMoney(function705E0(playerid), udb_getBankMoney(function705E0(playerid)) + 1500);
		return 1;
	}
	if(!strcmp(var1, "/ci", true))
	{
		SendClientMessage(playerid, 0xFF7200FF, "Comando incorreto!");
		SendClientMessage(playerid, 0xFF9900AA, "Use: /docs [id].");
		return 1;
	}
	if(!strcmp(var1, "/givecash", true) || !strcmp(var1, "/transferir", true))
	{
		SendClientMessage(playerid, 0xFF7200FF, "Comando incorreto!");
		SendClientMessage(playerid, 0xFF9900AA, "Use: /enviar [id] [valor].");
		return 1;
	}
	if(!strcmp(var1, "/bdp", true) || !strcmp(var1, "/bwd", true) || !strcmp(var1, "/bstats", true) || !strcmp(var1, "/bscell", true))
	{
		SendClientMessage(playerid, 0xFF7200FF, "Comando incorreto!");
		SendClientMessage(playerid, 0xF0E68CAA, "/retirar [valor] ou /sacar [valor] : Retira dinheiro de sua conta bancaria. ");
		SendClientMessage(playerid, 0xF0E68CAA, "/depositar [valor] : Deposita em sua conta bancaria");
		SendClientMessage(playerid, 0xF0E68CAA, "/saldo : Vê o saldo de sua conta bancaria.");
		SendClientMessage(playerid, 0xF0E68CAA, "/saldocel : Vê o saldo de sua conta bancaria pelo celular.");
		return 1;
	}
	if(!strcmp(var1, "/veiculoid", true))
	{
		if(IsPlayerInAnyVehicle(playerid))
		{
			new var7 = GetPlayerVehicleID(playerid);
			new var8[256];
			format(var8, 256, "O ID do seu veiculo é %d", var7);
			SendClientMessage(playerid, 0x0099FFAA, var8);
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não está em um veiculo.");
		return 1;
	}
	if(!strcmp(var1, "/pararsexo", true))
	{
		if(glob35280[playerid] == 1)
		{
			new var7 = 0;
			var7 = glob355A0[playerid];
			TogglePlayerControllable(playerid, true);
			TogglePlayerControllable(var7, true);
			glob35280[playerid] = 0;
			glob35280[var7] = 0;
			glob355A0[playerid] = 0;
			glob355A0[var7] = 0;
			SendClientMessage(playerid, 0xDD0000FF, "Sexo parado.");
			SendClientMessage(var7, 0xDD0000FF, "O sexo acabou.");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não está fazendo sexo");
		return 1;
	}
	if(!strcmp(var1, "/mudar", true))
	{
		if(!glob27718[playerid])
		{
			SendClientMessage(playerid, 0xDD0000FF, "Você não tem uma casa nova!");
			return 1;
		}
		glob27718[playerid] = 0;
		SendClientMessage(playerid, 0x33AA33AA, "Você se mudou para sua casa nova.");
		LogarPlayer(playerid);
		return 1;
	}
	if(!strcmp(var1, "/horas", true))
	{
		new var7 = 0, var8 = 0, var9 = 0;
		new var10 = 0, var11 = 0, var12 = 0;
		gettime(var7, var8, var9);
		getdate(var10, var11, var12);
		new var13[256];
		format(var13, 256, "~r~Data:~w~%d/%d/%d~n~~r~Hora:~w~%d:%d:%d", var10, var11, var12, var7, var8, var9);
		GameTextForPlayer(playerid, var13, 5000, 4);
		return 1;
	}
	if(!strcmp(var1, "/skin", true))
	{
		new var7[256];
		new var8 = 0;
		var7 = function1A10(cmdtext, var4, 32);
		if(!strlen(var7))
		{
			SendClientMessage(playerid, 0xDD0000FF, "/skin [skin]");
			return 1;
		}
		var8 = strval(var7);
		if(var8 >= 289)
		{
			SendClientMessage(playerid, 0xDD0000FF, "ID de skin inválido!");
			return 1;
		}
		if(IsPlayerConnected(playerid))
		{
			udb_setSkin(function705E0(playerid), var8);
			SendClientMessage(playerid, 0x33AA33AA, "Agora você tem um skin novo!");
			SetPlayerSkin(playerid, var8);
			printf("%s(id: %d) comprou um novo skin", function705E0(playerid), playerid);
			return 1;
		}
	}
	if(!strcmp(var1, "/meustatus", true))
	{
		new var7[256];
		format(var7, 256, "Status de %s || ID: %d", function705E0(playerid), playerid);
		SendClientMessage(playerid, 0xFFFFFFAA, var7);
		new var8[256];
		format(var8, 256, "Profissao: %s || Experiencia Diaria : %d  || XL : %d  || Skin : %d", glob4E08[glob2AF8C[playerid]][0], udb_getED(function705E0(playerid)), udb_getED(function705E0(playerid)), udb_getXP(function705E0(playerid)));
		SendClientMessage(playerid, 0xFCFE5CAA, var8);
		new var9[256];
		format(var9, 256, "Habilitação Terrestre : %s || Habilitação Aérea : %s || Habilitação Náutica: %s", glob9424[udb_gethabterre(function705E0(playerid))][0], glob9424[udb_getHabaerea(function705E0(playerid))][0], glob9424[udb_getHabnauti(function705E0(playerid))][0]);
		SendClientMessage(playerid, 0xFCFE5CAA, var9);
		return 1;
	}
	if(!strcmp(var1, "/mostrarpassagem", true))
	{
		new var7[256];
		new var8 = 0;
		new var9[256];
		var7 = function1A10(cmdtext, var4, 32);
		var8 = strval(var7);
		if(!strlen(var7))
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "/mostrarpassagem [id]");
			return 1;
		}
		if(IsPlayerConnected(var8))
		{
			if(!glob3041C[playerid])
			{
				format(var9, 256, "Passagem de %s não encontrada.", function705E0(playerid));
				SendClientMessage(var8, 0xFFFFFFAA, var9);
				return 1;
			}
			if(glob3041C[playerid] == 1)
			{
				format(var9, 256, "Passagem de %s encontrada.", function705E0(playerid));
				SendClientMessage(var8, 0xFFFFFFAA, var9);
				return 1;
			}
		}
		else
		{
			SendClientMessage(playerid, 0x7585C0AA, "Jogador não conectado/logado");
			return 1;
		}
		return 1;
	}
	if(!strcmp(var1, "/report", true))
	{
		new var7[256];
		new var8[256];
		new var9[256];
		new var10 = 0;
		new File:var11 = 0;
		var7 = function1A10(cmdtext, var4, 32);
		if(!strlen(var7))
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "/report [id] [rasão]");
			return 1;
		}
		var10 = strval(var7);
		var7 = function1A10(cmdtext, var4, 32);
		if(!strlen(var7))
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "/report [id] [rasão]");
			return 1;
		}
		set(var9, var7);
		if(IsPlayerConnected(var10))
		{
			format(var8, 256, "%s: denunciado por: %s, rasão: %s", function705E0(var10), function705E0(playerid), var9);
			var11 = fopen("reloadrpg.denuncias", 3);
			fwrite(var11, var8);
			fclose(var11);
			for(new var12 = 0; var12 < 200; var12++)
			{
				if(IsPlayerAdmin(var12))
				{
					format(var8, 256, "O Jogador %s(id: %d) foi denunciado por %s(id: %d).", function705E0(var10), var10, function705E0(playerid), playerid);
					SendClientMessage(var12, 0xDD0000FF, var8);
					format(var8, 256, "Rasão: %s.", var9);
					SendClientMessage(var12, 0xDD0000FF, var8);
					return 1;
				}
			}
			return 1;
		}
		SendClientMessage(playerid, 0x7585C0AA, "Jogador não conectado/logado");
		return 1;
	}
	if(!strcmp(var1, "/pizza", true))
	{
		SendClientMessage(playerid, 0xFFFF00AA, "Uma pizza está a caminho!");
		for(new var7 = 0; var7 < 200; var7++)
		{
			if(glob2AF8C[var7] == 2 || IsPlayerAdmin(var7))
			{
				new var8[256];
				format(var8, 256, "O jogador %s solicita uma pizza.", function705E0(playerid));
				SendClientMessage(var7, 0xFFF297AA, var8);
				return 1;
			}
		}
	}
	if(!strcmp(var1, "/advogado", true))
	{
		SendClientMessage(playerid, 0x33AA33AA, "Um dos advogados de San Andreas, ira lhe defender no tribunal.");
		for(new var7 = 0; var7 < 200; var7++)
		{
			if((IsPlayerConnected(var7) && glob2AF8C[var7] == 30) || IsPlayerAdmin(var7))
			{
				new var8[256];
				format(var8, 256, "O jogador %s solicita um advogado.", function705E0(playerid));
				SendClientMessage(var7, 0x33AA33AA, var8);
				printf("%s solicita um advogado", function705E0(playerid));
				return 1;
			}
		}
	}
	if(!strcmp(var1, "/processo", true))
	{
		if(glob2AF8C[playerid] == 30 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8[256];
			strmid(var7, cmdtext, 10, strlen(cmdtext), 256);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/processo [nome_do_réu] [descrição_da_causa]");
				return 1;
			}
			SendClientMessage(playerid, 0x5CFFFDAA, "Você fez a defesa do seu cliente e o processo está em andamento, aguarde a sentença do juiz");
			for(new var9 = 0; var9 < 200; var9++)
			{
				if(glob2AF8C[var9] == 25 || IsPlayerAdmin(playerid))
				{
					format(var8, 256, "O Dr.%s entrou com um processo em defesa do réu %s.", function705E0(playerid), var7);
					SendClientMessage(var9, 0x33AA33AA, var8);
					printf("%s entrou com um preocesso: %s", function705E0(playerid), var7);
					udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
					return 1;
				}
			}
		}
		else
		{
			SendClientMessage(playerid, 0xDD0000FF, "Você não é Advogado!");
			return 1;
		}
	}
	if(!strcmp(var1, "/carteira", true))
	{
		if(glob26134[playerid] == 1)
		{
			new var7[256];
			new var8[256];
			new var9 = 0;
			var8 = function1A10(cmdtext, var4, 32);
			if(!strlen(var8))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/carteira [id_da_carteira]");
				return 1;
			}
			var9 = strval(var8);
			if(var9 < 1 || var9 > 3)
			{
				SendClientMessage(playerid, 0xDD0000FF, "Carteira Invalida, As carteiras são de 1 a 3.");
				SendClientMessage(playerid, 0xDD0000FF, "Para ver os ids das carteiras digite /carteiras.");
				return 1;
			}
			for(new var10 = 0; var10 < 200; var10++)
			{
				if(glob2AF8C[var10] == 7 || IsPlayerAdmin(playerid))
				{
					format(var7, 256, "o Jogador %s solicita uma carteira %s.", function705E0(playerid), glob9394[var9][0]);
					printf("%s solicita uma carteira %s", function705E0(playerid), glob9394[var9][0]);
					SendClientMessage(var10, 0x33AA33AA, var7);
					SendClientMessage(playerid, 0x5CFFFDAA, "Carteira Solicitada.");
					return 1;
				}
				SendClientMessage(playerid, 0xDD0000FF, "Você não está na Auto Escola!");
				return 1;
			}
		}
	}
	if(!strcmp(var1, "/190", true))
	{
		new var7[256];
		new var8[256];
		strmid(var7, cmdtext, 4, strlen(cmdtext), 256);
		if(!strlen(var7))
		{
			SendClientMessage(playerid, 0xDD0000FF, "/190 [denuncia]");
			return 1;
		}
		SendClientMessage(playerid, 0x4C62B3AA, "Os policiais foram informados");
		for(new var9 = 0; var9 < 200; var9++)
		{
			if(glob2AF8C[var9] == 21 || glob2AF8C[var9] == 56 || glob2AF8C[var9] == 24 || glob2AF8C[var9] == 29 || glob2AF8C[var9] == 22 || glob2AF8C[var9] == 23)
			{
				format(var8, 256, "%s fez uma denuncia: %s", function705E0(playerid), var7);
				SendClientMessage(var9, 0x4C62B3AA, var8);
			}
		}
		return 1;
	}
	if(!strcmp(var1, "/diskdroga", true))
	{
		new var7[256];
		new var8[256];
		strmid(var7, cmdtext, 4, strlen(cmdtext), 256);
		if(!strlen(var7))
		{
			SendClientMessage(playerid, 0xDD0000FF, "/diskdroga [local]");
			return 1;
		}
		SendClientMessage(playerid, 0x4C62B3AA, "Os traficantes foram informados");
		for(new var9 = 0; var9 < 200; var9++)
		{
			if(glob2AF8C[var9] == 16 || glob2AF8C[var9] == 47)
			{
				format(var8, 256, "%s pediu uma droga: %s", function705E0(playerid), var7);
				SendClientMessage(var9, 0x4C62B3AA, var8);
			}
		}
		return 1;
	}
	if(!strcmp(var1, "/taxi", true))
	{
		new var7[256];
		new var8[256];
		strmid(var7, cmdtext, 5, strlen(cmdtext), 256);
		if(!strlen(var7))
		{
			SendClientMessage(playerid, 0xDD0000FF, "/taxi [aonde]");
			return 1;
		}
		SendClientMessage(playerid, 0xFFFF00AA, "Os taxistas foram informados");
		for(new var9 = 0; var9 < 200; var9++)
		{
			if(glob2AF8C[var9] == 9)
			{
				format(var8, 256, "%s pede um taxi. Local: %s", function705E0(playerid), var7);
				SendClientMessage(var9, 0xFFFF00AA, var8);
			}
		}
		return 1;
	}
	if(!strcmp(var1, "/192", true))
	{
		new var7[256];
		new var8[256];
		strmid(var7, cmdtext, 4, strlen(cmdtext), 256);
		if(!strlen(var7))
		{
			SendClientMessage(playerid, 0xDD0000FF, "/192 [local]");
			return 1;
		}
		SendClientMessage(playerid, 0x4C62B3AA, "Os paramédicos foram informados");
		for(new var9 = 0; var9 < 200; var9++)
		{
			if(glob2AF8C[var9] == 6)
			{
				format(var8, 256, "%s precisa de uma Ambulancia. Local: %s", function705E0(playerid), var7);
				SendClientMessage(var9, 0x4C62B3AA, var8);
			}
		}
		return 1;
	}
	if(!strcmp(cmdtext, "/trancar", true))
	{
		if(2 != GetPlayerState(playerid))
		{
			new var7 = 0;
			for(var7 = 0; var7 < 200; var7++)
			{
				if(var7 != playerid)
				{
					SetVehicleParamsForPlayer(GetPlayerVehicleID(playerid), var7, false, true);
				}
			}
			SendClientMessage(playerid, 0xDD0000FF, "Você não está dirigindo nenhum veiculo!");
		}
		else
		{
			SendClientMessage(playerid, 0x4C62B3AA, "Veículo Trancado");
			new Float:var7 = 0.0, Float:var8 = 0.0, Float:var9 = 0.0;
			PlayerPlaySound(playerid, 1056, var7, var8, var9);
			return 1;
		}
	}
	if(!strcmp(cmdtext, "/destrancar", true))
	{
		if(2 != GetPlayerState(playerid))
		{
			new var7 = 0;
			for(var7 = 0; var7 < 200; var7++)
			{
				if(var7 != playerid)
				{
					SetVehicleParamsForPlayer(GetPlayerVehicleID(playerid), var7, false, false);
				}
			}
			SendClientMessage(playerid, 0xDD0000FF, "Você não está dirigindo nenhum veiculo!");
		}
		else
		{
			SendClientMessage(playerid, 0x4C62B3AA, "Veículo Destrancado");
			new Float:var7 = 0.0, Float:var8 = 0.0, Float:var9 = 0.0;
			PlayerPlaySound(playerid, 1057, var7, var8, var9);
			return 1;
		}
		return 1;
	}
	if(!strcmp(var1, "/noticia", true))
	{
		if(glob2AF8C[playerid] == 38 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8[256];
			strmid(var7, cmdtext, 8, strlen(cmdtext), 256);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/noticia [mensagen]");
				return 1;
			}
			SendClientMessage(playerid, 0xFFFF00AA, "Noticia Publicada.");
			format(var8, 256, "Noticias de San Andreas, Jornalista %s.", function705E0(playerid));
			SendClientMessageToAll(0xFFFFFFAA, var8);
			format(var8, 256, "Noticia: %s ", var7);
			SendClientMessageToAll(0x56EADAAA, var8);
			udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não é Jornalista!");
		return 1;
	}
	if(!strcmp(var1, "/anunciar", true))
	{
		if(glob2AF8C[playerid] == 38 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8[256];
			strmid(var7, cmdtext, 10, strlen(cmdtext), 256);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/anunciar [texto]");
				return 1;
			}
			format(var8, 256, "Anuncio feito por: %s", function705E0(playerid));
			SendClientMessageToAll(0xFEFFFAAA, var8);
			GameTextForAll(var7, 5000, 0);
			udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não tem permissão!");
		return 1;
	}
	if(!strcmp(var1, "/pediranuncio", true))
	{
		new var7[256];
		new var8[256];
		new var9 = 0;
		var7 = function1A10(cmdtext, var4, 32);
		var9 = strval(var7);
		if(!strlen(var7))
		{
			SendClientMessage(playerid, 0xDD0000FF, "/pediranuncio [id] [anúncio]");
			return 1;
		}
		var7 = function1A10(cmdtext, var4, 32);
		strmid(var8, cmdtext, 10, strlen(cmdtext), 256);
		if(!strlen(var7))
		{
			SendClientMessage(playerid, 0xDD0000FF, "/pediranuncio [id] [anúncio]");
			return 1;
		}
		if(IsPlayerConnected(var9))
		{
			if(glob2AF8C[var9] == 38 || IsPlayerAdmin(var9))
			{
				SendClientMessage(playerid, 0xFFFFFFAA, "Anuncio pedido com sucesso.");
				new var10[256];
				format(var10, 256, "%s esta lhe pedindo um anúncio", function705E0(playerid));
				SendClientMessage(var9, 0xFFFFFFAA, var10);
				SendClientMessage(var9, 0xFFFFFFAA, var8);
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Você só pode pedir anúncio para jornalistas.");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Jogador não conectado/logado.");
		return 1;
	}
	if(!strcmp(var1, "/pedirnoticia", true))
	{
		new var7[256];
		new var8[256];
		new var9 = 0;
		var7 = function1A10(cmdtext, var4, 32);
		var9 = strval(var7);
		if(!strlen(var7))
		{
			SendClientMessage(playerid, 0xDD0000FF, "/pedirnoticia [id] [notícia]");
			return 1;
		}
		var7 = function1A10(cmdtext, var4, 32);
		strmid(var8, cmdtext, 10, strlen(cmdtext), 256);
		if(!strlen(var7))
		{
			SendClientMessage(playerid, 0xDD0000FF, "/pediranuncio [id] [notícia]");
			return 1;
		}
		if(IsPlayerConnected(var9))
		{
			if(glob2AF8C[var9] == 38 || IsPlayerAdmin(var9))
			{
				SendClientMessage(playerid, 0xFFFFFFAA, "Anuncio pedido com sucesso.");
				new var10[256];
				format(var10, 256, "%s esta lhe pedindo um anúncio", function705E0(playerid));
				SendClientMessage(var9, 0xFFFFFFAA, var10);
				SendClientMessage(var9, 0xFFFFFFAA, var8);
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Você só pode pedir anúncio para jornalistas.");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Jogador não conectado/logado.");
		return 1;
	}
	if(!strcmp(var1, "/enviar", true))
	{
		new var7[256];
		new var8[256];
		var8 = function1A10(cmdtext, var4, 32);
		if(!strlen(var8))
		{
			SendClientMessage(playerid, 0xDD0000FF, "Uso: /enviar [id] [valor]");
			return 1;
		}
		var2 = strval(var8);
		var8 = function1A10(cmdtext, var4, 32);
		if(!strlen(var8))
		{
			SendClientMessage(playerid, 0xDD0000FF, "Uso: /enviar [id] [valor]");
			return 1;
		}
		var3 = strval(var8);
		if(IsPlayerConnected(var2))
		{
			GetPlayerName(var2, var5, 24);
			GetPlayerName(playerid, var6, 24);
			var0 = GetPlayerMoney(playerid);
			if(var3 > 0 && var0 >= var3)
			{
				GivePlayerMoney(playerid, 0 - var3);
				GivePlayerMoney(var2, var3);
				format(var7, 256, "Você enviou %s(id: %d), R$%d.", var5, var2, var3);
				SendClientMessage(playerid, 0xFFFF00AA, var7);
				format(var7, 256, "Você recebeu R$%d de %s(id: %d).", var3, var6, playerid);
				SendClientMessage(var2, 0xFFFF00AA, var7);
			}
			else
			{
				SendClientMessage(playerid, 0xFFFF00AA, "Valor inválido.");
			}
		}
		else
		{
			format(var7, 256, "O Jogador de id: %d, não está online", var2);
			SendClientMessage(playerid, 0xFFFF00AA, var7);
		}
		return 1;
	}
	if(!strcmp(var1, "/pagar", true))
	{
		new var7[256];
		new var8[256];
		new var9 = 0;
		new var10 = 0;
		var8 = function1A10(cmdtext, var4, 32);
		if(!strlen(var8))
		{
			SendClientMessage(playerid, 0xDD0000FF, "/pagar [id] [valor]");
			return 1;
		}
		var9 = strval(var8);
		var8 = function1A10(cmdtext, var4, 32);
		if(!strlen(var8))
		{
			SendClientMessage(playerid, 0xDD0000FF, "/pagar [id] [valor]");
			return 1;
		}
		var10 = strval(var8);
		if(glob2AF8C[var9] == 35 || glob2AF8C[var9] == 36)
		{
			if(var10 > GetPlayerMoney(var9) || var10 <= 0)
			{
				SendClientMessage(playerid, 0xDD0000FF, "Você não tem esse dinheiro! ou não está querendo pagar de forma justa.");
				return 1;
			}
			if(IsPlayerConnected(var9))
			{
				GivePlayerMoney(var9, var10 / 10);
				GivePlayerMoney(playerid, 0 - var10);
				SendClientMessage(playerid, 0x33AA33AA, "Pagamento feito.");
				format(var7, 256, "Você vendeu por %d e lucrou %d com a venda", var10, var10 / 10);
				SendClientMessage(playerid, 0x33AA33AA, var7);
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "O jogador não está conectado!");
			return 1;
		}
		if(35 != glob2AF8C[var9] || 36 != glob2AF8C[var9])
		{
			SendClientMessage(playerid, 0xDD0000FF, "Você está tentando pagaer a alguem que não é coretoe e nem vendedor!");
			return 1;
		}
		return 1;
	}
	if(!strcmp(var1, "/depositar", true))
	{
		new var7[256];
		new var8 = 0;
		var7 = function1A10(cmdtext, var4, 32);
		if(!strlen(var7))
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Uso: /depositar [quantidade]");
			return 1;
		}
		var8 = strval(var7);
		if(var8 <= 0 || var8 > GetPlayerMoney(playerid))
		{
			SendClientMessage(playerid, 0xDD0000FF, "Você não tem todo esse dinheiro. Ou está tentando enviar R$0.");
			return 1;
		}
		if(IsPlayerInCheckpoint(playerid))
		{
			GivePlayerMoney(playerid, 0 - var8);
			udb_setBankMoney(function705E0(playerid), var8 + udb_getBankMoney(function705E0(playerid)));
			TogglePlayerControllable(playerid, false);
			SetTimerEx("depositar", 11000, false, "d", playerid);
			ApplyAnimation(playerid, "PED", "ATM", 4.0999, 0, 1, 1, 1, 1);
			return 1;
		}
		SendClientMessage(playerid, 0xFFFF00AA, "Você precisa estar em um banco para usar esse comando.");
		return 1;
	}
	if(!strcmp(var1, "/sacar", true) || !strcmp(var1, "/retirar", true))
	{
		new var7[256];
		new var8[256];
		new var9 = 0;
		var8 = function1A10(cmdtext, var4, 32);
		if(!strlen(var8))
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Uso: /sacar [valor] ou /retirar [valor]");
			return 1;
		}
		var9 = strval(var8);
		if(0 > var9)
		{
			SendClientMessage(playerid, 0xDD0000FF, "Você não pode depositar com esse comando");
			return 1;
		}
		if(udb_getBankMoney(function705E0(playerid)) < var9)
		{
			SendClientMessage(playerid, 0xDD0000FF, "Você não pode tem essa quantidade no banco");
			return 1;
		}
		if(IsPlayerInCheckpoint(playerid))
		{
			GivePlayerMoney(playerid, var9);
			udb_setBankMoney(function705E0(playerid), udb_getBankMoney(function705E0(playerid)) - var9);
			format(var7, 256, "Você retirou R$%d do banco. seu saldo atual é de R$%d", var9, udb_getBankMoney(function705E0(playerid)));
			SendClientMessage(playerid, 0xFFFF00AA, var7);
			TogglePlayerControllable(playerid, false);
			SetTimerEx("sacar", 11000, false, "d", playerid);
			ApplyAnimation(playerid, "PED", "ATM", 4.0999, 0, 1, 1, 1, 1);
			return 1;
		}
		SendClientMessage(playerid, 0xFFFF00AA, "Você precisa estar em um banco para usar esse comando.");
		return 1;
	}
	if(!strcmp(var1, "/saldo", true))
	{
		new var7[256];
		if(IsPlayerInCheckpoint(playerid))
		{
			format(var7, 256, "%s, você tem %d na conta (seu id: %d)", function705E0(playerid), udb_getBankMoney(function705E0(playerid)), playerid);
			SendClientMessage(playerid, 0x33AA33AA, var7);
			return 1;
		}
		SendClientMessage(playerid, 0xFFFF00AA, "Você precisa estar em um banco para usar esse comando.");
		return 1;
	}
	if(!strcmp(var1, "/saldocel", true))
	{
		new var7[256];
		if(GetPlayerMoney(playerid) < 2)
		{
			SendClientMessage(playerid, 0xFFFF00AA, "Você não tem dinheiro em mãos(Custo: R$2).");
			return 1;
		}
		GivePlayerMoney(playerid, -2);
		SendClientMessage(playerid, 0xFFFF00AA, "Nova mensagem de Bancos SA.");
		format(var7, 256, "%s(id: %d), você tem %d em sua conta bancaria.", function705E0(playerid), udb_getBankMoney(function705E0(playerid)), playerid);
		SendClientMessage(playerid, 0x33AA33AA, var7);
		return 1;
	}
	if(!strcmp(var1, "/votacaoon", true))
	{
		if(IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8[256];
			new var9 = 0;
			new var10 = 0;
			for(new var11 = 0; var11 < 200; var11++)
			{
				var7 = function1A10(cmdtext, var4, 32);
				var9 = strval(var7);
				if(!strlen(var7))
				{
					SendClientMessage(playerid, 0xFFFFFFAA, "/votacaoon [id1] [id2]");
					return 1;
				}
				var8 = function1A10(cmdtext, var4, 32);
				var10 = strval(var8);
				if(!strlen(var8))
				{
					SendClientMessage(playerid, 0xFFFFFFAA, "/votacaoon [id1] [id2]");
					return 1;
				}
				if(IsPlayerConnected(var11))
				{
					if(var9 != var10)
					{
						if(IsPlayerConnected(var9))
						{
							if(IsPlayerConnected(var10) && glob1A0CC[playerid] == 1)
							{
								glob32390[var9] = 1;
								glob32390[var10] = 1;
								glob29CCC[var11] = 1;
								glob29FEC[var9] = 1;
								glob29FEC[var10] = 1;
								new var12[256];
								format(var12, 256, "Votaçoes politicas abertas entre %s e %s.", function705E0(var9), function705E0(var10));
								SendClientMessageToAll(0xFFFFFFAA, var12);
								SetTimerEx("votacaoon", 1500000, true, "dd", var9, var10);
								return 1;
							}
							SendClientMessage(playerid, 0x7585C0AA, "Jogador 2 não conectado/logado");
							return 1;
						}
						SendClientMessage(playerid, 0x7585C0AA, "Jogador 1 não conectado/logado");
						return 1;
					}
					SendClientMessage(playerid, 0x7585C0AA, "não da pra elegir 1 pessoa 2 vezes né");
					return 1;
				}
			}
		}
		return 1;
	}
	if(!strcmp(var1, "/votar", true))
	{
		new var7[256];
		new var8 = 0;
		var7 = function1A10(cmdtext, var4, 32);
		var8 = strval(var7);
		if(!strlen(var7))
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "/votar [id]");
			return 1;
		}
		if(1 != glob29CCC[playerid])
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "não estamos na temporada de votos espere ate ela para votar");
			return 1;
		}
		if(1 != glob29FEC[var8])
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "O jogador que você quer votar não está elegido para votaçoes por enquanto");
			return 1;
		}
		if(glob2A62C[playerid] == 1)
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Você ja votou agora basta esperar os resultados");
			return 1;
		}
		if(IsPlayerConnected(var8))
		{
			if(glob1A70C[playerid] == 1)
			{
				glob2A30C[var8]++;
				glob2A62C[playerid] = 1;
				SendClientMessage(playerid, 0xFE684BFF, "Obrigado por colaborar os resultados dos votos sairão no jornal");
				return 1;
			}
		}
		else
		{
			SendClientMessage(playerid, 0x7585C0AA, "Você tem que estar em um banco para votar");
			return 1;
		}
	}
	if(!strcmp(var1, "/docs", true))
	{
		new var7[256];
		new var8[256];
		new var9 = 0;
		new var10[5];
		var8 = function1A10(cmdtext, var4, 32);
		if(!strlen(var8))
		{
			SendClientMessage(playerid, 0xDD0000FF, "Documentos mostrados.");
			return 1;
		}
		var9 = strval(var8);
		if(IsPlayerConnected(var9))
		{
			var10[2] = udb_getHabaerea(function705E0(playerid));
			var10[0] = udb_gethabterre(function705E0(playerid));
			var10[1] = udb_getHabnauti(function705E0(playerid));
			format(var7, 256, "Identidade de : %s", function705E0(playerid));
			SendClientMessage(playerid, 0x4C62B3AA, var7);
			format(var7, 256, "Skin : %d", udb_getSkin(function705E0(playerid)));
			SendClientMessage(playerid, 0xFF9900AA, var7);
			if(!var10[0])
			{
				SendClientMessage(playerid, 0xFFFFFFAA, "Habilitação de Carros e Motos: NÂO");
			}
			if(var10[0] == 1)
			{
				SendClientMessage(playerid, 0x4C62B3AA, "Habilitação de Carros e Motos: SIM");
			}
			if(!var10[1])
			{
				SendClientMessage(playerid, 0xFFFFFFAA, "Habilitação Náutica: NÂO");
			}
			if(var10[1] == 1)
			{
				SendClientMessage(playerid, 0x4C62B3AA, "Habilitação Náutica: SIM");
			}
			if(!var10[2])
			{
				SendClientMessage(playerid, 0xFFFFFFAA, "Habilitação Aérea: NÂO");
			}
			if(var10[2] == 1)
			{
				SendClientMessage(playerid, 0x4C62B3AA, "Habilitação Aérea: SIM");
			}
			format(var7, 256, "Documentos mostrados para %s.", function705E0(var9));
			SendClientMessage(playerid, 0x4C62B3AA, var7);
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Jogador não conectado/logado.");
		return 1;
	}
	if(!strcmp(var1, "/habaerea", true))
	{
		if(glob2AF8C[playerid] == 7 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8 = 0;
			var7 = function1A10(cmdtext, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/habaerea [id].");
				return 1;
			}
			var8 = strval(var7);
			new var9 = 0;
			var9 = udb_getHabaerea(function705E0(var8));
			if(!var9)
			{
				if(IsPlayerConnected(var8))
				{
					udb_setHabaerea(function705E0(var8), 1);
					SendClientMessage(playerid, 0x33AA33AA, "Habilitação de direção habilitação aéria concedida.");
					SendClientMessage(var8, 0x33AA33AA, "Agora você tem carteira de habilitação aéria, pode dirigir: helicopteros e aviões.");
					printf("O Jogador %s(id: %d) deu carteira de habilitaçao aerea a %s(id: %d).", function705E0(playerid), playerid, function705E0(var8), var8);
					GivePlayerMoney(var8, -1200);
					udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
					return 1;
				}
				SendClientMessage(playerid, 0xDD0000FF, "ID Invalido");
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "O jogador ja possue habilitação aerea");
			return 1;
		}
		if(7 != glob2AF8C[playerid])
		{
			SendClientMessage(playerid, 0xDD0000FF, "Você não é Intrutor de Direção.");
			return 1;
		}
	}
	if(!strcmp(var1, "/habterrestre", true))
	{
		if(glob2AF8C[playerid] == 7 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8 = 0;
			var7 = function1A10(cmdtext, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/habterrestre [id].");
				return 1;
			}
			var8 = strval(var7);
			if(IsPlayerConnected(var8))
			{
				new var9 = 0;
				var9 = udb_gethabterre(function705E0(var8));
				if(!var9)
				{
					udb_setHabterre(function705E0(var8), 1);
					SendClientMessage(playerid, 0x33AA33AA, "Habilitação de direção terrestre concedida.");
					SendClientMessage(var8, 0x33AA33AA, "Agora você tem carteira de habilitação terrestre, pode dirigir: carros, motos, caminhoes e onibus.");
					printf("O Jogador %s(id: %d) deu carteira de habilitaçao terrestre a %s(id: %d).", function705E0(playerid), playerid, function705E0(var8), var8);
					GivePlayerMoney(var8, -500);
					udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
					return 1;
				}
				SendClientMessage(playerid, 0xDD0000FF, "O jogador ja possue habilitação terrestre");
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "ID inválido");
			return 1;
		}
		if(7 != glob2AF8C[playerid])
		{
			SendClientMessage(playerid, 0xDD0000FF, "Você não é Intrutor de Direção.");
			return 1;
		}
	}
	if(!strcmp(var1, "/habnautica", true))
	{
		if(glob2AF8C[playerid] == 7 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8 = 0;
			var7 = function1A10(cmdtext, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/habnautica [id].");
				return 1;
			}
			var8 = strval(var7);
			if(IsPlayerConnected(var8))
			{
				new var9 = 0;
				var9 = udb_getHabnauti(function705E0(var8));
				if(!var9)
				{
					udb_setHabnauti(function705E0(var8), 1);
					SendClientMessage(playerid, 0x33AA33AA, "Habilitação de direção náutica concedida.");
					SendClientMessage(var8, 0x33AA33AA, "Agora você tem carteira de habilitação nautica, pode dirigir: barcos, navios.");
					printf("O Jogador %s(id: %d) deu carteira de habilitaçao nautica a %s(id: %d).", function705E0(playerid), playerid, function705E0(var8), var8);
					GivePlayerMoney(var8, -800);
					udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
					return 1;
				}
				SendClientMessage(playerid, 0xDD0000FF, "O jogador ja possue habilitação nautica");
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "ID inválido");
			return 1;
		}
		if(7 != glob2AF8C[playerid])
		{
			SendClientMessage(playerid, 0xDD0000FF, "Você não tem level o suficiente.");
			return 1;
		}
	}
	if(!strcmp(var1, "/revisarlimo", true))
	{
		if(glob2AF8C[playerid] == 32)
		{
			new var7 = GetVehicleModel(GetPlayerVehicleID(playerid));
			if(var7 == glob1878C)
			{
				if(IsPlayerInAnyVehicle(playerid))
				{
					if(!glob37E40[GetPlayerVehicleID(playerid)])
					{
						DisablePlayerCheckpoint(playerid);
						SetPlayerCheckpoint(playerid, -1923.7762, 302.5551, 41.0469, 3.0);
						glob187CC[playerid] = 24;
						SendClientMessage(playerid, 0xFFFFFFAA, "O Circuito para revisar a limosine começou.");
						SendClientMessage(playerid, 0xFFFFFFAA, "Vá até a oficina para revisar a saúde do carro.");
						return 1;
					}
					SendClientMessage(playerid, 0xDD0000FF, "Esta limosine já foi revisada.");
					return 1;
				}
				SendClientMessage(playerid, 0xDD0000FF, "Você não está em um veiculo.");
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Você tem que estar em uma limosine.");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não tem permissão.");
		return 1;
	}
	if(!strcmp(var1, "/lavarlimo", true))
	{
		if(glob2AF8C[playerid] == 32)
		{
			new var7[256];
			new var8 = 0;
			var7 = function1A10(cmdtext, var4, 32);
			var8 = GetPlayerVehicleID(playerid);
			new var9 = GetVehicleModel(GetPlayerVehicleID(playerid));
			if(IsPlayerInVehicle(playerid, var8))
			{
				if(glob319FC[playerid] == 1)
				{
					if(var9 == glob1878C)
					{
						GivePlayerMoney(playerid, 100);
						SendClientMessage(playerid, 0x2CCC6CAA, "Limosine lavada! Você recebeu R$100 pelo trabalho");
						glob326B0[var8] = 1;
						udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
						return 1;
					}
					SendClientMessage(playerid, 0xDD0000FF, "Você não está numa limosine");
					return 1;
				}
				SendClientMessage(playerid, 0xDD0000FF, "Você não está na companhia de limosine");
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Você não está em um veiculo.");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não tem permissão");
		return 1;
	}
	if(!strcmp(var1, "/alugarlimo", true))
	{
		if(glob2AF8C[playerid] == 32 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8 = 0;
			var7 = function1A10(cmdtext, var4, 32);
			glob2FABC[playerid]++;
			if(glob319FC[playerid] == 1)
			{
				udb_setBankMoney(function705E0(playerid), udb_getBankMoney(function705E0(playerid)) - 400);
				SendClientMessage(playerid, 0x2CCC6CAA, "Limosine alugada por R$400 o dinheiro foi retirado do banco, não esqueça de devolver a Limosine");
				var8 = CreateVehicle(glob1878C, -1974.1918, 724.8635, 45.0974, 266.6841, 0, 0, 0);
				SetTimerEx("alugarlimo", 600000, true, "dd", var8, playerid);
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Você não está na companhia de limosines");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não é motorista");
		return 1;
	}
	if(!strcmp(var1, "/devolverlimo", true))
	{
		if(glob2AF8C[playerid] == 32)
		{
			new var7[256];
			new var8 = 0;
			new var9 = GetVehicleModel(GetPlayerVehicleID(playerid));
			if(var9 == glob1878C)
			{
				var7 = function1A10(cmdtext, var4, 32);
				var8 = GetPlayerVehicleID(playerid);
				if(glob319FC[playerid] == 1)
				{
					if(IsPlayerInVehicle(playerid, var8))
					{
						if(!glob326B0[var8])
						{
							glob2FABC[playerid]--;
							DestroyVehicle(var8);
							SendClientMessage(playerid, 0xFFFFFFAA, "Limosine Devolvida com sucesso");
							return 1;
						}
						SendClientMessage(playerid, 0xFFFFFFAA, "Limosine Devolvida com sucesso");
						SendClientMessage(playerid, 0x2CCC6CAA, "Obrigado por lavar nossas limosines você recebeu $150 pelo bom trabalho.");
						glob2FABC[playerid]--;
						GivePlayerMoney(playerid, 150);
						DestroyVehicle(var8);
						return 1;
					}
					SendClientMessage(playerid, 0xDD0000FF, "Você não está em um carro");
					return 1;
				}
				SendClientMessage(playerid, 0xDD0000FF, "Você não está na companhia de limosines");
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Você tem que estar numa limosine");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não é motorista particular");
		return 1;
	}
	if(!strcmp(var1, "/buycell", true))
	{
		new var7 = 0;
		var7 = udb_getcell(function705E0(playerid));
		if(GetPlayerMoney(playerid) >= 500)
		{
			if(!var7)
			{
				if(glob31D1C[playerid] == 1 || IsPlayerAdmin(playerid))
				{
					GivePlayerMoney(playerid, -500);
					udb_setcell(function705E0(playerid), 1);
					SendClientMessage(playerid, 0xFFFFFFAA, "Agora você possue um celular!");
					SendClientMessage(playerid, 0xFFFFFFAA, "Digite /calculadorainfo para ver as opções da calculadora dele");
					return 1;
				}
				SendClientMessage(playerid, 0xDD0000FF, "Você não está na operadora");
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Você ja possue celular");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não possue $500 para comprar um celular.");
		return 1;
	}
	if(!strcmp(var1, "/meuscreditos", true))
	{
		new var7 = 0;
		var7 = udb_getcell(function705E0(playerid));
		if(var7 == 1)
		{
			new var8[256];
			format(var8, 256, "Você possue %d créditos em seu celular", udb_getnumcell(function705E0(playerid)));
			SendClientMessage(playerid, 0xFFFFFFAA, var8);
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não possue celular");
		return 1;
	}
	if(!strcmp(var1, "/buycreditos", true))
	{
		new var7[256];
		new var8 = 0;
		var7 = function1A10(cmdtext, var4, 32);
		var8 = strval(var7);
		if(!strlen(var7))
		{
			SendClientMessage(playerid, 0xDD0000FF, "/buycreditos [quantia de creditos]");
			return 1;
		}
		new var9 = 0;
		var9 = udb_getcell(function705E0(playerid));
		new var10 = 0;
		var10 = udb_getnumcell(function705E0(playerid));
		if(var10 + var8 <= 150)
		{
			if(glob31D1C[playerid] == 1 || IsPlayerAdmin(playerid))
			{
				if(var8 * 2 < GetPlayerMoney(playerid))
				{
					if(var9 == 1)
					{
						udb_setnumcell(function705E0(playerid), var8 + udb_getnumcell(function705E0(playerid)));
						GivePlayerMoney(playerid, 0 - (var8 * 2));
						new var11[256];
						format(var11, 256, "Você comprou %d créditos e pagou $%d", var8, var8 * 2);
						SendClientMessage(playerid, 0xFFFFFFAA, var11);
						return 1;
					}
					SendClientMessage(playerid, 0xDD0000FF, "Você não possue celular");
					return 1;
				}
				SendClientMessage(playerid, 0xDD0000FF, "Você não possue dinheiro para comprar");
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Você não está na operadora");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "O Limite de créditos é 150 digite /meuscreditos para ver quanto você tem para ver quanto pode comprar");
		return 1;
	}
	if(!strcmp(var1, "/dividir", true))
	{
		new var7[256];
		new var8[256];
		new var9 = 0;
		new var10 = 0;
		new var11 = 0;
		new var12 = 0;
		var12 = udb_getcell(function705E0(playerid));
		var7 = function1A10(cmdtext, var4, 32);
		var9 = strval(var7);
		if(!strlen(var7))
		{
			SendClientMessage(playerid, 0xDD0000FF, "/dividir [numero 1] [numero 2]");
			return 1;
		}
		var8 = function1A10(cmdtext, var4, 32);
		var10 = strval(var8);
		if(!strlen(var7))
		{
			SendClientMessage(playerid, 0xDD0000FF, "/dividir [numero 1] [numero 2]");
			return 1;
		}
		var11 = var9 / var10;
		if(var12 == 1)
		{
			new var13[256];
			format(var13, 256, "Você dividiu %d por %d e o resultado foi: %d", var9, var10, var11);
			SendClientMessage(playerid, 0xFFFFFFAA, var13);
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não possue celular");
		return 1;
	}
	if(!strcmp(var1, "/multiplicar", true))
	{
		new var7[256];
		new var8[256];
		new var9 = 0;
		new var10 = 0;
		new var11 = 0;
		new var12 = 0;
		var12 = udb_getcell(function705E0(playerid));
		var7 = function1A10(cmdtext, var4, 32);
		var9 = strval(var7);
		if(!strlen(var7))
		{
			SendClientMessage(playerid, 0xDD0000FF, "/multiplicar [numero 1] [numero 2]");
			return 1;
		}
		var8 = function1A10(cmdtext, var4, 32);
		var10 = strval(var8);
		if(!strlen(var7))
		{
			SendClientMessage(playerid, 0xDD0000FF, "/multiplicar [numero 1] [numero 2]");
			return 1;
		}
		var11 = var9 * var10;
		if(var12 == 1)
		{
			new var13[256];
			format(var13, 256, "Você multiplicou %d por %d e o resultado foi: %d", var9, var10, var11);
			SendClientMessage(playerid, 0xFFFFFFAA, var13);
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não possue celular");
		return 1;
	}
	if(!strcmp(var1, "/somar", true))
	{
		new var7[256];
		new var8[256];
		new var9 = 0;
		new var10 = 0;
		new var11 = 0;
		new var12 = 0;
		var12 = udb_getcell(function705E0(playerid));
		var7 = function1A10(cmdtext, var4, 32);
		var9 = strval(var7);
		if(!strlen(var7))
		{
			SendClientMessage(playerid, 0xDD0000FF, "/somar [numero 1] [numero 2]");
			return 1;
		}
		var8 = function1A10(cmdtext, var4, 32);
		var10 = strval(var8);
		if(!strlen(var7))
		{
			SendClientMessage(playerid, 0xDD0000FF, "/somar [numero 1] [numero 2]");
			return 1;
		}
		var11 = var9 + var10;
		if(var12 == 1)
		{
			new var13[256];
			format(var13, 256, "Você somou %d com %d e o resultado foi: %d", var9, var10, var11);
			SendClientMessage(playerid, 0xFFFFFFAA, var13);
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não possue celular");
		return 1;
	}
	if(!strcmp(var1, "/subtrair", true))
	{
		new var7[256];
		new var8[256];
		new var9 = 0;
		new var10 = 0;
		new var11 = 0;
		new var12 = 0;
		var12 = udb_getcell(function705E0(playerid));
		var7 = function1A10(cmdtext, var4, 32);
		var9 = strval(var7);
		if(!strlen(var7))
		{
			SendClientMessage(playerid, 0xDD0000FF, "/subtrair [numero 1] [numero 2]");
			return 1;
		}
		var8 = function1A10(cmdtext, var4, 32);
		var10 = strval(var8);
		if(!strlen(var7))
		{
			SendClientMessage(playerid, 0xDD0000FF, "/subtrair [numero 1] [numero 2]");
			return 1;
		}
		var11 = var9 - var10;
		if(var12 == 1)
		{
			new var13[256];
			format(var13, 256, "Você subtraiu %d por %d e o resultado foi: %d", var9, var10, var11);
			SendClientMessage(playerid, 0xFFFFFFAA, var13);
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não possue celular");
		return 1;
	}
	if(!strcmp(var1, "/culpado", true))
	{
		if(glob2AF8C[playerid] == 25 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8 = 0;
			new var9[256];
			new File:var10 = 0;
			var7 = function1A10(cmdtext, var4, 32);
			var8 = strval(var7);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0x7585C0AA, "/culpado [id]");
				return 1;
			}
			if(IsPlayerConnected(var8))
			{
				if(glob37B20[var8] == 1)
				{
					format(var9, 256, "O Juiz %s declarou %s Culpado.", function705E0(playerid), function705E0(var8));
					SendClientMessageToAll(0x7585C0AA, var9);
					var10 = fopen("reloadrpg.culpados", 3);
					fwrite(var10, var9);
					fclose(var10);
					return 1;
				}
				SendClientMessage(playerid, 0xDD0000FF, "Esse jogador não está aberto para declarações.");
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Jogador não conectado/logado.");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não tem permissão.");
		return 1;
	}
	if(!strcmp(var1, "/inocente", true))
	{
		if(glob2AF8C[playerid] == 25 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8 = 0;
			new var9[256];
			new File:var10 = 0;
			var7 = function1A10(cmdtext, var4, 32);
			var8 = strval(var7);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0x7585C0AA, "/inocente [id]");
				return 1;
			}
			if(IsPlayerConnected(var8))
			{
				if(glob37B20[var8] == 1)
				{
					format(var9, 256, "O Juiz %s declarou %s Inocente.", function705E0(playerid), function705E0(var8));
					SendClientMessageToAll(0x7585C0AA, var9);
					var10 = fopen("reloadrpg.inocentes", 3);
					fwrite(var10, var9);
					fclose(var10);
					return 1;
				}
				SendClientMessage(playerid, 0xDD0000FF, "Esse jogador não está aberto para declarações.");
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Jogador não conectado/logado.");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não tem permissão.");
		return 1;
	}
	if(!strcmp(var1, "/radar", true))
	{
		if(glob2AF8C[playerid] == 43 || IsPlayerAdmin(playerid))
		{
			TogglePlayerControllable(playerid, false);
			ShowMenuForPlayer(glob1D91C, playerid);
			return 1;
		}
	}
	if(!strcmp(var1, "/cacarterrestre", true))
	{
		if(glob2AF8C[playerid] == 22 || glob2AF8C[playerid] == 43 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8 = 0;
			var7 = function1A10(cmdtext, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0x33AA33AA, "Habilitação de direção terrestre removida.");
				return 1;
			}
			var8 = strval(var7);
			if(IsPlayerConnected(var8))
			{
				udb_setHabterre(function705E0(var8), 0);
				SendClientMessage(playerid, 0x33AA33AA, "Habilitação de direção terrestre removida.");
				SendClientMessage(var8, 0x33AA33AA, "Sua Carteira de habilitação terrestre foi caçada, agora não pode dirigir mais nem um veículo terrestre.");
				printf("O Jogador %s(id: %d) deu carteira de habilitaçao terrestre a %s(id: %d).", function705E0(playerid), playerid, function705E0(var8), var8);
				udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "ID inválido");
			return 1;
		}
		if(22 != glob2AF8C[playerid])
		{
			SendClientMessage(playerid, 0xDD0000FF, "Você não é Policial, Conficador.");
			return 1;
		}
	}
	if(!strcmp(var1, "/cacaraerea", true))
	{
		if(glob2AF8C[playerid] == 22 || glob2AF8C[playerid] == 43 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8 = 0;
			var7 = function1A10(cmdtext, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0x33AA33AA, "Habilitação de direção aerea removida.");
				return 1;
			}
			var8 = strval(var7);
			if(IsPlayerConnected(var8))
			{
				udb_setHabaerea(function705E0(var8), 0);
				SendClientMessage(playerid, 0x33AA33AA, "Habilitação de direção aérea removida.");
				SendClientMessage(var8, 0x33AA33AA, "Sua Carteira de habilitação aérea foi caçada, agora não pode dirigir mais nem um veículo aério.");
				printf("O Jogador %s(id: %d) deu carteira de habilitaçao terrestre a %s(id: %d).", function705E0(playerid), playerid, function705E0(var8), var8);
				udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "ID inválido");
			return 1;
		}
		if(22 != glob2AF8C[playerid])
		{
			SendClientMessage(playerid, 0xDD0000FF, "Você não é Policial, Conficador.");
			return 1;
		}
	}
	if(!strcmp(var1, "/cacarnautica", true))
	{
		if(glob2AF8C[playerid] == 22 || glob2AF8C[playerid] == 43 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8 = 0;
			var7 = function1A10(cmdtext, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0x33AA33AA, "Habilitação de direção nautica removida.");
				return 1;
			}
			var8 = strval(var7);
			if(IsPlayerConnected(var8))
			{
				udb_setHabnauti(function705E0(var8), 0);
				SendClientMessage(playerid, 0x33AA33AA, "Habilitação de direção nautica removida.");
				SendClientMessage(var8, 0x33AA33AA, "Sua Carteira de habilitação nautica foi caçada, agora não pode dirigir mais nem um veículo nautico.");
				printf("O Jogador %s(id: %d) deu carteira de habilitaçao terrestre a %s(id: %d).", function705E0(playerid), playerid, function705E0(var8), var8);
				udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "ID inválido");
			return 1;
		}
		if(22 != glob2AF8C[playerid])
		{
			SendClientMessage(playerid, 0xDD0000FF, "Você não é Policial, Conficador.");
			return 1;
		}
	}
	if(!strcmp(var1, "/setcone", true))
	{
		if(glob2AF8C[playerid] == 22 || IsPlayerAdmin(playerid))
		{
			new Float:var7 = 0.0, Float:var8 = 0.0, Float:var9 = 0.0;
			GetPlayerPos(playerid, var7, var8, var9);
			SetTimerEx("SetCone", 5000, false, "fff", var7, var8, var9);
			SendClientMessage(playerid, 0x33AA33AA, "Você adicionou um cone neste local, dentro de 5 segundos ele aparecerá.");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não é Policial Rodoviario");
		return 1;
	}
	if(!strcmp(var1, "/multar", true))
	{
		if(glob2AF8C[playerid] == 21 || glob2AF8C[playerid] == 56 || glob2AF8C[playerid] == 45 || glob2AF8C[playerid] == 24 || glob2AF8C[playerid] == 22 || glob2AF8C[playerid] == 28 || glob2AF8C[playerid] == 23 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8 = 0;
			new var9 = 0;
			new var10[256];
			var7 = function1A10(cmdtext, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/multar [id] [valor]");
				return 1;
			}
			var8 = strval(var7);
			var7 = function1A10(cmdtext, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/multar [id] [valor]");
				return 1;
			}
			var9 = strval(var7);
			if(var9 > 1000 || var9 <= 0)
			{
				SendClientMessage(playerid, 0xDD0000FF, "Você não está querendo multar de forma justa.");
				return 1;
			}
			if(IsPlayerConnected(var8))
			{
				format(var10, 256, "Você recebeu uma multa de %d dada por %s. Descontade direto de sua conta bancaria.", var9, function705E0(playerid));
				SendClientMessage(var8, 0x33AA33AA, var10);
				SendClientMessage(playerid, 0x33AA33AA, "Multa dada.");
				printf("O Jogador %s(id: %d) deu uma multa para %s(id: %d) de R$%d.", function705E0(playerid), playerid, function705E0(var8), var8, var9);
				udb_setBankMoney(function705E0(var8), udb_getBankMoney(function705E0(var8)) - var9);
				udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "O jogador não está conectado!");
			return 1;
		}
		if(21 != glob2AF8C[playerid] || 56 != glob2AF8C[playerid] || 22 != glob2AF8C[playerid] || 28 != glob2AF8C[playerid] || 23 != glob2AF8C[playerid])
		{
			SendClientMessage(playerid, 0xDD0000FF, "Você não é policial.");
			return 1;
		}
		return 1;
	}
	if(!strcmp(var1, "/procurar", true))
	{
		if(glob2AF8C[playerid] == 21 || glob2AF8C[playerid] == 56 || glob2AF8C[playerid] == 29 || glob2AF8C[playerid] == 24 || glob2AF8C[playerid] == 22 || glob2AF8C[playerid] == 23 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8[256];
			new var9[256];
			new var10 = 0;
			var7 = function1A10(cmdtext, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0x4C62B3AA, "SERVIDOR: Comando não encontrado.");
				return 1;
			}
			var10 = strval(var7);
			if(IsPlayerConnected(var10) && glob1A0CC[playerid] == 1)
			{
				glob2B5CC[var10] = 1;
				format(var9, 256, "%s agora está com %d niveis de procurados", function705E0(var10), GetPlayerWantedLevel(var10) + 1);
				SendClientMessageToAll(0x4C62B3AA, var9);
				format(var8, 256, "Você está sendo perseguido pela policia, Você foi colocado na lista por: %s", function705E0(playerid));
				SendClientMessage(var10, 0x4C62B3AA, var8);
				SetPlayerWantedLevel(var10, GetPlayerWantedLevel(var10) + 1);
				return 1;
			}
			SendClientMessage(playerid, 0x4C62B3AA, "SERVIDOR: Comando não encontrado.");
			return 1;
		}
		if(21 != glob2AF8C[playerid] || 56 != glob2AF8C[playerid] || 22 != glob2AF8C[playerid] || 23 != glob2AF8C[playerid] || !IsPlayerAdmin(playerid))
		{
			SendClientMessage(playerid, 0xDD0000FF, "Você não é policial");
			return 1;
		}
	}
	if(!strcmp(var1, "/desprocurar", true))
	{
		if(glob2AF8C[playerid] == 21 || glob2AF8C[playerid] == 56 || glob2AF8C[playerid] == 29 || glob2AF8C[playerid] == 24 || glob2AF8C[playerid] == 22 || glob2AF8C[playerid] == 23 || glob2AF8C[playerid] == 29 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8 = 0;
			var7 = function1A10(cmdtext, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0x4C62B3AA, "SERVIDOR: Comando não encontrado.");
				return 1;
			}
			var8 = strval(var7);
			if(IsPlayerConnected(var8) && glob1A0CC[playerid] == 1)
			{
				glob2B5CC[var8] = 0;
				SendClientMessage(playerid, 0x0099FFAA, "Excluido da lista com suscesso.");
				SendClientMessage(var8, 0x0099FFAA, "Você foi retirado da lista de procurados");
				SetPlayerWantedLevel(var8, 0);
				return 1;
			}
			SendClientMessage(playerid, 0x4C62B3AA, "SERVIDOR: Comando não encontrado.");
			return 1;
		}
		if(21 != glob2AF8C[playerid] || 56 != glob2AF8C[playerid] || 22 != glob2AF8C[playerid] || 23 != glob2AF8C[playerid] || !IsPlayerAdmin(playerid))
		{
			SendClientMessage(playerid, 0xDD0000FF, "Você não é policial");
			return 1;
		}
	}
	if(!strcmp(var1, "/bafometro", true))
	{
		if(glob2AF8C[playerid] == 21 || glob2AF8C[playerid] == 56 || glob2AF8C[playerid] == 22 || glob2AF8C[playerid] == 29 || glob2AF8C[playerid] == 23 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8[256];
			new var9 = 0;
			new var10 = 0;
			var10 = GetDistanceBetweenPlayers(playerid, var9);
			var7 = function1A10(cmdtext, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/bafometro [id]");
				return 1;
			}
			var9 = strval(var7);
			if(IsPlayerConnected(var9) && glob1A0CC[playerid] == 1)
			{
				if(var10 > 20)
				{
					SendClientMessage(playerid, 0xDD0000FF, "Você está muito longe, chegue mais perto!");
					return 1;
				}
				if(var10 <= 20)
				{
					format(var8, 256, "O bafômetro mostra: %s no sangue", glob2DB54);
					SendClientMessage(playerid, 0xFFFF00AA, var8);
					return 1;
				}
			}
			else
			{
				SendClientMessage(playerid, 0xDD0000FF, "Jogador não está conectado/logado");
				return 1;
			}
		}
		if(21 != glob2AF8C[playerid] || 56 != glob2AF8C[playerid] || 22 != glob2AF8C[playerid] || 23 != glob2AF8C[playerid])
		{
			SendClientMessage(playerid, 0xDD0000FF, "Você não é policial");
			return 1;
		}
		return 1;
	}
	if(!strcmp(cmdtext, "/desarmardinamite", true))
	{
		if(glob2AF8C[playerid] == 24 || glob2AF8C[playerid] == 56 || glob2AF8C[playerid] == 22 || glob2AF8C[playerid] == 21 || glob2AF8C[playerid] == 23 || IsPlayerAdmin(playerid))
		{
			new var7 = 0;
			var7 = GetPlayerVehicleID(playerid);
			if(IsPlayerInVehicle(playerid, var7))
			{
				if(glob35BE0[var7] == 1)
				{
					TogglePlayerControllable(playerid, false);
					SendClientMessage(playerid, 0xFFFFFFAA, "Aguarde você esta desarmando a bomba.");
					SetTimerEx("Desarme", 10000, false, "dd", playerid, var7);
					return 1;
				}
				SendClientMessage(playerid, 0xDD0000FF, "Não há nenhuma dinamite plantada nesse carro");
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Você não esta em um veiculo");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não tem permissão");
		return 1;
	}
	if(!strcmp(var1, "/reforco", true))
	{
		if(glob2AF8C[playerid] == 24 || glob2AF8C[playerid] == 56 || glob2AF8C[playerid] == 22 || glob2AF8C[playerid] == 21 || IsPlayerAdmin(playerid))
		{
			new var7 = 0;
			new var8[256];
			new var9[256];
			strmid(var8, cmdtext, 8, strlen(cmdtext), 256);
			if(!strlen(var8))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/reforco [id_do_procurado]");
				return 1;
			}
			var7 = strval(var8);
			if(IsPlayerConnected(var7) && glob1A0CC[playerid] == 1)
			{
				SendClientMessage(playerid, 0xFFFF00AA, "Os policiais foram informados");
				for(new var10 = 0; var10 < 200; var10++)
				{
					if(glob2AF8C[var10] == 29 || glob2AF8C[var10] == 56 || glob2AF8C[var10] == 23 || glob2AF8C[var10] == 22 || glob2AF8C[var10] == 21)
					{
						format(var9, 256, "O Policial %s precisa de reforços contra %s", function705E0(playerid), function705E0(var7));
						SendClientMessage(var10, 0xFFFF00AA, var9);
						return 1;
					}
				}
			}
		}
		else
		{
			SendClientMessage(playerid, 0xDD0000FF, "Jogador não conectado/logado!");
			return 1;
		}
		if(24 != glob2AF8C[playerid] || 56 != glob2AF8C[playerid] || 22 != glob2AF8C[playerid] || 21 != glob2AF8C[playerid])
		{
			SendClientMessage(playerid, 0xDD0000FF, "Você não é Policial!");
			return 1;
		}
	}
	if(!strcmp(var1, "/prender", true))
	{
		if(glob2AF8C[playerid] == 21 || glob2AF8C[playerid] == 46 || glob2AF8C[playerid] == 56 || glob2AF8C[playerid] == 45 || glob2AF8C[playerid] == 29 || glob2AF8C[playerid] == 22 || glob2AF8C[playerid] == 24 || glob2AF8C[playerid] == 23 || glob2AF8C[playerid] == 26 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8 = 0;
			new var9 = 0;
			new var10[256];
			var9 = GetDistanceBetweenPlayers(playerid, var8);
			var7 = function1A10(cmdtext, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/prender [id]");
				return 1;
			}
			var8 = strval(var7);
			if(IsPlayerConnected(var8) && glob1A0CC[var8] == 1)
			{
				if(var9 > 10)
				{
					SendClientMessage(playerid, 0xDD0000FF, "Chegue mais perto!");
					return 1;
				}
				if(var9 <= 10)
				{
					RemovePlayerFromVehicle(var8);
					glob2A94C[var8] = 1;
					udb_setPrisao(function705E0(var8), 1);
					SetTimerEx("Prisao", 2000, false, "%d", var8);
					RemovePlayerFromVehicle(var8);
					LogarPlayer(var8);
					format(var10, 256, "Você foi preso por: %s", function705E0(playerid));
					SendClientMessage(var8, 0x81ABABAA, var10);
					SendClientMessage(playerid, 0x33AA33AA, "Prisão concluida");
					SetPlayerSpecialAction(var8, 10);
					printf("O Jogador %s(id: %d) prendeu %s(id: %d).", function705E0(playerid), playerid, function705E0(var8), var8);
					udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
					return 1;
				}
			}
			else
			{
				SendClientMessage(playerid, 0xDD0000FF, "Jogador não está conectado/logado");
				return 1;
			}
		}
		if(21 != glob2AF8C[playerid] || 56 != glob2AF8C[playerid] || 45 != glob2AF8C[playerid] || 22 != glob2AF8C[playerid] || 24 != glob2AF8C[playerid] || 23 != glob2AF8C[playerid])
		{
			SendClientMessage(playerid, 0xDD0000FF, "Você não é policial/Delegado");
			return 1;
		}
	}
	if(!strcmp(var1, "/soltar", true))
	{
		if(glob2AF8C[playerid] == 25 || glob2AF8C[playerid] == 46 || glob2AF8C[playerid] == 56 || glob2AF8C[playerid] == 29 || glob2AF8C[playerid] == 45 || glob2AF8C[playerid] == 24 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8 = 0;
			var7 = function1A10(cmdtext, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/soltar [id]");
				return 1;
			}
			var8 = strval(var7);
			if(IsPlayerConnected(var8) && glob1A0CC[playerid] == 1)
			{
				if(!glob2A94C[var8])
				{
					SendClientMessage(playerid, 0xDD0000FF, "O jogador não está preso!");
					return 1;
				}
				udb_setPrisao(function705E0(playerid), 0);
				glob2A94C[var8] = 0;
				SetSpawnInfo(var8, 0, udb_getSkin(function705E0(var8)), -1605.3073, 718.3339, 11.9386, 0.0, 0, 0, 0, 0, 0, 0);
				SetPlayerInterior(var8, 0);
				SpawnPlayer(var8);
				SetPlayerWantedLevel(var8, 0);
				SendClientMessage(var8, 0x33AA33AA, "Sua sentença acabou, não cometa mais crimes, ou será preso novamente.");
				format(var7, 256, "Você foi solto por %s", function705E0(playerid));
				SendClientMessage(var8, 0x33AA33AA, var7);
				SendClientMessage(playerid, 0x33AA33AA, "Libertado");
				udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Jogador não está conectado/logado");
			return 1;
		}
		if(25 != glob2AF8C[playerid] || 56 != glob2AF8C[playerid] || glob2AF8C[playerid] == 45 || 24 != glob2AF8C[playerid])
		{
			SendClientMessage(playerid, 0xDD0000FF, "Você não é Policial.");
			return 1;
		}
	}
	if(!strcmp(var1, "/examead", true))
	{
		if(glob2AF8C[playerid] == 26 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8 = 0;
			new var9[4];
			var7 = function1A10(cmdtext, var4, 32);
			var8 = strval(var7);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/examead [id]");
				return 1;
			}
			if(IsPlayerConnected(var8))
			{
				var9[0] = glob26454[var8];
				var9[1] = glob26A94[var8];
				var9[2] = glob26774[var8];
				var9[3] = glob26DB4[var8];
				new var10[256];
				new var11[256];
				new var12[256];
				new var13[256];
				new var14[256];
				format(var10, 256, "Exame anti-drogas de %s", function705E0(var8));
				SendClientMessage(playerid, 0x7585C0AA, var10);
				format(var11, 256, "Maconha: %d dose(s)", var9);
				SendClientMessage(playerid, 0xFFFFFFAA, var11);
				format(var12, 256, "Cocaína: %d dose(s)", var9);
				SendClientMessage(playerid, 0xFFFFFFAA, var12);
				format(var13, 256, "Heroína: %d dose(s)", var9);
				SendClientMessage(playerid, 0xFFFFFFAA, var13);
				format(var14, 256, "Crack: %d dose(s)", var9);
				SendClientMessage(playerid, 0xFFFFFFAA, var14);
				SendClientMessage(playerid, 0x7585C0AA, "Exame anti-drogas concluído.");
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Jogador não conectado/logado.");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não tem permissão.");
		return 1;
	}
	if(!strcmp(var1, "/revisardrogas", true))
	{
		if(glob2AF8C[playerid] == 26 || IsPlayerAdmin(playerid))
		{
			if(IsPlayerInAnyVehicle(playerid))
			{
				if(!glob331A4[GetPlayerVehicleID(playerid)])
				{
					SendClientMessage(playerid, 0xFFFFFFAA, "Este carro está livre! Não possue nenhuma droga plantada nele");
					return 1;
				}
				if(glob331A4[GetPlayerVehicleID(playerid)] == 1)
				{
					SendClientMessage(playerid, 0xFFFFFFAA, "Esse carro possue drogas plantadas é melhor você ir atras do dono");
					udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
					return 1;
				}
			}
			else
			{
				SendClientMessage(playerid, 0xDD0000FF, "Você não está em um veiculo");
				return 1;
			}
		}
		else
		{
			SendClientMessage(playerid, 0xDD0000FF, "Você não tem permissão");
			return 1;
		}
	}
	if(!strcmp(var1, "/verdrogas", true))
	{
		if(glob2AF8C[playerid] == 26 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8[256];
			new var9 = 0;
			var7 = function1A10(cmdtext, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/verdrogas [id]");
				return 1;
			}
			var9 = strval(var7);
			if(IsPlayerConnected(var9) && glob1A0CC[playerid] == 1)
			{
				if(GetDistanceBetweenPlayers(playerid, var9) > 20)
				{
					SendClientMessage(playerid, 0xDD0000FF, "Você está muito longe, chegue mais perto!");
					return 1;
				}
				SendClientMessage(playerid, 0xFFFF00AA, "Drogas:");
				format(var8, 256, "Maconha : %d cigarro(s)", 139532);
				SendClientMessage(playerid, 0xFFFF00AA, var8);
				format(var8, 256, "Cocaína : %d grama(s)", 140332);
				SendClientMessage(playerid, 0xFFFF00AA, var8);
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Jogador não conectado/logado");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não tem permissão para isso!");
		return 1;
	}
	if(!strcmp(var1, "/pt", true))
	{
		new var7[256];
		new var8[256];
		strmid(var7, cmdtext, 3, strlen(cmdtext), 256);
		if(!strlen(var7))
		{
			SendClientMessage(playerid, 0xDD0000FF, "/pt [texto]");
			return 1;
		}
		for(new var9 = 0; var9 < 200; var9++)
		{
			if(glob2AF8C[var9] == glob2AF8C[playerid])
			{
				format(var8, 256, "%s: %s", function705E0(playerid), var7);
				SendClientMessage(var9, GetPlayerColor(playerid), var8);
				SendClientMessage(playerid, GetPlayerColor(playerid), var8);
				return 1;
			}
		}
		return 1;
	}
	if(!strcmp(cmdtext, "/profissao", true))
	{
		if(glob2AF8C[playerid] == 2)
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Comandos de sua profissão - ENTREGADOR DE PIZZA");
			SendClientMessage(playerid, 0xFFF297AA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, 0xFFF297AA, "/sellpizza [id] [sabor] : Vende uma pizza a um jogador.");
			SendClientMessage(playerid, 0xFFF297AA, "/sellbebida [id] [bebida] : Vende uma bebida a um jogador.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Seu objetivo agora é vender pizzas pela cidade! Digite /pizzas para ver os sabores.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Toda vez que alguém quizer pizza fará /pizza tamem tente vender bebidas! Digite /bebidas para ver.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Bom Trabalho.");
		}
		else if(glob2AF8C[playerid] == 3)
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Comandos de sua profissão - BARMAN");
			SendClientMessage(playerid, 0xB2FB92AA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, 0xB2FB92AA, "/sellcerveja [id] [teor] : Vende uma bebida alcoolica e adiciona o teor de alcool no sangue da pessoa");
			SendClientMessage(playerid, 0xB2FB92AA, "/sellbebida [id] [bebida] : Vende uma bebida a um jogador.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Agora você é um barman. Tente vender cervejas por um preço mais barato que os bares da cidade.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Também venda bebidas! Digite /bebidas para ver as bebidas.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Bom Trabalho.");
		}
		else if(glob2AF8C[playerid] == 54)
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Comandos de sua profissão - VENDEDOR DE BOMBAS");
			SendClientMessage(playerid, 0xEFAB3FAA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, 0xEFAB3FAA, "/sellbombagas [id] :  Vende uma bomba de gas para alguém.");
			SendClientMessage(playerid, 0xEFAB3FAA, "/sellgranada [id] : Vende uma granada para alguém.");
			SendClientMessage(playerid, 0xEFAB3FAA, "/sellmolotov [id] : Vende um molotov a um jogador.");
			SendClientMessage(playerid, 0xEFAB3FAA, "/selldinamite [id] : Vende uma dinamite a um jogador.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Agora você é um vendedor de bombas. Venda suas bombas pela cidade e aumente o crime cada vez mais.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Quando muita gente não ter paciencia de tanta guerra iram comprar uma bomba com você para se defender.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Ou até mesmo para explodir alguém. Bom Trabalho.");
		}
		else if(glob2AF8C[playerid] == 55)
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Comandos de sua profissão - PROSTITUTA");
			SendClientMessage(playerid, 0xFD23F0AA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, 0xFD23F0AA, "/sexo [id] : Começa a fazer sexo com alguém.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Agora que você é uma prostituta deverá fazer sexo com os outros e enquanto o sexo vai indo.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Você irá recebendo $2 enquanto estiver fazendo sexo.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Bom Trabalho.");
		}
		else if(glob2AF8C[playerid] == 46)
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Comandos de sua profissão - JUSTIÇA FEDERAL");
			SendClientMessage(playerid, 0xC73614AA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, 0xC73614AA, "/tribunal [id 1] [id 2] [daqui a quanto tempo] : Marca um tribunal com dois jogadores depois de um certo tempo.");
			SendClientMessage(playerid, 0xC73614AA, "/fimtribunais : Dá fim a todos os tribunais que estão tendo.");
			SendClientMessage(playerid, 0xC73614AA, "/prender [id] : Prende um jogador.");
			SendClientMessage(playerid, 0xC73614AA, "/soltar [id] : Solta um jogador da prisão.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Você é um trabalhador da justiça federal. Deverá marcar tribunais, selecionar os júizes e ajudar a decidir os casos.");
			SendClientMessage(playerid, 0xFFFFFFAA, "OBS: Nunca se esqueça de dar fim aos tribunais depois das declarações dos júizes.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Bom Trabalho.");
		}
		else if(glob2AF8C[playerid] == 4)
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Comandos de sua profissão - SORVETEIRO");
			SendClientMessage(playerid, 0xFF91ECAA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, 0xFF91ECAA, "/sellsorvete [id] [sabor] : Vende um sorvete a um jogador.");
			SendClientMessage(playerid, 0xFF91ECAA, "/pegarsorvete [bolas] : Pega sorvetes para vender!");
			SendClientMessage(playerid, 0xFFFFFFAA, "Agora você é um sorveteiro. Pegue os sorvetes na sorveteria e comece a vender.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Digite /sabores para ver os sabores de sorvete.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Bom Trabalho.");
		}
		else if(glob2AF8C[playerid] == 5)
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Comandos de sua profissão - VENDEDOR DE LANCHES");
			SendClientMessage(playerid, 0xBDD94CFF, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, 0xBDD94CFF, "/selllanche [id] [lanche] : Vende um lanche a um jogador.");
			SendClientMessage(playerid, 0xBDD94CFF, "/vhotdog [id] [1-prensado ou 2-tradicional] : Vende um cachorro quente a um jogador.");
			SendClientMessage(playerid, 0xBDD94CFF, "/sellbebida [id] [bebida] : Vende uma bebida a um jogador.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Agora você é um vendedor de lanches. Digite /lanches para ver os lanches disponíveis.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Além de vender lanches e bebidas venda cachorros-quentes basta estar no carro de cachorro quente.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Bom Trabalho.");
		}
		else if(glob2AF8C[playerid] == 6)
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Comandos de sua profissão - PARAMEDICO");
			SendClientMessage(playerid, 0xFF9191FF, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, 0xFF9191FF, "/socorrer [id] : Socorre um jogador enchendo sua vida.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Bom Trabalho.");
		}
		else if(glob2AF8C[playerid] == 7)
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Comandos de sua profissão - INSTRUTOR DE DIREÇÃO");
			SendClientMessage(playerid, 0xFF7200FF, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, 0xFF7200FF, "/habaero : Habilita uma pessoa a dirigir veículos aereos (aviões e helicopteros).");
			SendClientMessage(playerid, 0xFF7200FF, "/habterrestre : Habilita uma pessoa a dirigir veículos terrestres (carros e motos).");
			SendClientMessage(playerid, 0xFF7200FF, "/habnautica : Habilita uma pessoa a dirigir veículos nauticos (barcos).");
			SendClientMessage(playerid, 0xFFFFFFAA, "Bom Trabalho.");
		}
		else if(glob2AF8C[playerid] == 45)
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Comandos de sua profissão - RECEITA FEDERAL");
			SendClientMessage(playerid, 0x34C6ACAA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, 0x34C6ACAA, "/removercontrabando : Remove o contrabando de alguém.");
			SendClientMessage(playerid, 0x34C6ACAA, "/permitircontrabando : Permite o contrabando de alguém.");
			SendClientMessage(playerid, 0x34C6ACAA, "/revisarcontrabando : Revisa o contrabando de alguém.");
			SendClientMessage(playerid, 0x34C6ACAA, "/prender [id] : Prende quem estiver fazendo contrabando.");
			SendClientMessage(playerid, 0x34C6ACAA, "/soltar [id] : Solta alguem da prisão.");
			SendClientMessage(playerid, 0x34C6ACAA, "/multar [id] [amount] : Multa alguem que estiver fazendo contrabando.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Agora você é Receita Federal. Muitas vezes revise os contrabandos e caso estiver precisando de uma graninha.");
			SendClientMessage(playerid, 0xFFFFFFAA, "peça dinheiro ao contrabandista e permita o contrabando. Quando for a primeira vez pode dar uma chance apenas multando. Bom Trabalho.");
		}
		else if(glob2AF8C[playerid] == 8)
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Comandos de sua profissão - FRENTISTA");
			SendClientMessage(playerid, 0x662228FF, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, 0x662228FF, "/sellcomb [id] [litros] : Vende combustivel a um jogador.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Bom Trabalho.");
		}
		else if(glob2AF8C[playerid] == 9)
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Comandos de sua profissão - TAXISTA");
			SendClientMessage(playerid, 0xFFFC00AA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, 0xFFFC00AA, "/staxi [id] : Começa a rodar o taxímetro (o passageiro tem que estar no seu carro).");
			SendClientMessage(playerid, 0xFFFFFFAA, "Bom Trabalho.");
		}
		else if(glob2AF8C[playerid] == 10)
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Comandos de sua profissão - MOTO-TAXI");
			SendClientMessage(playerid, 0xC3C105AA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, 0xC3C105AA, "/mtaxi [id] : Começa a rodar o moto-taxímetro (o passageiro tem que estar em sua moto).");
			SendClientMessage(playerid, 0xFFFFFFAA, "Bom Trabalho.");
		}
		else if(glob2AF8C[playerid] == 11)
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Comandos de sua profissão - TAXISTA AÉREO");
			SendClientMessage(playerid, 0xC6C55EAA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, 0xC6C55EAA, "/ataxi [id] : Começa a rodar o aero-taxímetro (o passageiro tem que estar em seu helicoptero).");
			SendClientMessage(playerid, 0xFFFFFFAA, "Bom Trabalho.");
		}
		else if(glob2AF8C[playerid] == 25)
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Comandos de sua profissão - JUIZ");
			SendClientMessage(playerid, 0x7585C0AA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, 0x7585C0AA, "/prender [id] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(playerid, 0x7585C0AA, "/soltar [id] : Solta uma pessoa da cadeia.");
			SendClientMessage(playerid, 0x7585C0AA, "/culpado [id] : Declara alguem culpado.");
			SendClientMessage(playerid, 0x7585C0AA, "/inocente [id] : Declara alguem inocente.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Você é um Juiz. Todas suas declarações serão totalmente importantes. É sempre bom consultar os jogadores da receita federal nas declarações.");
			SendClientMessage(playerid, 0xFFFFFFAA, "CUIDADO: Um pequeno erro pode obter grandes sacríficios na sua carreira e nos outros.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Bom Trabalho.");
		}
		else if(glob2AF8C[playerid] == 12)
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Comandos de sua profissão - SEQUESTRADOR");
			SendClientMessage(playerid, 0xFF5A00AA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, 0xFF5A00AA, "/sequestrar [id] : Sequestra um jogador.");
			SendClientMessage(playerid, 0xFF5A00AA, "/oferecerresgate [id] [quantia] : Oferece resgate para um jogador por uma certa quantia.");
			SendClientMessage(playerid, 0xFFFFFFAA, "O seu objetivo é apenas sequestrar alguém, pedir resgate e depois soltar. Você ganhará XL matando os outros também");
			SendClientMessage(playerid, 0xFFFFFFAA, "Bom Trabalho.");
		}
		else if(glob2AF8C[playerid] == 13)
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Comandos de sua profissão - ASSASSINO");
			SendClientMessage(playerid, 0xD22402AA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, 0xD22402AA, "Sua profissão não tem comando especiais! É só matar para ganhar dinheiro e XL.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Bom Trabalho.");
		}
		else if(glob2AF8C[playerid] == 14)
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Comandos de sua profissão - ASSALTANTE");
			SendClientMessage(playerid, 0xFE684BFF, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, 0xFE684BFF, "/assaltar : Assalta um banco.");
			SendClientMessage(playerid, 0xFE684BFF, "/roubar [id] [quantia] : Rouba uma certa quantia de um jogador.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Assalte os bancos,pegue a grana e fuja. Lembre-se: cada vez que for preso isso afetará sua profissão.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Você ganhará XL matando os outros também");
			SendClientMessage(playerid, 0xFFFFFFAA, "Bom Trabalho.");
		}
		else if(glob2AF8C[playerid] == 15)
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Comandos de sua profissão - LADRÃO DE CARROS");
			SendClientMessage(playerid, 0xCE2A2AFF, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, 0xCE2A2AFF, "/desmanchar : Vende um carro pro desmanche.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Você deve levar veiculos para o desmanche e desmancha-los utilizando o comando /desmanchar.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Você ganhará XL matando os outros também");
			SendClientMessage(playerid, 0xFFFFFFAA, "Bom Trabalho.");
		}
		else if(glob2AF8C[playerid] == 51)
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Comandos de sua profissão - PROMOTER");
			SendClientMessage(playerid, 0x25CE98AA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, 0x25CE98AA, "/contagem : Começa a fazer uma contagem (Isso poderá servir para corridas de carros).");
			SendClientMessage(playerid, 0x25CE98AA, "/organizarfesta [local] : Avisa a todos onde terá uma festa.");
			SendClientMessage(playerid, 0x25CE98AA, "/sellconvite [id] : Vende convite para alguém.");
			SendClientMessage(playerid, 0x25CE98AA, "/verificar [id] : Verifica se alguém possue convite.");
			SendClientMessage(playerid, 0x25CE98AA, "/recolherconvite [id] : Recolhe o convite de alguém.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Agora você é um promoter. Seu objetivo é organizar festas e eventos cobrando uma certa quantia em grana.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Você também poderá fazer festas publicas contratando barmans, fazendo eventos e também verificar as pessoas que possuem convites.");
			SendClientMessage(playerid, 0xFFFFFFAA, "OBS: Quando fizer uma festa lembre-se de entregar os convites e recolhe-los depois. Bom Trabalho.");
		}
		else if(glob2AF8C[playerid] == 16)
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Comandos de sua profissão - TRAFICANTE");
			SendClientMessage(playerid, 0xD94242FF, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, 0xD94242FF, "/selldroga [id] [id-da-droga] [doses] : Vende uma droga para um jogador.");
			SendClientMessage(playerid, 0xD94242FF, "/meusbags : Vê quantos bagulhos você possue.");
			SendClientMessage(playerid, 0xD94242FF, "/comprarbagulho [quantia] : Compra bagulhos para poder vender as drogas.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Para ver os ids das drogas digite /drogas.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Bom Trabalho.");
		}
		else if(glob2AF8C[playerid] == 47)
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Comandos de sua profissão - LIDER DE TRAFICO");
			SendClientMessage(playerid, 0x9B3B0CAA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, 0x9B3B0CAA, "/selldroga [id] [id-da-droga] [doses] : Vende uma droga para um jogador.");
			SendClientMessage(playerid, 0x9B3B0CAA, "/comprarbagulho [quantia] : Compra bagulho para poder vender as drogas.");
			SendClientMessage(playerid, 0x9B3B0CAA, "/meusbags : Vê quantos bagulhos você possue.");
			SendClientMessage(playerid, 0x9B3B0CAA, "/pdrogas : Planta drogas em um veiculo.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Agora você é líder de tráfico ou seja será o lider de todos os traficantes.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Você agora tem os mesmos objetivos que os traficantes, pegar bagulhos para poder vender as drogas e");
			SendClientMessage(playerid, 0xFFFFFFAA, "para ver os ids das drogas digite /drogas.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Bom Trabalho.");
		}
		else if(glob2AF8C[playerid] == 17)
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Comandos de sua profissão - VENDEDOR DE ARMAS");
			SendClientMessage(playerid, 0xAC5050FF, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, 0xAC5050FF, "/setarma [id] [id_da_arma] [balas] : Vende um carro pro desmanche.");
			SendClientMessage(playerid, 0xAC5050FF, "/colete [id] : Vende um colete para alguem.");
			SendClientMessage(playerid, 0xAC5050FF, "/camuflar [id] [tempo] : Camufla alguem por um tempo(em minutos).");
			SendClientMessage(playerid, 0xFFFFFFAA, "Agora você é um vendedor de armas. Venda armas, coletes e camuflagens para os outros jogadores.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Os ids das armas você encontra digitando /armas (1 a 9), /armas2 (10 a 18), /armas3 (22 a 30) e /armas4 (31 a 34).");
			SendClientMessage(playerid, 0xFFFFFFAA, "Bom Trabalho.");
		}
		else if(glob2AF8C[playerid] == 18)
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Comandos de sua profissão - CAÇADOR");
			SendClientMessage(playerid, 0xAB2DCFAA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, 0xAB2DCFAA, "/cacar : Caça animais (você precisa estar na Area de Caça).");
			SendClientMessage(playerid, 0xAB2DCFAA, "/sellcaca : Vende sua Caça.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Bom Trabalho.");
		}
		else if(glob2AF8C[playerid] == 57)
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Comandos de sua profissão - TRANSPORTE DE VALORES");
			SendClientMessage(playerid, 0x517C2EAA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, 0x517C2EAA, "/pegarvalores : Pega valores de um carro forte.");
			SendClientMessage(playerid, 0x517C2EAA, "/entregarvalores : Entrega os valores ao banco.");
			SendClientMessage(playerid, 0x517C2EAA, "/verbolsa : Vê sua bolsa de valores.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Você é um transportador de valores. Você deve pegar uma bolsa de valores que estarão nos carros fortes e");
			SendClientMessage(playerid, 0xFFFFFFAA, "entregar ao banco. A cada entrega você recebera 25 por cento da bolsa entregue.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Bom Trabalho.");
		}
		else if(glob2AF8C[playerid] == 42)
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Comandos de sua profissão - MECANICO");
			SendClientMessage(playerid, 0x00BC6FAA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, 0x00BC6FAA, "/consertar [id] : Conserta um carro.");
			SendClientMessage(playerid, 0x00BC6FAA, "/pintar [id] [cor1] [cor2] :  Pinta um carro.");
			SendClientMessage(playerid, 0x00BC6FAA, "/lavar [id] : Lava o carro de alguem.");
			SendClientMessage(playerid, 0x00BC6FAA, "/placa [nome] : Troca a placa do carro de alguem.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Bom Trabalho.");
		}
		else if(glob2AF8C[playerid] == 19)
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Comandos de sua profissão - PESCADOR");
			SendClientMessage(playerid, 0xE89AFFAA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, 0xE89AFFAA, "/pescar : Pesca (você precisa estar na Area de Pesca).");
			SendClientMessage(playerid, 0xE89AFFAA, "/sellpesca : Vende sua Pesca.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Bom Trabalho.");
		}
		else if(glob2AF8C[playerid] == 20)
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Comandos de sua profissão - AGRICULTOR");
			SendClientMessage(playerid, 0x9AFFDDAA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, 0x9AFFDDAA, "/plantar : Planta milho.");
			SendClientMessage(playerid, 0x9AFFDDAA, "/colher : Colhe o milho.");
			SendClientMessage(playerid, 0x9AFFDDAA, "/sellmilho : Vende o milho a Fazenda.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Bom Trabalho.");
		}
		else if(glob2AF8C[playerid] == 21)
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Comandos de sua profissão - POLICIAL CIVIL");
			SendClientMessage(playerid, 0x9EB3FFAA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, 0x9EB3FFAA, "/prender [id] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(playerid, 0x9EB3FFAA, "/bafometro [id] : Vê o teor de alcool no sangue de alguém");
			SendClientMessage(playerid, 0x9EB3FFAA, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, 0x9EB3FFAA, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
			SendClientMessage(playerid, 0x9EB3FFAA, "/multar [id] [valor] : Multar um Jogador.");
			SendClientMessage(playerid, 0x9EB3FFAA, "/desarmardinamite : Desarma uma dinamite plantada em um carro.");
			SendClientMessage(playerid, 0xFFFFFFAA, "A cidade está cheia de bandidos, por isso sua missão é cuidar bem da cidade, evitando assaltos, roubos, crimes");
			SendClientMessage(playerid, 0xFFFFFFAA, "assassinatos e rachas. Bom Trabalho!");
		}
		else if(glob2AF8C[playerid] == 22)
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Comandos de sua profissão - POLICIAL RODOVIARIO");
			SendClientMessage(playerid, 0x4970FFAA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, 0x4970FFAA, "/prender [id] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(playerid, 0x4970FFAA, "/bafometro [id] : Vê o teor de alcool no sangue de alguém");
			SendClientMessage(playerid, 0x4970FFAA, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, 0x4970FFAA, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
			SendClientMessage(playerid, 0x4970FFAA, "/multar [id] [valor] : Multar uma pessoa.");
			SendClientMessage(playerid, 0x4970FFAA, "/cacarterrestre [id] : Caça a carteira de um Jogador.");
			SendClientMessage(playerid, 0x4970FFAA, "/desarmardinamite : Desarma uma dinamite plantada em um carro.");
			SendClientMessage(playerid, 0xFFFFFFAA, "As Estradas são muito perigosas, por isso sua missão é cuidar de nossas estradas, evitando rachas e dando multa");
			SendClientMessage(playerid, 0xFFFFFFAA, "a jogadores a cima da velocidade permitida. Bom Trabalho!");
		}
		else if(glob2AF8C[playerid] == 23)
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Comandos de sua profissão - ATIRADOR DE ELITE");
			SendClientMessage(playerid, 0x4C62B3AA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, 0x4C62B3AA, "/prender [id] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(playerid, 0x4C62B3AA, "/bafometro [id] : Vê o teor de alcool no sangue de alguém");
			SendClientMessage(playerid, 0x4C62B3AA, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, 0x4C62B3AA, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
			SendClientMessage(playerid, 0x4C62B3AA, "/multar [id] [valor] : Multar uma pessoa.");
			SendClientMessage(playerid, 0x4C62B3AA, "/desarmardinamite : Desarma uma dinamite plantada em um carro.");
			SendClientMessage(playerid, 0xFFFFFFAA, "A Policia trabalha bem, mais quando a policia não consegur prender ou matar o assassino é chamado Atiradores de Elite. Por isso sua missão é ficar sempre");
			SendClientMessage(playerid, 0xFFFFFFAA, "a disposição para matar assassinos e ladrões Bom Trabalho!");
		}
		else if(glob2AF8C[playerid] == 24)
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Comandos de sua profissão - DELEGADO");
			SendClientMessage(playerid, 0x0024ACAA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, 0x0024ACAA, "/prender [id] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(playerid, 0x0024ACAA, "/soltar [id] : Solta uma pessoa da cadeia.");
			SendClientMessage(playerid, 0x0024ACAA, "/multar [id] [valor] : Multar uma pessoa.");
			SendClientMessage(playerid, 0x0024ACAA, "/exercito [mensagen] : pede ajuda ao exercito.");
			SendClientMessage(playerid, 0x0024ACAA, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, 0x0024ACAA, "/desarmardinamite : Desarma uma dinamite plantada em um carro.");
			SendClientMessage(playerid, 0x0024ACAA, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Bom Trabalho.");
		}
		else if(glob2AF8C[playerid] == 56)
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Comandos de sua profissão - XERIFE");
			SendClientMessage(playerid, 0x6A641EAA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, 0x6A641EAA, "/prender [id] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(playerid, 0x6A641EAA, "/soltar [id] : Solta uma pessoa da cadeia.");
			SendClientMessage(playerid, 0x6A641EAA, "/multar [id] [valor] : Multar uma pessoa.");
			SendClientMessage(playerid, 0x6A641EAA, "/reforco [id do procurado] : Pede reforço para pegar algum procurado.");
			SendClientMessage(playerid, 0x6A641EAA, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, 0x6A641EAA, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
			SendClientMessage(playerid, 0x6A641EAA, "/desarmardinamite : Desarma uma dinamite plantada em um carro.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Bom Trabalho.");
		}
		else if(glob2AF8C[playerid] == 26)
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Comandos de sua profissão - NARCOTICOS:");
			SendClientMessage(playerid, 0xD7DFFFAA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, 0xD7DFFFAA, "/examead [id] : Realiza o exame anti-dopping para verificar a presença de entorpecentes no sangue de um jogador.");
			SendClientMessage(playerid, 0xD7DFFFAA, "/revisardrogas : Revisa se um carro possue drogas.");
			SendClientMessage(playerid, 0xD7DFFFAA, "/verdrogas [id] : Vê se alguma pessoa fumou drogas.");
			SendClientMessage(playerid, 0xD7DFFFAA, "/prender [id] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Bom Trabalho.");
		}
		else if(glob2AF8C[playerid] == 27)
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Comandos de sua profissão - POLICIAL FLORESTAL:");
			SendClientMessage(playerid, 0x00FFEAFF, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, 0x00FFEAFF, "/cacaon : Liga a temporada de Caça.");
			SendClientMessage(playerid, 0x00FFEAFF, "/cacaoff : Desliga a temporada de Caça");
			SendClientMessage(playerid, 0x00FFEAFF, "/vercaca : Vê se um jogador está caçando.");
			SendClientMessage(playerid, 0x00FFEAFF, "/prendercaca [id] : Prende quem estiver caçando.");
			SendClientMessage(playerid, 0x00FFEAFF, "/multar : Multa um jogador.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Bom Trabalho.");
		}
		else if(glob2AF8C[playerid] == 28)
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Comandos de sua profissão - IBAMA:");
			SendClientMessage(playerid, 0x04AB6EAA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, 0x04AB6EAA, "/piracema : Liga e Desliga a Piracema.");
			SendClientMessage(playerid, 0x04AB6EAA, "/prenderpesca [id] : Prende quem estiver pescando.");
			SendClientMessage(playerid, 0x04AB6EAA, "/verpesca : Vê se um jogador está pescando.");
			SendClientMessage(playerid, 0x04AB6EAA, "/multar : Multa um jogador.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Bom Trabalho.");
		}
		else if(glob2AF8C[playerid] == 53)
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Comandos de sua profissão - PEDREIRO:");
			SendClientMessage(playerid, 0xE2E2E2AA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, 0xE2E2E2AA, "/pegarferramentas : Pega ferramentas (Você tem que estar na pedreira).");
			SendClientMessage(playerid, 0xE2E2E2AA, "/entregarferramentas : Entrega as ferramentas recebendo R$20 por cada (Você tem que estar na OBRA em San Fierro).");
			SendClientMessage(playerid, 0xE2E2E2AA, "/recolherpedras : Recolhe as pedras (Você tem que estar na pedreira).");
			SendClientMessage(playerid, 0xE2E2E2AA, "/entregarpedras : Entrega as pedras (Você tem que estar na OBRA em San Fierro).");
			SendClientMessage(playerid, 0xFFFFFFAA, "Bom Trabalho.");
		}
		else if(glob2AF8C[playerid] == 41)
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Comandos de sua profissão - LOCADOR DE CARROS");
			SendClientMessage(playerid, 0xFEE765AA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, 0xFEE765AA, "/locar [id] [tempo] : Loca carro por um tempo em minutos para alguem");
			SendClientMessage(playerid, 0xFEE765AA, "/alugueis : Vê a lista de pessoas que locaram um carro");
			SendClientMessage(playerid, 0xFFFFFFAA, "Enquanto você for locador de carros terá acesso aos carros da locadora.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Lembre-se de que se você ficar pegando muitos carros os outros jogadores não terão chance de aluga-los.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Por isso controle-se pegue os carros da locadora apenas quando estiver urgentemente precisando. Bom Trabalho.");
		}
		else if(glob2AF8C[playerid] == 29)
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Comandos de sua profissão - EXERCITO");
			SendClientMessage(playerid, 0x1B7A01AA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, 0x1B7A01AA, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, 0x1B7A01AA, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
			SendClientMessage(playerid, 0x1B7A01AA, "/prender [id] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(playerid, 0x1B7A01AA, "/soltar [id] : Tira um jogador da prisão");
			SendClientMessage(playerid, 0x1B7A01AA, "/bafometro [id] : Vê o teor de alcool no sangue de alguém");
			SendClientMessage(playerid, 0xFFFFFFAA, "Bom Trabalho.");
		}
		else if(glob2AF8C[playerid] == 43)
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Comandos de sua profissão - FISCAL DE VEICULOS:");
			SendClientMessage(playerid, 0xBC8F8FAA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, 0xBC8F8FAA, "/tiraraerea : Tira a habilitação aerea de alguem.");
			SendClientMessage(playerid, 0xBC8F8FAA, "/tirarnautica : Tira a habilitação nautica de alguem");
			SendClientMessage(playerid, 0xBC8F8FAA, "/tirarterrestre : Tira a habilitação terrestre de alguem.");
			SendClientMessage(playerid, 0xBC8F8FAA, "/radar : Vê as opçoes de radares da cidade.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Bom Trabalho.");
		}
		else if(glob2AF8C[playerid] == 30)
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Comandos de sua profissão - ADVOGADO");
			SendClientMessage(playerid, 0x5CFFFDAA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, 0x5CFFFDAA, "/processo [nome_do_reu] [descrição_da_causa] : Entra com um processo em favor ao réu.");
			SendClientMessage(playerid, 0x5CFFFDAA, "/fianca [id] [quantia] : Oferece proposta de fiança para um jogador.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Agora você é um advogado. Tente defender seus clientes cada vez mais e lembre-se caso precise você poderá oferecer");
			SendClientMessage(playerid, 0xFFFFFFAA, "propostas de fianças para os outros jogadores saírem da prisão.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Bom Trabalho.");
		}
		else if(glob2AF8C[playerid] == 31)
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Comandos de sua profissão - SEGURANÇA");
			SendClientMessage(playerid, 0x81ABABAA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, 0xFFFFFFAA, "Por enquanto sua profissão não tem comandos especiais mas aguarde para isso estamos trabalhando.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Seu objetivo agora é defender seu chefe de criminosos e também tente trabalhar em estacionamentos cuidando de veiculos.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Bom Trabalho.");
		}
		else if(glob2AF8C[playerid] == 32)
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Comandos de sua profissão - MOTORISTA PARTICULAR");
			SendClientMessage(playerid, 0x2CCC6CAA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, 0x2CCC6CAA, "/alugarlimo : Aluga uma limosine OBS:Você tem que estar na companhia de limosines");
			SendClientMessage(playerid, 0x2CCC6CAA, "/devolverlimo : Devolve uma limosine para a companhia de limosines");
			SendClientMessage(playerid, 0x2CCC6CAA, "/lavarlimo : Lava uma limosine OBS:Você tem que estar na companhia ou lavar com um mecanico");
			SendClientMessage(playerid, 0x2CCC6CAA, "/revisarlimo : Começa a ir nos lugares revisando uma limosine.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Bom Trabalho.");
		}
		else if(glob2AF8C[playerid] == 33)
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Comandos de sua profissão - MOTORISTA DE ONIBUS");
			SendClientMessage(playerid, 0x66E3DFAA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, 0x66E3DFAA, "/terminais : Ve as opçoes de terminais.");
			SendClientMessage(playerid, 0x66E3DFAA, "/passagem [id] : Vende passagem a alguem.");
			SendClientMessage(playerid, 0x66E3DFAA, "/verpassagem : Ve se alguem tem passagem.");
			SendClientMessage(playerid, 0x66E3DFAA, "/recolherpass : Recolhe a passagem de alguem.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Agora que você é um motorista de onibus poderá vender passagens para os outros em caso de viagens e também");
			SendClientMessage(playerid, 0xFFFFFFAA, "Terá que revistar e recolher. Lembre-se quando estiver passando pelos terminais não esqueça de parar.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Bom Trabalho.");
		}
		else if(glob2AF8C[playerid] == 34)
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Comandos de sua profissão - MENDIGO ");
			SendClientMessage(playerid, 0xC19100AA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, 0xC19100AA, "/pegarlatinha : Começa a fazer um circuito pegando latinhas.");
			SendClientMessage(playerid, 0xC19100AA, "/pararcoleta : Para de fazer uma coleta de latinhas.");
			SendClientMessage(playerid, 0xC19100AA, "/minhaslatinhas : Vê quantas latinhas você possue.");
			SendClientMessage(playerid, 0xC19100AA, "/selllatinha [id] [latas] : Vende latinhas para algum serviço de reciclagens.");
			SendClientMessage(playerid, 0xC19100AA, "/selllatas : Vende latinhas na area de reciclagens.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Você é um mendingo. Seu objetivo agora é recolher latinhas pelo circuito e pedindo para as pessoas que tomarem refrigerante.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Depois venda-as para um serviço de reciclagens ou entregue direto para o local da reciclagem.");
			SendClientMessage(playerid, 0xFFFFFFAA, "OBS: Você mesmo poderá comprar bebidas para ganhar latinhas.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Bom Trabalho.");
		}
		else if(glob2AF8C[playerid] == 52)
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Comandos de sua profissão - SERVIÇO DE RECICLAGENS");
			SendClientMessage(playerid, 0xFCFE5CAA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, 0xFCFE5CAA, "/selllatas : Vende todas suas latinhas na area de reciclagens.");
			SendClientMessage(playerid, 0xFCFE5CAA, "/minhaslatinhas : Vê quantas latinhas você possue.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Agora você é um serviço de reciclagens. Pegue as latinhas com um mendigo ou então tome bebidas para conseguir.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Você terá que ir na area de reciclagem para vender latinhas e também poderá ir ao lixão pegar as latinhas.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Bom Trabalho.");
		}
		else if(glob2AF8C[playerid] == 35)
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Comandos de sua profissão - VENDEDOR DE CARROS");
			SendClientMessage(playerid, 0xADFF0EAA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, 0xADFF0EAA, "/setcar [id_do_veículo] [id_do_comprador] [cor1] [cor2] : Vende um carro (esteja com ele na posição de spawn).");
			SendClientMessage(playerid, 0xFFFFFFAA, "Bom Trabalho.");
		}
		else if(glob2AF8C[playerid] == 36)
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Comandos de sua profissão - CORRETOR DE IMOVEIS");
			SendClientMessage(playerid, 0x77913AAA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, 0x77913AAA, "/setcasa [id] : Seta a casa para alguem, (esteja na posiçao exterior à casa).");
			SendClientMessage(playerid, 0xFFFFFFAA, "Bom Trabalho.");
		}
		else if(glob2AF8C[playerid] == 37)
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Comandos de sua profissão - SEGURADOR");
			SendClientMessage(playerid, 0xEEFFC4AA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, 0xEEFFC4AA, "/segurar [id] : Vende um seguro de vida a um jogador.");
			SendClientMessage(playerid, 0xEEFFC4AA, "/segurarcarro [id] : Vende um seguro de carro a um jogador.");
			SendClientMessage(playerid, 0xEEFFC4AA, "/seguros : Ve os jogadores que possuem seguros de vida.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Bom Trabalho.");
		}
		else if(glob2AF8C[playerid] == 38)
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Comandos de sua profissão - JORNALISTA");
			SendClientMessage(playerid, 0xFEFFFAAA, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, 0xFEFFFAAA, "/noticia [texto] : Publica uma notícia.");
			SendClientMessage(playerid, 0xFEFFFAAA, "/anunciar [texto] : Anuncia uma reportagem.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Bom Trabalho.");
		}
		else if(glob2AF8C[playerid] == 39)
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Comandos de sua profissão - CAMINHONEIRO");
			SendClientMessage(playerid, 0xACAC00FF, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, 0xACAC00FF, "/carregar : Carrega seu caminhão.");
			SendClientMessage(playerid, 0xACAC00FF, "/descarregar : descarrega seu caminhão.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Bom Trabalho.");
		}
		else if(glob2AF8C[playerid] == 40)
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Comandos de sua profissão - TRANSPORTE DE COMBUSTIVEL");
			SendClientMessage(playerid, 0x444444FF, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, 0x444444FF, "/carregarcomb : Carrega seu caminhão.");
			SendClientMessage(playerid, 0x444444FF, "/descarregarcomb : descarrega seu caminhão.");
			SendClientMessage(playerid, 0xFFFFFFAA, "Bom Trabalho.");
		}
		else
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "Você é Desempregado, não tem comandos especiais");
			SendClientMessage(playerid, 0xCBCBCBAA, "/pt [texto] : Manda uma mensagem para todas as pessoas que são desempregadas.");
		}
		return 1;
	}
	if(!strcmp(var1, "/presos", true))
	{
		new var7[256];
		SendClientMessage(playerid, 0xFFFF00AA, "Lista de presos");
		for(new var8 = 0; var8 < 200; var8++)
		{
			if(glob2A94C[var8] == 1)
			{
				format(var7, 256, "- %s", function705E0(var8));
				SendClientMessage(playerid, 0xFFFF00AA, var7);
				return 1;
			}
		}
	}
	if(!strcmp(cmdtext, "/alugueis", true))
	{
		new var7[256];
		SendClientMessage(playerid, 0xFEE765AA, "Lista de locadores");
		for(new var8 = 0; var8 < 200; var8++)
		{
			if(glob32070[var8] == 1)
			{
				format(var7, 256, "%d: %s", var8, function705E0(var8));
				SendClientMessage(playerid, 0xFEE765AA, var7);
				return 1;
			}
		}
	}
	if(!strcmp(var1, "/procurados", true))
	{
		new var7[256];
		SendClientMessage(playerid, 0xFFFF00AA, "Lista de procurados");
		for(new var8 = 0; var8 < 200; var8++)
		{
			if(glob2B5CC[var8] == 1)
			{
				format(var7, 256, "- %s", function705E0(var8));
				SendClientMessage(playerid, 0xFFFF00AA, var7);
				return 1;
			}
		}
	}
	if(!strcmp(var1, "/seguros", true))
	{
		new var7[256];
		SendClientMessage(playerid, 0xFFFF00AA, "Lista de segurados");
		for(new var8 = 0; var8 < 200; var8++)
		{
			if(glob236F0[var8] == 1)
			{
				format(var7, 256, "- %s", function705E0(var8));
				SendClientMessage(playerid, 0xFFFF00AA, var7);
				return 1;
			}
		}
	}
	if(!strcmp(var1, "/ataxi", true) && IsPlayerConnected(playerid))
	{
		if(glob2AF8C[playerid] == 11 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8 = 0;
			var7 = function1A10(cmdtext, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/mtaxi [id]");
				return 1;
			}
			var8 = strval(var7);
			new var9 = GetVehicleModel(GetPlayerVehicleID(playerid));
			if(var9 != glob187B0)
			{
				SendClientMessage(playerid, 0xDD0000FF, "Você não está dirigindo uma aeronave autorizada para sua profissão.");
				SendClientMessage(playerid, 0xDD0000FF, "Use apenas helicópteros Maverick.");
				return 1;
			}
			if(GetPlayerVehicleID(playerid) == GetPlayerVehicleID(var8) && GetPlayerState(playerid) == 2)
			{
				SendClientMessage(playerid, 0x33AA33AA, "O aero-taxímetro começou a rodar");
				SendClientMessage(var8, 0x33AA33AA, "O aero-taxímetro já está rodando. A corrida está sendo cobrada a partir de agora.");
				glob2CBAC[var8][0] = 1;
				glob2CBAC[var8][1] = playerid;
				udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "O passageiro não está na sua moto, ou você não é o condutor.");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não é Taxista Aéreo.");
		return 1;
	}
	if(!strcmp(var1, "/mtaxi", true) && IsPlayerConnected(playerid))
	{
		if(glob2AF8C[playerid] == 10 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8 = 0;
			var7 = function1A10(cmdtext, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/mtaxi [id]");
				return 1;
			}
			var8 = strval(var7);
			new var9 = GetVehicleModel(GetPlayerVehicleID(playerid));
			if(var9 != glob187C4)
			{
				SendClientMessage(playerid, 0xDD0000FF, "Você não está dirigindo uma moto autorizada para moto-taxí.");
				SendClientMessage(playerid, 0xDD0000FF, "Use motos do modelo PCJ-600 para esse tipo de profissão.");
				return 1;
			}
			if(GetPlayerVehicleID(playerid) == GetPlayerVehicleID(var8) && GetPlayerState(playerid) == 2)
			{
				SendClientMessage(playerid, 0x33AA33AA, "O moto-taxímetro começou a rodar");
				SendClientMessage(var8, 0x33AA33AA, "O moto-taxímetro já está rodando. A corrida está sendo cobrada a partir de agora.");
				glob2C24C[var8][0] = 1;
				glob2C24C[var8][1] = playerid;
				udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "O passageiro não está em uma moto, ou você não é o condutor.");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não é Moto-Taxista.");
		return 1;
	}
	if(!strcmp(var1, "/staxi", true) && IsPlayerConnected(playerid))
	{
		if(glob2AF8C[playerid] == 9 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8 = 0;
			var7 = function1A10(cmdtext, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/staxi [id]");
				return 1;
			}
			var8 = strval(var7);
			new var9 = GetVehicleModel(GetPlayerVehicleID(playerid));
			if(var9 != glob18770 && var9 != glob18780)
			{
				SendClientMessage(playerid, 0xDD0000FF, "Você não está dirigindo um veiculo autorizada para taxísta.");
				SendClientMessage(playerid, 0xDD0000FF, "Use carros do modelo Cabbie ou Taxi para esse tipo de profissão.");
				return 1;
			}
			if(GetPlayerVehicleID(playerid) == GetPlayerVehicleID(var8) && GetPlayerState(playerid) == 2)
			{
				SendClientMessage(playerid, 0x33AA33AA, "O taxímetro começou a rodar");
				SendClientMessage(var8, 0x33AA33AA, "O taxímetro já está rodando. A corrida está sendo cobrada a partir de agora.");
				glob2B8EC[var8][0] = 1;
				glob2B8EC[var8][1] = playerid;
				udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "O passageiro não está em um taxi, ou você não é o condutor.");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não é Taxista.");
		return 1;
	}
	if(!strcmp(var1, "/setcasa", true))
	{
		if(glob2AF8C[playerid] == 36 || IsPlayerAdmin(playerid))
		{
			new var7 = 0;
			new var8[256];
			new var9[256];
			var9 = function1A10(cmdtext, var4, 32);
			if(!strlen(var9))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/setcasa [id]");
				return 1;
			}
			var7 = strval(var9);
			if(udb_Exists(function705E0(var7)))
			{
				if(!glob27718[var7])
				{
					if(IsPlayerConnected(var7) && glob1A0CC[var7] == 1)
					{
						glob1912C[var7] = 3;
						glob1AA34 = playerid;
						SendClientMessage(playerid, 0x33AA33AA, "Otimo! Agora espere o outro jogador aceitar a casa");
						format(var8, 256, "%s está lhe oferecendo uma casa, digite /aceitar para aceitar e /recusar para recusar", function705E0(playerid));
						SendClientMessage(var7, 0x33AA33AA, var8);
						return 1;
					}
				}
			}
			else
			{
				SendClientMessage(playerid, 0xDD0000FF, "Jogador não conectado/logado");
				return 1;
			}
		}
		else
		{
			SendClientMessage(playerid, 0xDD0000FF, "Você não é Corretor de Imoveis");
			return 1;
		}
		return 1;
	}
	if(!strcmp(var1, "/setcar", true))
	{
		if(glob2AF8C[playerid] == 35 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8 = 0, var9 = 0, var10 = 0, var11 = 0;
			var7 = function1A10(cmdtext, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "ID fora do normal | ID's = 400-611");
				return 1;
			}
			var8 = strval(var7);
			var7 = function1A10(cmdtext, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/setcar [id_do_veículo] [id_do_comprador] [cor1] [cor2]");
				return 1;
			}
			var9 = strval(var7);
			var7 = function1A10(cmdtext, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/setcar [id_do_veículo] [id_do_comprador] [cor1] [cor2]");
				return 1;
			}
			var10 = strval(var7);
			var7 = function1A10(cmdtext, var4, 32);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/setcar [id_do_veículo] [id_do_comprador] [cor1] [cor2]");
				return 1;
			}
			var11 = strval(var7);
			if(var8 >= 400 && var8 <= 611)
			{
				if(IsPlayerInAnyVehicle(playerid))
				{
					if(IsPlayerConnected(var9))
					{
						glob1912C[var9] = 2;
						SendClientMessage(playerid, 0xDD0000FF, "Foi enviado ao outro jogador um convite para ver se ele aceita o carro.");
						new var12[256];
						format(var12, 256, "%s esta lhe oferecendo um carro. Digite /aceitar para aceitar e digite /recusar para recusar", function705E0(playerid));
						SendClientMessage(playerid, 0x33AA33AA, var12);
						glob1AA34 = playerid;
						glob24B44 = var8;
						glob24B48 = var10;
						glob24B4C = var11;
						return 1;
					}
					SendClientMessage(playerid, 0xDD0000FF, "Jogador não conectado.");
					return 1;
				}
				SendClientMessage(playerid, 0xDD0000FF, "Você precisa estar em um veiculo para vender.");
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "ID fora do normal | ID's = 400-611");
			return 1;
		}
		if(35 != glob2AF8C[playerid])
		{
			SendClientMessage(playerid, 0xDD0000FF, "Você não é Vendedor de Carros e Skins");
			return 1;
		}
	}
	if(!strcmp(var1, "/sellcerveja", true))
	{
		if(glob2AF8C[playerid] == 3 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8[256];
			new var9 = 0, var10 = 0;
			var8 = function1A10(cmdtext, var4, 32);
			if(!strlen(var8))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/selldcerveja [id] [quantia]");
				return 1;
			}
			var9 = strval(var8);
			var8 = function1A10(cmdtext, var4, 32);
			if(!strlen(var8))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/sellcerveja [id] [quantia]");
				return 1;
			}
			var10 = strval(var8);
			if(var10 < 1 || var10 > 10)
			{
				SendClientMessage(playerid, 0xDD0000FF, "Mínimo 1 cerveja e maxímo 10 cervejas.");
				return 1;
			}
			if(GetDistanceBetweenPlayers(playerid, var9) <= 20)
			{
				if(glob2DB54[var9] == 10)
				{
					SendClientMessage(playerid, 0xDD0000FF, "Você quer matar seu cliente!");
					return 1;
				}
				if(IsPlayerConnected(var9))
				{
					if(var9 != playerid)
					{
						glob2274C[var9] = var10;
						SendClientMessage(playerid, 0x33AA33AA, "Missão cumprida!");
						format(var7, 256, "%s te vendeu %d latas de cerveja, para bebe-las digite /beber [latas].", function705E0(playerid), var10);
						SendClientMessage(var9, 0x33AA33AA, var7);
						glob2274C[var9]++;
						udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
						return 1;
					}
					SendClientMessage(playerid, 0xDD0000FF, "Você não pode vende para você mesmo");
					return 1;
				}
				SendClientMessage(playerid, 0xDD0000FF, "O jogador não está conectado/logado!");
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Você está muito longe, chegue mais perto para entregar a bebida.");
			return 1;
		}
		if(3 != glob2AF8C[playerid])
		{
			SendClientMessage(playerid, 0xDD0000FF, "Você não é Barman!");
			return 1;
		}
		return 1;
	}
	if(!strcmp(var1, "/sellbebida", true))
	{
		if(glob2AF8C[playerid] == 3 || glob2AF8C[playerid] == 5 || glob2AF8C[playerid] == 2)
		{
			new var7[256];
			new var8 = 0;
			new var9 = 0;
			new var10 = 0;
			var10 = GetDistanceBetweenPlayers(playerid, var8);
			var7 = function1A10(cmdtext, var4, 32);
			var8 = strval(var7);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/sellbebida [id] [bebida");
				return 1;
			}
			var7 = function1A10(cmdtext, var4, 32);
			var9 = strval(var7);
			if(var9 < 0 || var9 > 5)
			{
				SendClientMessage(playerid, 0xDD0000FF, "Bebida inválida as bebidas são de 1 a 5");
				return 1;
			}
			if(var10 < 10)
			{
				if(IsPlayerConnected(var8))
				{
					if(var8 != playerid)
					{
						SendClientMessage(playerid, 0x33AA33AA, "Bebida vendida com sucesso.");
						glob33FB4[var8]++;
						new var11[256];
						format(var11, 256, "%s lhe vendeu uma bebida: %s", function705E0(playerid), glob91D4[var9][0]);
						SendClientMessage(var8, 0x33AA33AA, var11);
						udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
						return 1;
					}
					SendClientMessage(playerid, 0xDD0000FF, "Você não pode vender bebida para você mesmo");
					return 1;
				}
				SendClientMessage(playerid, 0xDD0000FF, "Jogador não conectado/logado");
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Chegue mais perto para vender a bebida");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não tem permissão");
		return 1;
	}
	if(!strcmp(var1, "/selllanche", true))
	{
		if(glob2AF8C[playerid] == 5 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8[256];
			new var9 = 0, var10 = 0;
			var8 = function1A10(cmdtext, var4, 32);
			if(!strlen(var8))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/selllanche [id] [lanche]");
				return 1;
			}
			var9 = strval(var8);
			var8 = function1A10(cmdtext, var4, 32);
			if(!strlen(var8))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/selllanche [id] [lanche]");
				return 1;
			}
			var10 = strval(var8);
			if(var10 < 1 || var10 > 7)
			{
				SendClientMessage(playerid, 0xDD0000FF, "Lanche Invalido, Os lanches são de 1 a 7.");
				return 1;
			}
			strval(var8);
			if(GetPlayerMoney(var9) < 8)
			{
				SendClientMessage(playerid, 0xDD0000FF, "O Jogador não tem dinheiro em mãos.");
				return 1;
			}
			if(GetDistanceBetweenPlayers(playerid, var9) <= 10)
			{
				if(IsPlayerConnected(var9))
				{
					if(var9 != playerid)
					{
						glob1DF60[var9] = var10;
						format(var7, 256, "%s, %s", function705E0(playerid), glob8F64[var10][0]);
						SendClientMessage(var9, 0x33AA33AA, var7);
						SetPlayerHealth(var9, 100.0);
						GivePlayerMoney(var9, -8);
						format(var7, 256, "Você vendeu lanche para %s", function705E0(var9));
						SendClientMessage(playerid, 0x33AA33AA, var7);
						ApplyAnimation(playerid, "FOOD", "EAT_Burger", 3.0, 0, 0, 0, 0, 0);
						GivePlayerMoney(playerid, 8);
						glob1E5A0[var9]--;
						udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
						return 1;
					}
					SendClientMessage(playerid, 0xDD0000FF, "Você não pode vende para você mesmo");
					return 1;
				}
				SendClientMessage(playerid, 0xDD0000FF, "O jogador não está conectado/logado!");
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Você está muito longe, chegue mais perto para entregar a bebida.");
			return 1;
		}
		if(5 != glob2AF8C[playerid])
		{
			SendClientMessage(playerid, 0xDD0000FF, "Você não é Vendedor de Lanches!");
			return 1;
		}
		return 1;
	}
	if(!strcmp(var1, "/vhotdog", true))
	{
		if(glob2AF8C[playerid] == 5 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8 = 0;
			new var9 = 0;
			var7 = function1A10(cmdtext, var4, 32);
			var8 = strval(var7);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/vhotdog [id] [1(prensado) ou 2(tradicional)]");
				return 1;
			}
			var9 = strval(var7);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/vhotdog [id] [1(prensado) ou 2(tradicional)");
				return 1;
			}
			if(var9 > 0 && var9 < 3)
			{
				if(IsPlayerConnected(var8))
				{
					if(var8 != playerid)
					{
						new var10 = GetVehicleModel(GetPlayerVehicleID(playerid));
						if(var10 == glob187B4)
						{
							SendClientMessage(playerid, 0x33AA33AA, "Cachorro quente vendido");
							new var11[256];
							format(var11, 256, "%s", "Invalido");
							SendClientMessage(var8, 0x33AA33AA, var11);
							udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
							return 1;
						}
						SendClientMessage(playerid, 0xDD0000FF, "Você tem que estar em um veiculo de cachorro quente");
						return 1;
					}
					SendClientMessage(playerid, 0xDD0000FF, "Você não pode vender para si mesmo");
					return 1;
				}
				SendClientMessage(playerid, 0xDD0000FF, "Jogador não conectado/logado");
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Cachorro quente invalido! Os cachorros quentes só podem ser de 1 a 2");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não tem permissão");
		return 1;
	}
	if(!strcmp(var1, "/sellpizza", true))
	{
		if(glob2AF8C[playerid] == 2 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8[256];
			new var9 = 0, var10 = 0;
			var8 = function1A10(cmdtext, var4, 32);
			if(!strlen(var8))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/sellpizza [id] [sabor]");
				return 1;
			}
			var9 = strval(var8);
			var8 = function1A10(cmdtext, var4, 32);
			if(!strlen(var8))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/sellpizza [id] [sabor]");
				return 1;
			}
			var10 = strval(var8);
			if(var10 < 1 || var10 > 4)
			{
				SendClientMessage(playerid, 0xDD0000FF, "Sabor Invalido, Os sabores são de 1 a 4.");
				return 1;
			}
			strval(var8);
			if(GetPlayerMoney(var9) < 15)
			{
				SendClientMessage(playerid, 0xDD0000FF, "O Jogador não tem dinheiro em mãos.");
				return 1;
			}
			if(GetDistanceBetweenPlayers(playerid, var9) <= 20)
			{
				if(IsPlayerConnected(var9))
				{
					if(var9 != playerid)
					{
						if(IsPlayerInAnyVehicle(playerid))
						{
							new var11 = GetVehicleModel(GetPlayerVehicleID(playerid));
							if(var11 == glob18798)
							{
								glob1E280[var9] = var10;
								format(var7, 256, "%s te vendeu uma pizza de %s", function705E0(playerid), glob9284[var10][0]);
								SendClientMessage(var9, 0x33AA33AA, var7);
								SetPlayerHealth(var9, 100.0);
								GivePlayerMoney(var9, -15);
								format(var7, 256, "Você vendeu uma pizza de %s para %s", glob9284[var10][0], function705E0(var9));
								SendClientMessage(playerid, 0x33AA33AA, var7);
								ApplyAnimation(playerid, "FOOD", "EAT_Burger", 3.0, 0, 0, 0, 0, 0);
								GivePlayerMoney(playerid, 15);
								glob1E5A0[var9]--;
								udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
								return 1;
							}
							SendClientMessage(playerid, 0xDD0000FF, "Você deve estar numa moto de entrega para usar esse comando");
							return 1;
						}
						SendClientMessage(playerid, 0xDD0000FF, "Você não esta em um veiculo.");
						return 1;
					}
					SendClientMessage(playerid, 0xDD0000FF, "Você não pode vender para você mesmo");
					return 1;
				}
				SendClientMessage(playerid, 0xDD0000FF, "O jogador não está conectado/logado!");
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Você está muito longe, chegue mais perto para entregar a bebida.");
			return 1;
		}
		if(2 != glob2AF8C[playerid])
		{
			SendClientMessage(playerid, 0xDD0000FF, "Você não é Sorveteiro!");
			return 1;
		}
		return 1;
	}
	if(!strcmp(var1, "/sellsorvete", true))
	{
		if(glob2AF8C[playerid] == 4 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8[256];
			new var9 = 0, var10 = 0;
			var8 = function1A10(cmdtext, var4, 32);
			if(!strlen(var8))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/sellsorvete [id] [sabor]");
				return 1;
			}
			var9 = strval(var8);
			var8 = function1A10(cmdtext, var4, 32);
			if(!strlen(var8))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/sellsorvete [id] [sabor]");
				return 1;
			}
			var10 = strval(var8);
			if(var10 < 1 || var10 > 7)
			{
				SendClientMessage(playerid, 0xDD0000FF, "Sabor Invalido, Os sabores são de 1 a 7.");
				return 1;
			}
			strval(var8);
			if(GetPlayerMoney(var9) < 5)
			{
				SendClientMessage(playerid, 0xDD0000FF, "O Jogador não tem dinheiro em mãos.");
				return 1;
			}
			if(GetDistanceBetweenPlayers(playerid, var9) <= 20)
			{
				if(IsPlayerConnected(var9))
				{
					if(var9 != playerid)
					{
						if(IsPlayerInAnyVehicle(playerid))
						{
							new var11 = GetVehicleModel(GetPlayerVehicleID(playerid));
							if(var11 == glob187BC)
							{
								if(0 < glob25190[playerid])
								{
									glob2DE74[var9] = var10;
									format(var7, 256, "%s te vendeu um sorvete de %s", function705E0(playerid), glob4CAC[var10][0]);
									SendClientMessage(var9, 0x33AA33AA, var7);
									SetPlayerHealth(var9, 100.0);
									GivePlayerMoney(var9, -5);
									format(var7, 256, "Você vendeu um sorvete de %s para %s", glob4CAC[var10][0], function705E0(var9));
									SendClientMessage(playerid, 0x33AA33AA, var7);
									ApplyAnimation(var9, "FOOD", "EAT_Burger", 3.0, 0, 0, 0, 0, 0);
									GivePlayerMoney(playerid, 5);
									glob1E5A0[var9]--;
									udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
									return 1;
								}
								SendClientMessage(playerid, 0xDD0000FF, "Você não possue nenhuma bola de sorvete vá na sorveteria buscar algumas");
								return 1;
							}
							SendClientMessage(playerid, 0xDD0000FF, "Você tem que estar num carro de sorvetes para usar esse comando");
							return 1;
						}
						SendClientMessage(playerid, 0xDD0000FF, "Você não esta em um veiculo.");
						return 1;
					}
					SendClientMessage(playerid, 0xDD0000FF, "Você não pode vender para você mesmo");
					return 1;
				}
				SendClientMessage(playerid, 0xDD0000FF, "O jogador não está conectado/logado!");
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Você está muito longe, chegue mais perto para entregar a bebida.");
			return 1;
		}
		if(4 != glob2AF8C[playerid])
		{
			SendClientMessage(playerid, 0xDD0000FF, "Você não é Sorveteiro!");
			return 1;
		}
		return 1;
	}
	if(!strcmp(var1, "/pegarsorvete", true))
	{
		if(glob2AF8C[playerid] == 4 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8 = 0;
			var7 = function1A10(cmdtext, var4, 32);
			var8 = strval(var7);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/pegarsorvete [bolas]");
				return 1;
			}
			if(var8 + glob25190[playerid] <= 10 && var8 <= 10)
			{
				if(glob254B0[playerid] == 1)
				{
					if(var8 * 5 <= GetPlayerMoney(playerid))
					{
						glob25190[playerid] = var8 + glob25190[playerid];
						GivePlayerMoney(playerid, var8 * 5);
						new var9[256];
						format(var9, 256, "Você pegou mais %d Bolas de sorvete e pagou %d! agora va vende-las", var8, var8 * 5);
						SendClientMessage(playerid, 0x33AA33AA, var9);
						return 1;
					}
					SendClientMessage(playerid, 0xDD0000FF, "Você não tem dinheiro! São $5 cada bola");
					return 1;
				}
				SendClientMessage(playerid, 0xDD0000FF, "Você não está na sorveteria");
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Você não pode ter mais que isso de bolas contando com o que você ja tem");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não é Sorveteiro");
		return 1;
	}
	if(!strcmp(var1, "/beber", true))
	{
		new var7[256];
		new var8[256];
		new var9 = 0;
		var8 = function1A10(cmdtext, var4, 32);
		if(!strlen(var8))
		{
			SendClientMessage(playerid, 0xDD0000FF, "/beber [latas]");
			return 1;
		}
		var9 = strval(var8);
		if(glob2274C[playerid] < var9)
		{
			SendClientMessage(playerid, 0xDD0000FF, "Você não tem todas estas latas.");
			return 1;
		}
		if(!glob2274C[playerid])
		{
			SendClientMessage(playerid, 0xDD0000FF, "Você não tem nenhuma lata, como poderá beber?");
			return 1;
		}
		glob2274C[playerid] = var9;
		glob2DB54[playerid] = var9;
		ApplyAnimation(playerid, "PED", "WALK_DRUNK", 4.0, 1, 1, 1, 1, 1);
		format(var7, 256, "Você tomou %d latas de cerveja.", var9);
		SendClientMessage(playerid, 0x33AA33AA, var7);
		glob2274C[playerid]--;
		glob2DB54[playerid]++;
		return 1;
	}
	if(!strcmp(var1, "/fumar", true))
	{
		new var7[256];
		new var8[256];
		new var9 = 0;
		var8 = function1A10(cmdtext, var4, 32);
		if(!strlen(var8))
		{
			SendClientMessage(playerid, 0xDD0000FF, "/fumar [cigarros]");
			return 1;
		}
		if(!glob2210C[playerid])
		{
			SendClientMessage(playerid, 0xDD0000FF, "Você não tem nenhum cigarro, como poderá fumar?");
			return 1;
		}
		glob2210C[playerid] = var9;
		ApplyAnimation(playerid, "SMOKING", "M_smklean_loop", 4.0, 1, 1, 1, 1, 1);
		format(var7, 256, "Você fumou %d cigarro de maconha.", var9);
		SendClientMessage(playerid, 0x33AA33AA, var7);
		glob2210C[playerid]--;
		glob26454[playerid]++;
		return 1;
	}
	if(!strcmp(var1, "/cherar", true))
	{
		new var7[256];
		new var8[256];
		new var9 = 0;
		var8 = function1A10(cmdtext, var4, 32);
		if(!strlen(var8))
		{
			SendClientMessage(playerid, 0xDD0000FF, "/cherar [gramas]");
			return 1;
		}
		if(!glob2242C[playerid])
		{
			SendClientMessage(playerid, 0xDD0000FF, "Você não cocaina, como poderá cherar?");
			return 1;
		}
		glob2242C[playerid] = var9;
		ApplyAnimation(playerid, "CRACK", "crckdeth1", 4.0, 1, 1, 1, 1, 1);
		format(var7, 256, "Você cherou %d gramas de cocaina.", var9);
		SendClientMessage(playerid, 0x33AA33AA, var7);
		glob2242C[playerid]--;
		glob26A94[playerid]++;
		return 1;
	}
	if(!strcmp(var1, "/pegarvalores", true))
	{
		if(glob2AF8C[playerid] == 57 || IsPlayerAdmin(playerid))
		{
			new var7 = GetVehicleModel(GetPlayerVehicleID(playerid));
			if(var7 == glob18788)
			{
				if(!glob369F0[GetPlayerVehicleID(playerid)])
				{
					glob369F0[GetPlayerVehicleID(playerid)] = 1;
					new var8 = random(5);
					if(!glob366D0[playerid])
					{
						if(IsPlayerInAnyVehicle(playerid))
						{
							if(!var8)
							{
								SendClientMessage(playerid, 0xFFFFFFAA, "Há nessa bolsa R$500 agora entregue ela ao banco");
								glob366D0[playerid] = 500;
								return 1;
							}
							if(var8 == 1)
							{
								SendClientMessage(playerid, 0xFFFFFFAA, "Há nessa bolsa R$1000 agora entregue ela ao banco");
								glob366D0[playerid] = 1000;
								return 1;
							}
							if(var8 == 2)
							{
								SendClientMessage(playerid, 0xFFFFFFAA, "Há nessa bolsa R$1500 agora entregue ela ao banco");
								glob366D0[playerid] = 1500;
								return 1;
							}
							if(var8 == 3)
							{
								SendClientMessage(playerid, 0xFFFFFFAA, "Há nessa bolsa R$1750 agora entregue ela ao banco");
								glob366D0[playerid] = 1750;
								return 1;
							}
							if(var8 == 4)
							{
								SendClientMessage(playerid, 0xFFFFFFAA, "Há nessa bolsa R$2000 agora entregue ela ao banco");
								glob366D0[playerid] = 2000;
								return 1;
							}
							if(var8 == 5)
							{
								SendClientMessage(playerid, 0xFFFFFFAA, "Há nessa bolsa R$2500 agora entregue ela ao banco");
								glob366D0[playerid] = 2500;
								return 1;
							}
						}
						else
						{
							SendClientMessage(playerid, 0xDD0000FF, "Você não esta em um veiculo");
							return 1;
						}
					}
					else
					{
						SendClientMessage(playerid, 0xDD0000FF, "Você já possue uma bolsa de valores! Entregue essa ao banco primeiro.");
						return 1;
					}
				}
				else
				{
					SendClientMessage(playerid, 0xDD0000FF, "Já foi pega a bolsa de valores desse veiculo!.");
					return 1;
				}
			}
			else
			{
				SendClientMessage(playerid, 0xDD0000FF, "Você tem que estar em um carro forte.");
				return 1;
			}
		}
		else
		{
			SendClientMessage(playerid, 0xDD0000FF, "Você não tem permissão.");
			return 1;
		}
	}
	if(!strcmp(var1, "/verbolsa", true))
	{
		if(glob2AF8C[playerid] == 57 || IsPlayerAdmin(playerid))
		{
			if(glob366D0[playerid])
			{
				new var7[256];
				format(var7, 256, "Você possue %d em sua bolsa de valores!", 222928);
				SendClientMessage(playerid, 0xFFFFFFAA, var7);
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Você não possue bolsa de valores.");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não tem permissão.");
		return 1;
	}
	if(!strcmp(var1, "/entregarvalores", true))
	{
		if(glob2AF8C[playerid] == 57 || IsPlayerAdmin(playerid))
		{
			if(IsPlayerInAnyVehicle(playerid))
			{
				new var7 = GetVehicleModel(GetPlayerVehicleID(playerid));
				if(var7 == glob18788)
				{
					if(glob366D0[playerid])
					{
						SendClientMessage(playerid, 0x33AA33AA, "Bolsa de valores entregue você recebeu 25 por cento dela");
						GivePlayerMoney(playerid, glob366D0[playerid] / 4);
						glob366D0[playerid] = 0;
						udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
						return 1;
					}
					SendClientMessage(playerid, 0xDD0000FF, "Você não possue uma bolsa de valores.");
					return 1;
				}
				SendClientMessage(playerid, 0xDD0000FF, "Você tem que estar em um carro forte.");
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Você não está em um veiculo.");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não tem permissão.");
		return 1;
	}
	if(!strcmp(var1, "/meusbags", true))
	{
		if(glob2AF8C[playerid] == 16 || IsPlayerAdmin(playerid))
		{
			if(0 < glob270D4[playerid])
			{
				new var7[256];
				format(var7, 256, "Você possue %d bagulhos", 159956);
				SendClientMessage(playerid, 0x7585C0AA, var7);
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Você não possue nenhum bagulho.");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não tem permissão.");
		return 1;
	}
	if(!strcmp(var1, "/comprarbagulho", true))
	{
		if(glob2AF8C[playerid] == 16 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8 = 0;
			var7 = function1A10(cmdtext, var4, 32);
			var8 = strval(var7);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/comprarbagulho [quantia]");
				return 1;
			}
			if(!glob316DC[playerid])
			{
				SendClientMessage(playerid, 0xDD0000FF, "Você tem que estar na area de tráfico.");
				return 1;
			}
			if(var8 + glob270D4[playerid] > 15)
			{
				SendClientMessage(playerid, 0xDD0000FF, "Você já possue bagulho suficiente para carregar.");
				return 1;
			}
			if(!var8)
			{
				SendClientMessage(playerid, 0xDD0000FF, "Você poderia invés de comprar 0 bagulhos nem ter vindo aqui.");
				return 1;
			}
			if(var8 * 15 > GetPlayerMoney(playerid))
			{
				SendClientMessage(playerid, 0xDD0000FF, "Você não possue dinheiro.");
				return 1;
			}
			glob270D4[playerid] = var8 + glob270D4[playerid];
			GivePlayerMoney(playerid, 0 - (var8 * 15));
			new var9[256];
			format(var9, 256, "Você comprou %d bagulhos.", var8);
			SendClientMessage(playerid, 0x7585C0AA, var9);
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não tem permissão.");
		return 1;
	}
	if(!strcmp(var1, "/selldroga", true))
	{
		if(glob2AF8C[playerid] == 16 || IsPlayerAdmin(playerid))
		{
			new var7[256];
			new var8 = 0;
			new var9 = 0;
			new var10 = 0;
			var7 = function1A10(cmdtext, var4, 32);
			var8 = strval(var7);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/selldroga [id] [id da droga] [doses]");
				return 1;
			}
			var7 = function1A10(cmdtext, var4, 32);
			var9 = strval(var7);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/selldroga [id] [id da droga] [doses]");
				return 1;
			}
			var7 = function1A10(cmdtext, var4, 32);
			var10 = strval(var7);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "/selldroga [id] [id da droga] [doses]");
				return 1;
			}
			if(!IsPlayerConnected(var8))
			{
				SendClientMessage(playerid, 0xDD0000FF, "Jogador não conectado/logado.");
				return 1;
			}
			if(var9 < 0 || var9 > 4)
			{
				SendClientMessage(playerid, 0xDD0000FF, "Droga inválida. As drogas são de 1 a 4.");
				return 1;
			}
			if(var10 < 0 || var10 > 7)
			{
				SendClientMessage(playerid, 0xDD0000FF, "Doses de 1 a 7.");
				return 1;
			}
			if(glob270D4[playerid] < var10)
			{
				SendClientMessage(playerid, 0xDD0000FF, "Você não possue bagulho.");
				return 1;
			}
			if(var9 == 1)
			{
				glob26454[var8] = var10 + glob26454[var8];
				SendClientMessage(playerid, 0x7585C0AA, "Maconha vendida.");
				new var11[256];
				format(var11, 256, "Foram adicionados %d doses de maconha em seu sangue.", var10);
				SendClientMessage(var8, 0x7585C0AA, var11);
				return 1;
			}
			if(var9 == 2)
			{
				glob26A94[var8] = var10 + glob26A94[var8];
				SendClientMessage(playerid, 0x7585C0AA, "Cocaína vendida.");
				new var11[256];
				format(var11, 256, "Foram adicionados %d doses de cocaína em seu sangue.", var10);
				SendClientMessage(var8, 0x7585C0AA, var11);
				return 1;
			}
			if(var9 == 3)
			{
				glob26774[var8] = var10 + glob26774[var8];
				SendClientMessage(playerid, 0x7585C0AA, "Heroína vendida.");
				new var11[256];
				format(var11, 256, "Foram adicionados %d doses de heroína em seu sangue.", var10);
				SendClientMessage(var8, 0x7585C0AA, var11);
				return 1;
			}
			if(var9 == 4)
			{
				glob26DB4[var8] = var10 + glob26DB4[var8];
				SendClientMessage(playerid, 0x7585C0AA, "Crack vendido.");
				new var11[256];
				format(var11, 256, "Foram adicionados %d doses de crack em seu sangue.", var10);
				SendClientMessage(var8, 0x7585C0AA, var11);
				return 1;
			}
		}
		else
		{
			SendClientMessage(playerid, 0xDD0000FF, "Você não tem permissão.");
			return 1;
		}
	}
	if(!strcmp(var1, "/pdrogas", true))
	{
		if(glob2AF8C[playerid] == 47)
		{
			if(glob270D4[playerid] <= 4)
			{
				if(IsPlayerInAnyVehicle(playerid))
				{
					if(!glob331A4[GetPlayerVehicleID(playerid)])
					{
						glob270D4[playerid] = glob270D4[playerid] - 4;
						glob331A4[GetPlayerVehicleID(playerid)] = 1;
						udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
						return 1;
					}
					SendClientMessage(playerid, 0xDD0000FF, "Este carro ja tem drogas plantadas");
					return 1;
				}
				SendClientMessage(playerid, 0xDD0000FF, "Você não está em um veiculo");
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Você não possue bagulho suficiente para plantar drogas num veiculo");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não tem permissão");
		return 1;
	}
	if(!strcmp(var1, "/gorjeta", true))
	{
		if(glob2AF8C[playerid] == 9 || glob2AF8C[playerid] == 2 || glob2AF8C[playerid] == 5)
		{
			new var7[256];
			new var8[256];
			new var9 = 0;
			strmid(var7, cmdtext, 8, strlen(cmdtext), 256);
			var9 = strval(var7);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "Uso: /gorjeta [id]");
				return 1;
			}
			if(IsPlayerConnected(var9))
			{
				format(var8, 256, "%s está lhe pedindo gorjeta.", function705E0(playerid));
				SendClientMessage(var9, 0x33AA33AA, var8);
			}
			else
			{
				SendClientMessage(playerid, 0xDD0000FF, "ID inválido");
				return 1;
			}
		}
		else
		{
			SendClientMessage(playerid, 0xDD0000FF, "Você não é Taxista/Entregador de Pizza/Vendedor de Lanches.");
			return 1;
		}
	}
	if(!strcmp(var1, "/almento", true))
	{
		if(glob2AF8C[playerid] == 32 || glob2AF8C[playerid] == 31)
		{
			new var7[256];
			new var8[256];
			new var9 = 0;
			strmid(var7, cmdtext, 8, strlen(cmdtext), 256);
			var9 = strval(var7);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "Uso: /almento [id]");
				return 1;
			}
			if(IsPlayerConnected(var9))
			{
				format(var8, 256, "%s está lhe pedindo almento.", function705E0(playerid));
				SendClientMessage(var9, 0x33AA33AA, var8);
			}
			else
			{
				SendClientMessage(playerid, 0xDD0000FF, "ID inválido");
				return 1;
			}
		}
		else
		{
			SendClientMessage(playerid, 0xDD0000FF, "Você não é Motorista Particular/Segurança.");
			return 1;
		}
	}
	if(!strcmp(var1, "/esmola", true))
	{
		if(glob2AF8C[playerid] == 34 || glob2AF8C[playerid] == 31)
		{
			new var7[256];
			new var8[256];
			new var9 = 0;
			strmid(var7, cmdtext, 8, strlen(cmdtext), 256);
			var9 = strval(var7);
			if(!strlen(var7))
			{
				SendClientMessage(playerid, 0xDD0000FF, "Uso: /esmola [id]");
				return 1;
			}
			if(IsPlayerConnected(var9))
			{
				format(var8, 256, "%s está lhe pedindo aesmola.", function705E0(playerid));
				SendClientMessage(var9, 0x33AA33AA, var8);
			}
			else
			{
				SendClientMessage(playerid, 0xDD0000FF, "ID inválido");
				return 1;
			}
		}
		else
		{
			SendClientMessage(playerid, 0xDD0000FF, "Você não é Mendigo.");
			return 1;
		}
	}
	if(!strcmp(var1, "/resgate", true))
	{
		if(!glob1D5FC[playerid])
		{
			SendClientMessage(playerid, 0xDD0000FF, "Você não está sequestrado!");
			return 1;
		}
		if(glob1D5FC[playerid] == 1)
		{
			SendClientMessage(playerid, 0x33AA33AA, "Você pagou resgate e foi solto.");
			GivePlayerMoney(playerid, -500);
			SetPlayerPos(playerid, -2080.8172, -2449.771, 30.625);
			TogglePlayerControllable(playerid, true);
			glob1D5FC[playerid] = 0;
			return 1;
		}
	}
	if(!strcmp(var1, "/entregarlata", true))
	{
		new var7[256];
		new var8 = 0;
		new var9 = 0;
		var7 = function1A10(cmdtext, var4, 32);
		var8 = strval(var7);
		if(!strlen(var7))
		{
			SendClientMessage(playerid, 0xDD0000FF, "/entregarlata [id]");
			return 1;
		}
		var9 = GetDistanceBetweenPlayers(playerid, var8);
		if(var9 <= 10)
		{
			if(glob2AF8C[var8] == 34 || glob2AF8C[var8] == 52 || IsPlayerAdmin(var8))
			{
				if(IsPlayerConnected(var8))
				{
					if(glob33FB4[playerid] > 1)
					{
						glob33FB4[var8]++;
						glob33FB4[playerid]--;
						SendClientMessage(playerid, 0x33AA33AA, "Você acabou de colaborar na luta contra a poluição! Está latinha foi um bom arrecadamento.");
						new var10[256];
						format(var10, 256, "%s lhe entregou uma latinha!", function705E0(playerid));
						SendClientMessage(var8, 0x33AA33AA, var10);
						return 1;
					}
					SendClientMessage(playerid, 0xDD0000FF, "Você não possue latinha");
					return 1;
				}
				SendClientMessage(playerid, 0xDD0000FF, "Jogador não conectado/logado");
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Você só pode entregar latinhas a mendingos e a trabalhadores do serviço de reciclagens");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você esta muito longe! Chegue mais perto");
		return 1;
	}
	if(!strcmp(var1, "/tomarsorvete", true))
	{
		new var7[256];
		new var8 = 0;
		var7 = function1A10(cmdtext, var4, 32);
		var8 = strval(var7);
		if(!strlen(var7))
		{
			SendClientMessage(playerid, 0xDD0000FF, "/tomarsorvete [sabor]");
			return 1;
		}
		if(glob254B0[playerid] == 1)
		{
			if(var8 >= 1 || var8 <= 7)
			{
				new var9[256];
				format(var9, 256, "Você recebeu um sorvete de %s! Aproveite", glob4CAC[var8][0]);
				SendClientMessage(playerid, 0x33AA33AA, var9);
				GivePlayerMoney(playerid, -5);
				ApplyAnimation(playerid, "FOOD", "EAT_Burger", 3.0, 0, 0, 0, 0, 0);
				glob1E5A0[playerid]--;
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Sabor invalido! Os sabores são de 1 a 7");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não está na sorveteria");
		return 1;
	}
	if(!strcmp(var1, "/hotel", true))
	{
		if(glob24500[playerid] == 1)
		{
			if(GetPlayerMoney(playerid) >= 1500)
			{
				new Float:var7 = 0.0, Float:var8 = 0.0, Float:var9 = 0.0;
				new Float:var10 = 0.0;
				GetPlayerPos(playerid, var7, var8, var9);
				GetPlayerFacingAngle(playerid, var10);
				udb_setPosition(function705E0(playerid), var7, var8, var9);
				udb_setAng(function705E0(playerid), var10);
				GivePlayerMoney(playerid, -1500);
				SendClientMessage(playerid, 0xFFFFFFAA, "Você se hospedou em um hotel. Ele poderá ser útil até você comprar uma casa");
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Você não possue dinheiro para se hospedar.");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você não esta em um hotel.");
		return 1;
	}
	if(!strcmp(var1, "/rcbaron", true))
	{
		if(IsPlayerAdmin(playerid))
		{
			new Float:var7 = 0.0, Float:var8 = 0.0, Float:var9 = 0.0, Float:var10 = 0.0;
			GetPlayerPos(playerid, var7, var8, var9);
			GetPlayerFacingAngle(playerid, var10);
			glob1D2DC[playerid] = CreateVehicle(464, var7, var8, var9, var10, 3, 3, 90000);
			PutPlayerInVehicle(playerid, glob1D2DC[playerid], 0);
			SendClientMessage(playerid, 0x33AA33AA, "Para você brincar! xD");
			printf("%s pegou um rc baron", function705E0(playerid));
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Apenas admins!");
		return 1;
	}
	if(!strcmp(var1, "/rcraider", true))
	{
		new Float:var7 = 0.0, Float:var8 = 0.0, Float:var9 = 0.0, Float:var10 = 0.0;
		GetPlayerPos(playerid, var7, var8, var9);
		GetPlayerFacingAngle(playerid, var10);
		glob1D2DC[playerid] = CreateVehicle(465, var7, var8, var9, var10, 3, 3, 90000);
		PutPlayerInVehicle(playerid, glob1D2DC[playerid], 0);
		SendClientMessage(playerid, 0x33AA33AA, "Para você brincar! xD");
		printf("%s pegou um rc raider", function705E0(playerid));
		return 1;
	}
	if(!strcmp(var1, "/rcbandit", true))
	{
		new Float:var7 = 0.0, Float:var8 = 0.0, Float:var9 = 0.0, Float:var10 = 0.0;
		GetPlayerPos(playerid, var7, var8, var9);
		GetPlayerFacingAngle(playerid, var10);
		glob1D2DC[playerid] = CreateVehicle(441, var7, var8, var9, var10, 3, 3, 90000);
		PutPlayerInVehicle(playerid, glob1D2DC[playerid], 0);
		SendClientMessage(playerid, 0x33AA33AA, "Para você brincar! xD");
		printf("%s pegou um rc bandit", function705E0(playerid));
		return 1;
	}
	if(!strcmp(var1, "/rcglobim", true))
	{
		new Float:var7 = 0.0, Float:var8 = 0.0, Float:var9 = 0.0, Float:var10 = 0.0;
		GetPlayerPos(playerid, var7, var8, var9);
		GetPlayerFacingAngle(playerid, var10);
		glob1D2DC[playerid] = CreateVehicle(501, var7, var8, var9, var10, 3, 3, 90000);
		PutPlayerInVehicle(playerid, glob1D2DC[playerid], 0);
		SendClientMessage(playerid, 0x33AA33AA, "Para você brincar! xD");
		printf("%s pegou um rc globim", function705E0(playerid));
		return 1;
	}
	if(!strcmp(var1, "/rctiger", true))
	{
		if(IsPlayerAdmin(playerid))
		{
			new Float:var7 = 0.0, Float:var8 = 0.0, Float:var9 = 0.0, Float:var10 = 0.0;
			GetPlayerPos(playerid, var7, var8, var9);
			GetPlayerFacingAngle(playerid, var10);
			glob1D2DC[playerid] = CreateVehicle(564, var7, var8, var9, var10, 3, 3, 90000);
			PutPlayerInVehicle(playerid, glob1D2DC[playerid], 0);
			SendClientMessage(playerid, 0x33AA33AA, "Para você brincar! xD");
			printf("%s pegou um rc tiger", function705E0(playerid));
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Apenas admins!");
		return 1;
	}
	if(!strcmp(var1, "/rccam", true))
	{
		if(IsPlayerAdmin(playerid))
		{
			new Float:var7 = 0.0, Float:var8 = 0.0, Float:var9 = 0.0, Float:var10 = 0.0;
			GetPlayerPos(playerid, var7, var8, var9);
			GetPlayerFacingAngle(playerid, var10);
			glob1D2DC[playerid] = CreateVehicle(594, var7, var8, var9, var10, 3, 3, 90000);
			PutPlayerInVehicle(playerid, glob1D2DC[playerid], 0);
			SendClientMessage(playerid, 0x33AA33AA, "Para você brincar! xD");
			printf("%s pegou um rc cam", function705E0(playerid));
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Apenas admins!");
		return 1;
	}
	if(!strcmp(var1, "/monstermpa", true) && IsPlayerAdmin(playerid))
	{
		new Float:var7 = 0.0, Float:var8 = 0.0, Float:var9 = 0.0, Float:var10 = 0.0;
		GetPlayerPos(playerid, var7, var8, var9);
		GetPlayerFacingAngle(playerid, var10);
		glob1D2DC[playerid] = CreateVehicle(444, var7, var8, var9, var10, 3, 3, 1000);
		PutPlayerInVehicle(playerid, glob1D2DC[playerid], 0);
		SendClientMessage(playerid, 0xFFFFFFAA, "Você fez o cheat do monster!");
		printf("%s fez o cheat do monster", function705E0(playerid));
		return 1;
	}
	if(!strcmp(var1, "/vidempa", true) && IsPlayerAdmin(playerid))
	{
		SetPlayerHealth(playerid, 100.0);
		SetVehicleHealth(GetPlayerVehicleID(playerid), 1000.0);
		GivePlayerMoney(playerid, 250000);
		SendClientMessage(playerid, 0xFFFFFFAA, "Você fez o cheat de vida e dinheiro!");
		printf("%s fez o cheat de vida e dinheiro", function705E0(playerid));
		return 1;
	}
	if(!strcmp(var1, "/trem", true))
	{
		if(IsPlayerAdmin(playerid))
		{
			new Float:var7 = 0.0, Float:var8 = 0.0, Float:var9 = 0.0, Float:var10 = 0.0;
			GetPlayerPos(playerid, var7, var8, var9);
			GetPlayerFacingAngle(playerid, var10);
			glob1D2DC[playerid] = CreateVehicle(538, var7, var8, var9, var10, 3, 3, 90000);
			PutPlayerInVehicle(playerid, glob1D2DC[playerid], 0);
			SendClientMessage(playerid, 0x33AA33AA, "Agora você pode andar de trem!");
			printf("%s fez um trem", function705E0(playerid));
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Apenas admins!");
		return 1;
	}
	if(!strcmp(var1, "/bonde", true))
	{
		if(IsPlayerAdmin(playerid))
		{
			new Float:var7 = 0.0, Float:var8 = 0.0, Float:var9 = 0.0, Float:var10 = 0.0;
			GetPlayerPos(playerid, var7, var8, var9);
			GetPlayerFacingAngle(playerid, var10);
			glob1D2DC[playerid] = CreateVehicle(449, var7, var8, var9, var10, 3, 3, 90000);
			PutPlayerInVehicle(playerid, glob1D2DC[playerid], 0);
			SendClientMessage(playerid, 0x33AA33AA, "Belo Bonde! xD");
			printf("%s fez um bonde", function705E0(playerid));
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Apenas admins!");
		return 1;
	}
	if(!strcmp(var1, "/sair", true))
	{
		if(glob38930[playerid] == 1)
		{
			if(GetPlayerState(playerid) == 2)
			{
				RemovePlayerFromVehicle(playerid);
				TogglePlayerControllable(playerid, true);
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Você precisa estar em um veículo para usar este comando.");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você está paralisado não por estar em um carro de aluguel então não poderá usar esse comando.");
		return 1;
	}
	if(!strcmp(var1, "/say", true))
	{
		new var7[256];
		new var8[256];
		strmid(var7, cmdtext, 4, strlen(cmdtext), 256);
		if(!strlen(var7))
		{
			SendClientMessage(playerid, 0xDD0000FF, "/say [texto]");
			return 1;
		}
		for(new var9 = 0; var9 < 200; var9++)
		{
			if(GetDistanceBetweenPlayers(playerid, var9) < 10)
			{
				format(var8, 256, "%s: %s", function705E0(playerid), var7);
				SendClientMessage(var9, 0xAFAFAFAA, var8);
				SendClientMessage(playerid, 0xAFAFAFAA, var8);
				return 1;
			}
		}
		return 1;
	}
	if(!strcmp(var1, "/apostar", true))
	{
		new var7[256];
		new var8 = 0;
		var7 = function1A10(cmdtext, var4, 32);
		var8 = strval(var7);
		if(!strlen(var7))
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "/apostar [numero]");
			return 1;
		}
		if(glob1A70C[playerid] == 1)
		{
			if(!glob29680[playerid])
			{
				if(var8 <= 20)
				{
					if(GetPlayerMoney(playerid) >= 100)
					{
						glob299A0[playerid] = var8;
						glob29680[playerid] = 1;
						GivePlayerMoney(playerid, -100);
						glob29CC0 = glob29CC0;
						new var9[256];
						format(var9, 256, "Você apostou no número %d! Boa sorte.", var8);
						SendClientMessage(playerid, 0x7585C0AA, var9);
						return 1;
					}
					SendClientMessage(playerid, 0xDD0000FF, "Você não possue $100 para apostar");
					return 1;
				}
				SendClientMessage(playerid, 0xDD0000FF, "Número Invalido! Números de 1 a 20");
				return 1;
			}
			SendClientMessage(playerid, 0xDD0000FF, "Você ja apostou! Espere o sorteio para apostar novamente");
			return 1;
		}
		SendClientMessage(playerid, 0xDD0000FF, "Você tem que estar no banco para apostar");
		return 1;
	}
	if(!strcmp(var1, "/guinchar", true))
	{
		new var7[256];
		new var8 = 0;
		new var9 = 0;
		new var10 = 0;
		var10 = GetDistanceBetweenPlayers(playerid, var9);
		var7 = function1A10(cmdtext, var4, 32);
		var9 = strval(var7);
		if(!strlen(var7))
		{
			SendClientMessage(playerid, 0xFFFFFFAA, "/guinchar [id]");
			return 1;
		}
		var8 = GetPlayerVehicleID(var9);
		new var11 = 0;
		functionCA14(GetPlayerVehicleID(playerid), var11);
		if(var11 == glob187C0)
		{
			if(IsPlayerInVehicle(var9, var8))
			{
				if(var10 < 5)
				{
					GetVehicleTrailer(GetPlayerVehicleID(playerid));
					AttachTrailerToVehicle(GetPlayerVehicleID(playerid), var8);
					SendClientMessage(playerid, 0x00BC6FAA, "Guinchado com sucesso");
					SendClientMessage(var9, 0x00BC6FAA, "Seu carro foi guinchado");
					return 1;
				}
				SendClientMessage(playerid, 0x00BC6FAA, "Chegue mais perto");
				return 1;
			}
			SendClientMessage(playerid, 0x00BC6FAA, "O jogador não está num veiculo");
			return 1;
		}
		SendClientMessage(playerid, 0x00BC6FAA, "Você tem que estar num carro guincho");
		return 1;
	}
	if(!strcmp(var1, "/irtrabalho", true))
	{
		if(glob2AF8C[playerid] == 1)
		{
			SetPlayerColor(playerid, 0xCBCBCBAA);
			return 1;
		}
		if(glob2AF8C[playerid] == 2)
		{
			SetPlayerColor(playerid, 0xFFF297AA);
			SetPlayerPos(playerid, -1805.1131, 948.6367, 24.8906);
			SetPlayerSkin(playerid, 155);
			udb_setSkin(function705E0(playerid), 155);
			GameTextForPlayer(playerid, "~y~Entregador de Pizza", 1500, 4);
			return 1;
		}
		if(glob2AF8C[playerid] == 3)
		{
			SetPlayerColor(playerid, 0xB2FB92AA);
			SetPlayerPos(playerid, -2244.1036, -89.818, 35.3203);
			SetPlayerSkin(playerid, 240);
			udb_setSkin(function705E0(playerid), 240);
			GameTextForPlayer(playerid, "~y~Barman", 1500, 4);
			return 1;
		}
		if(glob2AF8C[playerid] == 4)
		{
			SetPlayerColor(playerid, 0xFF91ECAA);
			SetPlayerPos(playerid, -2097.636, -2348.1456, 30.625);
			GameTextForPlayer(playerid, "~y~Sorveteiro", 1500, 4);
			return 1;
		}
		if(glob2AF8C[playerid] == 5)
		{
			SetPlayerColor(playerid, 0xBDD94CFF);
			SetPlayerPos(playerid, -2333.7896, -167.2186, 35.5546);
			GameTextForPlayer(playerid, "~y~Vendedor de Lanches", 1500, 4);
			return 1;
		}
		if(glob2AF8C[playerid] == 6)
		{
			SetPlayerColor(playerid, 0xFF9191FF);
			SetPlayerPos(playerid, -2620.2874, 629.6312, 14.4531);
			SetPlayerSkin(playerid, 70);
			udb_setSkin(function705E0(playerid), 70);
			GameTextForPlayer(playerid, "~y~Paramedico", 1500, 4);
			return 1;
		}
		if(glob2AF8C[playerid] == 7)
		{
			SetPlayerColor(playerid, 0xFF7200FF);
			SetPlayerPos(playerid, -2026.2343, -98.7061, 35.1641);
			GameTextForPlayer(playerid, "~y~Instrutor de Direcao", 1500, 4);
			return 1;
		}
		if(glob2AF8C[playerid] == 8)
		{
			SetPlayerColor(playerid, 0x662228FF);
			SetPlayerPos(playerid, -1675.9709, 431.7278, 7.1796);
			GameTextForPlayer(playerid, "~y~Frentista", 1500, 4);
			return 1;
		}
		if(glob2AF8C[playerid] == 9)
		{
			SetPlayerColor(playerid, 0xFFFC00AA);
			SetPlayerPos(playerid, -1754.858, 961.1519, 24.8827);
			GameTextForPlayer(playerid, "~y~Taxista", 1500, 4);
			return 1;
		}
		if(glob2AF8C[playerid] == 10)
		{
			SetPlayerColor(playerid, 0xFFFC00AA);
			SetPlayerPos(playerid, -1754.858, 961.1519, 24.8827);
			GameTextForPlayer(playerid, "~y~Moto-Taxi", 1500, 4);
			return 1;
		}
		if(glob2AF8C[playerid] == 11)
		{
			SetPlayerColor(playerid, 0xC6C55EAA);
			SetPlayerPos(playerid, -1754.858, 961.1519, 24.8827);
			GameTextForPlayer(playerid, "~y~Taxi Aereo", 1500, 4);
			return 1;
		}
		if(glob2AF8C[playerid] == 12)
		{
			SetPlayerColor(playerid, 0xFF5A00AA);
			GameTextForPlayer(playerid, "~y~Sequestrador", 1500, 4);
			return 1;
		}
		if(glob2AF8C[playerid] == 13)
		{
			SetPlayerColor(playerid, 0xD22402AA);
			GameTextForPlayer(playerid, "~y~Assassino", 1500, 4);
			return 1;
		}
		if(glob2AF8C[playerid] == 14)
		{
			SetPlayerColor(playerid, 0xFE684BFF);
			GameTextForPlayer(playerid, "~y~Assaltante", 1500, 4);
			return 1;
		}
		if(glob2AF8C[playerid] == 15)
		{
			SetPlayerColor(playerid, 0xCE2A2AFF);
			SetPlayerPos(playerid, -365.7678, 1166.3444, 19.7422);
			GameTextForPlayer(playerid, "~y~Ladrao de Carros", 1500, 4);
			return 1;
		}
		if(glob2AF8C[playerid] == 16)
		{
			SetPlayerColor(playerid, 0xD94242FF);
			GameTextForPlayer(playerid, "~y~Traficante", 1500, 4);
			return 1;
		}
		if(glob2AF8C[playerid] == 17)
		{
			SetPlayerColor(playerid, 0xAC5050FF);
			GameTextForPlayer(playerid, "~y~Vendedor de Armas", 1500, 4);
			return 1;
		}
		if(glob2AF8C[playerid] == 18)
		{
			SetPlayerColor(playerid, 0xAB2DCFAA);
			GameTextForPlayer(playerid, "~y~Cacador", 1500, 4);
			return 1;
		}
		if(glob2AF8C[playerid] == 19)
		{
			SetPlayerColor(playerid, 0xE89AFFAA);
			GameTextForPlayer(playerid, "~y~Pescador", 1500, 4);
			return 1;
		}
		if(glob2AF8C[playerid] == 20)
		{
			SetPlayerColor(playerid, 0x9AFFDDAA);
			GameTextForPlayer(playerid, "~y~Agricutor", 1500, 4);
			return 1;
		}
		if(glob2AF8C[playerid] == 21)
		{
			SetPlayerColor(playerid, 0x9EB3FFAA);
			SetPlayerPos(playerid, -1605.3073, 718.3339, 11.9386);
			SetPlayerSkin(playerid, 280);
			udb_setSkin(function705E0(playerid), 280);
			GameTextForPlayer(playerid, "~y~Policial Civil", 1500, 4);
			return 1;
		}
		if(glob2AF8C[playerid] == 22)
		{
			SetPlayerColor(playerid, 0x4970FFAA);
			SetPlayerPos(playerid, -211.6216, 980.4658, 19.3253);
			SetPlayerSkin(playerid, 283);
			udb_setSkin(function705E0(playerid), 283);
			GameTextForPlayer(playerid, "~y~Policial Rodoviario", 1500, 4);
			return 1;
		}
		if(glob2AF8C[playerid] == 23)
		{
			SetPlayerColor(playerid, 0x4C62B3AA);
			SetPlayerPos(playerid, 1552.9604, -1675.1141, 16.1952);
			SetPlayerSkin(playerid, 285);
			udb_setSkin(function705E0(playerid), 285);
			GameTextForPlayer(playerid, "~y~S.W.A.T.", 1500, 4);
			return 1;
		}
		if(glob2AF8C[playerid] == 24)
		{
			SetPlayerColor(playerid, 0x0024ACAA);
			SetPlayerPos(playerid, -1605.3073, 718.3339, 11.9386);
			SetPlayerSkin(playerid, 125);
			udb_setSkin(function705E0(playerid), 125);
			GameTextForPlayer(playerid, "~y~Delegado", 1500, 4);
			return 1;
		}
		if(glob2AF8C[playerid] == 25)
		{
			SetPlayerColor(playerid, 0x7585C0AA);
			SetPlayerPos(playerid, -1605.3073, 718.3339, 11.9386);
			SetPlayerSkin(playerid, 59);
			udb_setSkin(function705E0(playerid), 59);
			GameTextForPlayer(playerid, "~y~Juiz", 1500, 4);
			return 1;
		}
		if(glob2AF8C[playerid] == 26)
		{
			SetPlayerColor(playerid, 0x7585C0AA);
			SetPlayerPos(playerid, 1552.9604, -1675.1141, 16.1952);
			SetPlayerSkin(playerid, 46);
			udb_setSkin(function705E0(playerid), 46);
			GameTextForPlayer(playerid, "~y~Narcoticos", 1500, 4);
			return 1;
		}
		if(glob2AF8C[playerid] == 27)
		{
			SetPlayerColor(playerid, 0x00FFEAFF);
			SetPlayerPos(playerid, -2163.1668, -2387.774, 30.625);
			SetPlayerSkin(playerid, 127);
			udb_setSkin(function705E0(playerid), 127);
			GameTextForPlayer(playerid, "~y~Policia Florestal", 1500, 4);
			return 1;
		}
		if(glob2AF8C[playerid] == 28)
		{
			SetPlayerColor(playerid, 0x04AB6EAA);
			SetPlayerPos(playerid, -2163.1668, -2387.774, 30.625);
			SetPlayerSkin(playerid, 98);
			udb_setSkin(function705E0(playerid), 98);
			GameTextForPlayer(playerid, "~y~Ibama", 1500, 4);
			return 1;
		}
		if(glob2AF8C[playerid] == 29)
		{
			SetPlayerColor(playerid, 0x1B7A01AA);
			SetPlayerPos(playerid, -1310.9028, 472.2222, 7.1875);
			SetPlayerSkin(playerid, 287);
			udb_setSkin(function705E0(playerid), 287);
			GameTextForPlayer(playerid, "~y~Exercito", 1500, 4);
			return 1;
		}
		if(glob2AF8C[playerid] == 30)
		{
			SetPlayerColor(playerid, 0x5CFFFDAA);
			SetPlayerPos(playerid, -1938.594, 569.9606, 35.2899);
			SetPlayerSkin(playerid, 147);
			udb_setSkin(function705E0(playerid), 147);
			GameTextForPlayer(playerid, "~y~Advogado", 1500, 4);
			return 1;
		}
		if(glob2AF8C[playerid] == 31)
		{
			SetPlayerColor(playerid, 0x81ABABAA);
			SetPlayerPos(playerid, -2180.6014, -2401.2396, 30.625);
			SetPlayerSkin(playerid, 165);
			udb_setSkin(function705E0(playerid), 165);
			GameTextForPlayer(playerid, "~y~Seguranca", 1500, 4);
			return 1;
		}
		if(glob2AF8C[playerid] == 32)
		{
			SetPlayerColor(playerid, 0x2CCC6CAA);
			SetPlayerPos(playerid, -1754.858, 961.1519, 24.8827);
			SetPlayerSkin(playerid, 255);
			udb_setSkin(function705E0(playerid), 255);
			GameTextForPlayer(playerid, "~y~Motorista Particular", 1500, 4);
			return 1;
		}
		if(glob2AF8C[playerid] == 33)
		{
			SetPlayerColor(playerid, 0x66E3DFAA);
			SetPlayerPos(playerid, -1938.594, 569.9606, 35.2899);
			GameTextForPlayer(playerid, "~y~Motorista de Onibus", 1500, 4);
			return 1;
		}
		if(glob2AF8C[playerid] == 34)
		{
			SetPlayerColor(playerid, 0xC19100AA);
			SetPlayerPos(playerid, -2085.4712, -2448.2737, 30.625);
			GameTextForPlayer(playerid, "~y~Mendingo", 1500, 4);
			return 1;
		}
		if(glob2AF8C[playerid] == 35)
		{
			SetPlayerColor(playerid, 0xADFF0EAA);
			SetPlayerPos(playerid, -1652.3526, 1207.9296, 7.25);
			SetPlayerSkin(playerid, 120);
			udb_setSkin(function705E0(playerid), 120);
			GameTextForPlayer(playerid, "~y~Vendedor de Carros", 1500, 4);
			return 1;
		}
		if(glob2AF8C[playerid] == 36)
		{
			SetPlayerColor(playerid, 0x77913AAA);
			SetPlayerSkin(playerid, 126);
			udb_setSkin(function705E0(playerid), 126);
			GameTextForPlayer(playerid, "~y~Corretor", 1500, 4);
			return 1;
		}
		if(glob2AF8C[playerid] == 37)
		{
			SetPlayerColor(playerid, 0xEEFFC4AA);
			GameTextForPlayer(playerid, "~y~Segurador", 1500, 4);
			SetPlayerPos(playerid, 1153.8121, -1770.8702, 16.5991);
			SetPlayerSkin(playerid, 117);
			udb_setSkin(function705E0(playerid), 117);
			return 1;
		}
		if(glob2AF8C[playerid] == 38)
		{
			SetPlayerColor(playerid, 0xFEFFFAAA);
			GameTextForPlayer(playerid, "~y~Jornalista", 1500, 4);
			SetPlayerPos(playerid, -2521.2449, -624.7715, 132.783);
			SetPlayerSkin(playerid, 186);
			udb_setSkin(function705E0(playerid), 186);
			return 1;
		}
		if(glob2AF8C[playerid] == 39)
		{
			SetPlayerColor(playerid, 0xACAC00FF);
			SetPlayerPos(playerid, -2097.3877, -2255.649, 30.625);
			GameTextForPlayer(playerid, "~y~Caminhoneiro", 1500, 4);
			return 1;
		}
		if(glob2AF8C[playerid] == 40)
		{
			SetPlayerColor(playerid, 0x444444FF);
			SetPlayerPos(playerid, 295.6498, 1385.6341, 10.156);
			GameTextForPlayer(playerid, "~y~Transporte de Combustivel", 1500, 4);
			return 1;
		}
	}
	SendClientMessage(playerid, 0xDD0000FF, "Comando desconhecido!");
	return 1;
}

public OnPlayerInfoChange(playerid)
{
	printf("OnPlayerInfoChange(%d)");
	return 1;
}

public faminto()
{
	for(new var0 = 0; var0 < 200; var0++)
	{
		if(glob1E5A0[var0] == 5)
		{
			if(glob1E8C0 == 6)
			{
				new Float:var1 = 0.0;
				new var2 = 0;
				new var3 = 0;
				var2 = GetPlayerHealth(var0, var1);
				var3 = var2 - 20;
				SendClientMessage(var0, 0xDD0000FF, "Você está com fome e ira perdendo vida cada vez mais se não decidir comer");
				SetPlayerHealth(var0, var3);
			}
		}
	}
	return 0;
}

public semaluguel(playerid)
{
	TogglePlayerControllable(playerid, false);
	glob38930[playerid] = 1;
	return 0;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	if(vehicleid == glob2F77C || vehicleid == glob2F780 || vehicleid == glob2F784 || vehicleid == glob2F788 || vehicleid == glob2F78C || vehicleid == glob2F790 || vehicleid == glob2F794 || vehicleid == glob2F798)
	{
		if(glob2F45C[playerid] != vehicleid && 41 != glob2AF8C[playerid])
		{
			SendClientMessage(playerid, 0xDD0000FF, "Esse é um carro de aluguel peça a um locador para alugar ele ou");
			SendClientMessage(playerid, 0xDD0000FF, "então digite /sair para sair do veiculo.");
			SetTimerEx("semaluguel", 5000, false, "d", playerid);
			return 1;
		}
	}
	for(new var0 = 0; var0 < 200; var0++)
	{
		new Float:var1 = 0.0, Float:var2 = 0.0, Float:var3 = 0.0;
		GetPlayerPos(playerid, var1, var2, var3);
		if(glob1E8C8[GetPlayerVehicleID(var0)] == 1)
		{
			SendClientMessage(playerid, 0xDD0000FF, "Este veículo está protegido com o Sistema de Alarmes MPA®, as portas");
			SendClientMessage(playerid, 0xDD0000FF, "foram trancadas e só poderá sair quando algum Policial te liberar!");
			printf("O Jogador %s(id: %d) entrou em um veiculo(id: %d) mais estava trancado.", function705E0(playerid), playerid, vehicleid);
			TogglePlayerControllable(playerid, false);
			new var4[256];
			PlayerPlaySound(var0, 41800, var1, var2, var3);
			if(glob2AF8C[var0] == 21 || glob2AF8C[var0] == 22 || glob2AF8C[var0] == 23)
			{
				format(var4, 256, "%s entrou em um veículo trancado!", function705E0(playerid));
				SendClientMessage(var0, 0x4C62B3AA, var4);
				return 0;
			}
			return 1;
		}
	}
	printf("O Jogador %s(id: %d) entrou em um %s", function705E0(playerid), playerid, glob15634[GetPlayerVehicleID(playerid)][0]);
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	printf("O Jogador %s(id: %d) saiu de um veiculo(id: %d)", function705E0(playerid), playerid, vehicleid);
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	new var0 = 0;
	functionCA14(GetPlayerVehicleID(playerid), var0);
	if(IsPlayerConnected(playerid) == 1 && 510 != var0 && 509 != var0)
	{
		if(newstate == 2)
		{
			if(!glob1C1A8[GetPlayerVehicleID(playerid)])
			{
				TogglePlayerControllable(playerid, false);
				SendClientMessage(playerid, 0xDD0000FF, "Este veículo não tem combustivel! Vá até o posto e compre um galão de combustível.");
				SendClientMessage(playerid, 0xDD0000FF, "Digite '/sair' para  do veiculo ou digite '/colocar' para colocar um galao de combustivel neste veiculo.");
				return 1;
			}
		}
	}
	if(newstate == 1)
	{
		if(glob2B8EC[playerid][0] == 1)
		{
			SendClientMessage(playerid, 0x33AA33AA, "Taxi pago.");
			SendClientMessage(glob2B8EC[playerid][1], 0xDD0000FF, "Você recebeu o valor da corrida até aqui.");
			GivePlayerMoney(playerid, 0 - glob2D50C[playerid]);
			GivePlayerMoney(glob2B8EC[playerid][1], glob2D50C[playerid]);
			glob2D50C[playerid] = 0;
			glob2B8EC[playerid][1] = 0;
			glob2B8EC[playerid][0] = 0;
			return 1;
		}
	}
	return 1;
}

public PhoneCut()
{
	for(new var0 = 0; var0 < 200; var0++)
	{
		if(IsPlayerConnected(var0))
		{
			if(glob2E194[var0] > -1 && glob2E4B4[var0] == 1 && glob2EAF4[var0] == 1)
			{
				if(0 < udb_getnumcell(function705E0(var0)))
				{
					udb_setnumcell(function705E0(var0), udb_getnumcell(function705E0(var0)) - 1);
				}
				if(0 <= GetPlayerMoney(var0))
				{
					GivePlayerMoney(var0, 0);
				}
				if(0 > GetPlayerMoney(var0))
				{
					SendClientMessage(var0, 0xDD0000FF, "CHAMADA PERDIDA: Você não possue mais dinheiro para continuar essa ligação");
					SendClientMessage(glob2E194[var0], 0xDD0000FF, "CHAMADA PERDIDA: O telefone de quem estava na outra chamada foi desligado por falta de dinheiro");
					glob2E194[glob2E194[var0]] = -1;
					glob2E4B4[glob2E194[var0]] = 0;
					glob2E194[var0] = -1;
					glob2E4B4[var0] = 0;
					glob2EAF4[var0] = 0;
				}
				if(0 >= udb_getnumcell(function705E0(var0)))
				{
					SendClientMessage(var0, 0xDD0000FF, "CHAMADA PERDIDA: Você não possue mais créditos para continuar essa ligação");
					SendClientMessage(glob2E194[var0], 0xDD0000FF, "CHAMADA PERDIDA: O telefone de quem estava na outra chamada foi desligado por falta de créditos");
					glob2E194[glob2E194[var0]] = -1;
					glob2E4B4[glob2E194[var0]] = 0;
					glob2E194[var0] = -1;
					glob2E4B4[var0] = 0;
					glob2EAF4[var0] = 0;
				}
			}
		}
	}
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	printf("Jogador de ID %d (%s) entrou em um checkpoint", playerid, function705E0(playerid));
	switch(glob187CC[playerid]) {
		case 24:
			if(IsPlayerInAnyVehicle(playerid))
			{
				new var0 = GetVehicleModel(GetPlayerVehicleID(playerid));
				if(var0 == glob1878C)
				{
					new Float:var1 = 0.0;
					GetVehicleHealth(GetPlayerVehicleID(playerid), var1);
					if(var1 >= 70)
					{
						SendClientMessage(playerid, 0xFFFFFFAA, "Sua limosine não está muito danificada então sua companhia não pensou em gastar dinheiro ainda.");
						DisablePlayerCheckpoint(playerid);
						SetPlayerCheckpoint(playerid, -2437.4283, 1030.0269, 50.3905, 3.0);
						glob187CC[playerid] = 25;
						SendClientMessage(playerid, 0xFFFFFFAA, "Agora vá revisar se sua limosine está limpa.");
						return 1;
					}
					SendClientMessage(playerid, 0xFFFFFFAA, "Sua companhia resolveu consertar a limosine pois ela estava quebrada.");
					SetVehicleHealth(GetPlayerVehicleID(playerid), 100.0);
					DisablePlayerCheckpoint(playerid);
					SetPlayerCheckpoint(playerid, -2437.4283, 1030.0269, 50.3905, 3.0);
					glob187CC[playerid] = 25;
					SendClientMessage(playerid, 0xFFFFFFAA, "Agora vá revisar se sua limosine está limpa.");
					return 1;
				}
				GameTextForPlayer(playerid, "~w~Voce tem que ~n~ estar em uma ~n~~r~Limosine", 4000, 4);
				return 1;
			}
			GameTextForPlayer(playerid, "~w~Voce tem que ~n~ estar em um ~n~~g~Veiculo", 4000, 4);
			return 1;
		case 25:
			if(IsPlayerInAnyVehicle(playerid))
			{
				new var0 = GetVehicleModel(GetPlayerVehicleID(playerid));
				if(var0 == glob1878C)
				{
					if(!glob326B0[GetPlayerVehicleID(playerid)])
					{
						glob326B0[GetPlayerVehicleID(playerid)] = 1;
						SendClientMessage(playerid, 0xFFFFFFAA, "Sua limosine estava suja e sua companhia pagou a limpeza agora ela está brilhando novamente.");
						DisablePlayerCheckpoint(playerid);
						SetPlayerCheckpoint(playerid, -1670.9294, 415.5903, 7.1796, 3.0);
						glob187CC[playerid] = 26;
						SendClientMessage(playerid, 0xFFFFFFAA, "Vá revisar o combústivel de sua limosine no posto.");
						return 1;
					}
					SendClientMessage(playerid, 0xFFFFFFAA, "Sua limosine está limpa não irá precisar lava-la.");
					DisablePlayerCheckpoint(playerid);
					SetPlayerCheckpoint(playerid, -1670.9294, 415.5903, 7.1796, 3.0);
					glob187CC[playerid] = 26;
					SendClientMessage(playerid, 0xFFFFFFAA, "Vá revisar o combústivel de sua limosine no posto.");
					return 1;
				}
				GameTextForPlayer(playerid, "~w~Voce tem que ~n~ estar em uma ~n~~r~Limosine", 4000, 4);
				return 1;
			}
			GameTextForPlayer(playerid, "~w~Voce tem que ~n~ estar em um ~n~~g~Veiculo", 4000, 4);
			return 1;
		case 26:
			if(IsPlayerInAnyVehicle(playerid))
			{
				new var0 = GetVehicleModel(GetPlayerVehicleID(playerid));
				if(var0 == glob1878C)
				{
					if(glob1C1A8[GetPlayerVehicleID(playerid)] <= 50)
					{
						SendClientMessage(playerid, 0xFFFFFFAA, "Sua limosine estava com pouco combustível então sua companhia decidiu encher o tanque.");
						glob1C1A8[GetPlayerVehicleID(playerid)] = 100;
						DisablePlayerCheckpoint(playerid);
						SendClientMessage(playerid, 0xFFFFFFAA, "Limosine revisada seu chefe lhe depositou R$400 em sua conta.");
						udb_setBankMoney(function705E0(playerid), udb_getBankMoney(function705E0(playerid)) + 400);
						udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
						glob187CC[playerid] = 0;
						glob37E40[GetPlayerVehicleID(playerid)] = 1;
						return 1;
					}
					SendClientMessage(playerid, 0xFFFFFFAA, "Sua limosine está com o tanque cheio ainda então não será necessário abastecer.");
					DisablePlayerCheckpoint(playerid);
					SendClientMessage(playerid, 0xFFFFFFAA, "Vá revisar o combústivel de sua limosine no posto.");
					return 1;
				}
				GameTextForPlayer(playerid, "~w~Voce tem que ~n~ estar em uma ~n~~r~Limosine", 4000, 4);
				return 1;
			}
			GameTextForPlayer(playerid, "~w~Voce tem que ~n~ estar em um ~n~~g~Veiculo", 4000, 4);
			return 1;
		case 1:
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, -2679.8501, 558.8383, 14.503, 2.5);
			SendClientMessage(playerid, 0xF0E68CAA, "Otimo! agora chegue ate o proximo terminal");
			glob187CC[playerid] = 2;
		case 2:
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, -2246.3533, -136.8765, 35.3203, 2.5);
			SendClientMessage(playerid, 0xF0E68CAA, "Otimo! agora chegue ate o proximo terminal");
			glob187CC[playerid] = 3;
		case 3:
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, -1975.9673, -751.0165, 32.2266, 2.5);
			SendClientMessage(playerid, 0xF0E68CAA, "Muito bem! Seu chefe lhe deu $150 pelo bom trabalho");
			GivePlayerMoney(playerid, 150);
			glob187CC[playerid] = 4;
		case 4:
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, -2174.8453, -46.8932, 35.3125, 2.5);
			SendClientMessage(playerid, 0xF0E68CAA, "Otimo! agora chegue ate o proximo terminal");
			glob187CC[playerid] = 5;
		case 5:
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, -2154.7962, 252.1679, 35.3125, 2.5);
			SendClientMessage(playerid, 0xF0E68CAA, "Otimo! agora chegue ate o proximo terminal");
			glob187CC[playerid] = 6;
		case 6:
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, -1986.2688, 141.6903, 27.6875, 2.5);
			SendClientMessage(playerid, 0xF0E68CAA, "Otimo! agora chegue ate o proximo terminal");
			glob187CC[playerid] = 7;
		case 7:
			DisablePlayerCheckpoint(playerid);
			SendClientMessage(playerid, 0xF0E68CAA, "Muito bem! Seu chefe lhe deu $150 pelo bom trabalho");
			GivePlayerMoney(playerid, 150);
			glob187CC[playerid] = 0;
			udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
		case 8:
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, -2624.0499, 1181.1068, 35.0233, 2.5);
			SendClientMessage(playerid, 0xF0E68CAA, "Otimo! agora chegue ate o proximo terminal");
			glob187CC[playerid] = 9;
		case 9:
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, -2442.3326, 489.0844, 30.0877, 2.5);
			SendClientMessage(playerid, 0xF0E68CAA, "Otimo! agora chegue ate o proximo terminal");
			glob187CC[playerid] = 10;
		case 10:
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, -2054.0765, -65.3922, 35.1719, 2.5);
			SendClientMessage(playerid, 0xF0E68CAA, "Otimo! agora chegue ate o proximo terminal");
			glob187CC[playerid] = 11;
		case 11:
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, -1587.9776, 829.239, 7.6322, 2.5);
			SendClientMessage(playerid, 0xF0E68CAA, "Otimo! agora chegue ate o proximo terminal");
			glob187CC[playerid] = 12;
		case 12:
			DisablePlayerCheckpoint(playerid);
			SendClientMessage(playerid, 0xF0E68CAA, "Muito bem! Seu chefe lhe deu $150 pelo bom trabalho");
			GivePlayerMoney(playerid, 150);
			glob187CC[playerid] = 0;
			udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
		case 19:
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1434.8028, 2611.4238, 10.8203, 2.5);
			SendClientMessage(playerid, 0xF0E68CAA, "Va agora para a rodoviaria de Las Venturas");
			glob187CC[playerid] = 20;
		case 20:
			DisablePlayerCheckpoint(playerid);
			SendClientMessage(playerid, 0xF0E68CAA, "Otimo agora você recebeu $150 e mais o dinheiro dos passageiros");
			glob187CC[playerid] = 0;
			GivePlayerMoney(playerid, 150);
		case 21:
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, -1977.7321, -860.4664, 32.0312, 2.5);
			SendClientMessage(playerid, 0xF0E68CAA, "Va ate a rodoviaria de San Fierro agora");
			glob187CC[playerid] = 22;
			GivePlayerMoney(playerid, 150);
		case 22:
			DisablePlayerCheckpoint(playerid);
			SendClientMessage(playerid, 0xF0E68CAA, "Otimo agora você recebeu $150 e mais o dinheiro dos passageiros");
			glob187CC[playerid] = 0;
			GivePlayerMoney(playerid, 150);
		case 27:
			new var0 = GetPlayerVehicleID(playerid);
			new var1 = GetVehicleModel(playerid);
			new var2 = GetVehicleTrailer(var0);
			for(new var3 = 0; var3 < 200; var3++)
			{
				if(39 != glob2AF8C[var3])
				{
					return 1;
				}
				if(glob17914 <= 4)
				{
					if(var1 == glob187A4 || var1 == glob187AC || (var1 == glob187A8 && var2 == glob187A0))
					{
						DisablePlayerCheckpoint(playerid);
						SetTimerEx("CarregandoComb", 10000, false, "fff", playerid, var2, var0);
						SendClientMessage(playerid, 0x33AA33AA, "Espere enquanto carregamos o tanque, dentro de 10s pedorá partir.");
						glob175F4[var3] = 0;
					}
					else
					{
						SendClientMessage(playerid, 0xDD0000FF, "Você não está engatado. Engate a carrega tanque em seu caminhão para carregar");
					}
				}
			}
		case 28:
			new var0 = GetPlayerVehicleID(playerid);
			new var1 = GetVehicleModel(playerid);
			new var2 = GetVehicleTrailer(var0);
			if(IsTrailerAttachedToVehicle(var0))
			{
				if(var1 == glob187A4 || var1 == glob187AC || (var1 == glob187A8 && var2 == glob187A0))
				{
					if(glob1F9F8[GetPlayerVehicleID(var2)] == 1)
					{
						DisablePlayerCheckpoint(playerid);
						SetTimerEx("DescarregandoComb", 10000, false, "fff", playerid, var2, var0);
						SendClientMessage(playerid, 0x33AA33AA, "Aguarde, estamos desatrelando o tanque, dentro de 15s poderá partir.");
					}
					else
					{
						SendClientMessage(playerid, 0xDD0000FF, "Seu veículo não está carregado.");
					}
				}
				else
				{
					SendClientMessage(playerid, 0xDD0000FF, "O veículo em que você está não é de combústivel.");
				}
			}
			else
			{
				SendClientMessage(playerid, 0xDD0000FF, "Você não está engatado.");
			}
		case 23:
			if(glob33C94[playerid] == 1)
			{
				if(IsPlayerInAnyVehicle(playerid))
				{
					SendClientMessage(playerid, 0xDD0000FF, "Você tem que estar à pé");
					return 1;
				}
				SendClientMessage(playerid, 0xDD0000FF, "Latinha coletada.");
				DisablePlayerCheckpoint(playerid);
				new var0 = random(23);
				SetPlayerCheckpoint(playerid, glob8DF4[var0][0], glob8DF4[var0][1], glob8DF4[var0][2], 3.0);
				SendClientMessage(playerid, 0xDD0000FF, "Colete mais latinhas ou pare com /pararcoleta.");
				glob33FB4[playerid]++;
			}
	}
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	printf("O Jogador %s(%d) saiu de um checkpoint.", function705E0(playerid), playerid);
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

public votacaoon(arg0, arg1)
{
	for(new var0 = 0; var0 < 200; var0++)
	{
		glob29FEC[arg0] = 1;
		glob29FEC[arg1] = 2;
		glob29CCC[var0] = 1;
		SetTimerEx("fimvotacao", 10000, true, "dd", arg0, arg1);
	}
	return 0;
}

public fimvotacao(arg0, arg1, playerid)
{
	for(new var0 = 0; var0 < 200; var0++)
	{
		if(glob29FEC[arg0] == 1)
		{
			if(glob29FEC[arg1] == 1)
			{
			}
			if(IsPlayerConnected(var0))
			{
				if(glob2A30C[arg1] > glob2A30C[arg0])
				{
					arg1 = playerid;
					return 1;
				}
				if(glob2A30C[arg1] < glob2A30C[arg0])
				{
					arg0 = playerid;
					return 1;
				}
				new var1[256];
				format(var1, 256, "O vencedor foi:%s.", function705E0(playerid));
				SendClientMessageToAll(0xFFFFFFAA, var1);
				glob29CCC[var0] = 0;
				glob2A62C[var0] = 0;
				glob29FEC[arg0] = 0;
				glob29FEC[arg1] = 0;
				return 1;
			}
			if(glob2A30C[arg1] == glob2A30C[arg0])
			{
				SendClientMessage(var0, 0xFFFFFFAA, "Nenhum Vencedor nestá temporada de votaçoes. Depois sera feita outra eleição para decidir");
				glob29CCC[var0] = 0;
				glob2A62C[var0] = 0;
				glob29FEC[arg0] = 0;
				glob29FEC[arg1] = 0;
			}
		}
	}
	return 1;
}

public OnRconCommand(cmd)
{
	return 1;
}

public consertar(arg0, playerid, arg2)
{
	new Float:var0 = 0.0, Float:var1 = 0.0, Float:var2 = 0.0;
	GetPlayerPos(playerid, var0, var1, var2);
	if(IsPlayerConnected(playerid))
	{
		SetVehiclePos(arg0, 2.5 + var0, var1, 1.0 + var2);
		SetVehicleZAngle(arg0, arg2);
		SendClientMessage(playerid, 0x00BC6FAA, "Seu veiculo foi consertado.");
	}
	return 0;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public locar(playerid)
{
	if(41 != glob2AF8C[playerid])
	{
		if(glob2F13C[playerid] == 1)
		{
			glob2F13C[playerid] = 0;
			glob2F45C[playerid] = 0;
			RemovePlayerFromVehicle(playerid);
			SendClientMessage(playerid, 0xFEE765AA, "Seu tempo acabou se quiser mais peça a um locador de carros");
		}
	}
	return 0;
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
	new var0 = GetPlayerMenu(playerid);
	if(var0 == glob1D91C)
	{
		switch(row) {
			case 0:
				HideMenuForPlayer(var0, playerid);
				function70434();
				TogglePlayerControllable(playerid, true);
			case 1:
				HideMenuForPlayer(var0, playerid);
				function704EC();
				TogglePlayerControllable(playerid, true);
			case 2:
				HideMenuForPlayer(var0, playerid);
				TogglePlayerControllable(playerid, true);
		}
	}
	else if(var0 == glob1E8C4)
	{
		switch(row) {
			case 0:
				HideMenuForPlayer(var0, playerid);
				function70284(playerid);
				TogglePlayerControllable(playerid, true);
			case 1:
				HideMenuForPlayer(var0, playerid);
				function7035C(playerid);
				TogglePlayerControllable(playerid, true);
			case 2:
				HideMenuForPlayer(var0, playerid);
				TogglePlayerControllable(playerid, true);
		}
	}
	else if(var0 == glob24B40)
	{
		switch(row) {
			case 0:
				HideMenuForPlayer(var0, playerid);
				function6FA64(playerid);
				TogglePlayerControllable(playerid, true);
			case 1:
				HideMenuForPlayer(var0, playerid);
				function6FB68(playerid);
				TogglePlayerControllable(playerid, true);
			case 2:
				HideMenuForPlayer(var0, playerid);
				function6FC6C(playerid);
				TogglePlayerControllable(playerid, true);
			case 3:
				HideMenuForPlayer(var0, playerid);
				function6FD70(playerid);
				TogglePlayerControllable(playerid, true);
			case 4:
				HideMenuForPlayer(var0, playerid);
				function6FE74(playerid);
				TogglePlayerControllable(playerid, true);
			case 5:
				HideMenuForPlayer(var0, playerid);
				function6FF78(playerid);
				TogglePlayerControllable(playerid, true);
			case 6:
				HideMenuForPlayer(var0, playerid);
				function7007C(playerid);
				TogglePlayerControllable(playerid, true);
			case 7:
				HideMenuForPlayer(var0, playerid);
				function70180(playerid);
				TogglePlayerControllable(playerid, true);
			case 8:
				HideMenuForPlayer(var0, playerid);
				TogglePlayerControllable(playerid, true);
		}
	}
	else if(var0 == glob3203C)
	{
		switch(row) {
			case 0:
				HideMenuForPlayer(var0, playerid);
				glob18E0C[playerid] = 0;
				glob18AEC[playerid] = 2;
				ShowMenuForPlayer(glob3206C, playerid);
				TogglePlayerControllable(playerid, false);
			case 1:
				HideMenuForPlayer(var0, playerid);
				glob18E0C[playerid] = 0;
				glob18AEC[playerid] = 4;
				ShowMenuForPlayer(glob3206C, playerid);
				TogglePlayerControllable(playerid, false);
			case 2:
				HideMenuForPlayer(var0, playerid);
				glob18E0C[playerid] = 0;
				glob18AEC[playerid] = 9;
				ShowMenuForPlayer(glob3206C, playerid);
				TogglePlayerControllable(playerid, false);
			case 3:
				HideMenuForPlayer(var0, playerid);
				glob18E0C[playerid] = 0;
				glob18AEC[playerid] = 34;
				ShowMenuForPlayer(glob3206C, playerid);
				TogglePlayerControllable(playerid, false);
			case 4:
				HideMenuForPlayer(var0, playerid);
				glob18E0C[playerid] = 0;
				glob18AEC[playerid] = 33;
				ShowMenuForPlayer(glob3206C, playerid);
				TogglePlayerControllable(playerid, false);
			case 5:
				HideMenuForPlayer(var0, playerid);
				TogglePlayerControllable(playerid, true);
		}
	}
	else if(var0 == glob32040)
	{
		switch(row) {
			case 0:
				HideMenuForPlayer(var0, playerid);
				glob18E0C[playerid] = 5;
				glob18AEC[playerid] = 3;
				ShowMenuForPlayer(glob3206C, playerid);
				TogglePlayerControllable(playerid, false);
			case 1:
				HideMenuForPlayer(var0, playerid);
				glob18E0C[playerid] = 5;
				glob18AEC[playerid] = 19;
				ShowMenuForPlayer(glob3206C, playerid);
				TogglePlayerControllable(playerid, false);
			case 2:
				HideMenuForPlayer(var0, playerid);
				glob18E0C[playerid] = 5;
				glob18AEC[playerid] = 5;
				ShowMenuForPlayer(glob3206C, playerid);
				TogglePlayerControllable(playerid, false);
			case 3:
				HideMenuForPlayer(var0, playerid);
				glob18E0C[playerid] = 5;
				glob18AEC[playerid] = 39;
				ShowMenuForPlayer(glob3206C, playerid);
				TogglePlayerControllable(playerid, false);
			case 4:
				HideMenuForPlayer(var0, playerid);
				ShowMenuForPlayer(glob3203C, playerid);
				TogglePlayerControllable(playerid, false);
			case 5:
				HideMenuForPlayer(var0, playerid);
				TogglePlayerControllable(playerid, true);
		}
	}
	else if(var0 == glob32044)
	{
		switch(row) {
			case 0:
				HideMenuForPlayer(var0, playerid);
				glob18E0C[playerid] = 10;
				glob18AEC[playerid] = 20;
				ShowMenuForPlayer(glob3206C, playerid);
				TogglePlayerControllable(playerid, false);
			case 1:
				HideMenuForPlayer(var0, playerid);
				glob18E0C[playerid] = 10;
				glob18AEC[playerid] = 18;
				ShowMenuForPlayer(glob3206C, playerid);
				TogglePlayerControllable(playerid, false);
			case 2:
				HideMenuForPlayer(var0, playerid);
				glob18E0C[playerid] = 10;
				glob18AEC[playerid] = 32;
				ShowMenuForPlayer(glob3206C, playerid);
				TogglePlayerControllable(playerid, false);
			case 3:
				HideMenuForPlayer(var0, playerid);
				glob18E0C[playerid] = 10;
				glob18AEC[playerid] = 40;
				ShowMenuForPlayer(glob3206C, playerid);
				TogglePlayerControllable(playerid, false);
			case 4:
				HideMenuForPlayer(var0, playerid);
				ShowMenuForPlayer(glob32040, playerid);
				TogglePlayerControllable(playerid, false);
			case 5:
				HideMenuForPlayer(var0, playerid);
				TogglePlayerControllable(playerid, true);
		}
	}
	else if(var0 == glob32048)
	{
		switch(row) {
			case 0:
				HideMenuForPlayer(var0, playerid);
				glob18E0C[playerid] = 15;
				glob18AEC[playerid] = 8;
				ShowMenuForPlayer(glob3206C, playerid);
				TogglePlayerControllable(playerid, false);
			case 1:
				HideMenuForPlayer(var0, playerid);
				glob18E0C[playerid] = 15;
				glob18AEC[playerid] = 6;
				ShowMenuForPlayer(glob3206C, playerid);
				TogglePlayerControllable(playerid, false);
			case 2:
				HideMenuForPlayer(var0, playerid);
				glob18E0C[playerid] = 15;
				glob18AEC[playerid] = 13;
				ShowMenuForPlayer(glob3206C, playerid);
				TogglePlayerControllable(playerid, false);
			case 3:
				HideMenuForPlayer(var0, playerid);
				ShowMenuForPlayer(glob32044, playerid);
				TogglePlayerControllable(playerid, false);
			case 4:
				HideMenuForPlayer(var0, playerid);
				TogglePlayerControllable(playerid, true);
		}
	}
	else if(var0 == glob3204C)
	{
		switch(row) {
			case 0:
				HideMenuForPlayer(var0, playerid);
				glob18E0C[playerid] = 20;
				glob18AEC[playerid] = 7;
				ShowMenuForPlayer(glob3206C, playerid);
				TogglePlayerControllable(playerid, false);
			case 1:
				HideMenuForPlayer(var0, playerid);
				glob18E0C[playerid] = 20;
				glob18AEC[playerid] = 16;
				ShowMenuForPlayer(glob3206C, playerid);
				TogglePlayerControllable(playerid, false);
			case 2:
				HideMenuForPlayer(var0, playerid);
				glob18E0C[playerid] = 20;
				glob18AEC[playerid] = 14;
				ShowMenuForPlayer(glob3206C, playerid);
				TogglePlayerControllable(playerid, false);
			case 3:
				HideMenuForPlayer(var0, playerid);
				glob18E0C[playerid] = 20;
				glob18AEC[playerid] = 31;
				ShowMenuForPlayer(glob3206C, playerid);
				TogglePlayerControllable(playerid, false);
			case 4:
				HideMenuForPlayer(var0, playerid);
				ShowMenuForPlayer(glob32048, playerid);
				TogglePlayerControllable(playerid, false);
			case 5:
				HideMenuForPlayer(var0, playerid);
				TogglePlayerControllable(playerid, true);
		}
	}
	else if(var0 == glob32050)
	{
		switch(row) {
			case 0:
				HideMenuForPlayer(var0, playerid);
				glob18E0C[playerid] = 25;
				glob18AEC[playerid] = 42;
				ShowMenuForPlayer(glob3206C, playerid);
				TogglePlayerControllable(playerid, false);
			case 1:
				HideMenuForPlayer(var0, playerid);
				glob18E0C[playerid] = 25;
				glob18AEC[playerid] = 37;
				ShowMenuForPlayer(glob3206C, playerid);
				TogglePlayerControllable(playerid, false);
			case 2:
				HideMenuForPlayer(var0, playerid);
				glob18E0C[playerid] = 25;
				glob18AEC[playerid] = 21;
				ShowMenuForPlayer(glob3206C, playerid);
				TogglePlayerControllable(playerid, false);
			case 3:
				HideMenuForPlayer(var0, playerid);
				glob18E0C[playerid] = 25;
				glob18AEC[playerid] = 15;
				ShowMenuForPlayer(glob3206C, playerid);
				TogglePlayerControllable(playerid, false);
			case 4:
				HideMenuForPlayer(var0, playerid);
				ShowMenuForPlayer(glob3204C, playerid);
				TogglePlayerControllable(playerid, false);
			case 5:
				HideMenuForPlayer(var0, playerid);
				TogglePlayerControllable(playerid, true);
		}
	}
	else if(var0 == glob32054)
	{
		switch(row) {
			case 0:
				HideMenuForPlayer(var0, playerid);
				glob18E0C[playerid] = 30;
				glob18AEC[playerid] = 22;
				ShowMenuForPlayer(glob3206C, playerid);
				TogglePlayerControllable(playerid, false);
			case 1:
				HideMenuForPlayer(var0, playerid);
				glob18E0C[playerid] = 30;
				glob18AEC[playerid] = 11;
				ShowMenuForPlayer(glob3206C, playerid);
				TogglePlayerControllable(playerid, false);
			case 2:
				HideMenuForPlayer(var0, playerid);
				glob18E0C[playerid] = 30;
				glob18AEC[playerid] = 17;
				ShowMenuForPlayer(glob3206C, playerid);
				TogglePlayerControllable(playerid, false);
			case 3:
				HideMenuForPlayer(var0, playerid);
				glob18E0C[playerid] = 30;
				glob18AEC[playerid] = 12;
				ShowMenuForPlayer(glob3206C, playerid);
				TogglePlayerControllable(playerid, false);
			case 4:
				HideMenuForPlayer(var0, playerid);
				ShowMenuForPlayer(glob32050, playerid);
				TogglePlayerControllable(playerid, false);
			case 5:
				HideMenuForPlayer(var0, playerid);
				TogglePlayerControllable(playerid, true);
		}
	}
	else if(var0 == glob32058)
	{
		switch(row) {
			case 0:
				HideMenuForPlayer(var0, playerid);
				glob18E0C[playerid] = 35;
				glob18AEC[playerid] = 41;
				ShowMenuForPlayer(glob3206C, playerid);
				TogglePlayerControllable(playerid, false);
			case 1:
				HideMenuForPlayer(var0, playerid);
				glob18E0C[playerid] = 35;
				glob18AEC[playerid] = 28;
				ShowMenuForPlayer(glob3206C, playerid);
				TogglePlayerControllable(playerid, false);
			case 2:
				HideMenuForPlayer(var0, playerid);
				glob18E0C[playerid] = 35;
				glob18AEC[playerid] = 43;
				ShowMenuForPlayer(glob3206C, playerid);
				TogglePlayerControllable(playerid, false);
			case 3:
				HideMenuForPlayer(var0, playerid);
				ShowMenuForPlayer(glob32054, playerid);
				TogglePlayerControllable(playerid, false);
			case 4:
				HideMenuForPlayer(var0, playerid);
				TogglePlayerControllable(playerid, true);
		}
	}
	else if(var0 == glob3205C)
	{
		switch(row) {
			case 0:
				HideMenuForPlayer(var0, playerid);
				glob18E0C[playerid] = 40;
				glob18AEC[playerid] = 30;
				ShowMenuForPlayer(glob3206C, playerid);
				TogglePlayerControllable(playerid, false);
			case 1:
				HideMenuForPlayer(var0, playerid);
				glob18E0C[playerid] = 40;
				glob18AEC[playerid] = 26;
				ShowMenuForPlayer(glob3206C, playerid);
				TogglePlayerControllable(playerid, false);
			case 2:
				HideMenuForPlayer(var0, playerid);
				glob18E0C[playerid] = 40;
				glob18AEC[playerid] = 27;
				ShowMenuForPlayer(glob3206C, playerid);
				TogglePlayerControllable(playerid, false);
			case 3:
				HideMenuForPlayer(var0, playerid);
				ShowMenuForPlayer(glob32058, playerid);
				TogglePlayerControllable(playerid, false);
			case 4:
				HideMenuForPlayer(var0, playerid);
				TogglePlayerControllable(playerid, true);
		}
	}
	else if(var0 == glob32060)
	{
		switch(row) {
			case 0:
				HideMenuForPlayer(var0, playerid);
				glob18E0C[playerid] = 45;
				glob18AEC[playerid] = 23;
				ShowMenuForPlayer(glob3206C, playerid);
				TogglePlayerControllable(playerid, false);
			case 1:
				HideMenuForPlayer(var0, playerid);
				glob18E0C[playerid] = 45;
				glob18AEC[playerid] = 36;
				ShowMenuForPlayer(glob3206C, playerid);
				TogglePlayerControllable(playerid, false);
			case 2:
				HideMenuForPlayer(var0, playerid);
				ShowMenuForPlayer(glob3205C, playerid);
				TogglePlayerControllable(playerid, false);
			case 3:
				HideMenuForPlayer(var0, playerid);
				TogglePlayerControllable(playerid, true);
		}
	}
	else if(var0 == glob32064)
	{
		switch(row) {
			case 0:
				HideMenuForPlayer(var0, playerid);
				glob18E0C[playerid] = 50;
				glob18AEC[playerid] = 29;
				ShowMenuForPlayer(glob3206C, playerid);
				TogglePlayerControllable(playerid, false);
			case 1:
				HideMenuForPlayer(var0, playerid);
				glob18E0C[playerid] = 50;
				glob18AEC[playerid] = 35;
				ShowMenuForPlayer(glob3206C, playerid);
				TogglePlayerControllable(playerid, false);
			case 2:
				HideMenuForPlayer(var0, playerid);
				ShowMenuForPlayer(glob32060, playerid);
				TogglePlayerControllable(playerid, false);
			case 3:
				HideMenuForPlayer(var0, playerid);
				TogglePlayerControllable(playerid, true);
		}
	}
	else if(var0 == glob32068)
	{
		switch(row) {
			case 0:
				HideMenuForPlayer(var0, playerid);
				glob18E0C[playerid] = 55;
				glob18AEC[playerid] = 25;
				ShowMenuForPlayer(glob3206C, playerid);
				TogglePlayerControllable(playerid, false);
			case 1:
				HideMenuForPlayer(var0, playerid);
				glob18E0C[playerid] = 55;
				glob18AEC[playerid] = 24;
				ShowMenuForPlayer(glob3206C, playerid);
				TogglePlayerControllable(playerid, false);
			case 2:
				HideMenuForPlayer(var0, playerid);
				ShowMenuForPlayer(glob32064, playerid);
				TogglePlayerControllable(playerid, false);
			case 3:
				HideMenuForPlayer(var0, playerid);
				TogglePlayerControllable(playerid, true);
		}
	}
	else if(var0 == glob3206C)
	{
		switch(row) {
			case 0:
				HideMenuForPlayer(var0, playerid);
				function6F4E8(playerid);
				TogglePlayerControllable(playerid, true);
			case 1:
				HideMenuForPlayer(var0, playerid);
				TogglePlayerControllable(playerid, true);
		}
	}
	return 0;
}

function6F4E8(playerid)
{
	new var0 = 0;
	var0 = udb_getNM(function705E0(playerid));
	if(!var0)
	{
		new var1 = 0;
		var1 = udb_getXP(function705E0(playerid));
		if(glob18E0C[playerid] <= var1)
		{
			udb_setProf(function705E0(playerid), glob18AEC[playerid]);
			udb_setSkin(function705E0(playerid), glob8D0C[glob18AEC[playerid]]);
			LogarPlayer(playerid);
			SpawnPlayer(playerid);
			SetPlayerPos(playerid, glob896C[glob18AEC[playerid]][0], glob896C[glob18AEC[playerid]][1], glob896C[glob18AEC[playerid]][2]);
			udb_setNM(function705E0(playerid), 1);
			SendClientMessage(playerid, 0x33AA33AA, "Você mudou de profissao digite /profissao para ver os comandos da sua profissao");
			new var2[256];
			format(var2, 256, "~w~%s", glob4E08[glob18AEC[playerid]][0]);
			GameTextForPlayer(playerid, var2, 3000, 0);
		}
		else
		{
			SendClientMessage(playerid, 0xDD0000FF, "Você não possue XL suficiente para esta profissão");
			return 1;
		}
	}
	else
	{
		SendClientMessage(playerid, 0xDD0000FF, "Espere chegar até o próximo nível para trocar sua profissão");
		return 1;
	}
	return 1;
}

function6FA64(playerid)
{
	ApplyAnimation(playerid, "FOOD", "EAT_Burger", 3.0, 0, 0, 0, 0, 0);
	SendClientMessage(playerid, 0x00BC6FAA, "Você pediu um X-Bacon. Bom Lanche!");
	GivePlayerMoney(playerid, -5);
	glob1E5A0[playerid]--;
	return 0;
}

function6FB68(playerid)
{
	ApplyAnimation(playerid, "FOOD", "EAT_Burger", 3.0, 0, 0, 0, 0, 0);
	SendClientMessage(playerid, 0x00BC6FAA, "Você comeu um X-Burguer. Bom Lanche!");
	GivePlayerMoney(playerid, -6);
	glob1E5A0[playerid]--;
	return 0;
}

function6FC6C(playerid)
{
	ApplyAnimation(playerid, "FOOD", "EAT_Burger", 3.0, 0, 0, 0, 0, 0);
	SendClientMessage(playerid, 0x00BC6FAA, "Você comeu um X-Salada. Bom Lanche");
	GivePlayerMoney(playerid, -4);
	glob1E5A0[playerid]--;
	return 0;
}

function6FD70(playerid)
{
	ApplyAnimation(playerid, "FOOD", "EAT_Burger", 3.0, 0, 0, 0, 0, 0);
	SendClientMessage(playerid, 0x00BC6FAA, "Você comeu um Cachorro Quente. Bom Lanche!");
	GivePlayerMoney(playerid, -6);
	glob1E5A0[playerid]--;
	return 0;
}

function6FE74(playerid)
{
	ApplyAnimation(playerid, "FOOD", "EAT_Burger", 3.0, 0, 0, 0, 0, 0);
	SendClientMessage(playerid, 0x00BC6FAA, "Você comeu uma porção de Batata Frita.");
	GivePlayerMoney(playerid, -10);
	glob1E5A0[playerid]--;
	return 0;
}

function6FF78(playerid)
{
	ApplyAnimation(playerid, "FOOD", "EAT_Burger", 3.0, 0, 0, 0, 0, 0);
	SendClientMessage(playerid, 0x00BC6FAA, "Você tomou uma lata refrigerante!");
	GivePlayerMoney(playerid, -5);
	glob1E5A0[playerid]--;
	return 0;
}

function7007C(playerid)
{
	ApplyAnimation(playerid, "FOOD", "EAT_Burger", 3.0, 0, 0, 0, 0, 0);
	SendClientMessage(playerid, 0x00BC6FAA, "Você bebeu uma lata de cerveja! Beba com moderação.");
	GivePlayerMoney(playerid, -5);
	glob1E5A0[playerid]--;
	return 0;
}

function70180(playerid)
{
	ApplyAnimation(playerid, "FOOD", "EAT_Burger", 3.0, 0, 0, 0, 0, 0);
	SendClientMessage(playerid, 0x00BC6FAA, "Você bebeu um copo de suco!");
	GivePlayerMoney(playerid, -4);
	glob1E5A0[playerid]--;
	return 0;
}

function70284(playerid)
{
	DisablePlayerCheckpoint(playerid);
	SetPlayerCheckpoint(playerid, -1750.8686, 955.9368, 24.7422, 2.5);
	glob187CC[playerid] = 1;
	SendClientMessage(playerid, 0x0099FFAA, "Siga até os checkpoints para ir aos terminais");
	return 0;
}

function7035C(playerid)
{
	DisablePlayerCheckpoint(playerid);
	SetPlayerCheckpoint(playerid, -1996.948, 145.348, 27.6875, 2.5);
	glob187CC[playerid] = 8;
	SendClientMessage(playerid, 0x0099FFAA, "Siga até os checkpoints para ir aos terminais");
	return 0;
}

function70434()
{
	for(new var0 = 0; var0 < 200; var0++)
	{
		glob1DC40[var0] = 1;
		SendClientMessage(var0, 0xBC8F8FAA, "Os radares da cidade foram ligados se alguem andar em alta velocidade pela rua sera multado");
	}
	return 0;
}

function704EC()
{
	for(new var0 = 0; var0 < 200; var0++)
	{
		glob1DC40[var0] = 0;
		SendClientMessage(var0, 0xBC8F8FAA, "Os radares da cidade foram desligados agora todos podem preparar os nitros de seus carros a vontade");
	}
	return 0;
}

public OnPlayerExitedMenu(playerid)
{
	TogglePlayerControllable(playerid, true);
	return 1;
}

function705E0(playerid)
{
	new var0[24];
	GetPlayerName(playerid, var0, 24);
	new var1[255];
	set(var1, function2858(var0));
	return var1;
}

public assaltar(playerid)
{
	if(IsPlayerConnected(playerid))
	{
		if(glob2FDDC[playerid] == 1)
		{
			glob2FDDC[playerid] = 0;
			SendClientMessage(playerid, 0xFE684BFF, "AVISO: você ja pode assaltar o banco ou o mercado novamente");
		}
	}
	return 0;
}

public alugarlimo(playerid, arg1)
{
	if(0 < glob2FABC[playerid])
	{
		SendClientMessage(playerid, 0x2CCC6CAA, "Sua Limosine não foi devolvida ainda se você não devolver logo poderá ser preso");
		SetTimerEx("atraso", 300000, false, "dd", playerid, arg1);
	}
	return 0;
}

public atraso(playerid)
{
	if(0 < glob2FABC[playerid])
	{
		SendClientMessage(playerid, 0x2CCC6CAA, "Você não devolveu a limosine e foi botado na lista dos procurados");
		new var0[256];
		format(var0, 256, "%s foi posto na lista dos procurados por roubar uma limosine", function705E0(playerid));
		SendClientMessageToAll(0x4C62B3AA, var0);
		glob2B5CC[playerid] = 1;
	}
	return 0;
}

public Bancos()
{
	new Float:var0 = 0.0, Float:var1 = 0.0, Float:var2 = 0.0;
	for(new var3 = 0; var3 < 200; var3++)
	{
		GetPlayerPos(var3, var0, var1, var2);
		if(IsPlayerConnected(var3))
		{
			if(var0 >= 2315.3017 && var0 <= 2317.3017 && var1 >= -13.7581 && var1 <= -11.7581)
			{
				if(!glob1A70C[var3])
				{
					if(glob175F4[var3] == 1)
					{
						SendClientMessage(var3, 0x4C62B3AA, "Banco Central:");
						SendClientMessage(var3, 0xF0E68CAA, "/retirar [valor] ou /sacar [valor] : Retira dinheiro de sua conta bancaria. ");
						SendClientMessage(var3, 0xF0E68CAA, "/depositar [valor] : Deposita em sua conta bancaria");
						SendClientMessage(var3, 0xF0E68CAA, "/saldo : Vê o saldo de sua conta bancaria.");
						SendClientMessage(var3, 0xF0E68CAA, "/saldocel : Vê o saldo de sua conta bancaria pelo celular.");
						SendClientMessage(var3, 0xFF9900AA, "Para visualizar novamente os comandos digite /bancoinfo");
					}
					else
					{
						SendClientMessage(var3, 0xDD0000FF, "Você está no meio de uma missão não pode acessar o banco!");
					}
					glob1A70C[var3] = 1;
				}
			}
			else if(var0 >= -2671.2032 && var0 <= -2665.3458 && var1 >= 631.8643 && var1 <= 640.1569)
			{
				if(!glob1A70C[var3])
				{
					if(glob175F4[var3] == 1)
					{
						DisablePlayerCheckpoint(var3);
						SetPlayerCheckpoint(var3, -2670.0745, 636.9832, 14.4531, 1.0);
						SendClientMessage(var3, 0x4C62B3AA, "Caixa Eletrônico do Hospital:");
						SendClientMessage(var3, 0xF0E68CAA, "/retirar [valor] ou /sacar [valor] : Retira dinheiro de sua conta bancaria. ");
						SendClientMessage(var3, 0xF0E68CAA, "/depositar [valor] : Deposita em sua conta bancaria");
						SendClientMessage(var3, 0xF0E68CAA, "/saldo : Vê o saldo de sua conta bancaria.");
						SendClientMessage(var3, 0xF0E68CAA, "/saldocel : Vê o saldo de sua conta bancaria pelo celular.");
						SendClientMessage(var3, 0xFF9900AA, "Para visualizar novamente os comandos digite /bancoinfo");
					}
					else
					{
						SendClientMessage(var3, 0xDD0000FF, "Você está no meio de uma missão não pode acessar o banco!");
					}
					glob1A70C[var3] = 1;
				}
			}
			else if(var0 >= -1986.5661 && var0 <= -1980.62 && var1 >= 161.8643 && var1 <= 169.9125)
			{
				if(!glob1A70C[var3])
				{
					if(glob175F4[var3] == 1)
					{
						DisablePlayerCheckpoint(var3);
						SetPlayerCheckpoint(var3, -1981.4068, 165.7178, 27.6875, 1.0);
						SendClientMessage(var3, 0x4C62B3AA, "Caixa Eletrônico da Rodoviaria:");
						SendClientMessage(var3, 0xF0E68CAA, "/retirar [valor] ou /sacar [valor] : Retira dinheiro de sua conta bancaria. ");
						SendClientMessage(var3, 0xF0E68CAA, "/depositar [valor] : Deposita em sua conta bancaria");
						SendClientMessage(var3, 0xF0E68CAA, "/saldo : Vê o saldo de sua conta bancaria.");
						SendClientMessage(var3, 0xF0E68CAA, "/saldocel : Vê o saldo de sua conta bancaria pelo celular.");
						SendClientMessage(var3, 0xFF9900AA, "Para visualizar novamente os comandos digite /bancoinfo");
					}
					else
					{
						SendClientMessage(var3, 0xDD0000FF, "Você está no meio de uma missão não pode acessar o banco!");
					}
					glob1A70C[var3] = 1;
				}
			}
			else if(var0 >= 1704.3107 && var0 <= 1710.7142 && var1 >= -1687.7232 && var1 <= -1682.6393)
			{
				if(!glob1A70C[var3])
				{
					if(glob175F4[var3] == 1)
					{
						DisablePlayerCheckpoint(var3);
						SetPlayerCheckpoint(var3, 1707.6602, -1683.2781, 13.5468, 1.0);
						SendClientMessage(var3, 0x4C62B3AA, "Caixa Eletrônico de Los Santos:");
						SendClientMessage(var3, 0xF0E68CAA, "/retirar [valor] ou /sacar [valor] : Retira dinheiro de sua conta bancaria. ");
						SendClientMessage(var3, 0xF0E68CAA, "/depositar [valor] : Deposita em sua conta bancaria");
						SendClientMessage(var3, 0xF0E68CAA, "/saldo : Vê o saldo de sua conta bancaria.");
						SendClientMessage(var3, 0xF0E68CAA, "/saldocel : Vê o saldo de sua conta bancaria pelo celular.");
						SendClientMessage(var3, 0xFF9900AA, "Para visualizar novamente os comandos digite /bancoinfo");
					}
					else
					{
						SendClientMessage(var3, 0xDD0000FF, "Você está no meio de uma missão não pode acessar o banco!");
					}
					glob1A70C[var3] = 1;
				}
			}
			else if(var0 >= 392.0194 && var0 <= 399.62 && var1 >= -1806.2046 && var1 <= -1800.3202)
			{
				if(!glob1A70C[var3])
				{
					if(glob175F4[var3] == 1)
					{
						DisablePlayerCheckpoint(var3);
						SetPlayerCheckpoint(var3, 395.8569, -1805.9064, 7.8379, 1.0);
						SendClientMessage(var3, 0x4C62B3AA, "Caixa Eletrônico da Praia de Santa Maria:");
						SendClientMessage(var3, 0xF0E68CAA, "/retirar [valor] ou /sacar [valor] : Retira dinheiro de sua conta bancaria. ");
						SendClientMessage(var3, 0xF0E68CAA, "/depositar [valor] : Deposita em sua conta bancaria");
						SendClientMessage(var3, 0xF0E68CAA, "/saldo : Vê o saldo de sua conta bancaria.");
						SendClientMessage(var3, 0xF0E68CAA, "/saldocel : Vê o saldo de sua conta bancaria pelo celular.");
						SendClientMessage(var3, 0xFF9900AA, "Para visualizar novamente os comandos digite /bancoinfo");
					}
					else
					{
						SendClientMessage(var3, 0xDD0000FF, "Você está no meio de uma missão não pode acessar o banco!");
					}
					glob1A70C[var3] = 1;
				}
			}
			else if(var0 >= 1580.2049 && var0 <= 1583.5478 && var1 >= 1757.5045 && var1 <= 1761.8826)
			{
				if(!glob1A70C[var3])
				{
					if(glob175F4[var3] == 1)
					{
						DisablePlayerCheckpoint(var3);
						SetPlayerCheckpoint(var3, 1582.7406, 1757.4973, 10.8203, 1.0);
						SendClientMessage(var3, 0x4C62B3AA, "Caixa Eletrônico do Hospital de Las Venturas:");
						SendClientMessage(var3, 0xF0E68CAA, "/retirar [valor] ou /sacar [valor] : Retira dinheiro de sua conta bancaria. ");
						SendClientMessage(var3, 0xF0E68CAA, "/depositar [valor] : Deposita em sua conta bancaria");
						SendClientMessage(var3, 0xF0E68CAA, "/saldo : Vê o saldo de sua conta bancaria.");
						SendClientMessage(var3, 0xF0E68CAA, "/saldocel : Vê o saldo de sua conta bancaria pelo celular.");
						SendClientMessage(var3, 0xFF9900AA, "Para visualizar novamente os comandos digite /bancoinfo");
					}
					else
					{
						SendClientMessage(var3, 0xDD0000FF, "Você está no meio de uma missão não pode acessar o banco!");
					}
					glob1A70C[var3] = 1;
				}
			}
			else if(var0 >= -183.1263 && var0 <= -179.1874 && var1 >= 1134.7364 && var1 <= 1140.8806)
			{
				if(!glob1A70C[var3])
				{
					if(glob175F4[var3] == 1)
					{
						DisablePlayerCheckpoint(var3);
						SetPlayerCheckpoint(var3, -181.5996, 1137.522, 19.7422, 1.0);
						SendClientMessage(var3, 0x4C62B3AA, "Caixa Eletrônico de Forst Carson:");
						SendClientMessage(var3, 0xF0E68CAA, "/retirar [valor] ou /sacar [valor] : Retira dinheiro de sua conta bancaria. ");
						SendClientMessage(var3, 0xF0E68CAA, "/depositar [valor] : Deposita em sua conta bancaria");
						SendClientMessage(var3, 0xF0E68CAA, "/saldo : Vê o saldo de sua conta bancaria.");
						SendClientMessage(var3, 0xF0E68CAA, "/saldocel : Vê o saldo de sua conta bancaria pelo celular.");
						SendClientMessage(var3, 0xFF9900AA, "Para visualizar novamente os comandos digite /bancoinfo");
					}
					else
					{
						SendClientMessage(var3, 0xDD0000FF, "Você está no meio de uma missão não pode acessar o banco!");
					}
					glob1A70C[var3] = 1;
				}
			}
			else if(var0 >= -2208.0638 && var0 <= -2202.5323 && var1 >= -2292.6495 && var1 <= -2286.9622)
			{
				if(!glob1A70C[var3])
				{
					if(glob175F4[var3] == 1)
					{
						DisablePlayerCheckpoint(var3);
						SetPlayerCheckpoint(var3, -2206.0032, -2290.7779, 30.625, 1.0);
						SendClientMessage(var3, 0x4C62B3AA, "Caixa Eletrônico do Hospital de Angel Pine:");
						SendClientMessage(var3, 0xF0E68CAA, "/retirar [valor] ou /sacar [valor] : Retira dinheiro de sua conta bancaria. ");
						SendClientMessage(var3, 0xF0E68CAA, "/depositar [valor] : Deposita em sua conta bancaria");
						SendClientMessage(var3, 0xF0E68CAA, "/saldo : Vê o saldo de sua conta bancaria.");
						SendClientMessage(var3, 0xF0E68CAA, "/saldocel : Vê o saldo de sua conta bancaria pelo celular.");
						SendClientMessage(var3, 0xFF9900AA, "Para visualizar novamente os comandos digite /bancoinfo");
					}
					else
					{
						SendClientMessage(var3, 0xDD0000FF, "Você está no meio de uma missão não pode acessar o banco!");
					}
					glob1A70C[var3] = 1;
				}
			}
			else if(var0 >= -2431.1712 && var0 <= -2429.1912 && var1 >= 64.9186 && var1 <= 69.0972)
			{
				if(glob175F4[var3] == 1)
				{
					SetPlayerPos(var3, 2307.3383, -16.1069, 26.7495);
					SendClientMessage(var3, 0xFFFFCCAA, "Você entrou no banco");
					SendClientMessage(var3, 0xDD0000FF, "Vá até o checkpoint marcado em seu mapa.");
					GameTextForPlayer(var3, "~y~Banco", 1000, 1);
					SetPlayerCheckpoint(var3, 2316.3017, -12.7581, 26.7422, 1.0);
					SetPlayerMapIcon(var3, 0, 316.3017, -12.7581, 26.7422, 52, 0xFFFFFFFF);
					AddStaticPickup(1274, 1, 316.3017, -12.7581, 26.7422);
				}
				else
				{
					SendClientMessage(var3, 0xDD0000FF, "Você está no meio de uma missão não pode acessar o banco!");
				}
			}
			else if(var0 >= 2304.6867 && var0 <= 2306.0764 && var1 >= -17.3534 && var1 <= -14.2469)
			{
				SetPlayerPos(var3, -2426.4385, 66.477, 35.1719);
				DisablePlayerCheckpoint(var3);
			}
			else if((var0 >= -229.1007 && var0 <= -222.383 && var1 >= 1393.7872 && var1 <= 1412.1816) || (var0 >= 488.2627 && var0 <= 512.0615 && var1 >= -88.5895 && var1 <= -67.7595))
			{
				GameTextForPlayer(var3, "~g~Bar", 1000, 1);
				glob24820[var3] = 1;
			}
			else if(var0 >= -2112.7396 && var0 <= -2090.7547 && var1 >= -2247.9727 && var1 <= -2222.8323)
			{
				GameTextForPlayer(var3, "Reload Logistica", 1000, 4);
				glob1F3B8[var3] = 1;
			}
			else if(var0 >= -2158.9739 && var1 <= -2435.3934 && var0 <= -2133.782 && var1 >= -2458.7315)
			{
				GameTextForPlayer(var3, "~y~Cooperativa de Taxi", 3000, 1);
			}
			else if(var0 >= 1536.8981 && var1 >= -1679.9175 && var0 <= 1538.9468 && var1 <= -1677.3487)
			{
				DisablePlayerCheckpoint(var3);
				GameTextForPlayer(var3, "~g~Aeroporto de Los Santos", 3000, 1);
				SendClientMessage(var3, 0x0099FFAA, "Os policiais te deixaram no aeroporto, compre uma passagem para San Fierro.");
				SetPlayerCheckpoint(var3, 1642.0025, -2335.219, 13.5468, 1.7);
				SetPlayerPos(var3, 1652.1751, -2326.066, 13.5468);
			}
			else if(var0 >= 1640.7945 && var1 >= -2335.4839 && var0 <= 1643.2434 && var1 <= -2334.0049)
			{
				if(!glob2E7D4[var3])
				{
					GameTextForPlayer(var3, "~w~Caixa", 3000, 1);
					SendClientMessage(var3, 0x0099FFAA, "Você entrou no Caixa do Aeroporto de Los Santos.");
					SendClientMessage(var3, 0xF0E68CAA, "Digite /passagemsf comprar uma passagem para San Fierro.");
					glob2E7D4[var3] = 1;
				}
			}
			else if((var0 >= 1737.6989 && var1 <= -2018.7426 && var0 <= 1812.3337 && var1 >= -2076.6141) || (var0 >= -2095.3233 && var1 <= -103.825 && var0 <= -2012.2542 && var1 >= -280.0542) || (var0 >= -150.0649 && var1 <= 1137.7105 && var0 <= -134.8053 && var1 >= 1108.8424) || (var0 >= -2152.9188 && var1 <= -2239.667 && var0 <= -2117.0594 && var1 >= -2272.0035))
			{
				if(!glob26134[var3])
				{
					GameTextForPlayer(var3, "~y~Auto-Escola", 3000, 1);
					SendClientMessage(var3, 0xFFFF00AA, "Você entrou em uma Auto-Escola.");
					SendClientMessage(var3, 0xF0E68CAA, "Digite /autoinfo para mais informações.");
					glob26134[var3] = 1;
				}
			}
			else if(var0 >= -2218.7876 && var1 <= -2283.6939 && var0 <= -2196.2481 && var1 >= -2302.9141)
			{
				GameTextForPlayer(var3, "~r~Hospital", 3000, 1);
			}
			else if(var0 >= -2199.4461 && var1 <= -2251.7737 && var0 <= -2189.1111 && var1 >= -2261.1231)
			{
				GameTextForPlayer(var3, "~g~Hotel", 3000, 1);
				glob24500[var3] = 1;
			}
			else if(var0 >= -1610.91 && var0 <= -1496.5112 && var1 >= 1279.2794 && var1 <= 1295.2489)
			{
				if(!glob217AC[var3])
				{
					GameTextForPlayer(var3, "~b~Cooperativa de Pesca", 1000, 1);
					SendClientMessage(var3, 0x0099FFAA, "Você entrou na Coopertiva de Pesca.");
					SendClientMessage(var3, 0xF0E68CAA, "Digite /pescainfo para mais informações.");
					glob217AC[var3] = 1;
				}
			}
			else if(var0 >= -1194.7273 && var0 <= -1007.1719 && var1 >= -1064.6097 && var1 <= -915.6717)
			{
				GameTextForPlayer(var3, "Plantacao da Fazenda", 1000, 4);
				glob204E8[var3] = 1;
			}
			else if(var0 >= -1118.8129 && var0 <= -1027.5987 && var1 >= -1319.4255 && var1 <= -1120.2231)
			{
				GameTextForPlayer(var3, "Fazenda, VENDA do Milho", 1000, 4);
				glob20808[var3] = 1;
			}
			else if(var0 >= -2824.2483 && var0 <= -2801.2569 && var1 >= -1534.1261 && var1 <= -1510.1261)
			{
				if(!glob22A70[var3])
				{
					GameTextForPlayer(var3, "~b~Cooperativa de Caca", 1000, 1);
					SendClientMessage(var3, 0x0099FFAA, "Você entrou na Coopertiva de Caça.");
					SendClientMessage(var3, 0xF0E68CAA, "Digite /cacainfo para mais informações.");
					glob22A70[var3] = 1;
				}
			}
			else if((var0 >= -364.4093 && var1 <= 1202.583 && var0 <= -357.1573 && var1 >= 1194.7304) || (var0 >= -375.7656 && var1 <= 1192.6091 && var0 <= -345.4589 && var1 >= 1156.071))
			{
				if(!glob24B50[var3])
				{
					GameTextForPlayer(var3, "~g~Desmanche", 3000, 1);
					SendClientMessage(var3, 0xDD0000FF, "Digite /desmanchar para desmanchar este veículo.");
					glob24B50[var3] = 1;
				}
			}
			else if(var0 >= 110.7788 && var1 <= 1484.3898 && var0 <= 288.1017 && var1 >= 1336.3016)
			{
				if(!glob1F6D8[var3])
				{
					GameTextForPlayer(var3, "~r~Refinaria", 3000, 1);
					SendClientMessage(var3, 0xDD0000FF, "Você entrou na Refinaria:");
					SendClientMessage(var3, 0xF0E68CAA, "Digite /refinariainfo para mais informações.");
					glob1F6D8[var3] = 1;
				}
			}
			else if((var0 >= -1496.1409 && var1 <= 1884.1014 && var0 <= -1449.3982 && var1 >= 1851.1889) || (var0 >= 608.2354 && var0 <= 619.7911 && var1 >= 1851.1889 && var1 <= 1884.1014) || (var0 >= -1332.9952 && var0 <= -1324.0494 && var1 >= 2669.6433 && var1 <= 2685.6674))
			{
				if(!glob27D58[var3])
				{
					GameTextForPlayer(var3, "~r~Posto", 3000, 1);
					SendClientMessage(var3, 0xDD0000FF, "Você entrou em um Posto.");
					SendClientMessage(var3, 0xF0E68CAA, "Digite /postoinfo para mais informações.");
					glob27D58[var3] = 1;
				}
			}
			else if(((var0 >= -1643.8086 && var1 <= -2685.7474 && var0 <= -1515.1467 && var1 >= -2579.6661) || (var0 >= -2785.431 && var1 <= -2542.806 && var0 <= -2221.5047 && var1 >= -2579.6661) || (var0 >= 651.7849 && var0 <= 661.3629 && var1 >= -577.074 && var1 <= -555.383)) || (var0 >= 2131.207 && var0 <= 2161.8208 && var1 >= 2735.4387 && var1 <= 2762.3884) || (var0 >= -1615.1073 && var0 <= -1601.3244 && var1 >= -2733.938 && var1 <= -2692.7103) || (var0 >= 1587.0551 && var0 <= 1605.8909 && var1 >= 2189.716 && var1 <= 2208.1713))
			{
				if(!glob27D58[var3])
				{
					GameTextForPlayer(var3, "~r~Posto", 3000, 1);
					SendClientMessage(var3, 0xDD0000FF, "Você entrou em um Posto.");
					SendClientMessage(var3, 0xF0E68CAA, "Digite /postoinfo para mais informações.");
					glob27D58[var3] = 1;
				}
			}
			else if((var0 >= 996.385 && var0 <= 1011.817 && var1 >= -943.7942 && var1 <= -930.1506) || (var0 >= -107.9446 && var0 <= -77.7968 && var1 >= -1178.9249 && var1 <= -1163.9294) || (var0 >= -2420.0506 && var0 <= -2400.0459 && var1 >= 958.4066 && var1 <= 997.0031) || (var0 >= -1703.851 && var0 <= -1644.272 && var1 >= 408.3848 && var1 <= 427.69) || (var0 >= 2104.0168 && var0 <= 2136.1518 && var1 >= 901.517 && var1 <= 947.6444))
			{
				if(!glob27D58[var3])
				{
					GameTextForPlayer(var3, "~r~Posto", 3000, 1);
					SendClientMessage(var3, 0xDD0000FF, "Você entrou em um Posto.");
					SendClientMessage(var3, 0xF0E68CAA, "Digite /postoinfo para mais informações.");
					glob27D58[var3] = 1;
				}
			}
			else if((var0 >= -1695.3917 && var0 <= -1659.05 && var1 >= 412.7228 && var1 <= 414.0762) || (var0 >= -1675.6531 && var0 <= -1675.1966 && var1 >= 398.1008 && var1 <= 434.0429) || (var0 >= 1932.031 && var0 <= 1948.1784 && var1 >= -1783.5274 && var1 <= -1764.2951) || (var0 >= 992.8317 && var0 <= 1016.6619 && var1 >= -945.4557 && var1 <= -929.5608) || (var0 >= 2189.5925 && var0 <= 2213.642 && var1 >= 2463.2565 && var1 <= 2487.5832))
			{
				if(!glob27D58[var3])
				{
					GameTextForPlayer(var3, "~r~Posto", 3000, 1);
					SendClientMessage(var3, 0xDD0000FF, "Você entrou em um Posto.");
					SendClientMessage(var3, 0xF0E68CAA, "Digite /postoinfo para mais informações.");
					glob27D58[var3] = 1;
				}
			}
			else if(var0 >= -2106.3938 && var0 <= -2037.6825 && var1 >= 203.8713 && var1 <= 279.221)
			{
				if(!glob1AD58[var3])
				{
					GameTextForPlayer(var3, "~w~Pedreira", 3000, 1);
					SendClientMessage(var3, 0xDD0000FF, "Você entrou na Pedreira. Cuidado os trabalhadores aqui não gostam muito de distraição.");
					glob1AD58[var3] = 1;
				}
			}
			else if(var0 >= 526.3201 && var0 <= 699.059 && var1 >= 848.5512 && var1 <= 940.3967)
			{
				if(!glob1AA38[var3])
				{
					GameTextForPlayer(var3, "~g~Obra de construcao", 3000, 1);
					glob1AA38[var3] = 1;
				}
			}
			else if(var0 >= -1610.91 && var0 <= -1496.5112 && var1 >= 1279.2794 && var1 <= 1295.2489)
			{
				if(!glob217AC[var3])
				{
					GameTextForPlayer(var3, "~b~Cooperativa de Pesca", 1000, 1);
					SendClientMessage(var3, 0x0099FFAA, "Você entrou na Coopertiva de Pesca.");
					SendClientMessage(var3, 0xF0E68CAA, "Digite /pescainfo para mais informações.");
					glob217AC[var3] = 1;
				}
			}
			else if(var0 >= -2689.9837 && var0 <= -2638.4957 && var1 >= 1388.9476 && var1 <= 1431.668)
			{
				if(!glob25AF0[var3])
				{
					GameTextForPlayer(var3, "~b~Balada", 1000, 1);
					glob25E14[var3] = 1;
					SendClientMessage(var3, 0x0099FFAA, "Você entrou na Balada Reload.");
					SendClientMessage(var3, 0xF0E68CAA, "Digite /baladainfo para mais informações.");
					glob25AF0[var3] = 1;
				}
			}
			else if(var0 >= -1555.4891 && var0 <= -1542.7486 && var1 >= -440.4772 && var1 <= -426.9336)
			{
				if(!glob3073C[var3])
				{
					GameTextForPlayer(var3, "~y~AEROPORTO", 3000, 1);
					glob3073C[var3] = 1;
				}
			}
			else if(var0 >= -2606.4307 && var0 <= -2594.6824 && var1 >= 1327.9157 && var1 <= 1339.5545)
			{
				if(!glob1D920[var3])
				{
					GameTextForPlayer(var3, "~b~RADAR", 3000, 1);
					glob1D920[var3] = 1;
				}
			}
			else if(var0 >= -2215.0362 && var0 <= -2208.7178 && var1 >= 1324.7434 && var1 <= 1339.7783)
			{
				if(!glob1D920[var3])
				{
					GameTextForPlayer(var3, "~b~RADAR", 3000, 1);
					glob1D920[var3] = 1;
				}
			}
			else if(var0 >= -1978.4378 && var0 <= -1973.3819 && var1 >= 1288.7751 && var1 <= 1288.9654)
			{
				if(!glob1D920[var3])
				{
					GameTextForPlayer(var3, "~b~RADAR", 3000, 1);
					glob1D920[var3] = 1;
				}
			}
			else if(var0 >= -1978.1755 && var0 <= -1972.3432 && var1 >= 1279.7661 && var1 <= 1285.8601)
			{
				if(!glob1D920[var3])
				{
					GameTextForPlayer(var3, "~b~RADAR", 3000, 1);
					glob1D920[var3] = 1;
				}
			}
			else if(var0 >= -1890.7643 && var0 <= -1877.3749 && var1 >= 1132.4296 && var1 <= 1133.8511)
			{
				if(!glob1D920[var3])
				{
					GameTextForPlayer(var3, "~b~RADAR", 3000, 1);
					glob1D920[var3] = 1;
				}
			}
			else if(var0 >= -2011.6629 && var0 <= -1997.0009 && var1 >= 782.1807 && var1 <= 782.8787)
			{
				if(!glob1D920[var3])
				{
					GameTextForPlayer(var3, "~b~RADAR", 3000, 1);
					glob1D920[var3] = 1;
				}
			}
			else if(var0 >= -2151.3377 && var0 <= -2134.8834 && var1 >= 526.5551 && var1 <= 530.8201)
			{
				if(!glob1D920[var3])
				{
					GameTextForPlayer(var3, "~b~RADAR", 3000, 1);
					glob1D920[var3] = 1;
				}
			}
			else if(var0 >= -2108.3707 && var0 <= -2103.771 && var1 >= 315.8865 && var1 <= 324.7084)
			{
				if(!glob1D920[var3])
				{
					GameTextForPlayer(var3, "~b~RADAR", 3000, 1);
					glob1D920[var3] = 1;
				}
			}
			else if(var0 >= -2010.4416 && var0 <= -1997.2302 && var1 >= 363.0029 && var1 <= 363.8208)
			{
				if(!glob1D920[var3])
				{
					GameTextForPlayer(var3, "~b~RADAR", 3000, 1);
					glob1D920[var3] = 1;
				}
			}
			else if(var0 >= -2781.17 && var0 <= -2774.7735 && var1 >= 462.9914 && var1 <= 463.0585)
			{
				if(!glob1D920[var3])
				{
					GameTextForPlayer(var3, "~b~RADAR", 3000, 1);
					glob1D920[var3] = 1;
				}
			}
			else if(var0 >= -2721.5723 && var0 <= -2715.2127 && var1 >= 572.7213 && var1 <= 558.7435)
			{
				if(!glob1D920[var3])
				{
					GameTextForPlayer(var3, "~b~RADAR", 3000, 1);
					glob1D920[var3] = 1;
				}
			}
			else if(var0 >= -2548.7088 && var0 <= -2543.7186 && var1 >= 703.9271 && var1 <= 712.9588)
			{
				if(!glob1D920[var3])
				{
					GameTextForPlayer(var3, "~b~RADAR", 3000, 1);
					glob1D920[var3] = 1;
				}
			}
			else if(var0 >= -2531.5413 && var0 <= -2521.7645 && var1 >= 821.6251 && var1 <= 827.0449)
			{
				if(!glob1D920[var3])
				{
					GameTextForPlayer(var3, "~b~RADAR", 3000, 1);
					glob1D920[var3] = 1;
				}
			}
			else if(var0 >= -2479.9122 && var0 <= -2475.7049 && var1 >= 912.9851 && var1 <= 913.1281)
			{
				if(!glob1D920[var3])
				{
					GameTextForPlayer(var3, "~b~RADAR", 3000, 1);
					glob1D920[var3] = 1;
				}
			}
			else if(var0 >= -1765.1849 && var0 <= -1759.5828 && var1 >= 911.2501 && var1 <= 938.1314)
			{
				if(!glob1D920[var3])
				{
					GameTextForPlayer(var3, "~b~RADAR", 3000, 1);
					glob1D920[var3] = 1;
				}
			}
			else if(var0 >= -1721.6741 && var0 <= -1706.9513 && var1 >= 805.0635 && var1 <= 805.1317)
			{
				if(!glob1D920[var3])
				{
					GameTextForPlayer(var3, "~b~RADAR", 3000, 1);
					glob1D920[var3] = 1;
				}
			}
			else if(var0 >= -1608.3539 && var0 <= -1604.9111 && var1 >= 724.1099 && var1 <= 738.564)
			{
				if(!glob1D920[var3])
				{
					GameTextForPlayer(var3, "~b~RADAR", 3000, 1);
					glob1D920[var3] = 1;
				}
			}
			else if(var0 >= -2011.5265 && var0 <= -1996.7945 && var1 >= 582.7819 && var1 <= 588.7749)
			{
				if(!glob1D920[var3])
				{
					GameTextForPlayer(var3, "~b~RADAR", 3000, 1);
					glob1D920[var3] = 1;
				}
			}
			else if(var0 >= -1625.8807 && var0 <= -1604.939 && var1 >= 427.4234 && var1 <= 447.9201)
			{
				if(!glob1D920[var3])
				{
					GameTextForPlayer(var3, "~b~RADAR", 3000, 1);
					glob1D920[var3] = 1;
				}
			}
			else if(var0 >= -8.7048 && var0 <= -2.5728 && var1 >= 1203.1497 && var1 <= 1203.2509)
			{
				if(!glob1D920[var3])
				{
					GameTextForPlayer(var3, "~b~RADAR", 3000, 1);
					glob1D920[var3] = 1;
				}
			}
			else if(var0 >= -70.2448 && var0 <= -60.7135 && var1 >= 1179.2514 && var1 <= 1179.7309)
			{
				if(!glob1D920[var3])
				{
					GameTextForPlayer(var3, "~b~RADAR", 3000, 1);
					glob1D920[var3] = 1;
				}
			}
			else if(var0 >= -42.0448 && var0 <= -34.8634 && var1 >= 1093.6132 && var1 <= 1103.2421)
			{
				if(!glob1D920[var3])
				{
					GameTextForPlayer(var3, "~b~RADAR", 3000, 1);
					glob1D920[var3] = 1;
				}
			}
			else if(var0 >= -20.4331 && var0 <= -10.756 && var1 >= 1042.2536 && var1 <= 1043.3009)
			{
				if(!glob1D920[var3])
				{
					GameTextForPlayer(var3, "~b~RADAR", 3000, 1);
					glob1D920[var3] = 1;
				}
			}
			else if(var0 >= -305.8266 && var0 <= -295.434 && var1 >= 1053.7713 && var1 <= 1058.4373)
			{
				if(!glob1D920[var3])
				{
					GameTextForPlayer(var3, "~b~RADAR", 3000, 1);
					glob1D920[var3] = 1;
				}
			}
			else if(var0 >= -334.8043 && var0 <= -328.715 && var1 >= 1143.3896 && var1 <= 1143.5026)
			{
				if(!glob1D920[var3])
				{
					GameTextForPlayer(var3, "~b~RADAR", 3000, 1);
					glob1D920[var3] = 1;
				}
			}
			else if(var0 >= -829.6515 && var0 <= -826.8743 && var1 >= 1437.7277 && var1 <= 1437.9859)
			{
				if(!glob24500[var3])
				{
					GameTextForPlayer(var3, "~r~HOTEL", 3000, 1);
					SendClientMessage(var3, 0xFFFFFFAA, "Você está em um hotel digite /hotel para ficar aqui");
					glob24500[var3] = 1;
				}
			}
			else if(var0 >= -1848.1219 && var0 <= -1831.0235 && var1 >= 117.0932 && var1 <= 134.7023)
			{
				if(!glob2F79C[var3])
				{
					GameTextForPlayer(var3, "~g~area de venda", 3000, 1);
					glob2F79C[var3] = 1;
				}
			}
			else if(var0 >= -2133.254 && var0 <= -2121.0899 && var1 >= -87.0582 && var1 <= -76.2425)
			{
				if(!glob21168[var3])
				{
					GameTextForPlayer(var3, "~w~Portoes Abertos", 3000, 1);
					StopObject(glob273F4);
					MoveObject(glob273F4, -2112.5499, -80.6438, 36.0447, 2.0);
					glob21168[var3] = 1;
				}
			}
			else if(var0 >= -1775.2002 && var0 <= -1763.3049 && var1 >= 974.2686 && var1 <= 993.1309)
			{
				if(!glob21488[var3])
				{
					GameTextForPlayer(var3, "~w~Portoes Abertos", 3000, 1);
					StopObject(glob29CC4);
					StopObject(glob29CC8);
					MoveObject(glob29CC4, -1770.1238, 975.4677, 24.2134, 2.0);
					MoveObject(glob29CC8, -1770.1374, 994.0803, 24.1825, 2.0);
					glob21488[var3] = 1;
				}
			}
			else if(var0 >= -2189.67 && var0 <= -2139.2532 && var1 >= -241.4 && var1 <= -226.4995)
			{
				if(!glob316DC[var3])
				{
					GameTextForPlayer(var3, "~r~area de trafico", 3000, 1);
					glob316DC[var3] = 1;
				}
			}
			else if(var0 >= -1987.1303 && var0 <= -1917.1048 && var1 >= 639.5454 && var1 <= 723.5545)
			{
				if(!glob319FC[var3])
				{
					GameTextForPlayer(var3, "~p~companhia de limosine", 3000, 1);
					glob319FC[var3] = 1;
				}
			}
			else if(var0 >= -1680.2588 && var0 <= -1644.0611 && var1 >= 1202.549 && var1 <= 1223.7968)
			{
				if(!glob313BC[var3])
				{
					GameTextForPlayer(var3, "~p~area de aluguel", 3000, 1);
					glob313BC[var3] = 1;
				}
			}
			else if(var0 >= -2672.409 && var0 <= -2613.1202 && var1 >= 631.0958 && var1 <= 631.2515)
			{
				if(!glob30D7C[var3])
				{
					GameTextForPlayer(var3, "~y~Hospital", 3000, 1);
					glob30D7C[var3] = 1;
				}
			}
			else if(var0 >= -1640.4902 && var0 <= -1573.111 && var1 >= 687.5545 && var1 <= 687.6561)
			{
				if(!glob3109C[var3])
				{
					GameTextForPlayer(var3, "~r~Delegacia", 3000, 1);
					glob3109C[var3] = 1;
				}
			}
			else if(var0 >= -323.9808 && var0 <= -309.9444 && var1 >= 1061.565 && var1 <= 1062.4644)
			{
				if(!glob30D7C[var3])
				{
					GameTextForPlayer(var3, "~y~Hospital", 3000, 1);
					glob30D7C[var3] = 1;
				}
			}
			else if(var0 >= -2107.2752 && var0 <= -2103.8931 && var1 >= -2343.5574 && var1 <= -2338.5145)
			{
				if(!glob254B0[var3])
				{
					GameTextForPlayer(var3, "~b~Sorveteria", 3000, 1);
					glob254B0[var3] = 1;
					SendClientMessage(var3, 0xDD0000FF, "Digite /tomarsorvete [sabor] para tomar sorvete!");
				}
			}
			else if(var0 >= -93.6183 && var0 <= -85.6025 && var1 >= 1225.555 && var1 <= 1229.1606)
			{
				if(!glob24500[var3])
				{
					GameTextForPlayer(var3, "~p~Hotel", 3000, 1);
					SendClientMessage(var3, 0xDD0000FF, "Você está num hotel para se hospedar digite /hotel");
					SendClientMessage(var3, 0xDD0000FF, "OBS: Você ira pagando $700 de despeja");
					glob24500[var3] = 1;
				}
			}
			else if(var0 >= 10.1433 && var0 <= 12.7758 && var1 >= 1218.0849 && var1 <= 1226.673)
			{
				if(!glob24500[var3])
				{
					GameTextForPlayer(var3, "~p~Hotel", 3000, 1);
					SendClientMessage(var3, 0xDD0000FF, "Você está num hotel para se hospedar digite /hotel");
					SendClientMessage(var3, 0xDD0000FF, "OBS: Você ira pagando $700 de despeja");
					glob24500[var3] = 1;
				}
			}
			else if(var0 >= 86.3386 && var0 <= 89.8249 && var1 >= 1180.8751 && var1 <= 1184.8681)
			{
				if(!glob24500[var3])
				{
					GameTextForPlayer(var3, "~p~Hotel", 3000, 1);
					SendClientMessage(var3, 0xDD0000FF, "Você está num hotel para se hospedar digite /hotel");
					SendClientMessage(var3, 0xDD0000FF, "OBS: Você ira pagando $700 de despeja");
					glob24500[var3] = 1;
				}
			}
			else if(var0 >= -1564.6642 && var1 <= 481.7943 && var0 <= -1327.8732 && var1 >= 308.581)
			{
				if(!glob257D0[var3])
				{
					GameTextForPlayer(var3, "~g~Base do Exercito", 3000, 1);
					if(29 != glob2AF8C[var3] || !IsPlayerAdmin(var3))
					{
						SendClientMessage(var3, 0xDD0000FF, "Você entrou em uma área não autorizada e por isso foi morto.");
						SetPlayerHealth(var3, 0.0);
						glob257D0[var3] = 1;
					}
				}
			}
			else if(var0 >= -1640.5191 && var1 <= 687.6574 && var0 <= -1573.118 && var1 >= 647.1256)
			{
				if(!glob257D0[var3])
				{
					GameTextForPlayer(var3, "~b~Departamento de Policia", 3000, 1);
					glob257D0[var3] = 1;
				}
			}
			else
			{
				if(glob1A70C[var3] == 1)
				{
					DisablePlayerCheckpoint(var3);
					glob1A70C[var3] = 0;
				}
				if(glob24500[var3] == 1)
				{
					glob24500[var3] = 0;
				}
				if(glob24820[var3] == 1)
				{
					glob24820[var3] = 0;
				}
				if(glob1F3B8[var3] == 1)
				{
					glob1F3B8[var3] = 0;
				}
				if(glob27D58[var3] == 1)
				{
					glob27D58[var3] = 0;
				}
				if(glob217AC[var3] == 1)
				{
					glob217AC[var3] = 0;
				}
				if(glob204E8[var3] == 1)
				{
					glob204E8[var3] = 0;
				}
				if(glob20808[var3] == 1)
				{
					glob20808[var3] = 0;
				}
				if(glob1F6D8[var3] == 1)
				{
					glob1F6D8[var3] = 0;
				}
				if(glob1AD58[var3] == 1)
				{
					glob1AD58[var3] = 0;
				}
				if(glob1AA38[var3] == 1)
				{
					glob1AA38[var3] = 0;
				}
				if(glob25AF0[var3] == 1)
				{
					glob25E14[var3] = 0;
					glob25AF0[var3] = 0;
				}
				if(glob21168[var3] == 1)
				{
					StopObject(glob273F4);
					MoveObject(glob273F4, -2122.2208, -80.6447, 36.0371, 2.0);
					glob21168[var3] = 0;
				}
				if(glob21488[var3] == 1)
				{
					StopObject(glob29CC4);
					StopObject(glob29CC8);
					MoveObject(glob29CC4, -1770.1128, 979.835, 24.1825, 2.0);
					MoveObject(glob29CC8, -1770.1229, 988.6641, 24.1825, 2.0);
					glob21488[var3] = 0;
				}
				if(glob26134[var3] == 1)
				{
					glob26134[var3] = 0;
				}
				if(glob24B50[var3] == 1)
				{
					glob24B50[var3] = 0;
				}
				if(glob3073C[var3] == 1)
				{
					glob3073C[var3] = 0;
				}
				if(glob1D920[var3] == 1)
				{
					glob1D920[var3] = 0;
				}
				if(glob24500[var3] == 1)
				{
					glob24500[var3] = 0;
				}
				if(glob316DC[var3] == 1)
				{
					glob316DC[var3] = 0;
				}
				if(glob2F79C[var3] == 1)
				{
					glob2F79C[var3] = 0;
				}
				if(glob30D7C[var3] == 1)
				{
					glob30D7C[var3] = 0;
				}
				if(glob3109C[var3] == 1)
				{
					glob3109C[var3] = 0;
				}
				if(glob313BC[var3] == 1)
				{
					glob313BC[var3] = 0;
				}
				if(glob30A5C[var3] == 1)
				{
					glob30A5C[var3] = 0;
				}
				if(glob319FC[var3] == 1)
				{
					glob319FC[var3] = 0;
				}
				if(glob257D0[var3] == 1)
				{
					glob257D0[var3] = 0;
				}
				if(glob2E7D4[var3] == 1)
				{
					glob2E7D4[var3] = 0;
				}
				if(glob254B0[var3] == 1)
				{
					glob254B0[var3] = 0;
				}
			}
		}
	}
	return 0;
}

public Megasena()
{
	for(new var0 = 0; var0 < 200; var0++)
	{
		glob29680[var0] = 0;
		new var1 = random(21);
		if(glob299A0[var0] == var1)
		{
			SendClientMessageToAll(0x7585C0AA, "Loteria's Reload. Sorteio!");
			new var2[256];
			format(var2, 256, "%s ganhou o sorteio! O número apostado foi %d", function705E0(var0), var1);
			SendClientMessageToAll(0x7585C0AA, var2);
			GivePlayerMoney(var0, glob29CC0);
			glob299A0[var0] = 0;
			return 1;
		}
		if(glob299A0[var0] != var1)
		{
			SendClientMessageToAll(0x7585C0AA, "Loteria's Reload. Sorteio!");
			glob29CC0 = glob29CC0;
			glob299A0[var0] = 0;
			new var2[256];
			format(var2, 256, "Nenhum vencedor. Talvez na próxima! O numero sorteado foi %d. O premio foi acumulado para R$%d", var1, 171200);
			SendClientMessageToAll(0x7585C0AA, var2);
			return 1;
		}
	}
	return 1;
}

public MoneyGrubScoreUpdate()
{
	new var0 = 0;
	for(new var1 = 0; var1 < 200; var1++)
	{
		if(IsPlayerConnected(var1))
		{
			var0 = GetPlayerMoney(var1);
			SetPlayerScore(var1, var0);
		}
	}
	return 0;
}

public CheckFuel()
{
	new var0[32];
	for(new var1 = 0; var1 < 200; var1++)
	{
		if(IsPlayerConnected(var1) == 1 && IsPlayerInAnyVehicle(var1) == 1)
		{
			if(GetPlayerState(var1) == 2)
			{
				new var2 = GetPlayerVehicleID(var1);
				if(glob1C1A8[var2] == -1)
				{
					return 1;
				}
				glob1C1A8[var2]--;
				format(var0, 32, "~r~Combust¢vel: ~s~%d~b~l", 115112);
				GameTextForPlayer(var1, var0, 1000, 1);
			}
		}
	}
	return 1;
}

public LogarPlayer(playerid)
{
	new Float:var0 = 0.0, Float:var1 = 0.0, Float:var2 = 0.0, Float:var3 = 0.0;
	GivePlayerMoney(playerid, udb_getAccState(function705E0(playerid)) - GetPlayerMoney(playerid));
	udb_getPosition(function705E0(playerid), var0, var1, var2);
	udb_getAng(function705E0(playerid), var3);
	SetSpawnInfo(playerid, 1, udb_getSkin(function705E0(playerid)), var0, var1, var2, var3, 0, 0, 0, 0, 0, 0);
	glob2AF8C[playerid] = udb_getProf(function705E0(playerid));
	if(glob2AF8C[playerid] == 1)
	{
		SetPlayerColor(playerid, 0xCBCBCBAA);
	}
	else if(glob2AF8C[playerid] == 2)
	{
		SetPlayerColor(playerid, 0xFFF297AA);
	}
	else if(glob2AF8C[playerid] == 3)
	{
		SetPlayerColor(playerid, 0xB2FB92AA);
	}
	else if(glob2AF8C[playerid] == 4)
	{
		SetPlayerColor(playerid, 0xFF91ECAA);
	}
	else if(glob2AF8C[playerid] == 5)
	{
		SetPlayerColor(playerid, 0xBDD94CFF);
	}
	else if(glob2AF8C[playerid] == 6)
	{
		SetPlayerColor(playerid, 0xFF9191FF);
	}
	else if(glob2AF8C[playerid] == 7)
	{
		SetPlayerColor(playerid, 0xFF7200FF);
	}
	else if(glob2AF8C[playerid] == 8)
	{
		SetPlayerColor(playerid, 0x662228FF);
	}
	else if(glob2AF8C[playerid] == 9)
	{
		SetPlayerColor(playerid, 0xFFFC00AA);
	}
	else if(glob2AF8C[playerid] == 10)
	{
		SetPlayerColor(playerid, 0xC3C105AA);
	}
	else if(glob2AF8C[playerid] == 11)
	{
		SetPlayerColor(playerid, 0xC6C55EAA);
	}
	else if(glob2AF8C[playerid] == 12)
	{
		SetPlayerColor(playerid, 0xFFFC00AA);
	}
	else if(glob2AF8C[playerid] == 13)
	{
		SetPlayerColor(playerid, 0xD22402AA);
	}
	else if(glob2AF8C[playerid] == 14)
	{
		SetPlayerColor(playerid, 0xFE684BFF);
	}
	else if(glob2AF8C[playerid] == 15)
	{
		SetPlayerColor(playerid, 0xCE2A2AFF);
	}
	else if(glob2AF8C[playerid] == 16)
	{
		SetPlayerColor(playerid, 0xD94242FF);
	}
	else if(glob2AF8C[playerid] == 17)
	{
		SetPlayerColor(playerid, 0xAC5050FF);
	}
	else if(glob2AF8C[playerid] == 18)
	{
		SetPlayerColor(playerid, 0xAB2DCFAA);
	}
	else if(glob2AF8C[playerid] == 19)
	{
		SetPlayerColor(playerid, 0xE89AFFAA);
	}
	else if(glob2AF8C[playerid] == 20)
	{
		SetPlayerColor(playerid, 0x9AFFDDAA);
	}
	else if(glob2AF8C[playerid] == 21)
	{
		SetPlayerColor(playerid, 0x9EB3FFAA);
	}
	else if(glob2AF8C[playerid] == 22)
	{
		SetPlayerColor(playerid, 0x4970FFAA);
	}
	else if(glob2AF8C[playerid] == 23)
	{
		SetPlayerColor(playerid, 0x4C62B3AA);
	}
	else if(glob2AF8C[playerid] == 24)
	{
		SetPlayerColor(playerid, 0x0024ACAA);
	}
	else if(glob2AF8C[playerid] == 25)
	{
		SetPlayerColor(playerid, 0x7585C0AA);
	}
	else if(glob2AF8C[playerid] == 26)
	{
		SetPlayerColor(playerid, 0xD7DFFFAA);
	}
	else if(glob2AF8C[playerid] == 27)
	{
		SetPlayerColor(playerid, 0x00FFEAFF);
	}
	else if(glob2AF8C[playerid] == 28)
	{
		SetPlayerColor(playerid, 0x04AB6EAA);
	}
	else if(glob2AF8C[playerid] == 29)
	{
		SetPlayerColor(playerid, 0x1B7A01AA);
	}
	else if(glob2AF8C[playerid] == 30)
	{
		SetPlayerColor(playerid, 0x5CFFFDAA);
	}
	else if(glob2AF8C[playerid] == 31)
	{
		SetPlayerColor(playerid, 0x81ABABAA);
	}
	else if(glob2AF8C[playerid] == 32)
	{
		SetPlayerColor(playerid, 0x2CCC6CAA);
	}
	else if(glob2AF8C[playerid] == 33)
	{
		SetPlayerColor(playerid, 0x66E3DFAA);
	}
	else if(glob2AF8C[playerid] == 34)
	{
		SetPlayerColor(playerid, 0xC19100AA);
	}
	else if(glob2AF8C[playerid] == 35)
	{
		SetPlayerColor(playerid, 0xADFF0EAA);
	}
	else if(glob2AF8C[playerid] == 36)
	{
		SetPlayerColor(playerid, 0x77913AAA);
	}
	else if(glob2AF8C[playerid] == 37)
	{
		SetPlayerColor(playerid, 0xEEFFC4AA);
	}
	else if(glob2AF8C[playerid] == 38)
	{
		SetPlayerColor(playerid, 0xFEFFFAAA);
	}
	else if(glob2AF8C[playerid] == 39)
	{
		SetPlayerColor(playerid, 0xACAC00FF);
	}
	else if(glob2AF8C[playerid] == 40)
	{
		SetPlayerColor(playerid, 0x444444FF);
	}
	else if(glob2AF8C[playerid] == 43)
	{
		SetPlayerColor(playerid, 0xBC8F8FAA);
	}
	else if(glob2AF8C[playerid] == 42)
	{
		SetPlayerColor(playerid, 0x00BC6FAA);
	}
	else if(glob2AF8C[playerid] == 44)
	{
		SetPlayerColor(playerid, 0x34A2C6AA);
	}
	else if(glob2AF8C[playerid] == 45)
	{
		SetPlayerColor(playerid, 0x34C6ACAA);
	}
	else if(glob2AF8C[playerid] == 46)
	{
		SetPlayerColor(playerid, 0xC73614AA);
	}
	else if(glob2AF8C[playerid] == 47)
	{
		SetPlayerColor(playerid, 0x9B3B0CAA);
	}
	else if(glob2AF8C[playerid] == 48)
	{
		SetPlayerColor(playerid, 0x00E020AA);
	}
	else if(glob2AF8C[playerid] == 49)
	{
		SetPlayerColor(playerid, 0x8EE000AA);
	}
	else if(glob2AF8C[playerid] == 50)
	{
		SetPlayerColor(playerid, 0xA6FEFDAA);
	}
	else if(glob2AF8C[playerid] == 51)
	{
		SetPlayerColor(playerid, 0x25CE98AA);
	}
	else if(glob2AF8C[playerid] == 53)
	{
		SetPlayerColor(playerid, 0xE2E2E2AA);
	}
	else if(glob2AF8C[playerid] == 54)
	{
		SetPlayerColor(playerid, 0xEFAB3FAA);
	}
	else if(glob2AF8C[playerid] == 55)
	{
		SetPlayerColor(playerid, 0xFD23F0AA);
	}
	else if(glob2AF8C[playerid] == 56)
	{
		SetPlayerColor(playerid, 0x6A641EAA);
	}
	else if(glob2AF8C[playerid] == 57)
	{
		SetPlayerColor(playerid, 0x517C2EAA);
	}
	if(udb_getPrisao(function705E0(playerid)) == 1)
	{
		SetSpawnInfo(playerid, 1, udb_getSkin(function705E0(playerid)), 263.7124, 77.7231, 1001.0391, 277.6702, 0, 0, 0, 0, 0, 0);
		glob2B5CC[playerid] = 0;
	}
	else
	{
		SpawnPlayer(playerid);
	}
	return 0;
}

public sacar(playerid)
{
	if(IsPlayerConnected(playerid))
	{
		TogglePlayerControllable(playerid, true);
		return 1;
	}
	return 1;
}

public depositar(playerid)
{
	if(IsPlayerConnected(playerid))
	{
		TogglePlayerControllable(playerid, true);
		return 1;
	}
	return 1;
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
	for(new var0 = 0; var0 < 200; var0++)
	{
		if(glob2B8EC[var0][0] == 1)
		{
			if(glob2D50C[var0] + 3 < GetPlayerMoney(var0))
			{
				new var1[256];
				glob2D50C[var0] = glob2D50C[var0] + 3;
				format(var1, 256, "O taxímetro mostra: R$%d", 185612);
				SendClientMessage(var0, 0x33AA33AA, var1);
				SendClientMessage(glob2B8EC[var0][1], 0x33AA33AA, var1);
			}
			if(glob2D50C[var0] + 3 > GetPlayerMoney(var0))
			{
				SendClientMessage(var0, 0xDD0000FF, "Seu dinheiro para o taxi acabou, vai ficar aqui");
				SendClientMessage(glob2B8EC[var0][1], 0xDD0000FF, "Seu passageiro ficou sem dinheiro e por isso foi deixado aqui.");
				GivePlayerMoney(var0, 0 - glob2D50C[var0]);
				GivePlayerMoney(glob2B8EC[var0][1], glob2D50C[var0]);
				RemovePlayerFromVehicle(var0);
				glob2D50C[var0] = 0;
				glob2B8EC[var0][1] = 0;
				glob2B8EC[var0][0] = 0;
			}
		}
	}
	return 0.0;
}

public tirandograna(playerid, playerid2)
{
	if(glob35280[playerid] == 1)
	{
		if(glob35280[playerid2] == 1)
		{
			if(GetPlayerMoney(playerid2) >= 2)
			{
				GivePlayerMoney(playerid, 2);
				GivePlayerMoney(playerid2, -2);
			}
			if(GetPlayerMoney(playerid2) < 2)
			{
				TogglePlayerControllable(playerid, true);
				TogglePlayerControllable(playerid2, true);
				glob35280[playerid] = 0;
				glob35280[playerid2] = 0;
				glob355A0[playerid] = 0;
				glob355A0[playerid2] = 0;
				SendClientMessage(playerid, 0xDD0000FF, "O sexo acabou pois o outro jogador ficou sem grana.");
				SendClientMessage(playerid2, 0xDD0000FF, "Sexo terminado pois seu dinheiro acabou.");
			}
		}
	}
	return 0;
}

public contagem1()
{
	GameTextForAll("~y~4", 2000, 6);
	SetTimer("contagem2", 2000, false);
	return 1;
}

public contagem2()
{
	GameTextForAll("~y~3", 2000, 6);
	SetTimer("contagem3", 2000, false);
	return 1;
}

public contagem3()
{
	GameTextForAll("~y~2", 2000, 6);
	SetTimer("contagem4", 2000, false);
	return 1;
}

public contagem4()
{
	GameTextForAll("~y~1", 2000, 6);
	SetTimer("contagem5", 2000, false);
	return 1;
}

public contagem5()
{
	GameTextForAll("~r~GO", 2000, 6);
	return 1;
}

public Balada()
{
	for(new var0 = 0; var0 < 200; var0++)
	{
		new Float:var1 = 0.0, Float:var2 = 0.0, Float:var3 = 0.0;
		GetPlayerPos(var0, var1, var2, var3);
		if(IsPlayerConnected(var0))
		{
			if(glob25E14[var0] == 1)
			{
				if(!glob25E10)
				{
					PlayerPlaySound(var0, 1088, var1, var2, var3);
					SendClientMessage(var0, 0xFF7200FF, "Trocando Música");
					PlayerPlaySound(var0, 1062, var1, var2, var3);
				}
				if(glob25E10 == 7)
				{
					PlayerPlaySound(var0, 1063, var1, var2, var3);
					SendClientMessage(var0, 0xFF7200FF, "Trocando Música");
					PlayerPlaySound(var0, 1068, var1, var2, var3);
				}
				if(glob25E10 == 14)
				{
					PlayerPlaySound(var0, 1069, var1, var2, var3);
					SendClientMessage(var0, 0xFF7200FF, "Trocando Música");
					PlayerPlaySound(var0, 1076, var1, var2, var3);
				}
				if(glob25E10 == 21)
				{
					PlayerPlaySound(var0, 1077, var1, var2, var3);
					SendClientMessage(var0, 0xFF7200FF, "Trocando Música");
					PlayerPlaySound(var0, 1097, var1, var2, var3);
				}
				if(glob25E10 == 28)
				{
					PlayerPlaySound(var0, 1098, var1, var2, var3);
					SendClientMessage(var0, 0xFF7200FF, "Trocando Música");
					PlayerPlaySound(var0, 1183, var1, var2, var3);
				}
				if(glob25E10 == 35)
				{
					PlayerPlaySound(var0, 1084, var1, var2, var3);
					SendClientMessage(var0, 0xFF7200FF, "Trocando Música");
					PlayerPlaySound(var0, 1185, var1, var2, var3);
				}
				if(glob25E10 == 42)
				{
					PlayerPlaySound(var0, 1086, var1, var2, var3);
					SendClientMessage(var0, 0xFF7200FF, "Trocando Música");
					PlayerPlaySound(var0, 1187, var1, var2, var3);
				}
			}
			else
			{
				PlayerPlaySound(var0, 1086, var1, var2, var3);
				PlayerPlaySound(var0, 1084, var1, var2, var3);
				PlayerPlaySound(var0, 1098, var1, var2, var3);
				PlayerPlaySound(var0, 1077, var1, var2, var3);
				PlayerPlaySound(var0, 1069, var1, var2, var3);
				PlayerPlaySound(var0, 1063, var1, var2, var3);
				PlayerPlaySound(var0, 1088, var1, var2, var3);
			}
		}
	}
	return 0;
}

public MTaxi()
{
	for(new var0 = 0; var0 < 200; var0++)
	{
		if(glob2C24C[var0][0] == 1)
		{
			if(glob2D50C[var0] + 1 < GetPlayerMoney(var0))
			{
				new var1[256];
				glob2D50C[var0] = glob2D50C[var0] + 1;
				format(var1, 256, "Preço do Moto Taxi: R$%d", 185612);
				SendClientMessage(var0, 0x33AA33AA, var1);
				SendClientMessage(glob2B8EC[var0][1], 0x33AA33AA, var1);
			}
			if(glob2D50C[var0] + 1 > GetPlayerMoney(var0))
			{
				SendClientMessage(var0, 0xDD0000FF, "Você não tem mais dinheiro para o taxi, vai ficar aqui.");
				SendClientMessage(glob2B8EC[var0][1], 0xDD0000FF, "Seu passageiro ficou sem dinheiro e por isso foi deixado aqui.");
				GivePlayerMoney(var0, 0 - glob2D50C[var0]);
				GivePlayerMoney(glob2B8EC[var0][1], glob2D50C[var0]);
				RemovePlayerFromVehicle(var0);
				glob2D50C[var0] = 0;
				glob2C24C[var0][1] = 0;
				glob2C24C[var0][0] = 0;
			}
		}
	}
	return 0;
}

public ATaxi()
{
	for(new var0 = 0; var0 < 200; var0++)
	{
		if(glob2CBAC[var0][0] == 1)
		{
			if(glob2D50C[var0] + 15 < GetPlayerMoney(var0))
			{
				new var1[256];
				glob2D50C[var0] = glob2D50C[var0] + 15;
				format(var1, 256, "O aero-taxímetro mostra: R$%d", 185612);
				SendClientMessage(var0, 0x33AA33AA, var1);
				SendClientMessage(glob2B8EC[var0][1], 0x33AA33AA, var1);
			}
			if(glob2D50C[var0] + 15 > GetPlayerMoney(var0))
			{
				SendClientMessage(var0, 0xDD0000FF, "Você não tem mais dinheiro para o taxi, vai ficar aqui.");
				SendClientMessage(glob2B8EC[var0][1], 0xDD0000FF, "Seu passageiro ficou sem dinheiro e por isso foi deixado aqui.");
				GivePlayerMoney(var0, 0 - glob2D50C[var0]);
				GivePlayerMoney(glob2B8EC[var0][1], glob2D50C[var0]);
				RemovePlayerFromVehicle(var0);
				glob2D50C[var0] = 0;
				glob2CBAC[var0][1] = 0;
				glob2CBAC[var0][0] = 0;
			}
		}
	}
	return 0;
}

public Cheat()
{
	SendClientMessageToAll(0xDD0000FF, "- Denuncie o uso de cheater /report [id] [rasão] -");
	return 0;
}

public TempoPrisao()
{
	for(new var0 = 0; var0 < 200; var0++)
	{
		if(glob2A94C[var0] == 1)
		{
			if(glob2B2AC[var0] == 180)
			{
				glob2B2AC[var0] = 0;
				udb_setPrisao(function705E0(var0), 0);
				glob2A94C[var0] = 0;
				SetSpawnInfo(var0, 0, udb_getSkin(function705E0(var0)), -1605.3073, 718.3339, 11.9386, 0.0, 0, 0, 0, 0, 0, 0);
				SpawnPlayer(var0);
				SendClientMessage(var0, 0xFFFF00AA, "Sua Sentença acabou, não cometa mais crimes, ou será preso novamente.");
			}
			else
			{
				glob2B2AC[var0]++;
			}
		}
	}
	return 0;
}

public SetCar(arg0, Float:arg1, Float:arg2, Float:arg3, Float:arg4, arg5, arg6)
{
	CreateVehicle(arg0, arg1, arg2, arg3, arg4, arg5, arg6, -1);
	return 0;
}

public SetCasa(Float:arg0, Float:arg1, Float:arg2)
{
	AddStaticPickup(1272, 1, arg0, arg1, arg2);
	return 0;
}

public SetCone(Float:arg0, Float:arg1, Float:arg2)
{
	CreateObject(1238, arg0, arg1, arg2 - 200, 0.0, 0.0, 0.0);
	return 0;
}

public Prisao(playerid)
{
	ApplyAnimation(playerid, "BEACH", "ParkSit_M_loop", 4.0, 1, 0, 0, 0, 0);
	return 0;
}

public Text()
{
	TextDrawDestroy(glob29678);
	return 0;
}

public Desmanchado()
{
	for(new var0 = 0; var0 < 200; var0++)
	{
		if(IsPlayerConnected(var0) == 1 && glob24E70[var0] == 1)
		{
			glob27A38[var0] = 0;
		}
	}
	return 0;
}

public CarroLocado()
{
	for(new var0 = 0; var0 < 200; var0++)
	{
		if(IsPlayerConnected(var0) == 1 && glob27A38[GetPlayerVehicleID(var0)] == 1)
		{
			SendClientMessage(var0, 0xDD0000FF, "O tempo de aluguel do carro acabou!");
			SetVehicleToRespawn(GetPlayerVehicleID(var0));
			glob27A38[GetPlayerVehicleID(var0)] = 0;
		}
	}
	return 0;
}

public PassagemSF(playerid)
{
	SetPlayerInterior(playerid, 0);
	SetPlayerPos(playerid, -1425.0416, -289.4514, 14.1484);
	SetPlayerFacingAngle(playerid, 90.0);
	DisablePlayerCheckpoint(playerid);
	SendClientMessage(playerid, 0x56EADAAA, "Você acabou de chegar em San Fierro.");
	SendClientMessage(playerid, 0x56EADAAA, "Procure emprego e uma casa para morar.");
	SendClientMessage(playerid, 0xFF9900AA, "Você têm R$5000 no banco, pode retirar quando quiser.");
	return 0;
}

public Segurado()
{
	for(new var0 = 0; var0 < 200; var0++)
	{
		if(IsPlayerConnected(var0) == 1 && glob236F0[var0] == 1)
		{
			SendClientMessage(var0, 0xDD0000FF, "O seu seguro de vida acabou!");
			glob236F0[var0] = 0;
		}
	}
	return 0;
}

public OnVehiclePaintjob(arg0, arg1)
{
	new var0[256];
	format(var0, 256, "%d.vinfo", arg0);
	new var1[256];
	format(var1, 256, "cor1");
	new var2[256];
	format(var2, 256, "cor2");
	if(!fexist(var0))
	{
		return 0;
	}
	functionD36C(var0, var1, arg1);
	functionD36C(var0, var2, arg1);
	return 1;
}

public OnVehicleRespray(arg0, arg1, arg2)
{
	new var0[256];
	format(var0, 256, "%d.vinfo", arg0);
	new var1[256];
	format(var1, 256, "cor1");
	new var2[256];
	format(var2, 256, "cor2");
	functionD36C(var0, var1, arg1);
	functionD36C(var0, var2, arg2);
	return 0;
}

public OnVehicleMod(arg0, arg1)
{
	new var0 = 1;
	new var1[5];
	format(var1, 5, "tun%d", var0);
	new var2[256];
	format(var2, 256, "%d.vinfo", arg0);
	if(!fexist(var2))
	{
		return 0;
	}
	functionD36C(var2, var1, arg1);
	var0++;
	format(var1, 5, "tun%d", var0);
	return 1;
}

public SaveFiles()
{
	new var0[256];
	new var1 = 1;
	format(var0, 256, "%d.vinfo", var1);
	while(fexist(var0))
	{
		functionD36C(var0, "gasolina", glob1C1A8[var1]);
		var1++;
		format(var0, 256, "%d.vinfo", var1);
	}
	return 1;
}

public CreateStartupFiles()
{
	new var0[256];
	for(new var1 = 1; var1 < 158; var1++)
	{
		format(var0, 256, "%d.vinfo", var1);
		if(fexist(var0))
		{
			return 0;
		}
		functionCAD4(var0);
		switch(GetVehicleModel(var1)) {
			case 481:
				GetVehicleModel(var1);
			case 523:
			case 510:
			case 509:
			case 594:
				functionD36C(var0, "gasolina", 4294967295);
				glob1C1A8[var1] = -1;
			default:
				functionD36C(var0, "gasolina", 100);
				glob1C1A8[var1] = 100;
		}
	}
	return 1;
}

public LoadFiles()
{
	new var0[256];
	new var1 = 1;
	format(var0, 256, "%d.vinfo", var1);
	while(fexist(var0))
	{
		glob1C1A8[var1] = functionD404(var0, "gasolina");
		var1++;
		format(var0, 256, "%d.vinfo", var1);
	}
	return 1;
}

public Pesca()
{
	for(new var0 = 0; var0 < 200; var0++)
	{
		if(IsPlayerConnected(var0) == 1 && glob21ACC[var0] == 1)
		{
			glob21DEC[var0]++;
			glob21ACC[var0] = 0;
			SendClientMessage(var0, 0x33AA33AA, "Sua rede voltou. Se quiser continuar pescando, fique a vontade.");
			SendClientMessage(var0, 0x33AA33AA, "Se não, vá a cooperativa de pescas e venda seu pescado.");
			udb_setED(function705E0(var0), udb_getED(function705E0(var0)) + 1);
		}
	}
	return 0;
}

public Float:Radar()
{
	for(new var0 = 0; var0 < 200; var0++)
	{
		new Float:var1 = 0.0, Float:var2 = 0.0, Float:var3 = 0.0;
		new Float:var4 = glob1944C[var0][0] - var1, Float:var5 = glob1944C[var0][1] - var2, Float:var6 = glob1944C[var0][2] - var3, Float:var7 = floatsqroot((var4 * var4) + (var5 * var5) + (var6 * var6));
		if(glob1D920[var0] == 1)
		{
			if(glob1DC40[var0] == 1)
			{
				glob2D82C[var0] = floatround(60.0 * 60.0 * (var7 / 1000.0), 0);
				if(glob2D82C[var0] > 130 && GetPlayerState(var0) == 2)
				{
					SendClientMessage(var0, 0xDD0000FF, "Você levou multa de $50 por passar em alta velocidade em um radar.");
					GivePlayerMoney(var0, -50);
				}
			}
			glob1944C[var0][0] = var1;
			glob1944C[var0][1] = var2;
			glob1944C[var0][2] = var3;
		}
	}
	return 0.0;
}

public Caca()
{
	for(new var0 = 0; var0 < 200; var0++)
	{
		if(IsPlayerConnected(var0) == 1 && glob22D90[var0] == 1)
		{
			glob230B0[var0]++;
			glob22D90[var0] = 0;
			SendClientMessage(var0, 0x33AA33AA, "Sua caça está pronta para ser vendida!");
			SendClientMessage(var0, 0x33AA33AA, "Se quiser continuar caçando, fique a vontade.");
			SendClientMessage(var0, 0x33AA33AA, "Se não, vá a cooperativa de caça e venda sua caça.");
			udb_setED(function705E0(var0), udb_getED(function705E0(var0)) + 1);
		}
	}
	return 0;
}

public Platacao()
{
	for(new var0 = 0; var0 < 200; var0++)
	{
		if(IsPlayerConnected(var0) == 1 && glob20B28[var0] == 1)
		{
			glob20E48[var0]++;
			glob20B28[var0] = 0;
			SendClientMessage(var0, 0x33AA33AA, "Sua platação está pronta para ser vendida!");
			SendClientMessage(var0, 0x33AA33AA, "Colha o milho platando e venda a Fazenda.");
		}
	}
	return 0;
}

public OnPlayerPrivmsg(playerid, receiverid, text)
{
	SendClientMessage(playerid, 0xDD0000FF, "|-------------------------ATENÇÃO--------------------------|");
	SendClientMessage(playerid, 0xDD0000FF, "O comando /pm foi desabilitado!");
	SendClientMessage(playerid, 0x4C62B3AA, "Use /ligar ou /sms para mensagens privadas");
	return 0;
}

public verificacao()
{
	glob2EE18++;
	glob2EE18 = glob2EE18 % 24;
	SetWorldTime(glob2EE18);
	for(new var0 = 0; var0 < 200; var0++)
	{
		if(!glob2EE18)
		{
			new var1 = 0;
			var1 = udb_getED(function705E0(var0));
			if(var1 >= 10)
			{
				new var2 = 0;
				var2 = udb_getXP(function705E0(var0));
				if(4 != var2 || 9 != var2 || 14 != var2 || 19 != var2 || 24 != var2 || 29 != var2 || 34 != var2 || 39 != var2 || 44 != var2 || 49 != var2 || 54 != var2 || 59 != var2 || 64 != var2 || 69 != var2 || 74 != var2 || 79 != var2 || 84 != var2 || 89 != var2 || 94 != var2 || 99 != var2)
				{
					SendClientMessage(var0, 0x00BC6FAA, "Verificação de Level : Parabens você ganhou um XL pelo bom esforço no trabalho.");
					udb_setXP(function705E0(var0), udb_getXP(function705E0(var0)) + 1);
					udb_setED(function705E0(var0), udb_getED(function705E0(var0)) - 10);
					return 1;
				}
				if(var2 == 4 || var2 == 9 || var2 == 14 || var2 == 19 || var2 == 24 || var2 == 29 || var2 == 34 || var2 == 39 || var2 == 44 || var2 == 49 || var2 == 54 || var2 == 59 || var2 == 64 || var2 == 69 || var2 == 74 || var2 == 79 || var2 == 84 || var2 == 89 || var2 == 94 || var2 == 99)
				{
					SendClientMessage(var0, 0x00BC6FAA, "Verificação de Level : Parabens você ganhou um XL pelo bom esforço no trabalho.");
					SendClientMessage(var0, 0x00BC6FAA, "Muito bem! Agora você terá novas profissões para escolher em seu menu e terá permissão para usar uma delas. Boa Sorte.");
					udb_setXP(function705E0(var0), udb_getXP(function705E0(var0)) + 1);
					udb_setED(function705E0(var0), udb_getED(function705E0(var0)) - 10);
					udb_setNM(function705E0(var0), 0);
					return 1;
				}
			}
			else
			{
				SendClientMessage(var0, 0x00BC6FAA, "Verificação de Level : Você não trabalhou o suficiente portanto nada de XL");
				return 1;
			}
		}
	}
	return 1;
}

public Semana()
{
	glob28088++;
	glob28088 = glob28088 % 48;
	SetWorldTime(glob28088);
	for(new var0 = 0; var0 < 200; var0++)
	{
		if(!glob28088)
		{
			GameTextForPlayer(var0, "~b~SEGUNDA FEIRA", 10000, 0);
			glob2808C[var0] = 1;
		}
		if(glob28088 == 7)
		{
			GameTextForPlayer(var0, "~b~TERCA FEIRA", 10000, 0);
			glob283AC[var0] = 1;
		}
		if(glob28088 == 14)
		{
			GameTextForPlayer(var0, "~b~QUARTA FEIRA", 10000, 0);
			glob286CC[var0] = 1;
		}
		if(glob28088 == 21)
		{
			GameTextForPlayer(var0, "~b~QUINTA FEIRA", 10000, 0);
			glob289EC[var0] = 1;
		}
		if(glob28088 == 28)
		{
			GameTextForPlayer(var0, "~b~SEXTA FEIRA", 10000, 0);
			glob28D0C[var0] = 1;
		}
		if(glob28088 == 35)
		{
			GameTextForPlayer(var0, "~b~SABADO", 10000, 0);
			glob2902C[var0] = 1;
		}
		if(glob28088 == 42)
		{
			GameTextForPlayer(var0, "~b~DOMINGO", 10000, 0);
			glob2934C[var0] = 1;
		}
	}
	return 0;
}

public quefome()
{
	glob1E8C0 = glob1E8C0 % 12;
	SetWorldTime(glob1E8C0);
	for(new var0 = 0; var0 < 200; var0++)
	{
		if(!glob1E8C0)
		{
			glob1E5A0[var0]++;
		}
	}
	return 0;
}

function82A44()
{
	for(new var0 = 0; var0 < 200; var0++)
	{
		if(IsPlayerConnected(var0))
		{
			SendClientMessage(var0, 0xFFFFFFAA, "Dia de pagamento.");
			SendClientMessage(var0, glob8888[glob2AF8C[var0]], glob5C14[glob2AF8C[var0]]);
			udb_setBankMoney(function705E0(var0), udb_getBankMoney(function705E0(var0)) + glob5B2C[glob2AF8C[var0]]);
		}
	}
	return 0;
}

public Tempo()
{
	if(glob2DB50 > 59)
	{
		glob2DB50 = 0;
		glob2DB4C++;
		glob2DB4C = glob2DB4C % 24;
	}
	if(glob2DB50 < 60)
	{
	}
	SetWorldTime(glob2DB4C);
	if(glob2DB50 == 1)
	{
		switch(glob2DB4C) {
			case 0:
				function82A44();
		}
	}
	return 0;
}

public GetClosestHospital(playerid)
{
	if(!IsPlayerConnected(playerid))
	{
		return -1;
	}
	new Float:var0 = 100000.0;
	new var1 = 0;
	for(new var2 = 0; var2 <= 4; var2++)
	{
		new Float:var3 = 0.0;
		if(!var2)
		{
			var3 = GetPlayerDistanceToPoint(playerid, -2651.6502, 634.1176);
		}
		else if(var2 == 1)
		{
			var3 = GetPlayerDistanceToPoint(playerid, 1173.5842, -1324.5616);
		}
		else if(var2 == 2)
		{
			var3 = GetPlayerDistanceToPoint(playerid, 2031.9415, -1404.3578);
		}
		else if(var2 == 3)
		{
			var3 = GetPlayerDistanceToPoint(playerid, 1582.5615, 1768.7921);
		}
		else if(var2 == 4)
		{
			var3 = GetPlayerDistanceToPoint(playerid, -319.0593, 1061.6934);
		}
		if(var3 < var0)
		{
			var0 = var3;
			var1 = var2;
		}
	}
	return var1;
}

public IsPlayerInCircle(playerid, Float:arg1, Float:arg2, arg3)
{
	if(GetPlayerDistanceToPoint(playerid, arg1, arg2) < arg3)
	{
		return 1;
	}
	return 0;
}

public Float:GetPlayerDistanceToPoint(playerid, Float:arg1, Float:arg2)
{
	new Float:var0 = 0.0, Float:var1 = 0.0, Float:var2 = 0.0;
	new Float:var3 = 0.0;
	GetPlayerPos(playerid, var0, var1, var2);
	var3 = floatsqroot(floatpower(floatabs(arg1 - var0), 2.0) + floatpower(floatabs(arg2 - var1), 2.0));
	return floatround(var3, 0);
}

public IsPlayerInSphere(playerid, Float:arg1, Float:arg2, Float:arg3, arg4)
{
	if(GetPlayerDistanceToPointEx(playerid, arg1, arg2, arg3) < arg4)
	{
		return 1;
	}
	return 0;
}

public Float:GetPlayerDistanceToPointEx(playerid, Float:arg1, Float:arg2, Float:arg3)
{
	new Float:var0 = 0.0, Float:var1 = 0.0, Float:var2 = 0.0;
	new Float:var3 = 0.0;
	GetPlayerPos(playerid, var0, var1, var2);
	var3 = floatsqroot(floatpower(floatabs(arg1 - var0), 2.0) + floatpower(floatabs(arg2 - var1), 2.0) + floatpower(floatabs(arg3 - var2), 2.0));
	return floatround(var3, 0);
}

public IsPlayerInArea(playerid, Float:arg1, Float:arg2, Float:arg3, Float:arg4)
{
	new Float:var0 = 0.0, Float:var1 = 0.0, Float:var2 = 0.0;
	GetPlayerPos(playerid, var0, var1, var2);
	if(var0 > arg1 && var0 < arg2 && var1 > arg3 && var1 < arg4)
	{
		return 1;
	}
	return 0;
}

public InicioTribunal(playerid, playerid2)
{
	new var0[256];
	format(var0, 256, "O Tribunal entre %s e %s começou a partir de agora!", function705E0(playerid), function705E0(playerid2));
	SendClientMessageToAll(0xFFFFFFAA, var0);
	SendClientMessageToAll(0xFFFFFFAA, "Agora os dois estão abertos para declarações de juizes.");
	glob37B20[playerid] = 1;
	glob37B20[playerid2] = 1;
	return 0;
}

public BUM(arg0)
{
	if(glob35BE0[arg0] == 1)
	{
		SetVehicleHealth(arg0, 0.0);
		SendClientMessageToAll(0xDD0000FF, "NOTÍCIA: Um carro acaba de explodir há provas de que foi plantada uma dinamite nele, o criminoso não");
		SendClientMessageToAll(0xDD0000FF, "esta mais no local! Vejam se algum vendedor de bombas pode informar quem andou comprando dinamites.");
		glob35BE0[arg0] = 0;
	}
	return 0;
}

public update_zones()
{
	new var0[10];
	new var1[10];
	for(new var2 = 0; var2 < 200; var2++)
	{
		if(IsPlayerConnected(var2) && glob1CC98[var2] == 1)
		{
			if(function83F5C(var2, glob1CFB8[var2]))
			{
			}
			else
			{
				new var3 = 0;
				var3 = glob1CFB8[var2];
				glob1CFB8[var2] = -1;
				for(new var4 = 0; var4 < 365; var4++)
				{
					if(function83F5C(var2, var4) && glob1CFB8[var2] == -1)
					{
						if(var3 == -1)
						{
							GameTextForPlayer(var2, glob944C[var4], 1500, 1);
						}
						else if(strcmp(glob944C[var4], glob944C[var3], true))
						{
							GameTextForPlayer(var2, glob944C[var4], 1500, 1);
						}
						glob1CFB8[var2] = var4;
						format(var0, 10, "p%dzone", var2);
						format(var1, 10, "%d", var4);
					}
				}
				if(glob1CFB8[var2] == -1)
				{
					glob1CFB8[var2] = var3;
				}
			}
		}
	}
	return 0;
}

function83F5C(playerid, arg1)
{
	if(arg1 == -1)
	{
		return 0;
	}
	new Float:var0 = 0.0, Float:var1 = 0.0, Float:var2 = 0.0;
	GetPlayerPos(playerid, var0, var1, var2);
	if(var0 >= glob944C[arg1][27] && var0 < glob944C[arg1][30] && var1 >= glob944C[arg1][28] && var1 < glob944C[arg1][31] && var2 >= glob944C[arg1][29] && var2 < glob944C[arg1][32] && var2 < 900.0)
	{
		return 1;
	}
	return 0;
}

public GetPlayerZone(arg0)
{
	new var0[10];
	format(var0, 10, "p%dzone", arg0);
	new var1 = strval(var0);
	return var1;
}

public Fimcamuflagem(playerid, playerid2)
{
	new var0 = 0;
	var0 = udb_getProf(function705E0(playerid2));
	if(IsPlayerConnected(playerid2))
	{
		if(IsPlayerConnected(playerid))
		{
			SendClientMessage(playerid2, 0xFFFFFFAA, "Seu tempo de camuflagem acabou!");
			new var1[256];
			format(var1, 256, "O Tempo de %s acabou! Seu chefe sugeriu que ofereça mais tempo a ele.", function705E0(playerid2));
			SendClientMessage(playerid, 0xFFFFFFAA, var1);
			SetPlayerColor(playerid2, glob8888[var0]);
		}
	}
	return 0;
}

public Desarme(playerid, arg1)
{
	if(IsPlayerInVehicle(playerid, arg1))
	{
		TogglePlayerControllable(playerid, true);
		glob35BE0[arg1] = 0;
		SendClientMessage(playerid, 0xFFFFFFAA, "Dinamite desarmada com sucesso.");
		udb_setED(function705E0(playerid), udb_getED(function705E0(playerid)) + 1);
	}
	return 0;
}

