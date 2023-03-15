::mods_hookExactClass("entity/world/settlements/buildings/arena_building", function(o) {
	o.onUpdateDraftList = function( _list )
	{
		_list.push("gladiator_background");
		_list.push("gladiator_background");
		_list.push("gladiator_background");
		_list.push("gladiator_background");
	}
});
