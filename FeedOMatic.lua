------------------------------------------------------
-- FeedOMatic.lua
------------------------------------------------------
local addonName, addonTable = ...; 

-- letting these be global inside Ace callbacks causes bugs
local FOM_Config, FOM_IsInDiet, FOM_IsKnownFood, FOM_PTCategories, FOM_CategoryNames, FOM_FoodsUIList

-- Food quality by itemLevel
--
-- levelDelta = petLevel - foodItemLevel
-- levelDelta > 30 = won't eat
FOM_DELTA_EATS = 30;	-- 30 >= levelDelta > 20 = 8 happiness per tick
FOM_DELTA_LIKES = 20;   -- 20 >= levelDelta > 10 = 17 happiness per tick
FOM_DELTA_LOVES = 10;   -- 10 >= levelDelta = 35 happiness per tick

-- constants
MAX_KEEPOPEN_SLOTS = 150;
FOM_FEED_PET_SPELL_ID = 6991;
FOM_COOKING_SPELL_ID = 2550;
FOM_MAX_PET_LEVEL_DELTA = 3; -- max # of levels a pet can be below yours (e.g. your pets are forced to 77 if you're 80)

-- Variables
FOM_LastPetName = nil;

FOM_CookingDifficulty = {};
FOM_CookingRecipes = {};

-- Anti-freeze code borrowed from ReagentInfo (in turn, from Quest-I-On):
-- keeps WoW from locking up if we try to scan the tradeskill window too fast.
FOM_TradeSkillLock = { };
FOM_TradeSkillLock.Locked = false;
FOM_TradeSkillLock.EventTimer = 0;
FOM_TradeSkillLock.EventCooldown = 0;
FOM_TradeSkillLock.EventCooldownTime = 1;

FOM_DifficultyLabels = {
	GFWUtils.Hilite("all"),
	GFWUtils.ColorText("easy", QuestDifficultyColors["standard"]),
	GFWUtils.ColorText("medium", QuestDifficultyColors["difficult"]),
	GFWUtils.ColorText("difficult", QuestDifficultyColors["verydifficult"]),
	GFWUtils.ColorText("unknown", QuestDifficultyColors["impossible"]),
};

FOM_DifficultyColors = {
	QuestDifficultyColors["trivial"],
	QuestDifficultyColors["standard"],
	QuestDifficultyColors["difficult"],
	QuestDifficultyColors["verydifficult"],
	QuestDifficultyColors["impossible"],
};

FOM_PTDiets = {
	[FOM_DIET_MEAT] = "Consumable.Food.Meat",
	[FOM_DIET_FISH] = "Consumable.Food.Fish",
	[FOM_DIET_BREAD] = "Consumable.Food.Bread",
	[FOM_DIET_CHEESE] = "Consumable.Food.Cheese",
	[FOM_DIET_FRUIT] = "Consumable.Food.Fruit",
	[FOM_DIET_FUNGUS] = "Consumable.Food.Fungus",
}

FOM_PTCategories = {
	"Consumable.Food.Edible.Bread.Conjured",
	"Consumable.Food.Edible.Bread.Combo.Conjured",
	"Consumable.Food.Edible.Basic.Non-Conjured",
	"Consumable.Food.Edible.Combo.Non-Conjured",
	"Consumable.Food.Edible.Bonus",
	"Consumable.Food.Inedible",
};
FOM_CategoryNames = {
	["Consumable.Food.Edible.Bread.Conjured"] = FOM_OPTIONS_FOODS_CONJURED,
	["Consumable.Food.Edible.Bread.Combo.Conjured"] = FOM_OPTIONS_FOODS_CONJ_COMBO,
	["Consumable.Food.Edible.Basic.Non-Conjured"] = FOM_OPTIONS_FOODS_BASIC,
	["Consumable.Food.Edible.Combo.Non-Conjured"] = FOM_OPTIONS_FOODS_COMBO,
	["Consumable.Food.Edible.Bonus"] = FOM_OPTIONS_FOODS_BONUS,
	["Consumable.Food.Inedible"] = FOM_OPTIONS_FOODS_INEDIBLE,
};

-- libraries
local PT = LibStub("LibPeriodicTable-3.1");

function FOM_FeedButton_PostClick(self, button, down)
	if (not FOM_GetFeedPetSpellName()) then
		local version = GetAddOnMetadata(addonName, "Version");
		GFWUtils.PrintOnce(GFWUtils.Red("Feed-O-Matic v."..version.." error:").."Can't find Feed Pet spell. (Have you finished your level 10 Hunter quests?)");
		return;
	end
	if (not down) then
		if (button == "RightButton") then
			GFW_FeedOMatic:ShowConfig();
		elseif (FOM_NextFoodLink and not FOM_NoFoodError and not InCombatLockdown()) then
			-- successful feed, messages are produced elsewhere
		elseif (FOM_NoFoodError and not IsAltKeyDown()) then
			if (FOM_NextFoodLink) then
				GFWUtils.Note(FOM_NoFoodError.."\n"..string.format(FOM_FALLBACK_MESSAGE, FOM_NextFoodLink));
			else
				GFWUtils.Note(FOM_NoFoodError);
			end
		end
	end
end

function FOM_FeedButton_OnEnter()
	if (FOM_Config.NoFeedButtonTooltip) then return; end
	
	FOM_FeedTooltip:SetOwner(FOM_FeedButton, "ANCHOR_RIGHT");
	local blankLine = false;
	local linesAdded = 0;
	if (FOM_NextFoodLink) then

		local bag = FOM_FeedButton:GetAttribute("target-bag");
		local slot = FOM_FeedButton:GetAttribute("target-slot");
		FOM_FeedTooltip:SetBagItem(bag,slot);
		
		if (FOM_NoFoodError) then
			FOM_FeedTooltipHeader:SetText(FOM_BUTTON_TOOLTIP1_FALLBACK);
			FOM_FeedTooltip:AddLine(" ");
			blankLine = true;
			FOM_FeedTooltip:AddLine(FOM_NoFoodError, RED_FONT_COLOR.r, RED_FONT_COLOR.g, RED_FONT_COLOR.b, 1);
			linesAdded = linesAdded + 1;
		else
			FOM_FeedTooltipHeader:SetText(FOM_BUTTON_TOOLTIP1);
		end
	else
		FOM_FeedTooltipHeader:SetText(FOM_BUTTON_TOOLTIP_NOFOOD);
		blankLine = true;
		FOM_FeedTooltip:AddLine(FOM_NoFoodError, RED_FONT_COLOR.r, RED_FONT_COLOR.g, RED_FONT_COLOR.b, 1);
		linesAdded = linesAdded + 1;
	end
	if (not blankLine) then
		FOM_FeedTooltip:AddLine(" ");
	end
	FOM_FeedTooltip:AddLine(FOM_BUTTON_TOOLTIP2, GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b);
	linesAdded = linesAdded + 1;
	
	-- putting an item in the tooltip shrinks all further text
	-- set it back only if we've set an item
	if (FOM_NextFoodLink) then
		local numLines = FOM_FeedTooltip:NumLines();
		for lineNum = numLines - linesAdded + 1, numLines do
			local line = _G["FOM_FeedTooltipTextLeft"..lineNum];
			local r, g, b, a = line:GetTextColor();
			line:SetFontObject("GameFontNormal");
			line:SetTextColor(r, g, b, a);
		end
	end
	FOM_TooltipDebug();
	
	FOM_FeedTooltip:Show();
	FOM_FeedTooltip:SetHeight(FOM_FeedTooltip:GetHeight() + 12 + FOM_FeedTooltipHeader:GetHeight());
