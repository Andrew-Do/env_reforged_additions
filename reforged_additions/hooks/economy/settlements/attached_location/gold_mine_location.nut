::mods_hookExactClass("entity/world/attached_location/gold_mine_location", function(o) {
	o.onUpdateDraftList = function( _list )
	{
		if (!this.isActive())
		{
			return;
		}

		_list.push("miner_background");
		_list.push("miner_background");
		_list.push("miner_background");
		_list.push("sellsword_background");
		_list.push("caravan_hand_background");
		_list.push("thief_background");
	}

	o.onUpdateShopList = function( _id, _list )
	{
		if (_id == "building.marketplace")
		{
			_list.push({
				R = 90,
				P = 1.0,
				S = "weapons/military_pick"
			});
		}
		else if (_id == "building.specialized_trader")
		{
		}
	}

});

