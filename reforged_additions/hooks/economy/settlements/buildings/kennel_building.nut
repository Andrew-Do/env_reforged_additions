::mods_hookExactClass("entity/world/settlements/buildings/kennel_building", function(o) {
	o.onUpdateShopList = function()
	{
		// local list = [
		// 	{
		// 		R = 0,
		// 		P = 1.0,
		// 		S = "accessory/wardog_item"
		// 	},
		// 	{
		// 		R = 0,
		// 		P = 1.0,
		// 		S = "accessory/armored_wardog_item"
		// 	}
		// ];

		// if (this.Const.DLC.Unhold)
		// {
		// 	list.extend([
		// 		{
		// 			R = 40,
		// 			P = 1.0,
		// 			S = "misc/wardog_armor_upgrade_item"
		// 		}
		// 	]);
		// }

		// if (this.Const.DLC.Wildmen && this.m.Settlement.getTile().SquareCoords.Y > this.World.getMapSize().Y * 0.7)
		// {
		// 	list.push({
		// 		R = 0,
		// 		P = 1.0,
		// 		S = "accessory/warhound_item"
		// 	});
		// 	list.push({
		// 		R = 0,
		// 		P = 1.0,
		// 		S = "accessory/armored_warhound_item"
		// 	});
		// }
		// else
		// {
		// 	list.push({
		// 		R = 0,
		// 		P = 1.0,
		// 		S = "accessory/wardog_item"
		// 	});
		// }

		// this.m.Settlement.onUpdateShopList(this.m.ID, list);
		// this.fillStash(list, this.m.Stash, 0.75, false);
	}

	o.onUpdateDraftList = function( _list )
	{
		//FEATURE_8: rework houndmaster into wolf tamer
		_list.push("houndmaster_background");
		_list.push("houndmaster_background");
	}

});
