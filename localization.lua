-----------------------------------------------------
-- localization.lua
-- English strings by default, localizations override with their own.
------------------------------------------------------

-- Diet names. These should be the six diets returned from GetPetFoodTypes() and shown in the Pet tab of the character window (when mousing over the happy icon). 
-- (Want to get them all nice and quick for your localization? Go tame a bear or boar... they eat anything.)
-- THESE STRINGS MUST BE LOCALIZED for Feed-O-Matic to work properly in other locales.
FOM_DIET_MEAT					= "Meat"
FOM_DIET_FISH					= "Fish"
FOM_DIET_BREAD					= "Bread"
FOM_DIET_CHEESE					= "Cheese"
FOM_DIET_FRUIT					= "Fruit"
FOM_DIET_FUNGUS					= "Fungus"

-- Beast family names; we use these to provide optional pet-specific feeding emotes (see FeedOMatic_Emotes.lua)
FOM_BAT							= "Bat"
FOM_BEAR						= "Bear"
FOM_BIRD_OF_PREY				= "Bird of Prey"        	-- WotLK
FOM_BOAR						= "Boar"                	
FOM_CARRION_BIRD				= "Carrion Bird"        	
FOM_CAT							= "Cat"                 	
FOM_CHIMAERA					= "Chimaera"            	-- WotLK exotic
FOM_CORE_HOUND					= "Core Hound"          	-- WotLK exotic
FOM_CRAB						= "Crab"                	
FOM_CROCOLISK					= "Crocolisk"           	
FOM_DEVILSAUR					= "Devilsaur"           	-- WotLK exotic
FOM_DRAGONHAWK					= "Dragonhawk"          	-- BC
FOM_GORILLA						= "Gorilla"             	
FOM_HYENA						= "Hyena"               	
FOM_MOTH						= "Moth"                	-- WotLK
FOM_NETHER_RAY					= "Nether Ray"          	-- BC
FOM_RAPTOR						= "Raptor"              	
FOM_RAVAGER						= "Ravager"             	-- BC
FOM_RHINO						= "Rhino"               	-- WotLK exotic
FOM_SCORPID						= "Scorpid"             	
FOM_SERPENT						= "Serpent"             	-- BC
FOM_SILITHID					= "Silithid"            	-- WotLK exotic
FOM_SPIDER						= "Spider"              	
FOM_SPIRIT_BEAST				= "Spirit Beast"        	-- WotLK exotic
FOM_SPOREBAT					= "Sporebat"            	-- BC
FOM_TALLSTRIDER					= "Tallstrider"         	
FOM_TURTLE						= "Turtle"              	
FOM_WARP_STALKER				= "Warp Stalker"			-- BC
FOM_WASP						= "Wasp"                	-- WotLK
FOM_WIND_SERPENT				= "Wind Serpent"        	
FOM_WOLF						= "Wolf"                	
FOM_WORM						= "Worm"                	-- WotLK exotic
FOM_DOG							= "Dog"                     -- Cataclysm
FOM_BEETLE						= "Beetle"                  -- Cataclysm
FOM_SHALE_SPIDER				= "Shale Spider"            -- Cataclysm exotic
FOM_FOX							= "Fox"                     -- Cataclysm
FOM_MONKEY						= "Monkey"                  -- Cataclysm

-- From here on down, the localized strings are just for readability... they don't affect whether Feed-O-Matic works.

FOM_BUTTON_TOOLTIP1				= "Left-Click to Feed Pet:"
FOM_BUTTON_TOOLTIP1_FALLBACK	= "Alt-Left-Click to Feed Pet:"
FOM_BUTTON_TOOLTIP2				= "<Right-Click for Options>"
FOM_BUTTON_TOOLTIP_NOFOOD		= "Cannot Feed Pet"

-- Used in tooltips to indicate food quality.
FOM_QUALITY_UNDER				= "%s doesn't like this anymore."
FOM_QUALITY_WILL				= "%s will eat this."
FOM_QUALITY_LIKE				= "%s likes to eat this."
FOM_QUALITY_LOVE				= "%s loves to eat this."

-- User-visible errors
FOM_ERROR_NO_FOOD				= "Found no food for %s."
FOM_ERROR_NO_FOOD_NO_FALLBACK	= "Found no food for %s that you haven't told Feed-O-Matic to avoid."
FOM_FALLBACK_MESSAGE			= "Hold Alt while pressing the Feed Pet button or key to feed %s anyway."

-- Feeding status messages
FOM_FEEDING_EAT					= "Feeding %s a %s..."
FOM_FEEDING_FEED				= "feeds %s a %s. "

-- Options panel
FOM_OPTIONS_GENERAL				= "General Options"
FOM_OPTIONS_PROFILE				= "Options Profile"
FOM_OPTIONS_SUBTEXT				= "To feed your pet with Feed-O-Matic, click the button next to your pet's health bar, bind a key to Feed Pet in the Key Bindings menu, or put '/click FOM_FeedButton' in a macro."

