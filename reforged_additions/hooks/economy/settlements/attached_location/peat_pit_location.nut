::mods_hookExactClass("entity/world/attached_location/peat_pit_location", function(o) {
	o.onUpdateProduce = function( _list )
	{
		_list.push("trade/peat_bricks_item");
	}

	o.onUpdateDraftList = function( _list )
	{
		if (!this.isActive())
		{
			return;
		}

		_list.push("daytaler_background");
		_list.push("peddler_background");
	}

	o.onUpdateShopList = function( _id, _list )
	{
		if (_id == "building.marketplace")
		{
			_list.push({
				R = 0,
				P = 1.0,
				S = "trade/peat_bricks_item"
			});
		}

		if (_id == "building.specialized_trader")
		{
		}
	}

});
