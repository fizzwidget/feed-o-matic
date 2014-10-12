-----------------------------------------------------
-- LocaleSupport.lua
-- English strings by default, localizations override with their own.
------------------------------------------------------
-- This file contains strings which must be localized in order for Feed-O-Matic features to work in other locales.
-- Note: strings which are the same as in the enUS version needn't be localized; they can be commented out.
------------------------------------------------------

-- Diet names. These should be the six diets returned from GetPetFoodTypes() and shown in the Pet tab of the character window (when mousing over the food icon). 
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

------------------------------------------------------

if (GetLocale() == "ptBR") then

-- Diet names. These should be the six diets returned from GetPetFoodTypes() and shown in the Pet tab of the character window (when mousing over the food icon). 
-- (Want to get them all nice and quick for your localization? Go tame a bear or boar... they eat anything.)
-- THESE STRINGS MUST BE LOCALIZED for Feed-O-Matic to work properly in other locales.
FOM_DIET_MEAT					= "Carne"
FOM_DIET_FISH					= "Peixe"
FOM_DIET_BREAD					= "Pão"
FOM_DIET_CHEESE					= "Queijo"
FOM_DIET_FRUIT					= "Fruta"
FOM_DIET_FUNGUS					= "Fungo"

-- Beast family names; we use these to provide optional pet-specific feeding emotes (see FeedOMatic_Emotes.lua)
FOM_BAT							= "Morcego"
FOM_BEAR						= "Urso"
FOM_BEETLE						= "Besouro"                  -- Cataclysm
FOM_BIRD_OF_PREY				= "Ave de Rapina"        	-- WotLK
FOM_BOAR						= "Javali"                	
FOM_CARRION_BIRD				= "Ave Carniceira"        	
FOM_CAT							= "Gato"                 	
FOM_CHIMAERA					= "Quimera"            	-- WotLK exotic
FOM_CORE_HOUND					= "Cão-magma"          	-- WotLK exotic
FOM_CRAB						= "Caranguejo"                	
FOM_CROCOLISK					= "Crocolisco"           	
FOM_DEVILSAUR					= "Demossauro"           	-- WotLK exotic
FOM_DOG							= "Cachorro"                     -- Cataclysm
FOM_DRAGONHAWK					= "Falcodrago"          	-- BC
FOM_FOX							= "Raposa"                     -- Cataclysm
FOM_GORILLA						= "Gorila"             	
FOM_HYENA						= "Hiena"               	
FOM_MONKEY						= "Macaco"                  -- Cataclysm
FOM_MOTH						= "Mariposa"                	-- WotLK
FOM_NETHER_RAY					= "Arraia Etérea"          	-- BC
-- FOM_RAPTOR						= "Raptor"              	-- same as enUS
FOM_RAVAGER						= "Assolador"             	-- BC
FOM_RHINO						= "Rinoceronte"               	-- WotLK exotic
FOM_SCORPID						= "Escorpídeo"             	
FOM_SERPENT						= "Serpente"             	-- BC
FOM_SHALE_SPIDER				= "Aranha Xistosa"            -- Cataclysm exotic
FOM_SILITHID					= "Silitídeo"            	-- WotLK exotic
FOM_SPIDER						= "Aranha"              	
FOM_SPIRIT_BEAST				= "Fera Espiritual"        	-- WotLK exotic
FOM_SPOREBAT					= "Quirósporo"            	-- BC
FOM_TALLSTRIDER					= "Moa"         	
FOM_TURTLE						= "Tartaruga"              	
-- FOM_WARP_STALKER				= "Warp Stalker"			-- BC, not translated in ptBR
FOM_WASP						= "Vespa"                	-- WotLK
FOM_WIND_SERPENT				= "Serpente Alada"        	
FOM_WOLF						= "Lobo"                	
FOM_WORM						= "Verme"                	-- WotLK exotic

end

------------------------------------------------------

if (GetLocale() == "frFR") then

-- Diet names. These should be the six diets returned from GetPetFoodTypes() and shown in the Pet tab of the character window (when mousing over the food icon). 
-- (Want to get them all nice and quick for your localization? Go tame a bear or boar... they eat anything.)
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

end

------------------------------------------------------

if (GetLocale() == "deDE") then

-- Diet names. These should be the six diets returned from GetPetFoodTypes() and shown in the Pet tab of the character window (when mousing over the food icon). 
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

end

------------------------------------------------------

if (GetLocale() == "esES" or GetLocale() == "esMX") then

-- Diet names. These should be the six diets returned from GetPetFoodTypes() and shown in the Pet tab of the character window (when mousing over the food icon). 
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

end

------------------------------------------------------

if (GetLocale() == "ruRU") then

-- Diet names. These should be the six diets returned from GetPetFoodTypes() and shown in the Pet tab of the character window (when mousing over the food icon). 
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

-- Diet names. These should be the six diets returned from GetPetFoodTypes() and shown in the Pet tab of the character window (when mousing over the food icon). 
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

end

------------------------------------------------------

if (GetLocale() == "zhTW") then

-- Diet names. These should be the six diets returned from GetPetFoodTypes() and shown in the Pet tab of the character window (when mousing over the food icon). 
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
