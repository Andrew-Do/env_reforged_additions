::mods_hookExactClass("entity/world/attached_location/lumber_camp_location", function(o) {
	o.onUpdateProduce = function( _list )
	{
		_list.push("trade/quality_wood_item");
	}

	o.onBuild = function()
	{
		local myTile = this.getTile();

		for( local i = 0; i != 6; i = ++i )
		{
			if (!myTile.hasNextTile(i))
			{
			}
			else
			{
				local nextTile = myTile.getNextTile(i);

				if (nextTile.Type == this.Const.World.TerrainType.LeaveForest)
				{
					nextTile.clear();
					nextTile.spawnDetail("world_detail_forest_leaves_cut_0" + this.Math.rand(1, 2), this.Const.World.ZLevel.Object, 0);
				}
				else if (nextTile.Type == this.Const.World.TerrainType.Forest)
				{
					nextTile.clear();
					nextTile.spawnDetail("world_detail_forest_cut_0" + this.Math.rand(1, 2), this.Const.World.ZLevel.Object, 0);
					nextTile.setBrush("world_forest_needle_02");
				}
			}
		}

		return true;
	}

	o.onUpdateDraftList = function( _list )
	{
		if (!this.isActive())
		{
			return;
		}

		_list.push("lumberjack_background");
		_list.push("lumberjack_background");
		_list.push("lumberjack_background");
		_list.push("poacher_background");
		_list.push("wildman_background");
	}

	o.onUpdateShopList = function( _id, _list )
	{
		if (_id == "building.marketplace")
		{
			_list.push({
				R = 30,
				P = 1.0,
				S = "weapons/hatchet"
			});
			_list.push({
				R = 30,
				P = 1.0,
				S = "weapons/hatchet"
			});
			_list.push({
				R = 30,
				P = 1.0,
				S = "weapons/hand_axe"
			});
			_list.push({
				R = 50,
				P = 1.0,
				S = "weapons/hooked_blade"
			});
			_list.push({
				R = 0,
				P = 1.0,
				S = "trade/quality_wood_item"
			});
		}
		else if (_id == "building.weaponsmith" || _id == "building.weaponsmith_oriental")
		{
			_list.push({
				R = 20,
				P = 1.0,
				S = "weapons/hatchet"
			});
			_list.push({
				R = 20,
				P = 1.0,
				S = "weapons/hand_axe"
			});
			_list.push({
				R = 20,
				P = 1.0,
				S = "weapons/hooked_blade"
			});
		}
		else if (_id == "building.specialized_trader")
		{
		}
	}

});

