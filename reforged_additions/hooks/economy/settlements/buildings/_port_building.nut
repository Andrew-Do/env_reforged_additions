::mods_hookExactClass("entity/world/settlements/buildings/port_building", function(o) {
	o.getCostTo = function( _to )
	{
		local myTile = this.getSettlement().getTile();
		local dist = _to.getTile().getDistanceTo(myTile);
		local cost = dist * this.World.getPlayerRoster().getSize() * 0.5;
		cost = this.Math.round(cost * 0.1);
		cost = cost * 10.0;
		return cost;
	}
});
