------------------------------------------------------
-- FFF_ItemInfo.lua
------------------------------------------------------
-- LOCALIZATION: nothing locale-specific here (any localized names are all in comments)
------------------------------------------------------

FOM_FoodTypes = { -- used to set priority
	CONJURED = 1, -- mage food etc, preferable because it's free!
	BASIC    = 2, -- includes combo health/mana food, because hunters don't care about mana anymore
	BONUS    = 3, -- food with "well fed" bonuses
	INEDIBLE = 4, -- usually cooking mats TODO: bring back prefer/avoid
}
local F = FOM_FoodTypes;

FOM_Foods = {
	[FOM_DIET_MEAT] = {
		-- Mists and before
		[   117] = F.BASIC,
		[  2287] = F.BASIC,
		[  2679] = F.BASIC,
		[  2681] = F.BASIC,
		[  2685] = F.BASIC,
		[  3770] = F.BASIC,
		[  3771] = F.BASIC,
		[  4599] = F.BASIC,
		[  5478] = F.BASIC,
		[  6890] = F.BASIC,
		[  7097] = F.BASIC,
		[  8952] = F.BASIC,
		[  9681] = F.BASIC,
		[  9681] = F.BASIC,
		[ 11444] = F.BASIC,
		[ 11444] = F.BASIC,
		[ 17119] = F.BASIC,
		[ 17407] = F.BASIC,
		[ 19223] = F.BASIC,
		[ 19224] = F.BASIC,
		[ 19304] = F.BASIC,
		[ 19305] = F.BASIC,
		[ 19306] = F.BASIC,
		[ 19995] = F.BASIC,
		[ 21235] = F.BASIC,
		[ 23495] = F.BASIC,
		[ 27854] = F.BASIC,
		[ 29451] = F.BASIC,
		[ 30610] = F.BASIC,
		[ 32685] = F.BASIC,
		[ 32686] = F.BASIC,
		[ 33254] = F.BASIC,
		[ 33454] = F.BASIC,
		[ 34747] = F.BASIC,
		[ 35953] = F.BASIC,
		[ 38427] = F.BASIC,
		[ 38428] = F.BASIC,
		[ 40202] = F.BASIC,
		[ 40358] = F.BASIC,
		[ 40359] = F.BASIC,
		[ 41729] = F.BASIC,
		[ 44072] = F.BASIC,
		[ 57544] = F.BASIC,
		[ 58268] = F.BASIC,
		[ 58269] = F.BASIC,
		[ 58280] = F.BASIC,
		[ 59231] = F.BASIC,
		[ 59232] = F.BASIC,
		[ 60268] = F.BASIC,
		[ 60377] = F.BASIC,
		[ 62653] = F.BASIC,
		[ 62658] = F.BASIC,
		[ 62662] = F.BASIC,
		[ 62664] = F.BASIC,
		[ 62665] = F.BASIC,
		[ 62670] = F.BASIC,
		[ 62676] = F.BASIC,
		[ 62909] = F.BASIC,
		[ 62910] = F.BASIC,
		[ 65730] = F.BASIC,
		[ 65731] = F.BASIC,
		[ 67230] = F.BASIC,
		[ 67270] = F.BASIC,
		[ 67271] = F.BASIC,
		[ 67272] = F.BASIC,
		[ 67273] = F.BASIC,
		[ 74642] = F.BASIC,
		[ 74646] = F.BASIC,
		[ 74647] = F.BASIC,
		[ 74648] = F.BASIC,
		[ 74649] = F.BASIC,
		[ 74650] = F.BASIC,
		[ 74653] = F.BASIC,
		[ 74654] = F.BASIC,
		[ 74656] = F.BASIC,
		[ 81917] = F.BASIC,
		[ 81918] = F.BASIC,
		[ 83097] = F.BASIC,
		[ 85501] = F.BASIC,
		[ 86070] = F.BASIC,
		[ 90135] = F.BASIC,
		[  1017] = F.BONUS,
		[  2680] = F.BONUS,
		[  2684] = F.BONUS,
		[  2687] = F.BONUS,
		[  2888] = F.BONUS,
		[  3220] = F.BONUS,
		[  3662] = F.BONUS,
		[  3726] = F.BONUS,
		[  3727] = F.BONUS,
		[  3728] = F.BONUS,
		[  3729] = F.BONUS,
		[  4457] = F.BONUS,
		[  5472] = F.BONUS,
		[  5474] = F.BONUS,
		[  5477] = F.BONUS,
		[  5479] = F.BONUS,
		[  5480] = F.BONUS,
		[ 12209] = F.BONUS,
		[ 12210] = F.BONUS,
		[ 12213] = F.BONUS,
		[ 12224] = F.BONUS,
		[ 13851] = F.BONUS,
		[ 17222] = F.BONUS,
		[ 18045] = F.BONUS,
		[ 20074] = F.BONUS,
		[ 21023] = F.BONUS,
		[ 24105] = F.BONUS,
		[ 27635] = F.BONUS,
		[ 27636] = F.BONUS,
		[ 27651] = F.BONUS,
		[ 27655] = F.BONUS,
		[ 27657] = F.BONUS,
		[ 27658] = F.BONUS,
		[ 27659] = F.BONUS,
		[ 27660] = F.BONUS,
		[ 29292] = F.BONUS,
		[ 31672] = F.BONUS,
		[ 31673] = F.BONUS,
		[ 33872] = F.BONUS,
		[ 34125] = F.BONUS,
		[ 34410] = F.BONUS,
		[ 34748] = F.BONUS,
		[ 34749] = F.BONUS,
		[ 34750] = F.BONUS,
		[ 34751] = F.BONUS,
		[ 34752] = F.BONUS,
		[ 34754] = F.BONUS,
		[ 34755] = F.BONUS,
		[ 34756] = F.BONUS,
		[ 34757] = F.BONUS,
		[ 34758] = F.BONUS,
		[ 35563] = F.BONUS,
		[ 35565] = F.BONUS,
		[ 42779] = F.BONUS,
		[ 42994] = F.BONUS,
		[ 42995] = F.BONUS,
		[ 42997] = F.BONUS,
		[ 43001] = F.BONUS,
		[ 43488] = F.BONUS,
		[ 46392] = F.BONUS,
		[ 57519] = F.BONUS,
		[ 62653] = F.BONUS,
		[ 62658] = F.BONUS,
		[ 62662] = F.BONUS,
		[ 62664] = F.BONUS,
		[ 62665] = F.BONUS,
		[ 62670] = F.BONUS,
		[ 64641] = F.BONUS,
		[ 74642] = F.BONUS,
		[ 74646] = F.BONUS,
		[ 74647] = F.BONUS,
		[ 74648] = F.BONUS,
		[ 74649] = F.BONUS,
		[ 74650] = F.BONUS,
		[ 74653] = F.BONUS,
		[ 74654] = F.BONUS,
		[ 74656] = F.BONUS,
		[ 81405] = F.BONUS,
		[ 81413] = F.BONUS,
		[ 86070] = F.BONUS,
		[   723] = F.INEDIBLE,
		[   729] = F.INEDIBLE,
		[   769] = F.INEDIBLE,
		[  1015] = F.INEDIBLE,
		[  1080] = F.INEDIBLE,
		[  1081] = F.INEDIBLE,
		[  2672] = F.INEDIBLE,
		[  2673] = F.INEDIBLE,
		[  2677] = F.INEDIBLE,
		[  2886] = F.INEDIBLE,
		[  2924] = F.INEDIBLE,
		[  3173] = F.INEDIBLE,
		[  3404] = F.INEDIBLE,
		[  3667] = F.INEDIBLE,
		[  3712] = F.INEDIBLE,
		[  3730] = F.INEDIBLE,
		[  3731] = F.INEDIBLE,
		[  4739] = F.INEDIBLE,
		[  5051] = F.INEDIBLE,
		[  5465] = F.INEDIBLE,
		[  5467] = F.INEDIBLE,
		[  5469] = F.INEDIBLE,
		[  5470] = F.INEDIBLE,
		[  5471] = F.INEDIBLE,
		[ 12037] = F.INEDIBLE,
		[ 12184] = F.INEDIBLE,
		[ 12202] = F.INEDIBLE,
		[ 12203] = F.INEDIBLE,
		[ 12204] = F.INEDIBLE,
		[ 12205] = F.INEDIBLE,
		[ 12208] = F.INEDIBLE,
		[ 12223] = F.INEDIBLE,
		[ 20424] = F.INEDIBLE,
		[ 21024] = F.INEDIBLE,
		[ 22644] = F.INEDIBLE,
		[ 23676] = F.INEDIBLE,
		[ 27668] = F.INEDIBLE,
		[ 27669] = F.INEDIBLE,
		[ 27671] = F.INEDIBLE,
		[ 27674] = F.INEDIBLE,
		[ 27677] = F.INEDIBLE,
		[ 27678] = F.INEDIBLE,
		[ 27681] = F.INEDIBLE,
		[ 27682] = F.INEDIBLE,
		[ 31670] = F.INEDIBLE,
		[ 31671] = F.INEDIBLE,
		[ 33120] = F.INEDIBLE,
		[ 34736] = F.INEDIBLE,
		[ 35562] = F.INEDIBLE,
		[ 35794] = F.INEDIBLE,
		[ 43009] = F.INEDIBLE,
		[ 43010] = F.INEDIBLE,
		[ 43011] = F.INEDIBLE,
		[ 43012] = F.INEDIBLE,
		[ 43013] = F.INEDIBLE,
		[ 62778] = F.INEDIBLE,
		[ 62779] = F.INEDIBLE,
		[ 62780] = F.INEDIBLE,
		[ 62781] = F.INEDIBLE,
		[ 62782] = F.INEDIBLE,
		[ 62783] = F.INEDIBLE,
		[ 62784] = F.INEDIBLE,
		[ 62785] = F.INEDIBLE,
		[ 67229] = F.INEDIBLE,
		[ 74833] = F.INEDIBLE,
		[ 74834] = F.INEDIBLE,
		[ 74837] = F.INEDIBLE,
		[ 74838] = F.INEDIBLE,
		[ 74839] = F.INEDIBLE,
		[ 75014] = F.INEDIBLE,
		[ 85506] = F.INEDIBLE,
		
		-- Warlords
		[111544] = F.BASIC, -- Frostboar Jerky 
		[115355] = F.BASIC, -- Marbled Clefthoof Steak 
		[117472] = F.BASIC, -- Grilled Gorgrond Surprise 
		[117473] = F.BASIC, -- Pickled Elekk Hooves 
		[117474] = F.BASIC, -- Rylak Sausages 
		[128219] = F.BASIC, -- Fel-Smoked Ham 
		[128498] = F.BASIC, -- Fel Eggs and Ham 
		[104196] = F.BASIC, -- Delectable Ogre Queasine 
		[111431] = F.BONUS, -- (sta) Hearty Elekk Steak 
		[111433] = F.BONUS, -- (critstrkrtng) Blackrock Ham 
		[111434] = F.BONUS, -- (hastertng) Pan-Seared Talbuk 
		[111436] = F.BONUS, -- (mastrtng) Braised Riverbeast 
		[111437] = F.BONUS, -- (critstrkrtng) Rylak Crepes 
		[111438] = F.BONUS, -- Clefthoof Sausages 
		[118428] = F.BONUS, -- Legion Chili 
		[130192] = F.BONUS, -- (manargn) Potato Axebeak Stew 
		[116407] = F.BONUS, -- Slow-Smoked Turkey 
		[120293] = F.BONUS, -- Lukewarm Yak Roast Broth 		
		[109131] = F.INEDIBLE, -- Raw Clefthoof Meat 
		[109132] = F.INEDIBLE, -- Raw Talbuk Meat 
		[109133] = F.INEDIBLE, -- Rylak Egg 
		[109134] = F.INEDIBLE, -- Raw Elekk Meat 
		[109135] = F.INEDIBLE, -- Raw Riverbeast Meat 
		[109136] = F.INEDIBLE, -- Raw Boar Meat 
		[128500] = F.INEDIBLE, -- Fel Ham 
		[128499] = F.INEDIBLE, -- Fel Egg 
		-- these take both meat and fish. which is it? (tested at least some as meat)
		[111447] = F.BONUS, -- (sta) Talador Surf and Turf 
		[111449] = F.BONUS, -- (critstrkrtng) Blackrock Barbecue 
		[111450] = F.BONUS, -- (hastertng) Frosty Stew 
		[111452] = F.BONUS, -- (mastrtng) Sleeper Surprise 
		[111453] = F.BONUS, -- (critstrkrtng) Calamari Crepes 
		[111454] = F.BONUS, -- Gorgrond Chowder 
		
		-- Legion
		[128840] = F.BASIC, -- Honey-Glazed Ham 
		[136545] = F.BASIC, -- Skolag Worm Dumpling 
		[136551] = F.BASIC, -- Elderhorn Jerky 
		[136552] = F.BASIC, -- Sablehorn Steak Tartare 
		[139345] = F.BASIC, -- Rat Hands 
		[140207] = F.BASIC, -- 'Free-Range' Honey-Glazed Ham 
		[133565] = F.BONUS, -- (critstrkrtng) Leybeque Ribs 
		[133566] = F.BONUS, -- (hastertng) Suramar Surf and Turf 
		[133570] = F.BONUS, -- (critstrkrtng) The Hungry Magister 
		[133571] = F.BONUS, -- (hastertng) Azshari Salad 
		[133576] = F.BONUS, -- Bear Tartare 
		[133681] = F.BONUS, -- Crispy Bacon 
		[133557] = F.BONUS, -- (critstrkrtng) Salt & Pepper Shank 
		[133564] = F.BONUS, -- Spiced Rib Roast 
		[138974] = F.BASIC, -- Charcoaled Elderhorn 
		[140202] = F.BASIC, -- Smoked 'Grass Fed' Elderhorn 
		[140668] = F.BASIC, -- Meaty Racks of Musken Ribs 
		[133893] = F.BASIC, -- Darkpit Mushroom Burger 
		[133979] = F.BASIC, -- Grilled Snail 
		[140343] = F.BONUS, -- Exotic Squirmy Delight 
		[140342] = F.BONUS, -- (sta) Lean - Mok'Nathal Shortribs 
		[140338] = F.BASIC, -- (sta) Mana-Wrapped Goretusk Liver Pie 
		[140337] = F.BASIC, -- Imported Tough Jerky 
		[124117] = F.INEDIBLE, -- Lean Shank 
		[124118] = F.INEDIBLE, -- Fatty Bearsteak 
		[124119] = F.INEDIBLE, -- Big Gamy Ribs 
		[124120] = F.INEDIBLE, -- Leyblood 
		[124121] = F.INEDIBLE, -- Wildfowl Egg 
		
		-- unsure of food diet
		[136555] = F.BASIC, -- Standard Issue Rations 
		[128849] = F.BASIC, -- Scallion Kimchi 
		[128839] = F.BASIC, -- Smoked Elderhorn 
		[141212] = F.BASIC, -- Mana-Poached Egg 
		[141213] = F.BASIC, -- Candied Sandpiper Eggs 
		[136556] = F.BASIC, -- Legion Spoiling Ration 
		[140344] = F.BASIC, -- Preserved Pickled Egg 

		
	},
	[FOM_DIET_FISH] = {
		-- Mists and before
		[   787] = F.BASIC,
		[  1326] = F.BASIC,
		[  2682] = F.BASIC,
		[  2682] = F.BASIC,
		[  4592] = F.BASIC,
		[  4593] = F.BASIC,
		[  4594] = F.BASIC,
		[  5095] = F.BASIC,
		[  6290] = F.BASIC,
		[  6316] = F.BASIC,
		[  6887] = F.BASIC,
		[  8364] = F.BASIC,
		[  8957] = F.BASIC,
		[  8959] = F.BASIC,
		[ 12238] = F.BASIC,
		[ 13546] = F.BASIC,
		[ 13930] = F.BASIC,
		[ 13933] = F.BASIC,
		[ 13935] = F.BASIC,
		[ 16766] = F.BASIC,
		[ 19996] = F.BASIC,
		[ 21071] = F.BASIC,
		[ 21153] = F.BASIC,
		[ 21552] = F.BASIC,
		[ 27661] = F.BASIC,
		[ 27858] = F.BASIC,
		[ 29452] = F.BASIC,
		[ 33004] = F.BASIC,
		[ 33048] = F.BASIC,
		[ 33053] = F.BASIC,
		[ 33451] = F.BASIC,
		[ 34759] = F.BASIC,
		[ 34760] = F.BASIC,
		[ 34761] = F.BASIC,
		[ 35285] = F.BASIC,
		[ 35951] = F.BASIC,
		[ 43571] = F.BASIC,
		[ 43646] = F.BASIC,
		[ 43647] = F.BASIC,
		[ 44049] = F.BASIC,
		[ 44071] = F.BASIC,
		[ 45932] = F.BASIC,
		[ 56165] = F.BASIC,
		[ 58262] = F.BASIC,
		[ 58263] = F.BASIC,
		[ 58277] = F.BASIC,
		[ 62651] = F.BASIC,
		[ 62652] = F.BASIC,
		[ 62654] = F.BASIC,
		[ 62655] = F.BASIC,
		[ 62656] = F.BASIC,
		[ 62657] = F.BASIC,
		[ 62659] = F.BASIC,
		[ 62660] = F.BASIC,
		[ 62661] = F.BASIC,
		[ 62663] = F.BASIC,
		[ 62666] = F.BASIC,
		[ 62667] = F.BASIC,
		[ 62668] = F.BASIC,
		[ 62669] = F.BASIC,
		[ 62671] = F.BASIC,
		[ 62677] = F.BASIC,
		[ 68687] = F.BASIC,
		[ 74636] = F.BASIC,
		[ 74641] = F.BASIC,
		[ 74644] = F.BASIC,
		[ 74645] = F.BASIC,
		[ 74651] = F.BASIC,
		[ 74652] = F.BASIC,
		[ 74655] = F.BASIC,
		[ 82448] = F.BASIC,
		[ 82449] = F.BASIC,
		[ 86073] = F.BASIC,
		[  5476] = F.BONUS,
		[  5527] = F.BONUS,
		[  6038] = F.BONUS,
		[ 12216] = F.BONUS,
		[ 13927] = F.BONUS,
		[ 13928] = F.BONUS,
		[ 13929] = F.BONUS,
		[ 13932] = F.BONUS,
		[ 13934] = F.BONUS,
		[ 16971] = F.BONUS,
		[ 21072] = F.BONUS,
		[ 21217] = F.BONUS,
		[ 27662] = F.BONUS,
		[ 27663] = F.BONUS,
		[ 27664] = F.BONUS,
		[ 27665] = F.BONUS,
		[ 27666] = F.BONUS,
		[ 27667] = F.BONUS,
		[ 30155] = F.BONUS,
		[ 33052] = F.BONUS,
		[ 33867] = F.BONUS,
		[ 34762] = F.BONUS,
		[ 34763] = F.BONUS,
		[ 34764] = F.BONUS,
		[ 34765] = F.BONUS,
		[ 34766] = F.BONUS,
		[ 34767] = F.BONUS,
		[ 34768] = F.BONUS,
		[ 34769] = F.BONUS,
		[ 37452] = F.BONUS,
		[ 39691] = F.BONUS,
		[ 42942] = F.BONUS,
		[ 42993] = F.BONUS,
		[ 42996] = F.BONUS,
		[ 42998] = F.BONUS,
		[ 42999] = F.BONUS,
		[ 43000] = F.BONUS,
		[ 43268] = F.BONUS,
		[ 43491] = F.BONUS,
		[ 43492] = F.BONUS,
		[ 43572] = F.BONUS,
		[ 43652] = F.BONUS,
		[ 62651] = F.BONUS,
		[ 62652] = F.BONUS,
		[ 62654] = F.BONUS,
		[ 62655] = F.BONUS,
		[ 62656] = F.BONUS,
		[ 62657] = F.BONUS,
		[ 62659] = F.BONUS,
		[ 62660] = F.BONUS,
		[ 62661] = F.BONUS,
		[ 62663] = F.BONUS,
		[ 62666] = F.BONUS,
		[ 62667] = F.BONUS,
		[ 62668] = F.BONUS,
		[ 62669] = F.BONUS,
		[ 62671] = F.BONUS,
		[ 74609] = F.BONUS,
		[ 74644] = F.BONUS,
		[ 74645] = F.BONUS,
		[ 74651] = F.BONUS,
		[ 74652] = F.BONUS,
		[ 74655] = F.BONUS,
		[ 81175] = F.BONUS,
		[ 81402] = F.BONUS,
		[ 81410] = F.BONUS,
		[ 85504] = F.BONUS,
		[ 86073] = F.BONUS,
		[  2674] = F.INEDIBLE,
		[  2675] = F.INEDIBLE,
		[  4603] = F.INEDIBLE,
		[  4655] = F.INEDIBLE,
		[  5468] = F.INEDIBLE,
		[  5503] = F.INEDIBLE,
		[  5504] = F.INEDIBLE,
		[  6289] = F.INEDIBLE,
		[  6291] = F.INEDIBLE,
		[  6303] = F.INEDIBLE,
		[  6308] = F.INEDIBLE,
		[  6317] = F.INEDIBLE,
		[  6361] = F.INEDIBLE,
		[  6362] = F.INEDIBLE,
		[  6889] = F.INEDIBLE,
		[  7974] = F.INEDIBLE,
		[  8365] = F.INEDIBLE,
		[ 12206] = F.INEDIBLE,
		[ 12207] = F.INEDIBLE,
		[ 13754] = F.INEDIBLE,
		[ 13755] = F.INEDIBLE,
		[ 13756] = F.INEDIBLE,
		[ 13758] = F.INEDIBLE,
		[ 13759] = F.INEDIBLE,
		[ 13760] = F.INEDIBLE,
		[ 13888] = F.INEDIBLE,
		[ 13889] = F.INEDIBLE,
		[ 13890] = F.INEDIBLE,
		[ 13893] = F.INEDIBLE,
		[ 15924] = F.INEDIBLE,
		[ 24477] = F.INEDIBLE,
		[ 27422] = F.INEDIBLE,
		[ 27425] = F.INEDIBLE,
		[ 27429] = F.INEDIBLE,
		[ 27435] = F.INEDIBLE,
		[ 27437] = F.INEDIBLE,
		[ 27438] = F.INEDIBLE,
		[ 27439] = F.INEDIBLE,
		[ 27515] = F.INEDIBLE,
		[ 27516] = F.INEDIBLE,
		[ 33823] = F.INEDIBLE,
		[ 33824] = F.INEDIBLE,
		[ 36782] = F.INEDIBLE,
		[ 40199] = F.INEDIBLE,
		[ 41800] = F.INEDIBLE,
		[ 41801] = F.INEDIBLE,
		[ 41802] = F.INEDIBLE,
		[ 41803] = F.INEDIBLE,
		[ 41805] = F.INEDIBLE,
		[ 41806] = F.INEDIBLE,
		[ 41807] = F.INEDIBLE,
		[ 41808] = F.INEDIBLE,
		[ 41809] = F.INEDIBLE,
		[ 41810] = F.INEDIBLE,
		[ 41812] = F.INEDIBLE,
		[ 41813] = F.INEDIBLE,
		[ 41814] = F.INEDIBLE,
		[ 53062] = F.INEDIBLE,
		[ 53063] = F.INEDIBLE,
		[ 53064] = F.INEDIBLE,
		[ 53066] = F.INEDIBLE,
		[ 53067] = F.INEDIBLE,
		[ 53068] = F.INEDIBLE,
		[ 53069] = F.INEDIBLE,
		[ 53070] = F.INEDIBLE,
		[ 53071] = F.INEDIBLE,
		[ 53072] = F.INEDIBLE,
		[ 62791] = F.INEDIBLE,
		[ 74856] = F.INEDIBLE,
		[ 74857] = F.INEDIBLE,
		[ 74859] = F.INEDIBLE,
		[ 74860] = F.INEDIBLE,
		[ 74861] = F.INEDIBLE,
		[ 74863] = F.INEDIBLE,
		[ 74865] = F.INEDIBLE,
		[ 74865] = F.INEDIBLE,
		[ 74866] = F.INEDIBLE,

		-- Warlords
		[111456] = F.BASIC, -- Grilled Saberfish 
		[124669] = F.BASIC, -- Darkmoon Daggermaw 
		[111439] = F.BONUS, -- (sta) Steamed Scorpion 
		[111441] = F.BONUS, -- (critstrkrtng) Grilled Gulper 
		[111442] = F.BONUS, -- (hastertng) Sturgeon Stew 
		[111444] = F.BONUS, -- (mastrtng) Fat Sleeper Cakes 
		[111445] = F.BONUS, -- (critstrkrtng) Fiery Calamari 
		[111446] = F.BONUS, -- Skulker Chowder 
		[122343] = F.BONUS, -- (mastrtng) Sleeper Sushi 
		[122344] = F.BONUS, -- (critstrkrtng) Salty Squid Roll 
		[122345] = F.BONUS, -- (critstrkrtng) Pickled Eel 
		[122346] = F.BONUS, -- Jumbo Sea Dog 
		[122347] = F.BONUS, -- (sta) Whiptail Fillet 
		[122348] = F.BONUS, -- (hastertng) Buttered Sturgeon 
		[118416] = F.BONUS, -- Fish Roe 
		[118424] = F.BONUS, -- Blind Palefish 
		[114238] = F.BONUS, -- Spiced Barbed Trout 
		[126934] = F.BONUS, -- Lemon Herb Filet 
		[109137] = F.INEDIBLE, -- Crescent Saberfish Flesh 
		[109138] = F.INEDIBLE, -- Jawless Skulker Flesh 
		[109139] = F.INEDIBLE, -- Fat Sleeper Flesh 
		[109140] = F.INEDIBLE, -- Blind Lake Sturgeon Flesh 
		[109141] = F.INEDIBLE, -- Fire Ammonite Tentacle 
		[109142] = F.INEDIBLE, -- Sea Scorpion Segment 
		[109143] = F.INEDIBLE, -- Abyssal Gulper Eel Flesh 
		[109144] = F.INEDIBLE, -- Blackwater Whiptail Flesh 
		
		-- Legion
		[133575] = F.BASIC, -- (manargn) Dried Mackerel Strips 
		[136546] = F.BASIC, -- Fresh Crawler Salad 
		[136547] = F.BASIC, -- Deep Sea Queenfish Cakes 
		[136548] = F.BASIC, -- Dried Barracuda Chips 
		[138290] = F.BASIC, -- Grilled Mini Rays 
		[140206] = F.BASIC, -- Grilled 'Wild' Mini Rays 
		[140302] = F.BASIC, -- Arcway Bisque 
		[133567] = F.BONUS, -- (mastrtng) Barracuda Mrglgagh 
		[133568] = F.BONUS, -- Koi-Scented Stormray 
		[133569] = F.BONUS, -- Drogbar-Style Salmon 
		[133572] = F.BONUS, -- (mastrtng) Nightborne Delicacy Platter 
		[133573] = F.BONUS, -- Seed-Battered Fish Plate 
		[133574] = F.BONUS, -- Fishbrul Special 
		[133577] = F.BONUS, -- Fighter Chow 
		[133561] = F.BONUS, -- (hastertng) Deep-Fried Mossgill 
		[133562] = F.BONUS, -- (mastrtng) Pickled Stormray 
		[141214] = F.BASIC, -- Mana-Eel Eggs 
		[138285] = F.BASIC, -- Blue-Tail Bites 
		[133981] = F.BASIC, -- Raw Cavescale 
		[135557] = F.BASIC, -- Inferno Curry Crab Legs 
		[140341] = F.BASIC, -- Wild Poached Emperor Salmon 
		[124107] = F.INEDIBLE, -- Cursed Queenfish 
		[124108] = F.INEDIBLE, -- Mossgill Perch 
		[124109] = F.INEDIBLE, -- Highmountain Salmon 
		[124110] = F.INEDIBLE, -- Stormray 
		[124111] = F.INEDIBLE, -- Runescale Koi 
		[124112] = F.INEDIBLE, -- Black Barracuda 
		[133607] = F.INEDIBLE, -- Silver Mackerel 
		
	},
	[FOM_DIET_BREAD] = {
		-- Mists and before
		[ 34062] = F.CONJURED,
		[ 43518] = F.CONJURED,
		[ 43523] = F.CONJURED,
		[ 65499] = F.CONJURED,
		[ 65500] = F.CONJURED,
		[ 65515] = F.CONJURED,
		[ 65516] = F.CONJURED,
		[ 65517] = F.CONJURED,
		[ 70924] = F.CONJURED,
		[ 70925] = F.CONJURED,
		[ 70926] = F.CONJURED,
		[ 70927] = F.CONJURED,
		[  4540] = F.BASIC,
		[  4541] = F.BASIC,
		[  4542] = F.BASIC,
		[  4544] = F.BASIC,
		[  4601] = F.BASIC,
		[  8950] = F.BASIC,
		[ 13724] = F.BASIC,
		[ 16169] = F.BASIC,
		[ 19301] = F.BASIC,
		[ 19696] = F.BASIC,
		[ 20857] = F.BASIC,
		[ 23160] = F.BASIC,
		[ 24072] = F.BASIC,
		[ 27855] = F.BASIC,
		[ 28486] = F.BASIC,
		[ 29394] = F.BASIC,
		[ 29449] = F.BASIC,
		[ 30816] = F.BASIC,
		[ 33449] = F.BASIC,
		[ 34780] = F.BASIC,
		[ 35950] = F.BASIC,
		[ 42428] = F.BASIC,
		[ 42429] = F.BASIC,
		[ 42430] = F.BASIC,
		[ 42431] = F.BASIC,
		[ 42432] = F.BASIC,
		[ 42433] = F.BASIC,
		[ 42434] = F.BASIC,
		[ 42778] = F.BASIC,
		[ 44609] = F.BASIC,
		[ 58260] = F.BASIC,
		[ 58261] = F.BASIC,
		[ 81406] = F.BASIC,
		[ 82450] = F.BASIC,
		[ 82451] = F.BASIC,
		[ 86026] = F.BASIC,
		[ 86069] = F.BASIC,
		[ 90457] = F.BASIC,
		[  2683] = F.BONUS,
		[  3666] = F.BONUS,
		[ 17197] = F.BONUS,
		[ 43490] = F.BONUS,
		[ 33924] = F.BONUS,
		[ 81400] = F.BONUS,
		[ 81408] = F.BONUS,
		[ 81406] = F.BONUS,
		[ 86026] = F.BONUS,
		[ 86069] = F.BONUS,
		[ 90457] = F.BONUS,

		-- Warlords
		[113509] = F.CONJURED, -- Conjured Mana Fritter 
		[115351] = F.BASIC, -- \"Rylak Claws\" 
		[117469] = F.BASIC, -- Sugar Dusted Choux Twist 
		[117470] = F.BASIC, -- Thirteen Grain Loaf 
		[117471] = F.BASIC, -- Cocoa Flatcakes 
		[112449] = F.BASIC, -- Iron Horde Rations 
		[116408] = F.BONUS, -- (sta) Herb-Infused Stuffing 
		[116409] = F.BONUS, -- (critstrkrtng) Gourmet Pumpkin Pie 
		
		-- Legion
		[128835] = F.BASIC, -- Highmountain Fry Bread 
		[128846] = F.BASIC, -- Tiramisu 
		[128847] = F.BASIC, -- Lovingly Crafted Carrot Cake 
		[136549] = F.BASIC, -- Airy Biscuits 
		[136557] = F.BASIC, -- Passionfruit Tart 
		[136558] = F.BASIC, -- Carefully Wrapped Cupcake 
		[136559] = F.BASIC, -- Imp Chip Cookie 
		[140273] = F.BASIC, -- Honey Croissant 
		[140275] = F.BASIC, -- Val'sharah Berry Pie 
		[140299] = F.BASIC, -- Magistrix Mix 
		[140301] = F.BASIC, -- Mana Biscuit 
		[128836] = F.BASIC, -- Barley Bread 
		[128845] = F.BASIC, -- Sweet Rice Cake 
		[138976] = F.BASIC, -- Stale Thundertotem Rice Cake 
		[138977] = F.BASIC, -- Thundertotem Rice Cake 
		[140276] = F.BASIC, -- Dalaran Rice Pudding 
		[140626] = F.BASIC, -- Frosted Mini-Brans 
		[132752] = F.BASIC, -- Illidari Rations 
		[132753] = F.BASIC, -- Legion Rations 
		
		-- temp parking for unguessable
		[140286] = F.BASIC, -- Nightbites 
		[140296] = F.BASIC, -- Gummy Wyrm 
		[140297] = F.BASIC, -- Shal'dorice Cream 
		[140627] = F.BASIC, -- Rockbites 
		[140679] = F.BASIC, -- NeverMelt Ice Cream 
		[141206] = F.BASIC, -- Slice of Night Delight 
		[141207] = F.BASIC, -- J'llah Suspension 
		[128848] = F.BASIC, -- Roasted Maize 
		[138987] = F.BASIC, -- Butterhoof Can't Believe It's Butter 
		
	},
	[FOM_DIET_CHEESE] = {
		-- Mists and before
		[   414] = F.BASIC,
		[   422] = F.BASIC,
		[  1707] = F.BASIC,
		[  2070] = F.BASIC,
		[  3927] = F.BASIC,
		[  8932] = F.BASIC,
		[ 17406] = F.BASIC,
		[ 27857] = F.BASIC,
		[ 29448] = F.BASIC,
		[ 30458] = F.BASIC,
		[ 33443] = F.BASIC,
		[ 35952] = F.BASIC,
		[ 44607] = F.BASIC,
		[ 44608] = F.BASIC,
		[ 44749] = F.BASIC,
		[ 58258] = F.BASIC,
		[ 58259] = F.BASIC,
		[ 81414] = F.BASIC,
		[ 81921] = F.BASIC,
		[ 81922] = F.BASIC,
		[  3665] = F.BONUS,
		[ 12218] = F.BONUS,
		[ 81401] = F.BONUS,
		[ 81414] = F.BONUS,

		-- Warlords
		[115352] = F.BASIC, -- Telmor-Aruuna Hard Cheese 
		
		-- Legion
		[128764] = F.BASIC, -- Moist Azsunian Feta 
		[136544] = F.BASIC, -- Gjetost Slice 
		[138978] = F.BASIC, -- High Fiber Gouda 
		[140205] = F.BASIC, -- 'Fresh' Moist Azsunian Feta 
		[128763] = F.BASIC, -- Pungent Vrykul Gamalost 
		[138973] = F.BASIC, -- Pungent and Moldy Gamalost 
		[138979] = F.BASIC, -- Spicy Sharp Cheddar 
		[138980] = F.BASIC, -- Butterhoof Singles 
		[140339] = F.BASIC, -- Hormone Free - Alterac Swiss 

	},
	[FOM_DIET_FRUIT] = {
		-- Mists and before
		[  4536] = F.BASIC,
		[  4537] = F.BASIC,
		[  4538] = F.BASIC,
		[  4539] = F.BASIC,
		[  4602] = F.BASIC,
		[  8953] = F.BASIC,
		[ 16168] = F.BASIC,
		[ 19994] = F.BASIC,
		[ 20031] = F.BASIC,
		[ 21030] = F.BASIC,
		[ 21031] = F.BASIC,
		[ 21033] = F.BASIC,
		[ 22324] = F.BASIC,
		[ 27856] = F.BASIC,
		[ 28112] = F.BASIC,
		[ 29393] = F.BASIC,
		[ 29450] = F.BASIC,
		[ 35948] = F.BASIC,
		[ 35949] = F.BASIC,
		[ 37252] = F.BASIC,
		[ 40356] = F.BASIC,
		[ 43087] = F.BASIC,
		[ 58264] = F.BASIC,
		[ 58265] = F.BASIC,
		[ 58278] = F.BASIC,
		[ 60267] = F.BASIC,
		[ 74643] = F.BASIC,
		[ 75026] = F.BASIC,
		[ 79320] = F.BASIC,
		[ 81919] = F.BASIC,
		[ 81920] = F.BASIC,
		[ 86057] = F.BASIC,
		[ 86074] = F.BASIC,
		[ 11950] = F.BONUS,
		[ 13810] = F.BONUS,
		[ 20516] = F.BONUS,
		[ 24009] = F.BONUS,
		[ 32721] = F.BONUS,
		[ 74643] = F.BONUS,
		[ 79320] = F.BONUS,
		[ 81403] = F.BONUS,
		[ 81411] = F.BONUS,
		[ 86074] = F.BONUS,
		[ 74840] = F.INEDIBLE,
		[ 74841] = F.INEDIBLE,
		[ 74842] = F.INEDIBLE,
		[ 74843] = F.INEDIBLE,
		[ 74844] = F.INEDIBLE,
		[ 74846] = F.INEDIBLE,
		[ 74847] = F.INEDIBLE,
		[ 74848] = F.INEDIBLE,
		[ 74849] = F.INEDIBLE,
		[ 74850] = F.INEDIBLE,
		
		-- Warlords
		[115353] = F.BASIC, -- Tanaan Sweetmelon 
		[117454] = F.BASIC, -- Gorgrond Grapes 
		[117457] = F.BASIC, -- Blood Apples 
		[113290] = F.BASIC, -- Spirevine Fruit 
		[112095] = F.BASIC, -- Half-Eaten Banana 
		[118273] = F.BONUS, -- (hastertng) Perfect O'ruk Orange 
		[118274] = F.BONUS, -- (mastrtng) Perfect Fuzzy Pear 
		[118268] = F.BONUS, -- (mastrtng) Fuzzy Pear 
		[118269] = F.BONUS, -- (critstrkrtng) Greenskin Apple 
		[118270] = F.BONUS, -- (hastertng) O'ruk Orange 
		[118271] = F.BONUS, -- Ironpeel Plantain 
		[118272] = F.BONUS, -- (critstrkrtng) Giant Nagrand Cherry 
		[118275] = F.BONUS, -- (critstrkrtng) Perfect Nagrand Cherry 
		[118276] = F.BONUS, -- (critstrkrtng) Perfect Greenskin Apple 
		[118277] = F.BONUS, -- Perfect Ironpeel Plantain 
		[116405] = F.BONUS, -- Congealed Cranberry Chutney 
		[116406] = F.BONUS, -- (hastertng) Twice-Baked Sweet Potato 
		[111842] = F.BONUS, -- (health) Star Root Tuber 
		
		-- Legion
		[128851] = F.BASIC, -- Roasted Juicycrunch Carrots 
		[128838] = F.BASIC, -- Foxberries 
		[128844] = F.BASIC, -- Dried Mango 
		[136553] = F.BASIC, -- Azsunian Raisins 
		[136554] = F.BASIC, -- Lingonberry Fruit Leather 
		[136560] = F.BASIC, -- Condensed Mana Sparks 
		[138291] = F.BASIC, -- Tart Green Apple 
		[140184] = F.BASIC, -- Good Batch of Fruit 
		[140300] = F.BASIC, -- Fresh Arcfruit 
		[140352] = F.BASIC, -- Dreamberries 
		[140631] = F.BASIC, -- Nightpear 
		[128761] = F.BASIC, -- Azsunian Olives 
		[128837] = F.BASIC, -- Dried Bilberries 
		[128843] = F.BASIC, -- Azsunian Grapes 
		[138972] = F.BASIC, -- Bilberry Preserves 
		[139344] = F.BASIC, -- Mana Banana 
		[140201] = F.BASIC, -- 'Organic' Azsunian Grapes 
		[124036] = F.BASIC, -- Juicy Apple 
		[140355] = F.BASIC, -- (manargn) Laden Apple 
		
	},
	[FOM_DIET_FUNGUS] = {
		-- Mists and before
		[  3448] = F.BASIC,
		[  4604] = F.BASIC,
		[  4605] = F.BASIC,
		[  4606] = F.BASIC,
		[  4607] = F.BASIC,
		[  4608] = F.BASIC,
		[  8948] = F.BASIC,
		[ 27859] = F.BASIC,
		[ 29453] = F.BASIC,
		[ 30355] = F.BASIC,
		[ 33452] = F.BASIC,
		[ 35947] = F.BASIC,
		[ 41751] = F.BASIC,
		[ 58266] = F.BASIC,
		[ 58267] = F.BASIC,
		[ 58279] = F.BASIC,
		[ 59228] = F.BASIC,
		[ 81889] = F.BASIC,
		[ 81916] = F.BASIC,
		[ 24539] = F.BONUS,
		[ 24008] = F.BONUS,
		[ 81404] = F.BONUS,
		[ 81412] = F.BONUS,
		[ 27676] = F.INEDIBLE,

		-- Warlords
		[115354] = F.BASIC, -- Sliced Zangar Buttons 
		
		-- Legion
		[136550] = F.BASIC, -- Deepearth Root Straws 
		[141208] = F.BASIC, -- Midnight Morel 
		[113099] = F.BASIC, -- Shadowcap Mushrooms 
		
	},
	[FOM_DIET_MECH] = {
		-- Engineering Parts up through Warlords... most of them just a guess for now.
		[  4357] = F.INEDIBLE, -- Rough Blasting Powder 
		[  4359] = F.INEDIBLE, -- Handful of Copper Bolts 
		[  4364] = F.INEDIBLE, -- Coarse Blasting Powder 
		[  4371] = F.INEDIBLE, -- Bronze Tube 
		[  4375] = F.INEDIBLE, -- Whirring Bronze Gizmo 
		[  4377] = F.INEDIBLE, -- Heavy Blasting Powder 
		[  4382] = F.INEDIBLE, -- Bronze Framework 
		[  4387] = F.INEDIBLE, -- Iron Strut 
		[  4389] = F.INEDIBLE, -- Gyrochronatom 
		[  4404] = F.INEDIBLE, -- Silver Contact 
		[  7191] = F.INEDIBLE, -- Fused Wiring 
		[ 10505] = F.INEDIBLE, -- Solid Blasting Powder 
		[ 10558] = F.INEDIBLE, -- Gold Power Core 
		[ 10559] = F.INEDIBLE, -- Mithril Tube 
		[ 10560] = F.INEDIBLE, -- Unstable Trigger 
		[ 10561] = F.INEDIBLE, -- Mithril Casing 
		[ 15992] = F.INEDIBLE, -- Dense Blasting Powder 
		[ 15994] = F.INEDIBLE, -- Thorium Widget 
		[ 16000] = F.INEDIBLE, -- Thorium Tube 
		[ 16006] = F.INEDIBLE, -- Delicate Arcanite Converter 
		[ 18631] = F.INEDIBLE, -- Truesilver Transformer 
		[ 23781] = F.INEDIBLE, -- Elemental Blasting Powder 
		[ 23782] = F.INEDIBLE, -- Fel Iron Casing 
		[ 23783] = F.INEDIBLE, -- Handful of Fel Iron Bolts 
		[ 23784] = F.INEDIBLE, -- Adamantite Frame 
		[ 23785] = F.INEDIBLE, -- Hardened Adamantite Tube 
		[ 23786] = F.INEDIBLE, -- Khorium Power Core 
		[ 23787] = F.INEDIBLE, -- Felsteel Stabilizer 
		[ 32423] = F.INEDIBLE, -- Icy Blasting Primers 
		[ 39681] = F.INEDIBLE, -- Handful of Cobalt Bolts 
		[ 39682] = F.INEDIBLE, -- Overcharged Capacitor 
		[ 39683] = F.INEDIBLE, -- Froststeel Tube 
		[ 39690] = F.INEDIBLE, -- Volatile Blasting Trigger 
		[ 60224] = F.INEDIBLE, -- Handful of Obsidium Bolts 
		[ 67749] = F.INEDIBLE, -- Electrified Ether 
		[ 77467] = F.INEDIBLE, -- Ghost Iron Bolts 
		[ 77468] = F.INEDIBLE, -- High-Explosive Gunpowder 
		[ 90146] = F.INEDIBLE, -- Tinker's Kit 
		[ 94113] = F.INEDIBLE, -- Jard's Peculiar Energy Source 
		
		-- Plus others that have been tested
		[   814] = F.INEDIBLE, -- Flask of Oil
	},
};