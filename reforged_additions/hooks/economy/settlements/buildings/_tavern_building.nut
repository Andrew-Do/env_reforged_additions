::mods_hookExactClass("entity/world/settlements/buildings/tavern_building", function(o) {
	o.getRumorPrice = function()
	{
		return this.Math.round(20 * this.m.Settlement.getBuyPriceMult());
	}

	//TODO: calc drink price
	o.getDrinkPrice = function()
	{
		return this.Math.round(this.World.getPlayerRoster().getSize() * 5 * this.m.Settlement.getBuyPriceMult());
	}

	o.getDrinkResult = function()
	{
		local bros = this.World.getPlayerRoster().getAll();
		if (this.World.Assets.getMoney() < getDrinkPrice()) return null;
		
		this.Sound.play(this.Const.Sound.TavernRound[this.Math.rand(0, this.Const.Sound.TavernRound.len() - 1)]);
		this.World.Assets.addMoney( getDrinkPrice() );
		++this.m.RoundsGiven;
		this.m.LastRoundTime = this.Time.getVirtualTimeF();
		local result = {
			Intro = this.Const.Strings.PayTavernRoundIntro[this.Math.rand(0, this.Const.Strings.PayTavernRoundIntro.len() - 1)],
			Result = []
		};

		foreach( b in bros )
		{
			if (result.Result.len() >= 5)
			{
				break;
			}

			local drunkChance = (this.m.RoundsGiven - 1) * 10;

			if (!b.getSkills().hasSkill("effects.drunk"))
			{
				if (b.getSkills().hasSkill("trait.drunkard"))
				{
					drunkChance = drunkChance + 20;
				}

				if (b.getSkills().hasSkill("trait.strong"))
				{
					drunkChance = drunkChance - 10;
				}

				if (b.getSkills().hasSkill("trait.tough"))
				{
					drunkChance = drunkChance - 10;
				}

				if (b.getSkills().hasSkill("trait.fragile"))
				{
					drunkChance = drunkChance + 10;
				}

				if (b.getSkills().hasSkill("trait.tiny"))
				{
					drunkChance = drunkChance + 10;
				}

				if (b.getSkills().hasSkill("trait.bright"))
				{
					drunkChance = drunkChance - 10;
				}
				else if (b.getSkills().hasSkill("trait.dumb"))
				{
					drunkChance = drunkChance + 10;
				}
			}
			else
			{
				drunkChance = 0;
			}

			if (this.Math.rand(1, 100) <= drunkChance)
			{
				local drunk = this.new("scripts/skills/effects_world/drunk_effect");
				b.getSkills().add(drunk);
				result.Result.push({
					Icon = drunk.getIcon(),
					Text = b.getName() + " is now drunk."
				});
			}

			if ((b.getLastDrinkTime() == 0 || this.Time.getVirtualTimeF() - b.getLastDrinkTime() > this.World.getTime().SecondsPerDay) && this.Math.rand(1, 100) <= 35)
			{
				b.setLastDrinkTime(this.Time.getVirtualTimeF());
				b.improveMood(this.Const.MoodChange.DrunkAtTavern, "Got drunk with the company");
				result.Result.push({
					Icon = this.Const.MoodStateIcon[b.getMoodState()],
					Text = b.getName() + this.Const.MoodStateEvent[b.getMoodState()]
				});
			}
		}

		return result;
	}

});
