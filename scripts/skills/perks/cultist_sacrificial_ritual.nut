
//TODO: refactor cultist skills with prefix
this.cultist_sacrificial_ritual <- this.inherit("scripts/skills/skill", {
	m = {
	},
	function create()
	{
		this.m.ID = "perk.sacrificial_ritual";
		this.m.Name = ::Const.Strings.PerkName.SacrificialRitual;
		this.m.Type = ::Const.SkillType.Perk | ::Const.SkillType.StatusEffect;
		this.m.Icon = "ui/perks/sacrificial_ritual.png";
		this.m.Order = ::Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function getTooltip()
	{
		local actor = this.getContainer().getActor();
		local resp = [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = "The first ritual any cultist learns. The souls harvested by this brother will belong to Davkul. Davkul will reward the devotee after getting 4, 44, 66 kills at their discretion."
			}
		];

		resp.push({
			id = 15,
			type = "hint",
			icon = "ui/icons/special.png",
			text = actor.getFlags().getAsInt("SoulsHarvestedForDavkul") + " souls harvested for Davkul"
		});

		resp.push({
			id = 15,
			type = "hint",
			icon = "ui/icons/special.png",
			text = "Reward for 4 souls: " + actor.getFlags().get("Davkul1stReward")
		});

		resp.push({
			id = 15,
			type = "hint",
			icon = "ui/icons/special.png",
			text = "Reward for 44 souls: " + actor.getFlags().get("Davkul2ndReward")
		});

		resp.push({
			id = 15,
			type = "hint",
			icon = "ui/icons/special.png",
			text = "Reward for 66 souls: " + actor.getFlags().get("Davkul3rdReward")
		});


		return resp;
	}

	function getTotalKillStats()
	{
		return ::Const.LegendMod.GetFavoriteEnemyStats(this.getContainer().getActor(), this.m.ValidTypes);
	}

	function onAdded()
	{
		local actor = this.getContainer().getActor();
		if (!actor.getFlags().has("SoulsHarvestedForDavkul")) actor.getFlags().add("SoulsHarvestedForDavkul", 0);
	}

	function onTargetKilled( _targetEntity, _skill )
	{
		local actor = this.getContainer().getActor();
        actor.getFlags().increment("SoulsHarvestedForDavkul", 1);
	}

	function onUpdate( _properties )
	{
		local actor = this.getContainer().getActor();
		if (!actor.getFlags().has("Davkul1stRewarded") && actor.getFlags().getAsInt("SoulsHarvestedForDavkul") >= 4)
			addReward("Davkul1stReward");
		if (!actor.getFlags().has("Davkul2ndRewarded") && actor.getFlags().getAsInt("SoulsHarvestedForDavkul") >= 44)
			addReward("Davkul2ndReward");
		if (!actor.getFlags().has("Davkul3rdRewarded") && actor.getFlags().getAsInt("SoulsHarvestedForDavkul") >= 66)
			addReward("Davkul3rdReward");
	}
		
	function onAdded()
	{
		local actor = this.getContainer().getActor();
		if (!actor.isPlayerControlled()) return;
		if (actor.getFlags().has("Davkul1stReward")) return;
		
		local roll;
		foreach (rewardtier in ::Const.PerkInfo.SacrificialRitual.Rewards) 
		{
			::logInfo("Doing " + rewardtier.ID);
			roll = this.Math.rand(1, 100);
			foreach (reward in rewardtier.Rolls) 
			{
				::logInfo("Checking " + reward.ID);
				if (reward.Validator.len() != 0) //If has validator(s), run it.
				{
					::logInfo("Has validator, checking...");
					local valid = true;
					foreach (index, validator in reward.Validator) 
					{
						local check = validator(actor, reward.Params[index]);
						::logInfo("Validator[" + index + "] returns " + check);
						if (!check) //if validator returns false
						{
							valid = false;
							break;
						}
					}
					if (!valid) continue;
				}
				
				::logInfo("Rolling " + roll + " vs " + reward.Chance);
				if (roll <= reward.Chance) //Since it's valid, then roll
				{
					::logInfo("Adding to " + rewardtier.ID + ", " + reward.ID);
					actor.getFlags().add(rewardtier.ID, reward.ID);
					break;
				}
			}
		}
	}

	function addReward( str )
	{
		local actor = this.getContainer().getActor();
		local reward_id = actor.getFlags().get(str);
		this.logInfo(str + "ed");
		this.logInfo(reward_id);

		if (reward_id in ::Const.PerkInfo.SacrificialRitual.RewardTable)
		{
			local reward = ::Const.PerkInfo.SacrificialRitual.RewardTable[reward_id];

			foreach (index, fn in reward.functions) 
			{
				fn(actor, reward.params);
			}
			actor.getFlags().set(str + "ed", true);

		}
	}

});