FOM_FOOD_QUALITY_INFO			= "Foods of a level closer to your pet's restore more health.\n"
FOM_OPTIONS_TOOLTIP				= "Show food quality in tooltips"
FOM_OPTIONS_TOOLTIP_TIP			= FOM_FOOD_QUALITY_INFO.."If enabled, food item tooltips show a quick summary of how much the food will restore your pet's health."
FOM_OPTIONS_LOW_LVL_1ST			= "Prefer lower-level foods"
FOM_OPTIONS_LOW_LVL_1ST_TIP		= FOM_FOOD_QUALITY_INFO.."Enable this option and your pet will quickly dispose of lower-quality foods but require feeding more often.\nDisable it and your pet will require feeding less often, but your inventory may quickly fill with less-useful foods."
FOM_OPTIONS_AVOID_QUEST			= "Avoid foods needed for quests"
FOM_OPTIONS_AVOID_QUEST_TIP		= "Some quests require collecting items which are also edible by pets. Enable this option to prevent your pet's appetite from interfering with your quest progress."
FOM_OPTIONS_NO_BUTTON			= "Hide Feed Pet button"
FOM_OPTIONS_NO_BUTTON_TIP		= "Don't show the button Feed-O-Matic normally puts next to your pet's health bar.\n(You might find this option useful if using a UI that changes/hides the default pet frame.)"
                            	                            	
FOM_OPTIONS_FEED_NOTIFY 		= "Notify when feeding:"
FOM_OPTIONS_NOTIFY_EMOTE		= "With an emote"
FOM_OPTIONS_NOTIFY_TEXT			= "In chat window"
FOM_OPTIONS_NOTIFY_NONE			= "Don't notify"

FOM_OPTIONS_FOODS_TITLE			= "Food Preferences"
FOM_OPTIONS_FOODS_TEXT			= "Uncheck individul foods (or food categories) below to prevent Feed-O-Matic from feeding them to your pet.\nFeed-O-Matic will prefer to use foods from categories closer to the top of the list."

FOM_OPTIONS_FOODS_NAME			= "Food"
FOM_OPTIONS_FOODS_COOKING		= "Ingredient for"

FOM_OPTIONS_FOODS_CONJURED		= "Conjured Foods"
FOM_OPTIONS_FOODS_CONJ_COMBO	= "Conjured Mana Restoring Foods"
FOM_OPTIONS_FOODS_BASIC			= "Basic Foods"
FOM_OPTIONS_FOODS_COMBO			= "Mana Restoring Foods"
FOM_OPTIONS_FOODS_BONUS			= "“Well Fed” Foods"
FOM_OPTIONS_FOODS_INEDIBLE		= "Raw Foods"

FOM_OPTIONS_FOODS_ONLY_PET		= "Only show foods for my pet"
FOM_OPTIONS_FOODS_ONLY_PET_TIP	= "Filters the list to show only foods a level %d %s will eat" -- e.g. level 80 Gorilla
FOM_OPTIONS_FOODS_ONLY_LVL_TIP	= "Filters the list to show only foods a level %d pet can eat"
FOM_OPTIONS_FOODS_ONLY_INV		= "Only show foods in my inventory"

FOM_DIFFICULTY_HEADER			= "Recipe status:"                            	
FOM_DIFFICULTY_1   				= "Trivial"
FOM_DIFFICULTY_2   				= "Easy"
FOM_DIFFICULTY_3				= "Medium"
FOM_DIFFICULTY_4				= "Difficult"
FOM_DIFFICULTY_5	   			= "Unknown"


------------------------------------------------------

-- TODO: ptBR, also split localization & locale support

------------------------------------------------------

if (GetLocale() == "frFR") then

-- Diet names. These should be the six diets returned from GetPetFoodTypes() and shown in the Pet tab of the character window (when mousing over the happy icon). 
-- THESE STRINGS MUST BE LOCALIZED for Feed-O-Matic to work properly in other locales.
FOM_DIET_MEAT					= "Viande"
FOM_DIET_FISH					= "Poisson"
FOM_DIET_BREAD					= "Pain"
FOM_DIET_CHEESE					= "Fromage"
FOM_DIET_FRUIT					= "Fruit"
FOM_DIET_FUNGUS					= "Champignon"

