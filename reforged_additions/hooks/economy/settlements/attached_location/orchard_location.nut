::mods_hookExactClass("entity/world/attached_location/orchard_location", function(o) {
	o.onBuild = function()
	{
		local myTile = this.getTile();
		local num = 0;

		for( local i = 0; i != 6; i = ++i )
		{
			if (!myTile.hasNextTile(i))
			{
			}
			else
			{
				local nextTile = myTile.getNextTile(i);

				if (nextTile.IsOccupied || nextTile.HasRoad)
				{
				}
				else if (nextTile.Type != this.Const.World.TerrainType.Plains && nextTile.Type != this.Const.World.TerrainType.Tundra && nextTile.Type != this.Const.World.TerrainType.Steppe)
				{
				}
				else
				{
					if (this.Math.rand(1, 100) <= 50)
					{
						nextTile.clear();
						nextTile.spawnDetail("world_orchard_detail_0" + this.Math.rand(1, 2), this.Const.World.ZLevel.Object, this.Const.World.DetailType.NotCompatibleWithRoad);
						num = ++num;
					}

					if (num >= 2)
					{
						break;
					}
				}
			}
		}

		return true;
	}

	o.onUpdateProduce = function( _list )
	{
		_list.push("supplies/dried_fruits_item");
	}

	o.onUpdateDraftList = function( _list )
	{
		if (!this.isActive())
		{
			return;
		}

		_list.push("daytaler_background");
		_list.push("farmhand_background");
	}

	o.onUpdateShopList = function( _id, _list )
	{
		if (_id == "building.marketplace")
		{
			_list.push({
				R = 0,
				P = 1.0,
				S = "supplies/dried_fruits_item"
			});
			_list.push({
				R = 10,
				P = 1.0,
				S = "helmets/hood"
			});
			_list.push({
				R = 20,
				P = 1.0,
				S = "weapons/scramasax"
			});
		}
	}

});