end

function FOM_TooltipDebug()	
	-- old	
	if (FOM_Debug) then
		FOM_FeedTooltip:AddLine(" ");
		FOM_FeedTooltip:AddLine("Next Foods:");
		for _, foodInfo in pairs(SortedFoodList) do
			local line = string.format("%dx%s (bag %d, slot %d)", foodInfo.count, foodInfo.link, foodInfo.bag, foodInfo.slot);
			if (foodInfo.useful) then
				line = line .. " (useful)";
			end
			if (foodInfo.temp) then
				line = line .. " (temp)";
			end
			local color;
			if (foodInfo.delta > FOM_DELTA_EATS) then
				color = QuestDifficultyColors["trivial"];
			elseif (foodInfo.delta > FOM_DELTA_LIKES and foodInfo.delta <= FOM_DELTA_EATS) then
				color = QuestDifficultyColors["standard"];
			elseif (foodInfo.delta > FOM_DELTA_LOVES and foodInfo.delta <= FOM_DELTA_LIKES) then
				color = QuestDifficultyColors["difficult"];
			elseif (foodInfo.delta <= FOM_DELTA_LOVES) then
				color = QuestDifficultyColors["verydifficult"];
			end
			FOM_FeedTooltip:AddLine(line, color.r, color.g, color.b);
		end
	end
end

function FOM_FeedButton_OnLeave()
	FOM_FeedTooltip:Hide();
end

function FOM_OnLoad(self)

	-- Register for Events
	self:RegisterEvent("VARIABLES_LOADED");
	self:RegisterEvent("SPELLS_CHANGED");

	-- Register Slash Commands
	SLASH_FEEDOMATIC1 = "/feedomatic";
	SLASH_FEEDOMATIC2 = "/fom";
	SLASH_FEEDOMATIC3 = "/feed";
	SLASH_FEEDOMATIC4 = "/petfeed"; -- Rauen's PetFeed compatibility
	SLASH_FEEDOMATIC5 = "/pf";
	SlashCmdList["FEEDOMATIC"] = function(msg)
		FOM_ChatCommandHandler(msg);
	end
		
	BINDING_HEADER_GFW_FEEDOMATIC = GetAddOnMetadata(addonName, "Title"); -- gets us the localized title if needed
	
	--GFWUtils.Debug = true;

end

function FOM_HookTooltip(frame)
	if (frame:GetScript("OnTooltipSetItem")) then
		frame:HookScript("OnTooltipSetItem", FOM_OnTooltipSetItem);
	else
		frame:SetScript("OnTooltipSetItem", FOM_OnTooltipSetItem);
	end
end

function FOM_OnTooltipSetItem(self)
	local name, link = self:GetItem();

	if (FOM_Config.Tooltip and link and UnitExists("pet")) then
				
		local itemID = FOM_IDFromLink(link);
		if (not FOM_IsInDiet(itemID)) then
			return false;
		end
		
		local color;
		local _, _, _, itemLevel = GetItemInfo(itemID);
		if (itemLevel) then
			local levelDelta = UnitLevel("pet") - itemLevel;
			local petName = UnitName("pet");
			if (levelDelta >= FOM_DELTA_EATS) then
				color = QuestDifficultyColors["trivial"];
				self:AddLine(string.format(FOM_QUALITY_UNDER, petName), color.r, color.g, color.b);
				return true;
			elseif (levelDelta >= FOM_DELTA_LIKES and levelDelta < FOM_DELTA_EATS) then
				color = QuestDifficultyColors["standard"];
				self:AddLine(string.format(FOM_QUALITY_WILL, petName), color.r, color.g, color.b);
				return true;
			elseif (levelDelta >= FOM_DELTA_LOVES and levelDelta < FOM_DELTA_LIKES) then
				color = QuestDifficultyColors["difficult"];
				self:AddLine(string.format(FOM_QUALITY_LIKE, petName), color.r, color.g, color.b);
				return true;
			elseif (levelDelta < FOM_DELTA_LOVES) then
				color = QuestDifficultyColors["verydifficult"];
				self:AddLine(string.format(FOM_QUALITY_LOVE, petName), color.r, color.g, color.b);
				return true;
			end
		end
	end
end

function FOM_GetFeedPetSpellName()
	-- we can get the spell name from the ID
	local _;
	FOM_FeedPetSpellName, _, FOM_FeedPetSpellIcon = GetSpellInfo(FOM_FEED_PET_SPELL_ID);

	BINDING_NAME_FOM_FEED = FOM_FeedPetSpellName;
	
	-- but we also want to know whether we can cast it
	for tabIndex = 1, GetNumSpellTabs() do
		local tabName, tabIcon, offset, numSpells = GetSpellTabInfo(tabIndex);
		for spellID = offset + 1, offset + numSpells do
			local type, id = GetSpellBookItemInfo(spellID, BOOKTYPE_SPELL);
			if (id == FOM_FEED_PET_SPELL_ID and type == "SPELL") then
				return FOM_FeedPetSpellName;
			end
		end
	end
	
	return nil;
end

function FOM_Initialize(self)
	
	local _, realClass = UnitClass("player");
	if (realClass ~= "HUNTER") then
	 	self:UnregisterAllEvents();
		return;
	end
	
	if (UnitLevel("player") < 10) then return; end
		
	-- track whether foods are useful for Cooking 
	self:RegisterEvent("TRADE_SKILL_SHOW");
	self:RegisterEvent("TRADE_SKILL_UPDATE");

	-- Catch when feeding happened so we can notify/emote
	self:RegisterEvent("CHAT_MSG_PET_INFO");
	self:RegisterEvent("CHAT_MSG_SPELL_TRADESKILLS");
	
	-- Only subscribe to inventory updates once we're in the world
	self:RegisterEvent("PLAYER_ENTERING_WORLD");
	self:RegisterEvent("PLAYER_LEAVING_WORLD");

	-- Events for trying to catch when the pet needs feeding
	self:RegisterEvent("UNIT_PET");
	self:RegisterEvent("PET_BAR_SHOWGRID");
	self:RegisterEvent("UNIT_NAME_UPDATE");
	self:RegisterEvent("PET_BAR_UPDATE");
	self:RegisterEvent("PET_UI_UPDATE");
	self:RegisterEvent("PLAYER_REGEN_ENABLED");

	-- events for managing feed button
	self:RegisterEvent("SPELL_UPDATE_COOLDOWN");
	self:RegisterEvent("SPELL_UPDATE_USABLE");
	
	-- create feed button
	FOM_FeedButton = CreateFrame("Button", "FOM_FeedButton", PetFrame, "ActionButtonTemplate,SecureActionButtonTemplate");
	FOM_FeedButton:SetWidth(24);
	FOM_FeedButton:SetHeight(23);
	FOM_FeedButtonNormalTexture:SetTexture("");
	FOM_FeedButton:SetPoint("LEFT", PetFrame, "RIGHT", -7, -4);
	FOM_FeedButton:RegisterForClicks("LeftButtonUp", "RightButtonUp");
	FOM_FeedButton:SetScript("PostClick", FOM_FeedButton_PostClick);
	FOM_FeedButton:SetScript("OnEnter", FOM_FeedButton_OnEnter);
	FOM_FeedButton:SetScript("OnLeave", FOM_FeedButton_OnLeave);
	if (FOM_Config.NoButton) then
		FOM_FeedButton:Hide();
	end

	-- muck with our special tooltip so it looks right
	FOM_FeedTooltipTextLeft1:SetFontObject("GameFontNormal");
	FOM_FeedTooltipTextLeft1:ClearAllPoints();
	FOM_FeedTooltipTextLeft1:SetPoint("TOPLEFT", FOM_FeedTooltipHeader, "BOTTOMLEFT", 0, -12);
	FOM_FeedTooltipTextLeft1:SetJustifyH("LEFT");
	FOM_FeedTooltipTextLeft2:SetJustifyH("LEFT");
	FOM_FeedTooltipTextLeft3:SetJustifyH("LEFT");
	FOM_FeedTooltipTextLeft4:SetJustifyH("LEFT");
	
	-- set key binding to click FOM_FeedButton
	FOM_UpdateBindings();
	self:RegisterEvent("UPDATE_BINDINGS");
	
	FOM_HookTooltip(GameTooltip);
	FOM_HookTooltip(ItemRefTooltip);
	FOM_HookTooltip(FOM_FeedTooltip);
	
	Frame_GFW_FeedOMatic:SetScript("OnUpdate", FOM_OnUpdate);

	self:UnregisterEvent("VARIABLES_LOADED");
	self:UnregisterEvent("SPELLS_CHANGED");

	FOM_Initialized = true;
		
