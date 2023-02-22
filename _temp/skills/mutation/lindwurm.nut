this.lindwurm <- this.inherit("scripts/skills/mutation/mutation", {
	m = {},
	function create()
	{
		this.mutation.create();
		this.m.ID = "effects.lindwurm";
		this.m.Name = "Acidic blood";
		this.m.Icon = "skills/status_effect_140.png";
		this.m.IconMini = "status_effect_140_mini";
		this.m.Overlay = "status_effect_140";
	}

	function getDescription()
	{
		return "This character\'s blood is highly pressurized and burns upon prolonged exposure to air. Attackers who break skin will find themselves unpleasantly surprised by the resultant spray.";
	}

	function getTooltipPotion()
	{
		local ret = [
			{
				id = 11,
				type = "text",
				icon = "ui/icons/special.png",
				text = "This character\'s blood burns with acid, damaging adjacent attackers whenever they deal hitpoint damage",
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/health.png",
				text = "+" + ::MSU.Text.colorGreen( "30" ) + " Hitpoints"
			}
		];
		return ret;
	}

	function onUpdate(_properties)
    {
        _properties.Hitpoints += 30;
    }

	function onDamageReceived( _attacker, _damageHitpoints, _damageArmor )
    {
        if (_damageHitpoints <= 5) return;
        local _actor = this.getContainer().getActor();
        local targets = [_attacker];

        if (_damageHitpoints >= 50)
        {
            targets = [];
            local mytile = _tag.User.getTile();
            local actors = this.Tactical.Entities.getAllInstances();

            foreach( i in actors )
            {
                foreach( a in i )
                {
                    if (a.getID() != _actor.getID() && a.getTile().getDistanceTo(mytile) < 3) targets.append(a);
                }
            }

        }

        foreach(target in targets)
        {
            if (target == null || !target.isAlive()) continue;
            if (target.getTile().getDistanceTo(_actor.getTile()) >= 3) continue;
            if (target.getFlags().has("lindwurm")) continue;
            if (target.getFlags().has("body_immune_to_acid") && target.getFlags().has("head_immune_to_acid")) continue;

            local poison = target.getSkills().getSkillByID("effects.lindwurm_acid");
            if (poison == null) target.getSkills().add(::new("scripts/skills/effects/lindwurm_acid_effect"));
            else poison.resetTime();
            this.spawnIcon("status_effect_78", target.getTile());
        }
    }

});