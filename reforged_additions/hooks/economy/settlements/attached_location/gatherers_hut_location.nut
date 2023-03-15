::mods_hookExactClass("entity/world/attached_location/gatherers_hut_location", function(o) {
	o.onUpdateProduce = function( _list )
	{
		_list.push("supplies/roots_and_berries_item");
	}

	o.onUpdateDraftList = function( _list )
	{
		if (!this.isActive())
		{
			return;
		}

		_list.push("daytaler_background");
	}

	o.onUpdateShopList = function( _id, _list )
	{
		if (_id == "building.marketplace")
		{
			_list.push({
				R = 0,
				P = 1.0,
				S = "supplies/roots_and_berries_item"
			});
			_list.push({
				R = 20,
				P = 1.0,
				S = "weapons/bludgeon"
			});
			_list.push({
				R = 20,
				P = 1.0,
				S = "supplies/medicine_item"
			});
		}
	}

});