-- Beast family names; we use these to provide optional pet-specific feeding emotes (see FeedOMatic_Emotes.lua)
FOM_BAT							= "Chauve-souris"
FOM_BEAR						= "Ours"
FOM_BOAR						= "Sanglier"
FOM_CARRION_BIRD				= "Charognard"
FOM_CAT							= "Félin"
FOM_CRAB						= "Crabe"
FOM_CROCOLISK					= "Crocilisque"
FOM_GORILLA						= "Gorille"
FOM_HYENA						= "Hyène"
--FOM_RAPTOR						= "Raptor"				-- same as enUS
FOM_SCORPID						= "Scorpide"
FOM_SPIDER						= "Araignée"
FOM_TALLSTRIDER					= "Haut-trotteur"
FOM_TURTLE						= "Tortue"
FOM_WIND_SERPENT				= "Serpent des vents"
FOM_WOLF						= "Loup"
FOM_DRAGONHAWK					= "Faucon-dragon"			-- BC
FOM_NETHER_RAY					= "Raie du Néant"			-- BC
FOM_RAVAGER						= "Ravageur"				-- BC
--FOM_SERPENT						= "Serpent"				-- BC; same as enUS
FOM_SPOREBAT					= "Sporoptère"				-- BC
FOM_WARP_STALKER				= "Traqueur dimensionnel"	-- BC
FOM_BIRD_OF_PREY				= "Oiseau de proie"			-- WotLK
FOM_WASP						= "Guêpe"					-- WotLK
FOM_CHIMAERA					= "Chimère"					-- WotLK exotic
FOM_CORE_HOUND					= "Chien du Magma"			-- WotLK exotic
FOM_DEVILSAUR					= "Diablosaure"				-- WotLK exotic
FOM_MOTH						= "Phalène"					-- WotLK
FOM_RHINO						= "Rhinocéros"				-- WotLK exotic
FOM_SILITHID					= "Silithide"				-- WotLK exotic
FOM_SPIRIT_BEAST				= "Esprit de bête"			-- WotLK exotic
FOM_WORM						= "Ver"						-- WotLK exotic
FOM_DOG							= "Chien"                   -- Cataclysm
FOM_BEETLE						= "Hanneton"                -- Cataclysm
FOM_SHALE_SPIDER				= "Araignée de schiste"     -- Cataclysm exotic
FOM_FOX							= "Renard"                  -- Cataclysm
FOM_MONKEY						= "Singe"                   -- Cataclysm

-- From here on down, the localized strings are just for readability... they don't affect whether Feed-O-Matic works.

FOM_BUTTON_TOOLTIP1				= "<Clic-gauche pour nourrir %s>"
FOM_BUTTON_TOOLTIP1_FALLBACK	= "<Alt-clic-gauche pour nourrir %s à tout prix>"
FOM_BUTTON_TOOLTIP2				= "<Clic-droit pour les options de Feed-O-Matic>"

-- Used in tooltips to indicate food quality.
FOM_QUALITY_UNDER				= "%s n'en mange plus désormais."
FOM_QUALITY_WILL				= "%s en mangera."
FOM_QUALITY_LIKE				= "%s aime en manger."
FOM_QUALITY_LOVE				= "%s adore en manger."

-- User-visible errors
FOM_ERROR_NO_FOOD				= "%s n'a pas trouvé de nourriture dans votre sac."
FOM_ERROR_NO_FOOD_NO_FALLBACK	= "Impossible de trouver de la nourriture disponible dans vos sacs pour %s."
FOM_FALLBACK_MESSAGE			= "Maintenez ALT enfoncé pendant que vous appuyez sur le bouton ou sur la touche pour nourrir %s à tout prix."

-- Feeding status messages
FOM_FEEDING_EAT					= "%s mange un(e) %s."
FOM_FEEDING_FEED				= "donne à %s à manger un(e) %s. "
                        		
-- Options panel
FOM_OPTIONS_GENERAL				= "Options générales"
FOM_OPTIONS_PROFILE				= "Options du profil"
FOM_OPTIONS_SUBTEXT				= "Pour nourrir votre familier avec Feed-O-Matic, cliquez sur l'icone de satisfaction, associez une touche dans le menu des raccourcis, ou mettez '/click FOM_FeedButton' dans une macro."

FOM_OPTIONS_TOOLTIP				= "Afficher la qualité des nourritures dans l'infobulle"
FOM_OPTIONS_LOW_LVL_1ST			= "Préférer la nourriture bas niveau"
FOM_OPTIONS_AVOID_QUEST			= "Eviter celle nécessaire pour une quête"

FOM_OPTIONS_FEED_NOTIFY 		= "Notifier le repas :"
FOM_OPTIONS_NOTIFY_EMOTE		= "Avec un emote"
FOM_OPTIONS_NOTIFY_TEXT			= "Fenêtre de discussion"
FOM_OPTIONS_NOTIFY_NONE			= "Ne pas notifier"

FOM_OPTIONS_FOODS_TITLE			= "Préférences de nourriture"
FOM_OPTIONS_FOODS_TEXT			= "Décocher les nourritures ci-dessous pour empêcher Feed-O-Matic de les donner à manger à votre familier. Feed-O-Matic préfèrera donner les nourritures les plus hautes dans la liste."

FOM_OPTIONS_FOODS_NAME			= "Nourriture"
FOM_OPTIONS_FOODS_COOKING		= "Ingrédient pour"

