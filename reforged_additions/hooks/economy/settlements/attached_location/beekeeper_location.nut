::mods_hookExactClass("entity/world/attached_location/beekeeper_location", function(o) {
	o.onUpdateProduce = function( _list )
	{
		_list.push("supplies/mead_item");
	}

	o.onUpdateDraftList = function( _list )
	{
		if (!this.isActive())
		{
			return;
		}

		_list.push("farmhand_background");
		_list.push("farmhand_background");
	}

	o.onUpdateShopList = function( _id, _list )
	{
		if (_id == "building.marketplace")
		{
			_list.push({
				R = 0,
				P = 1.0,
				S = "supplies/mead_item"
			});
			_list.push({
				R = 30,
				P = 1.0,
				S = "helmets/cultist_hood"
			});
			_list.push({
				R = 20,
				P = 1.0,
				S = "armor/apron"
			});
		}
	}

});
