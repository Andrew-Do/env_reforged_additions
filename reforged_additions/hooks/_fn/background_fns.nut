::R.get_subterfuge_chance <- function ()
{
	local chance = 0;
	local roster = this.World.getPlayerRoster().getAll();
	foreach( i, bro in roster )
	{
		if (i >= 25) break;
        local id = bro.getBackground().getID();
        if ( !(id in ::Z.Backgrounds.Specialties) || !("Subterfuge" in ::Z.Backgrounds.Specialties[id]) ) 
            continue;

		chance += ::Z.Backgrounds.Specialties[id].Subterfuge
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
        if ( !(id in ::Z.Backgrounds.Specialties) || !("Tracking" in ::Z.Backgrounds.Specialties[id]) ) 
            continue;

		chance += ::Z.Backgrounds.Specialties[id].Tracking
	}
	return chance;
};

::mods_hookExactClass("skills/backgrounds/character_background", function (o)
{
	local getBackgroundDescription = o.getBackgroundDescription;
	o.getBackgroundDescription = function()
	{
		if ( !(this.m.ID in ::Z.Backgrounds.Specialties) && this.m.ID != "background.anatomist")
			return getBackgroundDescription();
		
		local tooltip = "";
		if ( this.m.ID == "background.anatomist" )
			tooltip += " Anatomists can concoct sequence potions from the remains of monsters.";
		if ( this.m.ID in ::Z.Backgrounds.Specialties )
		{
			foreach (key, value in ::Z.Backgrounds.Specialties[this.m.ID]) {
				tooltip += format(" +%d %s.", value, key);
			}
		}

		return tooltip + "\n\n" + getBackgroundDescription();
	}

	local buildDescription = o.buildDescription;
	o.buildDescription = function( _isFinal = false )
	{
		buildDescription(_isFinal);
		if ( !(this.m.ID in ::Z.Backgrounds.Specialties) && this.m.ID != "background.anatomist") return;

		local tooltip = "";
		if ( this.m.ID == "background.anatomist" )
			tooltip += " Anatomists can concoct sequence potions from the remains of monsters.";
		if ( this.m.ID in ::Z.Backgrounds.Specialties )
		{
			foreach (key, value in ::Z.Backgrounds.Specialties[this.m.ID]) {
				tooltip += format(" +%d %s.", value, key);
			}
		}

		this.m.Description = tooltip + "\n\n" + this.m.Description;
	}
});

::mods_hookExactClass("entity/tactical/player", function (o)
{
	o.getRosterTooltip = function()
	{
		local tooltip = [
			{
				id = 1,
				type = "title",
				text = this.getName()
			}
		];
		local time = this.getDaysWithCompany();
		local text;

		if (!this.isGuest())
		{
			if (this.m.Background != null && this.m.Background.getID() == "background.companion")
			{
				text = "With the company from the very beginning.";
			}
			else if (time > 1)
			{
				text = "With the company for " + time + " days.";
			}
			else
			{
				text = "Has just joined the company.";
			}

			if (this.m.LifetimeStats.Battles != 0)
			{
				if (this.m.LifetimeStats.Battles == 1)
				{
					text = text + (" Took part in " + this.m.LifetimeStats.Battles + " battle");
				}
				else
				{
					text = text + (" Took part in " + this.m.LifetimeStats.Battles + " battles");
				}

				if (this.m.LifetimeStats.Kills == 1)
				{
					text = text + (" and has " + this.m.LifetimeStats.Kills + " kill.");
				}
				else if (this.m.LifetimeStats.Kills > 1)
				{
					text = text + (" and has " + this.m.LifetimeStats.Kills + " kills.");
				}
				else
				{
					text = text + ".";
				}

				if (this.m.LifetimeStats.MostPowerfulVanquished != "")
				{
					text = text + (" The most powerful opponent he vanquished was " + this.m.LifetimeStats.MostPowerfulVanquished + ".");
				}
			}

			tooltip.push({
				id = 2,
				type = "description",
				text = text
			});
			tooltip.push({
				id = 5,
				type = "text",
				icon = "ui/icons/xp_received.png",
				text = "Level " + this.m.Level
			});

			if (this.getDailyCost() != 0)
			{
				tooltip.push({
					id = 3,
					type = "text",
					icon = "ui/icons/asset_daily_money.png",
					text = "Paid [img]gfx/ui/tooltips/money.png[/img]" + this.getDailyCost() + " daily"
				});
			}

			//added tooltip bonus
			if ( this.m.Background.m.ID in ::Z.Backgrounds.Specialties || this.m.Background.m.ID == "background.anatomist")
			{
				local b = "";
				if ( this.m.Background.m.ID == "background.anatomist" )
					b += " Anatomists can concoct sequence potions from the remains of monsters.";
				if ( this.m.Background.m.ID in ::Z.Backgrounds.Specialties )
				{
					foreach (key, value in ::Z.Backgrounds.Specialties[this.m.Background.m.ID]) {
						b += format(" +%d %s.", value, key);
					}
				}
				tooltip.push({
					id = 4,
					type = "text",
					icon = "ui/icons/asset_daily_money.png",
					text = b
				});
			}

			tooltip.push({
				id = 5,
				type = "text",
				icon = this.Const.MoodStateIcon[this.getMoodState()],
				text = this.Const.MoodStateName[this.getMoodState()]
			});

			if (this.m.PlaceInFormation <= 17)
			{
				tooltip.push({
					id = 6,
					type = "hint",
					icon = "ui/icons/stat_screen_dmg_dealt.png",
					text = "In the fighting line"
				});
			}
			else
			{
				tooltip.push({
					id = 6,
					type = "hint",
					icon = "ui/icons/camp.png",
					text = "In reserve"
				});
			}
		}

		local injuries = this.getSkills().query(this.Const.SkillType.Injury | this.Const.SkillType.SemiInjury);

		foreach( injury in injuries )
		{
			if (injury.isType(this.Const.SkillType.TemporaryInjury))
			{
				local ht = injury.getHealingTime();

				if (ht.Min != ht.Max)
				{
					tooltip.push({
						id = 90,
						type = "text",
						icon = injury.getIcon(),
						text = injury.getName() + " (" + ht.Min + "-" + ht.Max + " days)"
					});
				}
				else if (ht.Min > 1)
				{
					tooltip.push({
						id = 90,
						type = "text",
						icon = injury.getIcon(),
						text = injury.getName() + " (" + ht.Min + " days)"
					});
				}
				else
				{
					tooltip.push({
						id = 90,
						type = "text",
						icon = injury.getIcon(),
						text = injury.getName() + " (" + ht.Min + " day)"
					});
				}
			}
			else
			{
				tooltip.push({
					id = 90,
					type = "text",
					icon = injury.getIcon(),
					text = injury.getName()
				});
			}
		}

		if (this.getHitpoints() < this.getHitpointsMax())
		{
			local ht = this.Math.ceil((this.getHitpointsMax() - this.getHitpoints()) / (this.Const.World.Assets.HitpointsPerHour * (("State" in this.World) && this.World.State != null ? this.World.Assets.m.HitpointsPerHourMult : 1.0)) / 24.0);

			if (ht > 1)
			{
				tooltip.push({
					id = 133,
					type = "text",
					icon = "ui/icons/days_wounded.png",
					text = "Light Wounds (" + ht + " days)"
				});
			}
			else
			{
				tooltip.push({
					id = 133,
					type = "text",
					icon = "ui/icons/days_wounded.png",
					text = "Light Wounds (" + ht + " day)"
				});
			}
		}

		return tooltip;
	}
	
});

