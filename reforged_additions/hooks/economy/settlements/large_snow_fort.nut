::mods_hookExactClass("entity/world/settlements/large_snow_fort", function(o) {
	local create = o.create;
	o.create = function()	
	{
		create();
		this.m.DraftList = [
			"apprentice_background",
			"brawler_background",
			"daytaler_background",
			"gravedigger_background",
			"graverobber_background",
			"mason_background",
			"messenger_background",
			"militia_background",
			"militia_background",
			"militia_background",
			"ratcatcher_background",
			"refugee_background",
			"servant_background",
			"vagabond_background",
			"vagabond_background",
			"wildman_background",
			"wildman_background",
			"wildman_background",
			"witchhunter_background",
			"witchhunter_background",
			"adventurous_noble_background",
			"deserter_background",
			"deserter_background",
			"disowned_noble_background",
			"disowned_noble_background",
			"hedge_knight_background",
			"hedge_knight_background",
			"raider_background",
			"raider_background",
			"raider_background",
			"retired_soldier_background",
			"retired_soldier_background",
			"sellsword_background",
			"squire_background",
			"cripple_background",
			"paladin_background",
			"beast_hunter_background"
		];
	}

	o.onBuild = function()
	{
		this.addBuilding(this.new("scripts/entity/world/settlements/buildings/crowd_building"), 5);
		this.addBuilding(this.new("scripts/entity/world/settlements/buildings/marketplace_building"), 2);
		this.addBuilding(this.new("scripts/entity/world/settlements/buildings/armorsmith_building"));
		this.addBuilding(this.new("scripts/entity/world/settlements/buildings/weaponsmith_building"));
		this.addBuilding(this.new("scripts/entity/world/settlements/buildings/training_hall_building"));

		if (this.Math.rand(1, 100) <= 60)
		{
			this.addBuilding(this.new("scripts/entity/world/settlements/buildings/tavern_building"));
		}
		else
		{
			this.addBuilding(this.new("scripts/entity/world/settlements/buildings/temple_building"));
		}

		if (this.Math.rand(1, 100) <= 40)
		{
			this.buildAttachedLocation(1, "scripts/entity/world/attached_location/stone_watchtower_location", [
				this.Const.World.TerrainType.Plains,
				this.Const.World.TerrainType.Steppe,
				this.Const.World.TerrainType.Snow,
				this.Const.World.TerrainType.Hills,
				this.Const.World.TerrainType.Tundra
			], [], 4, true);
			this.buildAttachedLocation(this.Math.rand(0, 1), "scripts/entity/world/attached_location/fortified_outpost_location", [
				this.Const.World.TerrainType.Tundra,
				this.Const.World.TerrainType.Hills
			], [], 2, true);
		}
		else
		{
			this.buildAttachedLocation(this.Math.rand(0, 1), "scripts/entity/world/attached_location/stone_watchtower_location", [
				this.Const.World.TerrainType.Plains,
				this.Const.World.TerrainType.Steppe,
				this.Const.World.TerrainType.Snow,
				this.Const.World.TerrainType.Hills,
				this.Const.World.TerrainType.Tundra
			], [], 4, true);
			this.buildAttachedLocation(1, "scripts/entity/world/attached_location/fortified_outpost_location", [
				this.Const.World.TerrainType.Tundra,
				this.Const.World.TerrainType.Hills
			], [], 2, true);
		}

		if (this.Math.rand(1, 100) <= 40)
		{
			this.buildAttachedLocation(1, "scripts/entity/world/attached_location/trapper_location", [
				this.Const.World.TerrainType.Snow,
				this.Const.World.TerrainType.Hills
			], [], 2);
			this.buildAttachedLocation(this.Math.rand(0, 1), "scripts/entity/world/attached_location/workshop_location", [
				this.Const.World.TerrainType.Snow,
				this.Const.World.TerrainType.Hills
			], [], 1);
		}
		else
		{
			this.buildAttachedLocation(this.Math.rand(0, 1), "scripts/entity/world/attached_location/trapper_location", [
				this.Const.World.TerrainType.Snow,
				this.Const.World.TerrainType.Hills
			], [], 2);
			this.buildAttachedLocation(1, "scripts/entity/world/attached_location/workshop_location", [
				this.Const.World.TerrainType.Snow,
				this.Const.World.TerrainType.Hills
			], [], 1);
		}

		this.buildAttachedLocation(1, "scripts/entity/world/attached_location/ore_smelters_location", [
			this.Const.World.TerrainType.Snow,
			this.Const.World.TerrainType.Hills,
			this.Const.World.TerrainType.Tundra
		], [
			this.Const.World.TerrainType.Hills
		]);
		this.buildAttachedLocation(1, "scripts/entity/world/attached_location/blast_furnace_location", [
			this.Const.World.TerrainType.Snow,
			this.Const.World.TerrainType.Hills
		], [
			this.Const.World.TerrainType.Tundra
		]);
		this.buildAttachedLocation(this.Math.rand(0, 1), "scripts/entity/world/attached_location/hunters_cabin_location", [
			this.Const.World.TerrainType.Snow,
			this.Const.World.TerrainType.Hills
		], [], 0, false, true);
		this.buildAttachedLocation(this.Math.rand(0, 1), "scripts/entity/world/attached_location/fletchers_hut_location", [
			this.Const.World.TerrainType.Snow,
			this.Const.World.TerrainType.Hills
		], [], 0, false, true);
	}

});

