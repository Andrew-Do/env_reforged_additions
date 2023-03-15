::mods_hookExactClass("entity/world/attached_location/wool_spinner_location", function(o) {
	o.onUpdateProduce = function( _list )
	{
		_list.push("trade/cloth_rolls_item");
	}

	o.onUpdateDraftList = function( _list )
	{
		if (!this.isActive())
		{
			return;
		}

		_list.push("apprentice_background");
		_list.push("caravan_hand_background");
		_list.push("tailor_background");
		_list.push("tailor_background");
		_list.push("shepherd_background");
	}

	o.onUpdateShopList = function( _id, _list )
	{
		if (_id == "building.marketplace")
		{
			_list.push({
				R = 10,
				P = 1.0,
				S = "armor/linen_tunic"
			});
			_list.push({
				R = 10,
				P = 1.0,
				S = "armor/linen_tunic"
			});
			_list.push({
				R = 10,
				P = 1.0,
				S = "helmets/hood"
			});
			_list.push({
				R = 0,
				P = 1.0,
				S = "trade/cloth_rolls_item"
			});
		}
		else if (_id == "building.specialized_trader")
		{
		}
	}

});