FOM_OPTIONS_FOODS_CONJURED		= "Nourriture invoquée"
FOM_OPTIONS_FOODS_CONJ_COMBO	= "Nourriture invoquée complète (vie & mana)"
FOM_OPTIONS_FOODS_BASIC			= "Nourriture basique"
FOM_OPTIONS_FOODS_COMBO			= "Nourriture complète (vie & mana)"
FOM_OPTIONS_FOODS_BONUS			= "Nourriture à buff “Bien nourri”"
FOM_OPTIONS_FOODS_INEDIBLE		= "Nourriture crue"

FOM_OPTIONS_FOODS_ONLY_PET		= "Afficher la nourriture pour votre familier"
FOM_OPTIONS_FOODS_ONLY_PET_TIP	= "Filtrer la liste pour n'afficher que les nourritures qu'un(e) niveau %d %s peut manger" -- e.g. level 80 Gorilla
FOM_OPTIONS_FOODS_ONLY_LVL_TIP	= "Filtrer la liste pour n'afficher que les nourritures qu'un familier niveau %d peut manger"
FOM_OPTIONS_FOODS_ONLY_INV		= "Afficher la nourriture présente dans les sacs"

FOM_DIFFICULTY_HEADER			= "Difficulté de la recette :"
FOM_DIFFICULTY_1   				= "Triviale"
FOM_DIFFICULTY_2   				= "Facile"
FOM_DIFFICULTY_3				= "Moyenne"
FOM_DIFFICULTY_4				= "Difficile"
FOM_DIFFICULTY_5	   			= "Inconnue"

end

------------------------------------------------------

if (GetLocale() == "deDE") then

-- Diet names. These should be the six diets returned from GetPetFoodTypes() and shown in the Pet tab of the character window (when mousing over the happy icon). 
-- (Want to get them all nice and quick for your localization? Go tame a bear or boar... they eat anything.)
-- THESE STRINGS MUST BE LOCALIZED for Feed-O-Matic to work properly in other locales.
FOM_DIET_MEAT					= "Fleisch"
FOM_DIET_FISH					= "Fisch"
FOM_DIET_BREAD					= "Brot"
FOM_DIET_CHEESE					= "Käse"
FOM_DIET_FRUIT					= "Obst"
--	FOM_DIET_FUNGUS				= "Fungus"					-- same as enUS

-- Beast family names; we use these to provide optional pet-specific feeding emotes (see FeedOMatic_Emotes.lua)
FOM_BAT							= "Fledermaus"
FOM_BEAR						= "Bär"
FOM_BOAR						= "Eber"
FOM_CARRION_BIRD				= "Aasvogel"
FOM_CAT							= "Katze"
FOM_CRAB						= "Krebs"
FOM_CROCOLISK					= "Krokilisk"
--	FOM_GORILLA					= "Gorilla"					-- same as enUS
FOM_HYENA						= "Hyäne"
--	FOM_RAPTOR					= "Raptor"					-- same as enUS
FOM_SCORPID						= "Skorpid"
FOM_SPIDER						= "Spinne"
FOM_TALLSTRIDER					= "Weitschreiter"
FOM_TURTLE						= "Schildkröte"
FOM_WIND_SERPENT				= "Windnatter"
--	FOM_WOLF					= "Wolf"					-- same as enUS
FOM_DRAGONHAWK					= "Drachenfalke"			-- BC
FOM_NETHER_RAY					= "Netherrochen"			-- BC
FOM_RAVAGER						= "Felshetzer"				-- BC
FOM_SERPENT						= "Schlange"				-- BC
FOM_SPOREBAT					= "Sporensegler"			-- BC
FOM_WARP_STALKER				= "Sphärenjäger"			-- BC
FOM_BIRD_OF_PREY				= "Raubvogel"				-- WotLK
FOM_WASP						= "Wespe"					-- WotLK
FOM_CHIMAERA					= "Schimäre"				-- WotLK exotic
FOM_CORE_HOUND					= "Kernhund"				-- WotLK exotic
FOM_DEVILSAUR					= "Teufelssaurier"			-- WotLK exotic
FOM_MOTH						= "Motte"					-- WotLK
FOM_RHINO						= "Rhinozeros"				-- WotLK exotic
--	FOM_SILITHID				= "Silithid"				-- WotLK exotic; same as enUS
FOM_SPIRIT_BEAST				= "Geisterbestie"			-- WotLK exotic
FOM_WORM						= "Wurm"					-- WotLK exotic
FOM_DOG							= "Hund"                   -- Cataclysm
FOM_BEETLE						= "Käfer"                -- Cataclysm
FOM_SHALE_SPIDER				= "Schieferspinne"     -- Cataclysm exotic
FOM_FOX							= "Fuchs"                  -- Cataclysm
FOM_MONKEY						= "Affe"                   -- Cataclysm

-- From here on down, the localized strings are just for readability; they don't affect whether Feed-O-Matic works.