end

function FOM_OnEvent(self, event, arg1, arg2)
	--print(event)

	if ( event == "VARIABLES_LOADED" or event == "SPELLS_CHANGED") then
				
		if (not FOM_Initialized) then FOM_Initialize(self); end
		FOM_PickFoodQueued = true;
		
	elseif ( event == "UPDATE_BINDINGS" ) then

		FOM_UpdateBindings();
		return;
		
	elseif ( event == "PLAYER_ENTERING_WORLD" ) then

		self:RegisterEvent("BAG_UPDATE");
		if (InCombatLockdown()) then
			FOM_PickFoodQueued = true;
		else
			FOM_PickFoodForButton();
		end
		return;

	elseif ( event == "PLAYER_LEAVING_WORLD" ) then

		self:UnregisterEvent("BAG_UPDATE");
		
	elseif (event == "BAG_UPDATE" ) then
		
		if (arg1 < 0 or arg1 > 4) then return; end	-- don't bother looking in keyring, bank, etc for food
		if (FOM_IsSpecialBag(arg1)) then return; end	-- don't look in bags that can't hold food, either
		
		FOM_PickFoodQueued = true;
	
	elseif ((event == "UNIT_NAME_UPDATE" and arg1 == "pet") or event == "PET_BAR_UPDATE" or event == "PLAYER_REGEN_ENABLED") then
	
		FOM_PickFoodQueued = true;
	
	elseif (event == "TRADE_SKILL_SHOW" or event == "TRADE_SKILL_UPDATE") then
		FOM_ScanTradeSkill();
		return;

	elseif (event == "CHAT_MSG_PET_INFO" or event == "CHAT_MSG_SPELL_TRADESKILLS") then
		if (not FOM_FEEDPET_LOG_FIRSTPERSON) then
			FOM_FEEDPET_LOG_FIRSTPERSON = GFWUtils.FormatToPattern(FEEDPET_LOG_FIRSTPERSON);
		end
		local _, _, foodEaten = string.find(arg1, FOM_FEEDPET_LOG_FIRSTPERSON);
		if (foodEaten) then
			local foodName = foodEaten;
			if (FOM_NextFoodLink and FOM_NameFromLink(FOM_NextFoodLink) == foodEaten) then
				foodName = FOM_NextFoodLink;
			end
			local pet = UnitName("pet");
			if (pet) then
				if ( FOM_Config.AlertType == 2) then
					GFWUtils.Print(string.format(FOM_FEEDING_EAT, pet, foodName));
				elseif ( FOM_Config.AlertType == 1) then
					SendChatMessage(string.format(FOM_FEEDING_FEED, pet, foodName).. FOM_RandomEmote(foodName), "EMOTE");
				end
			end
		end
	elseif (event == "SPELL_UPDATE_COOLDOWN") then
		local start, duration, enable = GetSpellCooldown(FOM_FEED_PET_SPELL_ID);
		CooldownFrame_SetTimer(FOM_FeedButtonCooldown, start, duration, enable);
	elseif (event == "SPELL_UPDATE_USABLE") then
		local isUsable, notEnoughtMana = IsUsableSpell(FOM_FEED_PET_SPELL_ID);
		if (not isUsable) then
			FOM_FeedButtonIcon:SetVertexColor(0.4, 0.4, 0.4);
		elseif (FOM_NoFoodError) then
			FOM_FeedButtonIcon:SetVertexColor(0.5, 0.5, 0.1);
		else
			FOM_FeedButtonIcon:SetVertexColor(1, 1, 1);
		end		
	end
	
	if (FOM_PickFoodQueued and not InCombatLockdown()) then
		FOM_PickFoodForButton();
	end

	if (FOM_FoodListBorder and FOM_FoodListBorder:IsVisible()) then
		FOM_FoodListUI_UpdateList();
		FOM_FoodsPanel.refresh();
	end
	
end

function FOM_ScanTradeSkill()
	if (GetTradeSkillLine() and GetTradeSkillLine() == FOM_CookingSpellName()) then
		-- Update Cooking reagents list so we can avoid consuming food we could skillup from.
		if (FOM_CookingDifficulty == nil) then
			FOM_CookingDifficulty = { };
		end
		if (FOM_CookingDifficulty and TradeSkillFrame and TradeSkillFrame:IsVisible() and not FOM_TradeSkillLock.Locked) then
			-- This prevents further update events from being handled if we're already processing one.
			-- This is done to prevent the game from freezing under certain conditions.
			FOM_TradeSkillLock.Locked = true;

			GFWUtils.DebugLog("scanning Cooking list");
			for i=1, GetNumTradeSkills() do
				local itemName, type, _, _ = GetTradeSkillInfo(i);
				if (type ~= "header") then
					local itemLink = GetTradeSkillItemLink(i);
					local itemID;
					if (itemLink) then
						_, _, itemID = string.find(itemLink, "item:(%d+)");
						if (itemID) then
							itemID = tonumber(itemID);
							FOM_CookingDifficulty[itemID] = FOM_DifficultyToNum(type);
							local recipeLink = GetTradeSkillRecipeLink(i);
							if (recipeLink) then
								local _, _, spellID = string.find(recipeLink, "enchant:(%d+)");
								if (spellID) then
									FOM_CookingRecipes[itemID] = tonumber(spellID);
								end
							end
						end
					end
				end
			end
		end
	end
end

function FOM_UpdateBindings()
	if (not InCombatLockdown()) then
		ClearOverrideBindings(FOM_FeedButton);
		local key = GetBindingKey("FOM_FEED");
		if (key) then
			SetOverrideBindingClick(FOM_FeedButton, nil, key, "FOM_FeedButton");
		end
	end
end

