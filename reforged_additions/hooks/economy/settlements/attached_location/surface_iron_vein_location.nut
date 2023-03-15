::mods_hookExactClass("entity/world/attached_location/surface_iron_vein_location", function(o) {
	o.onUpdateDraftList = function( _list )
	{
		if (!this.isActive())
		{
			return;
		}

		_list.push("militia_background");
		_list.push("miner_background");
		_list.push("miner_background");
		_list.push("miner_background");
		_list.push("retired_soldier_background");
	}

	o.onUpdateShopList = function( _id, _list )
	{
		if (_id == "building.marketplace")
		{
			_list.push({
				R = 25,
				P = 1.0,
				S = "supplies/armor_parts_item"
			});
		}
		else if (_id == "building.specialized_trader")
		{
		}
		else if (_id == "building.weaponsmith")
		{
			_list.push({
				R = 55,
				P = 1.0,
				S = "weapons/falchion"
			});
			_list.push({
				R = 60,
				P = 1.0,
				S = "weapons/morning_star"
			});
			_list.push({
				R = 70,
				P = 1.0,
				S = "weapons/arming_sword"
			});
			_list.push({
				R = 70,
				P = 1.0,
				S = "weapons/military_cleaver"
			});
			_list.push({
				R = 60,
				P = 1.0,
				S = "weapons/winged_mace"
			});
			_list.push({
				R = 60,
				P = 1.0,
				S = "weapons/pike"
			});
			_list.push({
				R = 70,
				P = 1.0,
				S = "weapons/longaxe"
			});
		}
		else if (_id == "building.armorsmith")
		{
		}
	}

});

