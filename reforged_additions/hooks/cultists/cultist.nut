::mods_hookExactClass("entity/tactical/actor", function (o)
{
    local addDefaultStatusSprites = o.addDefaultStatusSprites;
	o.addDefaultStatusSprites = function()
	{
		addDefaultStatusSprites();
		local compassion = this.addSprite("status_compassion");
		compassion.Visible = false;
	}
});