-- Update our list of quest objectives so we can avoid consuming food we want to accumulate for a quest.
function FOM_ScanQuests()
	for questNum = 1, GetNumQuestLogEntries() do
		local _, _, _, _, isHeader, isCollapsed, isComplete  = GetQuestLogTitle(questNum);
		if (not isHeader) then
			for objectiveNum = 1, GetNumQuestLeaderBoards(questNum) do
				local text, type, finished = GetQuestLogLeaderBoard(objectiveNum, questNum);
				if (text and strlen(text) > 0) then
					local _, _, objectiveName, numCurrent, numRequired = string.find(text, "(.*): (%d+)/(%d+)");
					if (objectiveName) then
						local _, link = GetItemInfo(objectiveName);
						-- not guaranteed to get us a link if we don't have the item,
						-- but we shouldn't be here unless we have the item anyway.
						local itemID = FOM_IDFromLink(link);
						if (itemID and FOM_IsKnownFood(itemID)) then
							if (FOM_QuestFood == nil) then
								FOM_QuestFood = { };
							end
							if (FOM_QuestFood[itemID] == nil) then
								FOM_QuestFood[itemID] = tonumber(numRequired);
							else             
								FOM_QuestFood[itemID] = max(FOM_QuestFood[itemID], tonumber(numRequired));
							end
						end
					end
				end
			end
		end
	end
end

function FOM_DifficultyToNum(level)
	if (level == "optimal" or level == "orange") then
		return 4;
	elseif (level == "medium" or level == "yellow") then
		return 3;
	elseif (level == "easy" or level == "green") then
		return 2;
	elseif (level == "trivial" or level == "gray" or level == "grey") then
		return 1;
	else -- bad input
		return nil;
	end
end

function FOM_OnUpdate(self, elapsed)

	-- If it's been more than a second since our last tradeskill update,
	-- we can allow the event to process again.
	FOM_TradeSkillLock.EventTimer = FOM_TradeSkillLock.EventTimer + elapsed;
	if (FOM_TradeSkillLock.Locked) then
		FOM_TradeSkillLock.EventCooldown = FOM_TradeSkillLock.EventCooldown + elapsed;
		if (FOM_TradeSkillLock.EventCooldown > FOM_TradeSkillLock.EventCooldownTime) then

			FOM_TradeSkillLock.EventCooldown = 0;
			FOM_TradeSkillLock.Locked = false;
		end
	end
		
	--GFWUtils.Debug = true;

end

function FOM_ChatCommandHandler(msg)

	if ( msg == "" ) then
		GFW_FeedOMatic:ShowConfig();
		return;
	end
		
	-- Print Help
	if ( msg == "help" ) then
		local version = GetAddOnMetadata(addonName, "Version");
		GFWUtils.Print("Fizzwidget Feed-O-Matic "..version..":");
		GFWUtils.Print("/feedomatic /fom <command>");
		GFWUtils.Print("- "..GFWUtils.Hilite("help").." - Print this helplist.");
		GFWUtils.Print("- "..GFWUtils.Hilite("reset").." - Reset to default settings.");
		GFWUtils.Print("- "..GFWUtils.Hilite("notooltip").." - Disable/enable feed button tooltip.");
		return;
	end

	if ( msg == "version" ) then
		local version = GetAddOnMetadata(addonName, "Version");
		GFWUtils.Print("Fizzwidget Feed-O-Matic "..version..":");
		return;
	end

	if ( msg == "debug" ) then
		FOM_Debug = not FOM_Debug;
		GFWUtils.Print((not FOM_Debug and "Not " or "").."Showing food list in feed button tooltip.");
	end

	if ( msg == "notooltip" ) then
		FOM_Config.NoFeedButtonTooltip = not FOM_Config.NoFeedButtonTooltip;
		GFWUtils.Print((FOM_Config.NoFeedButtonTooltip and "Not " or "").."Showing feed button tooltip.");
	end
	
	-- Reset Variables
	if ( msg == "reset" ) then
		GFW_FeedOMatic.db:ResetProfile();
		FOM_CookingDifficulty = nil;
		FOM_QuestFood = nil;
		GFWUtils.Print("Feed-O-Matic configuration reset.");
		return;
	end
	
	-- if we got down to here, we got bad input
	FOM_ChatCommandHandler("help");
end

-- Check Feed Effect
function FOM_HasFeedEffect()

	local i = 1;
	local _, _, buff = UnitBuff("pet", i);
	while buff do
		if ( string.find(buff, "Ability_Hunter_BeastTraining") ) then
			return true;
		end
		i = i + 1;
		_, _, buff = UnitBuff("pet", i);
	end
	return false;

end

