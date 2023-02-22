this.direwolf <- this.inherit("scripts/skills/mutation/mutation", {
	m = {},
	function create()
	{
		this.mutation.create();
		this.m.ID = "effects.direwolf";
		this.m.Name = "Direwolf Mutations";
		this.m.Icon = "skills/status_effect_139.png";
		this.m.IconMini = "";
		this.m.Overlay = "status_effect_139";
	}

	function getDescription()
	{
		return this.getContainer().getActor().getFlags().has("werewolf_8") ? "This character counts as a direwolf in skill checks, and does half of missing health as increased damage. Not affected by night time penalties." : "This character counts as a direwolf in skill checks. Not affected by night time penalties.";
	}

	function getTooltipPotion()
	{
		local is8 = isWerewolf8();
		local ret = [
			{
				id = 11,
				type = "text",
				icon = "ui/icons/fatigue.png",
				text = "+" + ::MSU.Text.colorGreen( is8 ? 15 : 7 ) + " Fatigue Recovery"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/health.png",
				text = "+" + ::MSU.Text.colorGreen( is8 ? 30 : 15 ) + " Hitpoints"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Not affected by nighttime penalties"
			}
		];

		if (is8)
		{
			ret.push({
				id = 11,
				type = "text",
				icon = "ui/icons/special.png",
				text = ::MSU.Text.colorGreen( 15 ) + "% chance to unleash a howl when attacking that boosts morale and gives killing frenzy to all allied direwolves."
			});

			local dmg = getAdditionalDamage();
			if (dmg > 0)
			{
				ret.push({
					id = 11,
					type = "text",
					icon = "ui/icons/special.png",
					text = "Attacks do " + ::MSU.Text.colorRed( dmg ) + " more damage"
				});
			}
		}

		return ret;
	}

	function onUpdate(_properties)
	{
		local is8 = isWerewolf8();
		_properties.FatigueRecoveryRate += is8 ? 10 : 5;
		_properties.Hitpoints += is8 ? 30 : 15;
		_properties.IsAffectedByNight = false;

		if (!is8) return;
		local dmg = getAdditionalDamage();
		if (dmg <= 0) return;
		_properties.DamageRegularMin += dmg;
		_properties.DamageRegularMax += dmg;
	}

	function onAnySkillExecuted( _skill, _targetTile, _targetEntity, _forFree )
    {
		local actor = this.getContainer().getActor();
		if (!actor.getFlags().has("werewolf_8")) return;
        if (!_skill.isAttack() || _skill.isRanged() || _targetEntity == null || _targetEntity.isAlliedWith(actor) || !::Tactical.TurnSequenceBar.isActiveEntity(actor)) return;
		if (this.Math.rand(1, 100) > 15) return;

		this.result <- {
			Self = actor,
			Skill = this
		};
		this.Sound.play("sounds/enemies/werewolf_howl.wav", ::Const.Sound.Volume.Actor);
		this.Tactical.queryActorsInRange(actor.getTile(), 1, 6, this.raiseMorale, this.result); //buff allies
		raiseMorale(actor, this.result); //Also buff self
    }

	function raiseMorale( target, tag )
	{
		if (target.getFaction() != tag.Self.getFaction() || !target.getFlags().has("werewolf")) return;
		
		target.setMoraleState(this.Math.min(::Const.MoraleState.Confident, target.getMoraleState() + 1))
		tag.Skill.spawnIcon("status_effect_06", target.getTile());

		local effect = target.getSkills().getSkillByID("effects.killing_frenzy");
		if (effect != null) effect.resetTime();
		else target.getSkills().add(::new("scripts/skills/effects/killing_frenzy_effect"));
	}

	function getAdditionalDamage() 
	{ 
		local healthMissing = this.getContainer().getActor().getHitpointsMax() - this.getContainer().getActor().getHitpoints();
		return this.Math.floor(healthMissing * 0.5);
	}

	function isWerewolf8() { return this.getContainer().getActor().getFlags().has("werewolf_8");}

});
