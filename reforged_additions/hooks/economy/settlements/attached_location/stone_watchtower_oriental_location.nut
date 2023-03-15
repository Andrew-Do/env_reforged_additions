::mods_hookExactClass("entity/world/attached_location/stone_watchtower_oriental_location", function(o) {
	o.onUpdateDraftList = function( _list )
	{
		if (!this.isActive())
		{
			return;
		}

		_list.push("nomad_background");
	}

	o.onUpdateShopList = function( _id, _list )
	{
		if (_id == "building.marketplace")
		{
			_list.push({
				R = 30,
				P = 1.0,
				S = "armor/oriental/padded_vest"
			});
			_list.push({
				R = 40,
				P = 1.0,
				S = "armor/oriental/linothorax"
			});
			_list.push({
				R = 40,
				P = 1.0,
				S = "armor/oriental/southern_mail_shirt"
			});
			_list.push({
				R = 10,
				P = 1.0,
				S = "helmets/oriental/southern_head_wrap"
			});
			_list.push({
				R = 65,
				P = 1.0,
				S = "helmets/oriental/spiked_skull_cap_with_mail"
			});
			_list.push({
				R = 30,
				P = 1.0,
				S = "shields/oriental/southern_light_shield"
			});
			_list.push({
				R = 40,
				P = 1.0,
				S = "weapons/oriental/saif"
			});
			_list.push({
				R = 60,
				P = 1.0,
				S = "weapons/scimitar"
			});
			_list.push({
				R = 60,
				P = 1.0,
				S = "weapons/oriental/light_southern_mace"
			});

			if (this.Const.DLC.Unhold)
			{
				_list.extend([
					{
						R = 80,
						P = 1.0,
						S = "weapons/throwing_spear"
					}
				]);
			}
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