function FOM_PickFoodForButton()

	if (not FOM_GetFeedPetSpellName()) then
		return;
	end
	local pet = UnitName("pet");
	if (not pet) then 
		FOM_PickFoodQueued = true;
		return;
	end
	local dietList = {GetPetFoodTypes()};
	if ( dietList == nil or #dietList == 0) then
		FOM_PickFoodQueued = true;
		FOM_FeedButton:Hide();
		return;
	elseif (not FOM_Config.NoButton) then
		FOM_FeedButton:Show();
	end
	
	local foodBag, foodSlot, foodIcon;
	foodBag, foodSlot, FOM_NextFoodLink, foodIcon = FOM_NewFindFood();
	FOM_SetupButton(foodBag, foodSlot);
	
	if ( foodBag == nil) then
		local fallbackBag, fallbackSlot;
		fallbackBag, fallbackSlot, FOM_NextFoodLink, foodIcon = FOM_NewFindFood(1);
		if (fallbackBag) then
			FOM_NoFoodError = string.format(FOM_ERROR_NO_FOOD_NO_FALLBACK, pet);
			FOM_SetupButton(fallbackBag, fallbackSlot, "alt");
			FOM_FeedButtonIcon:SetTexture(foodIcon);
		else
			-- No Food Could be Found
			FOM_NoFoodError = string.format(FOM_ERROR_NO_FOOD, pet);
			FOM_NextFoodLink = nil;
			FOM_FeedButtonIcon:SetTexture(FOM_FeedPetSpellIcon);
			--GFWUtils.Print("Can't feed? #SortedFoodList:"..#SortedFoodList);
			--DevTools_Dump(GetPetFoodTypes());
		end
		
		FOM_FeedButtonIcon:SetVertexColor(0.5, 0.5, 1);
	else
		FOM_NoFoodError = nil;
		FOM_FeedButtonIcon:SetVertexColor(1, 1, 1);
		FOM_FeedButtonIcon:SetTexture(foodIcon);
	end
	
	-- debug
	if (false and FOM_NextFoodLink) then
		if (FOM_NoFoodError) then
			GFWUtils.PrintOnce("Next food (fallback):"..FOM_NextFoodLink, 1);
		else
			GFWUtils.PrintOnce("Next food:"..FOM_NextFoodLink, 1);
		end
	end
end

function FOM_SetupButton(bag, slot, modifier)
	if (not FOM_GetFeedPetSpellName()) then
		return;
	end
	if (modifier) then
		modifier = modifier.."-";
	else
		modifier = "";
	end
	if (bag and slot) then
		FOM_FeedButton:SetAttribute(modifier.."type1", "spell");
		FOM_FeedButton:SetAttribute(modifier.."spell1", FOM_FeedPetSpellName);
		FOM_FeedButton:SetAttribute("target-bag", bag);
		FOM_FeedButton:SetAttribute("target-slot", slot);
	else
		FOM_FeedButton:SetAttribute(modifier.."type", ATTRIBUTE_NOOP);
		FOM_FeedButton:SetAttribute(modifier.."spell", ATTRIBUTE_NOOP);
		FOM_FeedButton:SetAttribute(modifier.."type1", ATTRIBUTE_NOOP);
		FOM_FeedButton:SetAttribute(modifier.."spell1", ATTRIBUTE_NOOP);
		FOM_FeedButton:SetAttribute("target-bag", nil);
		FOM_FeedButton:SetAttribute("target-slot", nil);
	end
	FOM_PickFoodQueued = nil;
end

function FOM_RandomEmote(foodLink)
	
	local localeEmotes = FOM_Emotes[GetLocale()];
	if (localeEmotes) then
		local randomEmotes = {};
		if (UnitSex("pet") == 2) then
			randomEmotes = GFWTable.Merge(randomEmotes, localeEmotes["male"]);
		elseif (UnitSex("pet") == 3) then
			randomEmotes = GFWTable.Merge(randomEmotes, localeEmotes["female"]);
		end
		
		local itemID = FOM_IDFromLink(foodLink);
		if (itemID) then
			randomEmotes = GFWTable.Merge(randomEmotes, localeEmotes[itemID]);

			local sets = PT:ItemSearch(itemID);
			for _, setName in pairs(sets) do
				randomEmotes = GFWTable.Merge(randomEmotes, localeEmotes[setName]);
			end
		end
			
		randomEmotes = GFWTable.Merge(randomEmotes, localeEmotes[UnitCreatureFamily("pet")]);
		randomEmotes = GFWTable.Merge(randomEmotes, localeEmotes["any"]);
	
		return randomEmotes[math.random(table.getn(randomEmotes))];
	else
		return "";
	end
end

function FOM_FlatFoodList(fallback)
	local foodList = {};
	local petLevel = UnitLevel("pet");
	for bagNum = 0, 4 do
		if (not FOM_IsSpecialBag(bagNum)) then
		-- skip bags that can't contain food
			for itemNum = 1, GetContainerNumSlots(bagNum) do
				local itemLink = GetContainerItemLink(bagNum, itemNum);
				local itemID = FOM_IDFromLink(itemLink);
				-- debug
				--if (bagNum == 0 and itemNum == 1) then _, itemLink = GetItemInfo(21023); end
				if (itemID) then
					local itemIcon, itemCount = GetContainerItemInfo(bagNum, itemNum);
					-- debug
					--if (bagNum == 0 and itemNum == 1) then itemCount = 10; end
					local _, _, _, level = GetItemInfo(itemID);
					if (not level) then
						-- how can we not have cached info for an item in your bags?
						-- make sure it's cached for future runs
						FOMTooltip:SetHyperlink("item:"..itemID);
					elseif (petLevel - level < FOM_DELTA_EATS) then
						if ( FOM_IsInDiet(itemID) ) then
							local avoid = FOM_ShouldAvoidFood(itemID, itemCount);
							if (fallback or not avoid) then
								table.insert(foodList, {bag=bagNum, slot=itemNum, link=itemLink, count=itemCount, delta=(petLevel - level), priority=FOM_CategoryIndexForFood(itemID), icon=itemIcon});
							end
						end
					end
				end
			end
		end
	end
	return foodList;
end

function FOM_NewFindFood(fallback)
	SortedFoodList = FOM_FlatFoodList(fallback);

	-- if there are any conjured foods, drop everything else from the list
	local tempFoodsOnly = {};
	for _, foodInfo in pairs(SortedFoodList) do
		if (foodInfo.temp) then
			table.insert(tempFoodsOnly, foodInfo);
		end
	end
	if (table.getn(tempFoodsOnly) > 0) then
		SortedFoodList = tempFoodsOnly;
	end
	
	local function sortCount(a, b)
		return a.count < b.count;
	end
	local function sortQualityDescending(a, b)
		return a.delta < b.delta;
	end
	local function sortQualityAscending(a, b)
		return a.delta > b.delta;
	end
	local function sortPriority(a, b)
		return a.priority > b.priority;
	end
	table.sort(SortedFoodList, sortCount); -- small stacks first
	if (not FOM_Config.UseLowLevelFirst) then
		table.sort(SortedFoodList, sortQualityDescending); -- higher quality first
	else
		table.sort(SortedFoodList, sortQualityAscending); -- lower quality first
	end
	table.sort(SortedFoodList, sortPriority); -- category priorities (conjured ahead of normal ahead of bonus etc)
	
	if (GFWUtils.Debug) then
		if (fallback) then
			GFWUtils.DebugLog("Food list (with fallback):")
		else
			GFWUtils.DebugLog("Food list:")
		end
		for num, foodInfo in pairs(SortedFoodList) do
			GFWUtils.DebugLog(string.format("%d: %dx%s, delta %d", num, foodInfo.count, foodInfo.link, foodInfo.delta));
		end
	end
	for _, foodInfo in pairs(SortedFoodList) do
		return foodInfo.bag, foodInfo.slot, foodInfo.link, foodInfo.icon;
	end
	
	return nil;
end

function FOM_CategoryIndexForFood(itemID)
	for index, category in pairs(FOM_PTCategories) do
		if (PT:ItemInSet(itemID, category)) then
			return index;
		end
	end
end

function FOM_ShouldAvoidFood(itemID, quantity)
	if (FOM_Config.excludedFoods[itemID]) then
		return true;
	end
	local foodName = GetItemInfo(itemID);
	if (foodName == nil) then
		GFWUtils.DebugLog("Can't get info for item ID "..itemID..", assuming it's OK to eat.");
		return false;
	end
	if (FOM_Config.AvoidQuestFood) then
		if (FOM_IsQuestFood(itemID, quantity)) then
			GFWUtils.DebugLog("Skipping "..quantity.."x "..foodName.."; is needed for quest.");
			return true;
		end
	end
	for category in pairs(FOM_Config.excludedCategories) do
		if (PT:ItemInSet(itemID, category)) then
			GFWUtils.DebugLog("Skipping "..quantity.."x "..foodName.."; is in category "..category..".");
			return true;
		end
	end
	--GFWUtils.DebugLog("Not skipping "..quantity.."x "..foodName.."; doesn't have other uses.");
	return false;
end

function FOM_IsQuestFood(itemID, quantity)
	FOM_ScanQuests();
	if (FOM_QuestFood and FOM_QuestFood[itemID]) then
		return GetItemCount(itemID) <= FOM_QuestFood[itemID];
	end
end

function FOM_IsInDiet(food, dietList)

	if ( dietList == nil ) then
		dietList = {GetPetFoodTypes()};
	end
	if ( dietList == nil or #dietList == 0) then
		FOM_PickFoodQueued = true;
		return false;
	end
	if (type(dietList) ~= "table") then
		dietList = {dietList};
	end
	for _, diet in pairs(dietList) do
		local PTdiet = FOM_PTDiets[diet];
		if (PTdiet and PT:ItemInSet(food, PTdiet)) then
			return true;
		end
	end
	
	return false;

end

function FOM_IsKnownFood(itemID)
	return FOM_IsInDiet(itemID, {FOM_DIET_MEAT, FOM_DIET_FISH, FOM_DIET_BREAD, FOM_DIET_CHEESE, FOM_DIET_FRUIT, FOM_DIET_FUNGUS});
end

function FOM_CookingSpellName()
	return (GetSpellInfo(FOM_COOKING_SPELL_ID));
end

function FOM_IsSpecialBag(bagNum)
	-- this used to be for quivers, but they're obsolete (and gone?) now
	-- other special bags can't contain food, though, so we may as well skip 'em
	if (bagNum == 0) then return false; end
	local _, bagType = GetContainerNumFreeSlots(bagNum);
	return bagType ~= 0; 	
end

function FOM_IDFromLink(itemLink)
	if (itemLink == nil) then return nil; end
	local _, _, itemID  = string.find(itemLink, "item:(%d+)");
	if (tonumber(itemID)) then
		return tonumber(itemID);
	else
		return nil;
	end
end

function FOM_NameFromLink(itemLink)
	if (itemLink == nil) then return nil; end
	local _, _, name = string.find(itemLink, "%[(.-)%]"); 
	if (name) then
		return name;
	end
	return itemLink;
end

------------------------------------------------------
-- foods list options pansl
------------------------------------------------------

local FOM_LIST_HEIGHT = 24;
local FOM_MAX_LIST_DISPLAYED = 10;
local MAX_COOKING_RESULTS = 6;

function FOM_BuildFoodsUI(panel)
	
	FOM_FoodsPanel = panel;
		
	local borderFrame = CreateFrame("Frame", "FOM_FoodListBorder", panel, "OptionsBoxTemplate");
	borderFrame:SetHeight(273);
	borderFrame:SetPoint("BOTTOMLEFT", panel, "BOTTOMLEFT", 15, 15);
	borderFrame:SetPoint("RIGHT", panel, -15, 0);
	borderFrame:Show();
	
	local headerBgLeft = panel:CreateTexture("FOM_FoodList_HeaderBGLeft", "ARTWORK");
	headerBgLeft:SetTexture("Interface\\TokenFrame\\UI-TokenFrame-CategoryButton");
	headerBgLeft:SetDesaturated(1);
	headerBgLeft:SetTexCoord(0, 1, 0, 0.28125);
	headerBgLeft:SetHeight(24);
	headerBgLeft:SetPoint("TOPLEFT",borderFrame,"TOPLEFT",5,-5);
	headerBgLeft:SetPoint("RIGHT",borderFrame,-66,0);
	headerBgLeft:Show();

	local headerBgRight = panel:CreateTexture("FOM_FoodList_HeaderBGRight", "ARTWORK");
	headerBgRight:SetTexture("Interface\\TokenFrame\\UI-TokenFrame-CategoryButton");
	headerBgRight:SetDesaturated(1);
	headerBgRight:SetTexCoord(0, 0.14453125, 0.296875, 0.578125);
	headerBgRight:SetWidth(61);
	headerBgRight:SetHeight(24);
	headerBgRight:SetPoint("TOPRIGHT",borderFrame,"TOPRIGHT",-5,-5);
	
	local s = panel:CreateFontString("FOM_FoodList_NameHeader", "OVERLAY", "GameFontNormalSmall");
	s:SetPoint("TOPLEFT", borderFrame, "TOPLEFT", 53, -12);
	s:SetText(FOM_OPTIONS_FOODS_NAME);
	
	s = panel:CreateFontString("FOM_FoodList_CookingHeader", "OVERLAY", "GameFontNormalSmall");
	s:SetPoint("TOPRIGHT", borderFrame, "TOPRIGHT", -26, -12);
	s:SetText(FOM_OPTIONS_FOODS_COOKING);
	
	local listItem = CreateFrame("Button", "FOM_FoodList1", panel, "FOM_FoodListItemTemplate");
	listItem:SetPoint("TOPLEFT", borderFrame, "TOPLEFT", 5, -29);
	listItem:SetPoint("TOPRIGHT", borderFrame, "TOPRIGHT", -24, -29);
	for i = 2, FOM_MAX_LIST_DISPLAYED do
		listItem = CreateFrame("Button", "FOM_FoodList" .. i, panel, "FOM_FoodListItemTemplate");
		listItem:SetPoint("TOPLEFT", "FOM_FoodList" .. (i - 1), "BOTTOMLEFT", 0, 0);
		listItem:SetPoint("TOPRIGHT", "FOM_FoodList" .. (i - 1), "BOTTOMRIGHT", 0, 0);
	end
	
	local scrollFrame = CreateFrame("ScrollFrame", "FOM_FoodListScrollFrame", panel, "FauxScrollFrameTemplate");
	scrollFrame:SetHeight(240);
	scrollFrame:SetPoint("TOPLEFT", borderFrame, "TOPLEFT", 5, -29);
	scrollFrame:SetPoint("RIGHT", borderFrame, -27, 0);
	scrollFrame:SetFrameLevel(scrollFrame:GetFrameLevel() + 5);
	scrollFrame:SetScript("OnVerticalScroll", function(self, offset) 
		FauxScrollFrame_OnVerticalScroll(self, offset, FOM_LIST_HEIGHT, FOM_FoodListUIUpdate);
	end);
		
end

function FOM_FoodListShowTooltip(button)
	if (button.recipe) then
		local recipe = FOM_CookingRecipes[button.item];
		if (recipe) then
			GameTooltip:SetHyperlink("enchant:"..recipe);
		else
			GameTooltip:SetHyperlink("item:"..button.item);
		end
		local difficulty = FOM_CookingDifficulty[button.item] or 5;
		local c = FOM_DifficultyColors[difficulty];
		GameTooltip:AddDoubleLine(FOM_DIFFICULTY_HEADER, getglobal("FOM_DIFFICULTY_"..difficulty), c.r,c.g,c.b, c.r,c.g,c.b);
		GameTooltip:Show();
	elseif (button.item) then
		GameTooltip:SetHyperlink("item:"..button.item);
		GameTooltip:Show();
	end	
end

function FOM_FoodListButton_OnLoad(self)
	local name = self:GetName();
	self.check = getglobal(name.."Check");
	self.icon = getglobal(name.."Icon");
	self.name = getglobal(name.."Name");
	self.categoryLeft = getglobal(name.."CategoryLeft");
	self.categoryRight = getglobal(name.."CategoryRight");
	self.cookingIcons = {};
	self.cookingItems = {};
	for i = 1, MAX_COOKING_RESULTS do
		self.cookingIcons[i] = getglobal(name.."CreatedIcon"..i);
		self.cookingItems[i] = getglobal(name.."CreatedItem"..i);
	end
end

function FOM_FoodListButton_OnClick(self)
	if (self.header and not self.item) then
		if (FOM_Config.excludedCategories[self.header]) then
			FOM_Config.excludedCategories[self.header] = nil;
		else
			FOM_Config.excludedCategories[self.header] = 1;
		end
	elseif (self.item and not FOM_Config.excludedCategories[self.header]) then
		if (FOM_Config.excludedFoods[self.item]) then
			FOM_Config.excludedFoods[self.item] = nil;
		else
			FOM_Config.excludedFoods[self.item] = 1;
		end
	end
	FOM_FoodListUIUpdate();
	if (InCombatLockdown()) then
		FOM_PickFoodQueued = true;
	else
		FOM_PickFoodForButton();
	end
end

function FOM_FoodListUI_UpdateList()
	FOM_FoodsUIList = {};
	for _, header in pairs(FOM_PTCategories) do
		if (PT:GetSetTable(header)) then
			local list = {};
			local uniqueList = {};
			-- build list of foods from PT matching criteria
			local petLevel = UnitLevel("player") - FOM_MAX_PET_LEVEL_DELTA;	-- player lvl - 3 assumed if no pet summoned
			if (UnitExists("pet")) then
				petLevel = UnitLevel("pet");
			end
			local itemNamesCache = {};
			for itemID in PT:IterateSet(header) do
				local name, _, _, iLvl = GetItemInfo(itemID);
				local skip = false;
				if (name) then
					itemNamesCache[itemID] = name;
					local delta = petLevel - iLvl;
					if (FOM_Config.ShowOnlyInventory) then
						if (GetItemCount(itemID) == 0) then
							skip = true;
						end
					end
					local dietChecked = false;
					if (not skip and FOM_Config.ShowOnlyPetFoods) then
						if (UnitExists("pet")) then
							if (not FOM_IsInDiet(itemID)) then
								skip = true;
							end
							dietChecked = true;
						end
						if (not skip and delta >= FOM_DELTA_EATS) then
							skip = true;
						end
					end
					if (not skip and not dietChecked and not FOM_IsKnownFood(itemID)) then
						-- make sure PT foods not in pet diets don't show up
						skip = true;
					end
					
					if (not skip) then
						if (not uniqueList[itemID]) then
							tinsert(list, itemID);
						end
						if (delta >= FOM_DELTA_EATS) then
							uniqueList[itemID] = 3;
						elseif (delta >= FOM_DELTA_LIKES and delta < FOM_DELTA_EATS) then
							uniqueList[itemID] = 2;
						elseif (delta >= FOM_DELTA_LOVES and delta < FOM_DELTA_LIKES) then
							uniqueList[itemID] = 1;
						elseif (delta < FOM_DELTA_LOVES) then
							uniqueList[itemID] = 0;
						end
					end
				end
			end
			-- sort list for display
			local function sortHigherQualityFirst(a,b)
				if (uniqueList[a] == uniqueList[b]) then
					return itemNamesCache[a] < itemNamesCache[b];
				else
					return uniqueList[a] < uniqueList[b];
				end
			end
			local function sortLowerQualityFirst(a,b)
				if (uniqueList[a] == uniqueList[b]) then
					return itemNamesCache[a] < itemNamesCache[b];
				else
					return uniqueList[a] > uniqueList[b];
				end
			end
			if (not FOM_Config.UseLowLevelFirst) then
				table.sort(list, sortHigherQualityFirst);
			else
				table.sort(list, sortLowerQualityFirst);
			end
			tinsert(FOM_FoodsUIList, header);
			for _, itemID in pairs(list) do
				tinsert(FOM_FoodsUIList, {id=itemID,header=header});
			end
		end
	end
	FOM_FoodListUIUpdate();
end

function FOM_FoodListUIUpdate()

	local numListItems = #FOM_FoodsUIList;
	local listOffset = FauxScrollFrame_GetOffset(FOM_FoodListScrollFrame);
	if (listOffset > numListItems - FOM_MAX_LIST_DISPLAYED) then
		listOffset = math.max(0, numListItems - FOM_MAX_LIST_DISPLAYED);
		FauxScrollFrame_SetOffset(FOM_FoodListScrollFrame, listOffset);
	end
	
	FauxScrollFrame_Update(FOM_FoodListScrollFrame, numListItems, FOM_MAX_LIST_DISPLAYED, FOM_LIST_HEIGHT);
	
	local petLevel = UnitLevel("player") - FOM_MAX_PET_LEVEL_DELTA;	-- player lvl - 3 assumed if no pet summoned
	if (UnitExists("pet")) then
		petLevel = UnitLevel("pet");
	end
	for i=1, FOM_MAX_LIST_DISPLAYED, 1 do
		local listIndex = i + listOffset;
		local listItem = FOM_FoodsUIList[listIndex];
		local listButton = getglobal("FOM_FoodList"..i);
		
		if ( listIndex <= numListItems ) then	
			-- Set button widths if scrollbar is shown or hidden
			if ( FOM_FoodListScrollFrame:IsShown() ) then
				listButton:SetWidth(350);
			else
				listButton:SetWidth(368);
			end
							
			listButton:SetID(listIndex);
			listButton:Show();
			
			if ( type(listItem) == "string" ) then
				-- it's a header
				listButton.header = listItem;
				listButton.item = nil;

				listButton.categoryRight:Show();
				listButton.categoryLeft:Show();
				listButton.icon:SetTexture("");
				listButton.name:SetText("");
				listButton:SetText(FOM_CategoryNames[listItem]);
				
				for iconIndex = 1, MAX_COOKING_RESULTS do
					listButton.cookingIcons[iconIndex]:SetTexture("");
					listButton.cookingItems[iconIndex]:Hide();
				end
				
				if (FOM_Config.excludedCategories[listItem]) then
					listButton.check:Hide();
				else
					listButton.check:Show();
				end
				listButton:SetAlpha(1);
				
			else
				listButton.header = listItem.header;
				listButton.item = listItem.id;
		
				listButton.categoryLeft:Hide();
				listButton.categoryRight:Hide();

				local name, _, _, iLvl, _, _, _, _, _, texture = GetItemInfo(listItem.id);
				listButton:SetText("");
				listButton.name:SetText(name);
				local color;
				local delta = petLevel - iLvl;
				if (delta > FOM_DELTA_EATS) then
					color = QuestDifficultyColors["trivial"];
				elseif (delta > FOM_DELTA_LIKES and delta <= FOM_DELTA_EATS) then
					color = QuestDifficultyColors["standard"];
				elseif (delta > FOM_DELTA_LOVES and delta <= FOM_DELTA_LIKES) then
					color = QuestDifficultyColors["difficult"];
				elseif (delta <= FOM_DELTA_LOVES) then
					color = QuestDifficultyColors["verydifficult"];
				end
				listButton.name:SetTextColor(color.r, color.g, color.b);
				listButton.icon:SetTexture(texture);

				-- show cooking results
				for iconIndex = 1, MAX_COOKING_RESULTS do
					listButton.cookingIcons[iconIndex]:SetTexture("");
					listButton.cookingItems[iconIndex]:Hide();
				end
				local cookingResultString = PT:ItemInSet(listItem.id, "TradeskillResultMats.Reverse.Cooking");
				if (cookingResultString) then
					local resultIndex = 1;
					local cookingResults = {strsplit(";", cookingResultString)};
					for _, resultString in pairs(cookingResults) do
						local _, _, itemID = string.find(resultString, "^(%d+)");
						if (itemID) then
							if (resultIndex > MAX_COOKING_RESULTS) then
								--print(GetItemInfo(listItem.id), resultIndex)
								break;
							end
							
							itemID = tonumber(itemID);
							icon = GetItemIcon(itemID);
							listButton.cookingIcons[resultIndex]:SetTexture(icon);
							listButton.cookingItems[resultIndex]:Show();
							listButton.cookingItems[resultIndex].item = itemID;
							listButton.cookingItems[resultIndex].recipe = true;
							
							local difficulty = FOM_CookingDifficulty[itemID];
							if (difficulty) then
								listButton.cookingIcons[resultIndex]:SetVertexColor(1, 1, 1);
							else
								listButton.cookingIcons[resultIndex]:SetVertexColor(0.25, 0.25, 0.25);
							end
							resultIndex = resultIndex + 1;
						end
					end
				end
							
							
				if (FOM_Config.excludedFoods[listItem.id] or FOM_Config.excludedCategories[listItem.header]) then
					listButton.check:Hide();
				else
					listButton.check:Show();
				end
				
				if (FOM_Config.excludedCategories[listItem.header]) then
					listButton:SetAlpha(0.5);
				else
					listButton:SetAlpha(1);
				end
			end
			
		else
			listButton:Hide();
		end
	end
	
end

------------------------------------------------------
-- Ace3 options panel stuff
------------------------------------------------------

local AceConfig = LibStub("AceConfig-3.0")
local AceConfigDialog = LibStub("AceConfigDialog-3.0")
local AceDB = LibStub("AceDB-3.0")

-- AceAddon Initialization
GFW_FeedOMatic = LibStub("AceAddon-3.0"):NewAddon(addonName)
GFW_FeedOMatic.date = gsub("$Date: 2012-12-27 22:17:15 -0800 (Thu, 27 Dec 2012) $", "^.-(%d%d%d%d%-%d%d%-%d%d).-$", "%1")

function GFW_FeedOMatic:OnProfileChanged(event, database, newProfileKey)
	-- this is called every time our profile changes (after the change)
	FOM_Config = database.profile

	if (FOM_FoodListBorder and FOM_FoodListBorder:IsVisible()) then
		FOM_FoodListUI_UpdateList();
	end
	if (InCombatLockdown()) then
		FOM_PickFoodQueued = true;
	else
		FOM_PickFoodForButton();
	end
end

local function getProfileOption(info)
	return FOM_Config[info.arg]
end

local function setProfileOption(info, value)
	FOM_Config[info.arg] = value

	if (FOM_FoodListBorder and FOM_FoodListBorder:IsVisible()) then
		FOM_FoodListUI_UpdateList();
	end
	if (InCombatLockdown()) then
		FOM_PickFoodQueued = true;
	else
		FOM_PickFoodForButton();
	end
	
	if (info.arg == "NoButton") then
		if (FOM_Config.NoButton) then
			FOM_FeedButton:Hide();
		else
			FOM_FeedButton:Show();
		end
	end
	
end

local titleText = GetAddOnMetadata(addonName, "Title");
local version = GetAddOnMetadata(addonName, "Version");
titleText = titleText .. " " .. version;

local options = {
	type = 'group',
	get = getProfileOption,
	set = setProfileOption,
	name = titleText,
	args = {
		general = {
			type = 'group',
			order = -1,
			name = FOM_OPTIONS_GENERAL,
			desc = "foo",
			args = {
				tips = {
					type = "description",
					name = FOM_OPTIONS_SUBTEXT,
					order = 1,
				},
				tooltip = {
					type = 'toggle',
					order = 2,
					width = "double",
					name = FOM_OPTIONS_TOOLTIP,
					desc = FOM_OPTIONS_TOOLTIP_TIP,
					arg = "Tooltip",
				},
				useLowLevelFirst = {
					type = 'toggle',
					order = 3,
					width = "double",
					name = FOM_OPTIONS_LOW_LVL_1ST,
					desc = FOM_OPTIONS_LOW_LVL_1ST_TIP,
					arg = "UseLowLevelFirst",
				},
				avoidQuestFood = {
					type = 'toggle',
					order = 4,
					width = "double",
					name = FOM_OPTIONS_AVOID_QUEST,
					desc = FOM_OPTIONS_AVOID_QUEST_TIP,
					arg = "AvoidQuestFood",
				},
				alertType = {
					type = 'select',
					order = 5,
					name = FOM_OPTIONS_FEED_NOTIFY,
					values = {
						[1] = FOM_OPTIONS_NOTIFY_EMOTE,
						[2] = FOM_OPTIONS_NOTIFY_TEXT,
						[3] = FOM_OPTIONS_NOTIFY_NONE,
					},
					arg = "AlertType",
				},
				noButton = {
					type = 'toggle',
					order = 6,
					width = "double",
					name = FOM_OPTIONS_NO_BUTTON,
					desc = FOM_OPTIONS_NO_BUTTON_TIP,
					arg = "NoButton",
				},
				blank = {
					type = "header",
					name = FOM_OPTIONS_FOODS_TITLE,
					order = 10,
				},
				tips = {
					type = "description",
					name = FOM_OPTIONS_FOODS_TEXT,
					order = 11,
			   	},
			   	showOnlyPetFoods = {
			   	    type = 'toggle',
			   	    order = 12,
			   	    width = "double",
			   	    name = FOM_OPTIONS_FOODS_ONLY_PET,
					desc = function() 
						if (UnitExists("pet")) then
							return format(FOM_OPTIONS_FOODS_ONLY_PET_TIP, UnitLevel("pet"), UnitCreatureFamily("pet"));
						else
							return format(FOM_OPTIONS_FOODS_ONLY_LVL_TIP, UnitLevel("player") - FOM_MAX_PET_LEVEL_DELTA);
						end
					end,
			   	    arg = "ShowOnlyPetFoods",
			   	},
			   	showOnlyInventory = {
			   	    type = 'toggle',
					order = 13,
					width = "double",
					name = FOM_OPTIONS_FOODS_ONLY_INV,
					arg = "ShowOnlyInventory",
				},
			},
		},
	},
}
local profileDefault = {
	Tooltip				= true,
	UseLowLevelFirst	= true,
	AvoidQuestFood		= true,
	AlertType			= 1,
	
	ShowOnlyPetFoods	= false,
	ShowOnlyInventory	= false,
	
	excludedCategories = {
		["Consumable.Food.Edible.Bonus"] = 1;
	},
	excludedFoods = {},
}
local defaults = {}
defaults.profile = profileDefault

function GFW_FeedOMatic:SetupOptions()
	-- Inject profile options
	options.args.profile = LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db)
	options.args.profile.order = -2
	
	-- Register options table
	AceConfig:RegisterOptionsTable(addonName, options)
	
	local titleText = GetAddOnMetadata(addonName, "Title");
	titleText = string.gsub(titleText, "Fizzwidget", "GFW");		-- shorter so it fits in the list width

	-- Setup Blizzard option frames
	self.optionsFrames = {}
	-- The ordering here matters, it determines the order in the Blizzard Interface Options
	self.optionsFrames.general = AceConfigDialog:AddToBlizOptions(addonName, titleText, nil, "general")
	self.optionsFrames.profile = AceConfigDialog:AddToBlizOptions(addonName, FOM_OPTIONS_PROFILE, titleText, "profile")
	
	FOM_BuildFoodsUI(self.optionsFrames.general);
	local aceRefresh = self.optionsFrames.general.refresh;
	self.optionsFrames.general.refresh = function(...)
		aceRefresh(...);
		FOM_FoodListUI_UpdateList();
	end;
end

function GFW_FeedOMatic:OnInitialize()

	local _, realClass = UnitClass("player");
	if (realClass ~= "HUNTER") then
		return;
	end

	local version = GetAddOnMetadata(addonName, "Version");
	self.version = version.." (r"..gsub("$Revision: 780 $", "(%d+)", "%1")..")"

	-- Create DB
	self.db = AceDB:New("GFW_FeedOMatic_DB", defaults, "Default")
	self.db.RegisterCallback(self, "OnProfileChanged", "OnProfileChanged")
	self.db.RegisterCallback(self, "OnProfileCopied", "OnProfileChanged")
	self.db.RegisterCallback(self, "OnProfileReset", "OnProfileChanged")
	
	FOM_Config = self.db.profile
	self:SetupOptions()
end

function GFW_FeedOMatic:ShowConfig()
	InterfaceOptionsFrame_OpenToCategory(self.optionsFrames.general)
end

