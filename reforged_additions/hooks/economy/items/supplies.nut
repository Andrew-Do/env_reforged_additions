
::mods_hookExactClass("items/supplies/armor_parts_item", function(o)
{
	o.getBuyPrice = function()
	{
		if (("State" in this.World) && this.World.State != null && this.World.State.getCurrentTown() != null)
		{
			local t = this.World.State.getCurrentTown();
			local isBuildingPresent = t.hasAttachedLocation("attached_location.workshop") 
				|| t.hasAttachedLocation("attached_location.leather_tanner") 
				|| t.hasBuilding("building.armorsmith") 
				|| t.hasBuilding("building.armorsmith_oriental") 
				|| t.hasBuilding("building.weaponsmith") 
				|| t.hasBuilding("building.weaponsmith_oriental");

			return this.Math.max(
				this.getSellPrice(), 
				this.Math.ceil(this.getValue() * this.getPriceMult() * this.Const.Difficulty.BuyPriceMult[this.World.Assets.getEconomicDifficulty()] * this.World.State.getCurrentTown().getBuyPriceMult() * (isBuildingPresent ? 1.0 : 1.25))
			);
		}
		return this.item.getBuyPrice();
	}

});

::mods_hookExactClass("items/supplies/medicine_item", function(o)
{
	o.getBuyPrice = function()
	{
		if (("State" in this.World) && this.World.State != null && this.World.State.getCurrentTown() != null)
		{
			local isBuildingPresent = this.World.State.getCurrentTown().hasAttachedLocation("attached_location.herbalists_grove") 
			|| this.World.State.getCurrentTown().hasAttachedLocation("attached_location.mushroom_grove") 
			|| this.World.State.getCurrentTown().hasAttachedLocation("attached_location.gatherers_hut");
			
			return this.Math.max(
				this.getSellPrice(),
				this.Math.ceil(this.getValue() * this.getPriceMult() * this.Const.Difficulty.BuyPriceMult[this.World.Assets.getEconomicDifficulty()] * this.World.State.getCurrentTown().getBuyPriceMult() * this.World.State.getCurrentTown().getModifiers().MedicalPriceMult * (isBuildingPresent ? 1.0 : 1.25))
			);
		}

		return this.item.getBuyPrice();
	}

});