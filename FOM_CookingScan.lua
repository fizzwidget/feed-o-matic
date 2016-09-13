------------------------------------------------------
-- FOM_CookingScan.lua
------------------------------------------------------

local COOKING_SKILL_ID = 185;

FOM_Cooking = {};

function FOM_ScanTradeSkill()
	
	local tradeSkillID, skillLineName, skillLineRank, skillLineMaxRank, skillLineModifier = C_TradeSkillUI.GetTradeSkillLine();	
	if not C_TradeSkillUI.IsTradeSkillReady() 
	  or C_TradeSkillUI.IsDataSourceChanging() 
	  or tradeSkillID ~= COOKING_SKILL_ID then
		return -- should just get called again when ready
	end
		
	local allRecipeIDs = C_TradeSkillUI.GetAllRecipeIDs(FOM_RecipeIDs);
	for _, recipeID in pairs(allRecipeIDs) do
		local numReagents = C_TradeSkillUI.GetRecipeNumReagents(recipeID);
		if numReagents > 0 then
			for reagentIndex = 1, numReagents do
				local reagentLink = C_TradeSkillUI.GetRecipeReagentItemLink(recipeID, reagentIndex);
				if reagentLink then
					local _, _, itemID = string.find(reagentLink, "item:(%d+)");
					local reagentItemID = tonumber(itemID);
					if FOM_Cooking[reagentItemID] == nil then
						FOM_Cooking[reagentItemID] = {};
					end
					FOM_Cooking[reagentItemID][recipeID] = true;
				end		
			end
		end
	end
end
