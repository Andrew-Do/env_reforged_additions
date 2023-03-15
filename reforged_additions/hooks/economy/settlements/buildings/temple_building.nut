::mods_hookExactClass("entity/world/settlements/buildings/temple_building", function(o) {
	o.onUpdateDraftList = function( _list )
	{
		_list.push("monk_background");
		_list.push("cripple_background");
		_list.push("paladin_background");
	}

});
