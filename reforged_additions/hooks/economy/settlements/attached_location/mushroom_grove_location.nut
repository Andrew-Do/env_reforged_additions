::mods_hookExactClass("entity/world/attached_location/mushroom_grove_location", function(o) {
	o.onUpdateProduce = function( _list )
	{
		_list.push("supplies/pickled_mushrooms_item");
	}

	o.onUpdateDraftList = function( _list )
	{
		if (!this.isActive())
		{
			return;
		}

		_list.push("cultist_background");
		_list.push("cultist_background");
		_list.push("flagellant_background");
		_list.push("wildman_background");
	}

	o.onUpdateShopList = function( _id, _list )
	{
		if (_id == "building.marketplace")
		{
			_list.push({
				R = 0,
				P = 1.0,
				S = "supplies/pickled_mushrooms_item"
			});
			_list.push({
				R = 20,
				P = 1.0,
				S = "armor/apron"
			});
			_list.push({
				R = 20,
				P = 1.0,
				S = "supplies/medicine_item"
			});
			_list.push({
				R = 50,
				P = 1.0,
				S = "accessory/berserker_mushrooms_item"
			});
		}
	}

});