-- Used in tooltips to indicate food quality.
FOM_QUALITY_UNDER				= "%s mag das nicht mehr fressen."
FOM_QUALITY_WILL				= "%s mag das fressen."
FOM_QUALITY_LIKE				= "%s frisst das gerne."
FOM_QUALITY_LOVE				= "%s liebt es, das zu fressen."

-- User-visible errors
FOM_ERROR_NO_FOOD 				= "%s findet nichts zu fressen in Deinem Rucksack."

-- Feeding status messages
FOM_FEEDING_EAT  				= "%s frisst ein %s aus Deinem Rucksack."
FOM_FEEDING_FEED 				= "füttert %s ein %s. "

end

------------------------------------------------------

if (GetLocale() == "esES" or GetLocale() == "esMX") then

-- Diet names. These should be the six diets returned from GetPetFoodTypes() and shown in the Pet tab of the character window (when mousing over the happy icon). 
-- (Want to get them all nice and quick for your localization? Go tame a bear or boar... they eat anything.)
-- THESE STRINGS MUST BE LOCALIZED for Feed-O-Matic to work properly in other locales.
FOM_DIET_MEAT					= "Carne"
FOM_DIET_FISH					= "Pescado"
FOM_DIET_BREAD					= "Pan"
FOM_DIET_CHEESE					= "Queso"
FOM_DIET_FRUIT					= "Fruta"
FOM_DIET_FUNGUS					= "Hongo"

-- Beast family names; we use these to provide optional pet-specific feeding emotes (see FeedOMatic_Emotes.lua)
FOM_BAT							= "Murciélago"
FOM_BEAR						= "Oso"
FOM_BOAR						= "Jabalí"
FOM_CARRION_BIRD				= "Carroñero"
FOM_CAT							= "Felino"
FOM_CRAB						= "Cangrejo"
FOM_CROCOLISK					= "Crocolisco"
FOM_GORILLA						= "Gorila"
FOM_HYENA						= "Hiena"
--	FOM_RAPTOR					= "Raptor"					-- same as enUS
FOM_SCORPID						= "Escórpido"
FOM_SPIDER						= "Araña"
FOM_TALLSTRIDER					= "Zancaalta"
FOM_TURTLE						= "Tortuga"
FOM_WIND_SERPENT				= "Serpiente alada"
FOM_WOLF						= "Lobo"
FOM_DRAGONHAWK					= "Dracohalcón"				-- BC
FOM_NETHER_RAY					= "Raya abisal"				-- BC
FOM_RAVAGER						= "Devastador"				-- BC
FOM_SERPENT						= "Serpiente"				-- BC
FOM_SPOREBAT					= "Esporiélago"				-- BC
FOM_WARP_STALKER				= "Acechador deformado"		-- BC
FOM_BIRD_OF_PREY				= "Ave rapaz"				-- WotLK
FOM_WASP						= "Avispa"					-- WotLK
FOM_CHIMAERA					= "Quimera"					-- WotLK exotic
FOM_CORE_HOUND					= "Can del Núcleo"			-- WotLK exotic
FOM_DEVILSAUR					= "Demosaurio"				-- WotLK exotic
FOM_MOTH						= "Palomilla"				-- WotLK
FOM_RHINO						= "Rinoceronte"				-- WotLK exotic
FOM_SILITHID					= "Silítido"				-- WotLK exotic
FOM_SPIRIT_BEAST				= "Bestia espíritu"			-- WotLK exotic
FOM_WORM						= "Gusano"					-- WotLK exotic
FOM_DOG							= "Perro"                   -- Cataclysm
FOM_BEETLE						= "Alfazaque"                -- Cataclysm
FOM_SHALE_SPIDER				= "Araña de esquisto"     -- Cataclysm exotic
FOM_FOX							= "Zorro"                  -- Cataclysm
FOM_MONKEY						= "Mono"                   -- Cataclysm

-- From here on down, the localized strings are just for readability; they don't affect whether Feed-O-Matic works.

FOM_BUTTON_TOOLTIP1				= "<Left-Click para alimentar al pet %s>"
FOM_BUTTON_TOOLTIP1_FALLBACK	= "<Alt-Left-Click para Alimentar al pet %s>"
FOM_BUTTON_TOOLTIP2				= "<Right-Click para las opciones de Feed-O-Matic>"

-- Used in tooltips to indicate food quality.
FOM_QUALITY_UNDER				= "%s no le gusta."
FOM_QUALITY_WILL				= "%s podria comerlo."
FOM_QUALITY_LIKE				= "%s le gusta comerse esto."
FOM_QUALITY_LOVE				= "%s ama comer esto."

-- User-visible errors
FOM_ERROR_NO_FOOD				= "No fue posible encontrar una comida para %s."
FOM_ERROR_NO_FOOD_NO_FALLBACK	= "No fue posible encontrar ninguna comida en los bags para %s que no hayas dicho a Feed-O-Matic que deba evitar."
FOM_FALLBACK_MESSAGE			= "Presionar Alt mientras presionas el boton de Alimentar Pet o una tecla para alimentar %s de todas formas."

