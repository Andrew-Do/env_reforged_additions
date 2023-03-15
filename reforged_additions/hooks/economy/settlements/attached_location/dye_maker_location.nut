::mods_hookExactClass("entity/world/attached_location/dye_maker_location", function(o) {
	o.onUpdateProduce = function( _list )
	{
		_list.push("trade/dies_item");
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
	}

	o.onUpdateShopList = function( _id, _list )
	{
		if (_id == "building.marketplace")
		{
			_list.push({
				R = 0,
				P = 1.0,
				S = "trade/dies_item"
			});

			if (this.Const.DLC.Unhold)
			{
				_list.push({
					R = 30,
					P = 1.0,
					S = "misc/paint_set_item"
				});
				_list.push({
					R = 50,
					P = 1.0,
					S = "misc/paint_black_item"
				});
				_list.push({
					R = 50,
					P = 1.0,
					S = "misc/paint_red_item"
				});
				_list.push({
					R = 50,
					P = 1.0,
					S = "misc/paint_orange_red_item"
				});
				_list.push({
					R = 50,
					P = 1.0,
					S = "misc/paint_white_blue_item"
				});
				_list.push({
					R = 50,
					P = 1.0,
					S = "misc/paint_white_green_yellow_item"
				});
			}
		}
		else if (_id == "building.specialized_trader")
		{
		}
	}

});
