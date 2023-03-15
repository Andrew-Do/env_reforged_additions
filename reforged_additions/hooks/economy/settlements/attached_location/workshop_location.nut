::mods_hookExactClass("entity/world/attached_location/workshop_location", function(o) {
	o.onUpdateProduce = function( _list )
	{
		_list.push("supplies/armor_parts_item");
	}

	o.onUpdateDraftList = function( _list )
	{
		if (!this.isActive())
		{
			return;
		}

		_list.push("apprentice_background");
		_list.push("caravan_hand_background");
		_list.push("peddler_background");
		_list.push("daytaler_background");
	}

	o.onUpdateShopList = function( _id, _list )
	{
		if (_id == "building.marketplace")
		{
			_list.push({
				R = 20,
				P = 1.0,
				S = "supplies/armor_parts_item"
			});
			_list.push({
				R = 20,
				P = 1.0,
				S = "supplies/armor_parts_item"
			});
			_list.push({
				R = 20,
				P = 1.0,
				S = "supplies/armor_parts_item"
			});
			_list.push({
				R = 20,
				P = 1.0,
				S = "supplies/armor_parts_item"
			});
		}
		else if (_id == "building.specialized_trader")
		{
		}
		else if (_id == "building.weaponsmith")
		{
		}
		else if (_id == "building.armorsmith")
		{
		}
	}

});
