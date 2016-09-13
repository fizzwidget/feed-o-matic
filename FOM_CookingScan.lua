------------------------------------------------------
-- FOM_CookingScan.lua
------------------------------------------------------

local COOKING_SKILL_ID = 185;

FOM_Cooking = {};

local DifficultyToNum = {
	["optimal"]	= 4,
	["orange"]	= 4,
	["medium"]	= 3,
	["yellow"]	= 3,
	["easy"]	= 2,
	["green"]	= 2,
	["trivial"]	= 1,
	["gray"]	= 1,
	["grey"]	= 1,
}

function FOM_ScanTradeSkill()
	
	local tradeSkillID, skillLineName, skillLineRank, skillLineMaxRank, skillLineModifier = C_TradeSkillUI.GetTradeSkillLine();	
	if not C_TradeSkillUI.IsTradeSkillReady() 
	  or C_TradeSkillUI.IsDataSourceChanging() 
	  or tradeSkillID ~= COOKING_SKILL_ID then
		return -- should just get called again when ready
	end
		
	local allRecipeIDs = C_TradeSkillUI.GetAllRecipeIDs(FOM_RecipeIDs);
	for _, recipeID in pairs(allRecipeIDs) do
		
		local recipeInfo = C_TradeSkillUI.GetRecipeInfo(recipeID);
		local difficulty;
		if recipeInfo.learned then
			difficulty = DifficultyToNum[recipeInfo.difficulty];
		else
			difficulty = 5;
		end
		
		local createdItemLink = C_TradeSkillUI.GetRecipeItemLink(recipeID);
		local _, _, id = string.find(createdItemLink, "item:(%d+)");
		local createdItemID = tonumber(id);
		
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
					FOM_Cooking[reagentItemID][createdItemID] = difficulty;
				end		
			end
		end
	end
end