-- Feeding status messages
FOM_FEEDING_EAT					= "Alimentando %s a %s..." 
FOM_FEEDING_FEED				= "Alimentando %s con %s. "

end

------------------------------------------------------

if (GetLocale() == "ruRU") then

-- Diet names. These should be the six diets returned from GetPetFoodTypes() and shown in the Pet tab of the character window (when mousing over the happy icon). 
-- (Want to get them all nice and quick for your localization? Go tame a bear or boar... they eat anything.)
-- THESE STRINGS MUST BE LOCALIZED for Feed-O-Matic to work properly in other locales.
FOM_DIET_MEAT					= "Мясо"
FOM_DIET_FISH					= "Рыба"
FOM_DIET_BREAD					= "Хлеб"
FOM_DIET_CHEESE					= "Сыр"
FOM_DIET_FRUIT					= "Фрукты"
FOM_DIET_FUNGUS					= "Грибы"

-- Beast family names; we use these to provide optional pet-specific feeding emotes (see FeedOMatic_Emotes.lua)
FOM_BAT							= "Летучая мышь"
FOM_BEAR						= "Медведь"
FOM_BOAR						= "Вепрь"
FOM_CARRION_BIRD				= "Падальщик"
FOM_CAT							= "Кошка"
FOM_CRAB						= "Краб"
FOM_CROCOLISK					= "Кроколиск"
FOM_GORILLA						= "Горилла"
FOM_HYENA						= "Гиена"
FOM_RAPTOR						= "Ящер"
FOM_SCORPID						= "Скорпид"
FOM_SPIDER						= "Паук"
FOM_TALLSTRIDER					= "Долгоног"
FOM_TURTLE						= "Черепаха"
FOM_WIND_SERPENT				= "Крылатый змей"
FOM_WOLF						= "Волк"
FOM_DRAGONHAWK					= "Дракондор"				-- BC
FOM_NETHER_RAY					= "Скат Пустоты"			-- BC
FOM_RAVAGER						= "Опустошитель"			-- BC
FOM_SERPENT						= "Змей"					-- BC
FOM_SPOREBAT					= "Спороскат"				-- BC
FOM_WARP_STALKER				= "Прыгуана"				-- BC
FOM_BIRD_OF_PREY				= "Сова"					-- WotLK
FOM_WASP						= "Оса"						-- WotLK
FOM_CHIMAERA					= "Химера"					-- WotLK exotic
FOM_CORE_HOUND					= "Пес недр"				-- WotLK exotic
FOM_DEVILSAUR					= "Девизавр"				-- WotLK exotic
FOM_MOTH						= "Мотылек"					-- WotLK exotic
FOM_RHINO						= "Люторог"					-- WotLK exotic
FOM_SILITHID					= "Силитид"					-- WotLK exotic
FOM_SPIRIT_BEAST				= "Дух зверя"				-- WotLK exotic
FOM_WORM						= "Червь"					-- WotLK exotic
FOM_DOG							= "Собака"                   -- Cataclysm
FOM_BEETLE						= "Жук"                -- Cataclysm
FOM_SHALE_SPIDER				= "Сланцевый паук"     -- Cataclysm exotic
FOM_FOX							= "Лисица"                  -- Cataclysm
FOM_MONKEY						= "Обезьяна"                   -- Cataclysm

-- From here on down, the localized strings are just for readability; they don't affect whether Feed-O-Matic works.
FOM_BUTTON_TOOLTIP1				= "<Левык-Клик для кормление питомца %s>"
FOM_BUTTON_TOOLTIP1_FALLBACK	= "<Alt-Левык-Клик для кормление питомца %s>"
FOM_BUTTON_TOOLTIP2				= "<Правый-Клик для настроек Feed-O-Matic>"

-- Used in tooltips to indicate food quality.
FOM_QUALITY_UNDER				= "%s больше это не нравится."
FOM_QUALITY_WILL				= "%s будет этим питаться."
FOM_QUALITY_LIKE				= "%s нравится этим питаться."
FOM_QUALITY_LOVE				= "%s обожает этим питаться."

-- User-visible errors
FOM_ERROR_NO_FOOD				= "Не удалось найти каких-либо продуктов питания в ваших мешках для %s."
FOM_ERROR_NO_FOOD_NO_FALLBACK	= "Не удалось найти каких-либо продуктов питания в ваших мешках для %s, вы не указали Feed-O-Matic избегать данное положение."
FOM_FALLBACK_MESSAGE			= "Удерживайте Alt когда нажимаете кнопку кормления питомца или кнопку для кормления %s."

-- Feeding status messages
FOM_FEEDING_EAT					= "Кормление питомца, %s ест %s..."
FOM_FEEDING_FEED				= "кормит питомца, %s ест %s. "

