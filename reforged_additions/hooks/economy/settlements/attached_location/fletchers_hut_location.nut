::mods_hookExactClass("entity/world/attached_location/fletchers_hut_location", function(o) {
	o.onUpdateProduce = function( _list )
	{
		_list.push("supplies/ammo_item");
	}

	o.onUpdateDraftList = function( _list )
	{
		if (!this.isActive())
		{
			return;
		}

		_list.push("hunter_background");
		_list.push("bowyer_background");
		_list.push("bowyer_background");
		_list.push("poacher_background");
		_list.push("witchhunter_background");
	}

	o.onUpdateShopList = function( _id, _list )
	{
		if (_id == "building.marketplace")
		{
			_list.push({
				R = 10,
				P = 1.0,
				S = "weapons/short_bow"
			});
			_list.push({
				R = 0,
				P = 0.8,
				S = "ammo/quiver_of_arrows"
			});
			_list.push({
				R = 0,
				P = 0.8,
				S = "ammo/quiver_of_bolts"
			});
			_list.push({
				R = 0,
				P = 0.8,
				S = "supplies/ammo_item"
			});
		}
		else if (_id == "building.specialized_trader")
		{
		}
		else if (_id == "building.fletcher")
		{
			_list.push({
				R = 20,
				P = 1.0,
				S = "weapons/hunting_bow"
			});
			_list.push({
				R = 20,
				P = 1.0,
				S = "weapons/light_crossbow"
			});
		}
		else if (_id == "building.armorsmith")
		{
		}
	}

});

