::mods_hookExactClass("entity/world/attached_location/goat_herd_oriental_location", function(o) {
	o.onUpdateDraftList = function( _list )
	{
		if (!this.isActive())
		{
			return;
		}

		_list.push("daytaler_southern_background");
		_list.push("shepherd_southern_background");
		_list.push("shepherd_southern_background");
		_list.push("shepherd_southern_background");
		_list.push("shepherd_southern_background");
	}

	o.onUpdateShopList = function( _id, _list )
	{
		if (_id == "building.marketplace")
		{
			_list.push({
				R = 0,
				P = 1.0,
				S = "supplies/goat_cheese_item"
			});
			_list.push({
				R = 0,
				P = 1.0,
				S = "supplies/dried_lamb_item"
			});
			_list.push({
				R = 20,
				P = 1.0,
				S = "weapons/staff_sling"
			});
		}
	}

});

