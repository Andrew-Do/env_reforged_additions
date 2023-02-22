::R.get_subterfuge_chance <- function ()
{
	local chance = 0;
	local roster = this.World.getPlayerRoster().getAll();
	foreach( i, bro in roster )
	{
		if (i >= 25) break;
        local id = bro.getBackground().getID();
        if ( !(id in ::R.Backgrounds.Specialties) && !("Subterfuge" in ::R.Backgrounds.Specialties[id]) ) 
            continue;

		chance += ::R.Backgrounds.Specialties[id].Subterfuge
	}
	return chance;
}

::R.get_tracking_chance <- function ()
{
	local chance = 0;
	local roster = this.World.getPlayerRoster().getAll();
	foreach( i, bro in roster )
	{
		if (i >= 25) break;
        local id = bro.getBackground().getID();
        if ( !(id in ::R.Backgrounds.Specialties) && !("Tracking" in ::R.Backgrounds.Specialties[id]) ) 
            continue;

		chance += ::R.Backgrounds.Specialties[id].Tracking
	}
	return chance;
};

//Hook background tooltip logic - refactored to remove boilerplate code
::mods_hookExactClass("skills/backgrounds/character_background", function (o)
{
	o.getBackgroundTooltip <- function()
	{ 
		if ( !(this.m.ID in ::R.Backgrounds.Specialties) ) return [];
		local ret = [];
		foreach (key, value in ::R.Backgrounds.Specialties[this.m.ID]) {
			ret.push({
				id = 3,
				type = "hint",
				icon = "ui/icons/special.png",
				text = format("+%d %s for relevant checks.", value, key)
			});
		}
		return ret; 
	}
	
	o.getDescription <- function()
	{
		if ( !(this.m.ID in ::R.Backgrounds.Specialties) ) return this.getDescription();

		local tooltip = "";
		foreach (key, value in ::R.Backgrounds.Specialties[this.m.ID]) {
			tooltip += format(" +%d %s.", value, key);
		}
		return this.getDescription() + tooltip;
	}

    local getTooltip = "getTooltip" in o ? o.getTooltip : null;
	o.getTooltip <- function()
	{
		local ret = getTooltip == null ? this.skill.getTooltip() : getTooltip();
		ret.extend(this.getBackgroundTooltip());
		return ret;
	}
});

::mods_hookDescendants("skills/backgrounds/character_background", function(o) {
	if ("getTooltip" in o)
	{
		local getTooltip = o.getTooltip;
		o.getTooltip <- function()
		{
			local ret = getTooltip();
			ret.extend(this.getBackgroundTooltip());
			return ret;
		}
	}
})