-- Options panel
FOM_OPTIONS_SUBTEXT				= "Кормление вашего питомца с помощью F-O-M, кликните по иконке счастья питомца, назначте клавишу для кормления в меню назначения клавиш, или добавте макрос '/click FOM_FeedButton'."

FOM_OPTIONS_TOOLTIP				= "Отображать качетво пищи в подсказках"
FOM_OPTIONS_LOW_LVL_1ST			= "Предпочтительнее пища низкого-уровня"
FOM_OPTIONS_AVOID_QUEST			= "Исключать пищу котораю нужна для заданий"
                            	                            	
FOM_OPTIONS_FEED_NOTIFY 		= "Извещать при кормлении:"
FOM_OPTIONS_NOTIFY_EMOTE		= "Как эмоцию"
FOM_OPTIONS_NOTIFY_TEXT			= "В окно чата"
FOM_OPTIONS_NOTIFY_NONE			= "Не извещать"

FOM_OPTIONS_FOODS_TITLE			= "Преимущество питания"
FOM_OPTIONS_FOODS_TEXT			= "Ниже снимите отметку с характерной пищи (или с категории пищи) чтобы предотвратить кормления ею вашего питомца. Будет использоваться пищу из категории ближе к верхней части списка."

FOM_OPTIONS_FOODS_NAME			= "Пища"
FOM_OPTIONS_FOODS_COOKING		= "Продукты кулинарии"

FOM_OPTIONS_FOODS_CONJURED		= "Сотворенная пища"
FOM_OPTIONS_FOODS_CONJ_COMBO	= "Сотворенная пища восстановления маны"
FOM_OPTIONS_FOODS_BASIC			= "Обычная пища"
FOM_OPTIONS_FOODS_COMBO			= "Пища восстановления маны"
FOM_OPTIONS_FOODS_BONUS			= "“Сытость” пища"
FOM_OPTIONS_FOODS_INEDIBLE		= "Сырая пища"

FOM_OPTIONS_FOODS_ONLY_PET		= "Показывать только ту пищу которую будет кушать %s"
FOM_OPTIONS_FOODS_ONLY_LVL		= "Показывать только ту пищу которую будет кушать питомец в соответствии с моим уровнем"
FOM_OPTIONS_FOODS_ONLY_INV		= "Показывать только ту пищу которая в моём инвенторе"

FOM_DIFFICULTY_HEADER			= "Статус рецепта:"                            	
FOM_DIFFICULTY_1   				= "Обычное"
FOM_DIFFICULTY_2   				= "Легкий"
FOM_DIFFICULTY_3				= "Средний"
FOM_DIFFICULTY_4				= "Сложность"
FOM_DIFFICULTY_5	   			= "Неизвестный"

end

------------------------------------------------------

if (GetLocale() == "koKR") then

-- Diet names. These should be the six diets returned from GetPetFoodTypes() and shown in the Pet tab of the character window (when mousing over the happy icon). 
-- (Want to get them all nice and quick for your localization? Go tame a bear or boar... they eat anything.)
-- THESE STRINGS MUST BE LOCALIZED for Feed-O-Matic to work properly in other locales.
FOM_DIET_MEAT					= "고기"
FOM_DIET_FISH					= "생선"
FOM_DIET_BREAD					= "빵"
FOM_DIET_CHEESE					= "치즈"
FOM_DIET_FRUIT					= "과일"
FOM_DIET_FUNGUS					= "버섯"

-- Beast family names; we use these to provide optional pet-specific feeding emotes (see FeedOMatic_Emotes.lua)
FOM_BAT							= "박쥐"
FOM_BEAR						= "곰"
FOM_BIRD_OF_PREY				= "올빼미"        	-- WotLK
FOM_BOAR						= "멧돼지"                	
FOM_CARRION_BIRD				= "독수리"        	
FOM_CAT							= "살쾡이"                 	
FOM_CHIMAERA					= "키메라"            	-- WotLK exotic
FOM_CORE_HOUND					= "심장부 사냥개"          	-- WotLK exotic
FOM_CRAB						= "게"                	
FOM_CROCOLISK					= "악어"           	
FOM_DEVILSAUR					= "데빌사우르스"           	-- WotLK exotic
FOM_DRAGONHAWK					= "용매"          	-- BC
FOM_GORILLA						= "고릴라"             	
FOM_HYENA						= "하이에나"               	
FOM_MOTH						= "나방"                	-- WotLK exotic
FOM_NETHER_RAY					= "황천의 가오리"          	-- BC
FOM_RAPTOR						= "랩터"              	
FOM_RAVAGER						= "갈퀴발톱"             	-- BC
FOM_RHINO						= "코뿔소"               	-- WotLK exotic
FOM_SCORPID						= "전갈"             	
FOM_SERPENT						= "살무사"             	-- BC
FOM_SILITHID					= "실리시드"            	-- WotLK exotic
FOM_SPIDER						= "거미"              	
FOM_SPIRIT_BEAST				= "영혼의 야수"        	-- WotLK exotic
FOM_SPOREBAT					= "포자날개"            	-- BC
FOM_TALLSTRIDER					= "타조"         	
FOM_TURTLE						= "거북이"              	
FOM_WARP_STALKER				= "차원의 추적자"			-- BC
FOM_WASP						= "말벌"                	-- WotLK
FOM_WIND_SERPENT				= "천둥매"        	
FOM_WOLF						= "늑대"                	
FOM_WORM						= "벌레"                	-- WotLK exotic

