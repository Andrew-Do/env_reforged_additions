this.webknecht <- this.inherit("scripts/skills/mutation/mutation", {
	m = {},
	function create()
	{
		this.mutation.create();
		this.m.ID = "effects.webknecht";
		this.m.Name = "Webknecht Mutations";
		this.m.Icon = "skills/status_effect_142.png";
		this.m.IconMini = "";
		this.m.Overlay = "status_effect_142";
	}

	function getDescription()
	{
		return "This character has developed venom glands that allow them to produce poison strong enough to kill any man. Sadly they do not have the fangs of a snake or spider to deliver this venom and have to resort using piercing or cutting weapons to apply it.";
	}

	function getTooltipPotion()
	{
        return [
			{
                id = 11,
                type = "text",
                icon = "ui/icons/special.png",
                text = "Piercing or cutting attacks poison the target necrotic toxin."
            },
			{
                id = 11,
                type = "text",
                icon = "ui/icons/special.png",
                text = "Immune to necrotic poison effects"
            }
        ];
	}

	function onUpdate(_properties)
    {
        _properties.IsImmuneToPoison = true;
    }

    function onTargetHit(_skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor)
    {
        local actor = this.getContainer().getActor();
        if (_targetEntity.getCurrentProperties().IsImmuneToPoison && !actor.getFlags().has("spider_8")) return;
        if (_damageInflictedHitpoints < ::Const.Combat.PoisonEffectMinDamage || _targetEntity.getHitpoints() <= 0) return;

        if (!_targetEntity.isAlive()) return;
        if (_targetEntity.getFlags().has("undead")) return;

        if (_skill.m.InjuriesOnBody != ::Const.Injury.PiercingBody && _skill.m.InjuriesOnBody != ::Const.Injury.CuttingBody) return;

        if (!_targetEntity.isHiddenToPlayer())
        {
            if (this.m.SoundOnUse.len() != 0) this.Sound.play(this.m.SoundOnUse[this.Math.rand(0, this.m.SoundOnUse.len() - 1)], ::Const.Sound.Volume.RacialEffect * 1.5, _targetEntity.getPos());

            this.Tactical.EventLog.log(::Const.UI.getColorizedEntityName(_targetEntity) + " is poisoned");
        }

        this.spawnIcon("status_effect_54", _targetEntity.getTile());

        local effect;
        if (actor.getFlags().has("spider_8")) effect = ::new("scripts/skills/effects/legend_redback_spider_poison_effect");
        else effect = ::new("scripts/skills/effects/spider_poison_effect");
        if (actor.getFaction() == ::Const.Faction.Player) effect.setActor(actor);
        _targetEntity.getSkills().add(effect);
    }
});
