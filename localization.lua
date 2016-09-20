-----------------------------------------------------
-- localization.lua
-- English strings by default, localizations override with their own.
------------------------------------------------------
-- This file contains only strings for localizing Feed-O-Matic's UI.
-- See LocaleSupport.lua for strings that MUST be localized for Feed-O-Matic to work correctly in a locale.
------------------------------------------------------

FOM_BUTTON_TOOLTIP1				= "Left-Click to Feed Pet:"
FOM_BUTTON_TOOLTIP1_FALLBACK	= "Alt-Left-Click to Feed Pet:"
FOM_BUTTON_TOOLTIP2				= "<Right-Click for Options>"
FOM_BUTTON_TOOLTIP_NOFOOD		= "Cannot Feed Pet"
FOM_BUTTON_TOOLTIP_DIET			= "%s eats:"

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

if (GetLocale() == "ptBR") then


end

------------------------------------------------------

if (GetLocale() == "frFR") then

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


end
