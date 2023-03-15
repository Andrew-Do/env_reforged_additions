::mods_hookExactClass("entity/world/attached_location/salt_mine_location", function(o) {
	o.onUpdateProduce = function( _list )
	{
		_list.push("trade/salt_item");
	}

	o.onUpdateDraftList = function( _list )
	{
		if (!this.isActive())
		{
			return;
		}

		_list.push("miner_background");
		_list.push("miner_background");
		_list.push("caravan_hand_background");
	}

	o.onUpdateShopList = function( _id, _list )
	{
		if (_id == "building.marketplace")
		{
			_list.push({
				R = 0,
				P = 1.0,
				S = "trade/salt_item"
			});
		}
		else if (_id == "building.specialized_trader")
		{
		}
	}

});

