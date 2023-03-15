::mods_hookExactClass("entity/world/attached_location/plantation_location", function(o) {
	o.onBuild = function()
	{
		local myTile = this.getTile();
		myTile.setBrush("world_desert_0" + this.Math.rand(6, 9));
		return true;
	}

	o.onUpdateProduce = function( _list )
	{
		_list.push("trade/spices_item");
	}

	o.onUpdateDraftList = function( _list )
	{
		if (!this.isActive())
		{
			return;
		}

		_list.push("slave_southern_background");
		_list.push("slave_southern_background");
	}

	o.onUpdateShopList = function( _id, _list )
	{
		if (_id == "building.marketplace")
		{
			_list.push({
				R = 0,
				P = 1.0,
				S = "trade/spices_item"
			});
			_list.push({
				R = 0,
				P = 1.0,
				S = "supplies/dates_item"
			});
		}
	}

});