-- From here on down, the localized strings are just for readability... they don't affect whether Feed-O-Matic works.

FOM_BUTTON_TOOLTIP1				= "<왼쪽 클릭: %s 먹이 주기>"
FOM_BUTTON_TOOLTIP1_FALLBACK	= "<Alt+왼쪽 클릭: %s 예비 먹이 주기>"
FOM_BUTTON_TOOLTIP2				= "<오른 클릭: Feed-O-Matic 옵션>"

-- Used in tooltips to indicate food quality.
FOM_QUALITY_UNDER				= "%s도 이런건 안먹겠대요."
FOM_QUALITY_WILL				= "%s 주면 먹긴 할 거에요."
FOM_QUALITY_LIKE				= "%s 입맛에 딱 맞습니다."
FOM_QUALITY_LOVE				= "%s 침 흘리기 시작합니다."

-- User-visible errors
FOM_ERROR_NO_FOOD				= "%s 먹이가 가방에 없는 것 같아요!"
FOM_ERROR_NO_FOOD_NO_FALLBACK	= "Feed-O-Matic에 입력한 %s 먹이가 없습니다."
FOM_FALLBACK_MESSAGE			= "Alt를 누른채 Feed Pet 버튼이나 단축키를 누르면 %s 에게 예비 먹이를 줄 수 있습니다"

-- Feeding status messages
FOM_FEEDING_EAT					= " %s에게 %s를 먹입니다..."
FOM_FEEDING_FEED				= " %s에게 %s를 먹이며 말합니다. "

-- Options panel
FOM_OPTIONS_SUBTEXT				= "먹이를 주려면 Feed Pet 단축키를 설정하거나 매크로 '/click FOM_FeedButton'을 만드세요."
                            	
FOM_OPTIONS_TOOLTIP				= "툴팁에 음식 품질 보기"
FOM_OPTIONS_LOW_LVL_1ST			= "낮은 레벨 음식 먼저"
                            	                            	                            	
FOM_OPTIONS_FEED_NOTIFY 		= "먹이 줄때 알림:"
FOM_OPTIONS_NOTIFY_EMOTE		= "감정 표현으로"
FOM_OPTIONS_NOTIFY_TEXT			= "채팅창에"
FOM_OPTIONS_NOTIFY_NONE			= "알리지 않음"

end

------------------------------------------------------

if (GetLocale() == "zhTW") then

-- Diet names. These should be the six diets returned from GetPetFoodTypes() and shown in the Pet tab of the character window (when mousing over the happy icon). 
-- (Want to get them all nice and quick for your localization? Go tame a bear or boar... they eat anything.)
-- THESE STRINGS MUST BE LOCALIZED for Feed-O-Matic to work properly in other locales.
FOM_DIET_MEAT					= "肉"
FOM_DIET_FISH					= "魚"
FOM_DIET_BREAD					= "麵包"
FOM_DIET_CHEESE					= "乳酪"
FOM_DIET_FRUIT					= "水果"
FOM_DIET_FUNGUS					= "蘑菇"

-- Beast family names; we use these to provide optional pet-specific feeding emotes (see FeedOMatic_Emotes.lua)
FOM_BAT							= "蝙蝠"                       
FOM_BEAR						= "熊"                    
FOM_BOAR						= "野豬"                   
FOM_CARRION_BIRD				= "禿鷹"           
FOM_CAT							= "貓"                        
FOM_CRAB						= "螃蟹"                   
FOM_CROCOLISK					= "鱷魚"               
FOM_GORILLA						= "猩猩"                   
FOM_HYENA						= "土狼"                   
FOM_OWL							= "貓頭鷹"                      
FOM_RAPTOR						= "迅猛龍"                  
FOM_SCORPID						= "蠍子"                   
FOM_SPIDER						= "蜘蛛"                   
FOM_TALLSTRIDER					= "陸行鳥"              
FOM_TURTLE						= "烏龜"                   
FOM_WIND_SERPENT				= "風蛇"           
FOM_WOLF						= "狼"                    
FOM_DRAGONHAWK					= "龍鷹"					-- BC
FOM_NETHER_RAY					= "虛空鰭刺"				-- BC
FOM_RAVAGER						= "破壞者"					-- BC
FOM_SERPENT						= "毒蛇"					-- BC
FOM_SPOREBAT					= "孢子蝙蝠"				-- BC
FOM_WARP_STALKER				= "扭曲行者"				-- BC

end
