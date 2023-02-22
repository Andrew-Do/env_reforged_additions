//TODO: hold out
// ::Const.Strings.PerkDescription.HoldOut = "Keep it together! Reduce the duration of general status effects to " + ::MSU.Text.colorGreen( "1" ) + " turn. +" + ::MSU.Text.colorGreen( "8" ) + " hitpoints.  Raises the chance to survive being struck down from 33% to 66%.";
// ::Const.Perks.PerkDefObjects[::Const.Perks.PerkDefs.HoldOut].Tooltip = ::Const.Strings.PerkDescription.HoldOut;

::mods_hookExactClass("skills/effects/spider_poison_effect", function (o)
{
    o.m.Damage = 10;
    o.m.Actor <- null;

    o.setActor <- function( _a )
	{
		this.m.Actor = ::MSU.asWeakTableRef(_a);
	}

    o.getAttacker <- function()
	{
		if (::MSU.isNull(this.m.Actor)) return this.getContainer().getActor();
		if (this.m.Actor.getID() != this.getContainer().getActor().getID())
		{
			if (this.m.Actor.isAlive() && this.m.Actor.isPlacedOnMap()) return this.m.Actor;
		}
		return this.getContainer().getActor();
	}

    o.applyDamage = function()
    {
		if (this.m.LastRoundApplied != this.Time.getRound())
		{
			this.m.LastRoundApplied = this.Time.getRound();
			this.spawnIcon("status_effect_54", this.getContainer().getActor().getTile());

			if (this.m.SoundOnUse.len() != 0)
			{
				this.Sound.play(this.m.SoundOnUse[this.Math.rand(0, this.m.SoundOnUse.len() - 1)], ::Const.Sound.Volume.RacialEffect * 1.0, this.getContainer().getActor().getPos());
			}

			local hitInfo = clone ::Const.Tactical.HitInfo;
			hitInfo.DamageRegular = this.m.Damage;
			hitInfo.DamageDirect = 1.0;
			hitInfo.BodyPart = ::Const.BodyPart.Body;
			hitInfo.BodyDamageMult = 1.0;
			hitInfo.FatalityChanceMult = 0.0;
			this.getContainer().getActor().onDamageReceived(this.getAttacker(), this, hitInfo);
		}
	}
});

::mods_hookExactClass("skills/racial/spider_racial", function (o)
{
    o.onTargetHit = function( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if (_targetEntity.getCurrentProperties().IsImmuneToPoison || _damageInflictedHitpoints < ::Const.Combat.PoisonEffectMinDamage || _targetEntity.getHitpoints() <= 0) return;
		if (!_targetEntity.isAlive() || _targetEntity.isDying() || _targetEntity.getFlags().has("undead")) return;

		if (!_targetEntity.isHiddenToPlayer())
		{
			if (this.m.SoundOnUse.len() != 0)
			{
				this.Sound.play(this.m.SoundOnUse[this.Math.rand(0, this.m.SoundOnUse.len() - 1)], ::Const.Sound.Volume.RacialEffect * 1.5, _targetEntity.getPos());
			}

			this.Tactical.EventLog.log(::Const.UI.getColorizedEntityName(_targetEntity) + " is poisoned with webknecht venom");
		}

		this.spawnIcon("status_effect_54", _targetEntity.getTile());
		_targetEntity.getSkills().add(::new("scripts/skills/effects/spider_poison_effect"));
	}

});

::mods_hookExactClass("skills/perks/perk_coup_de_grace", function(o) {
	o.onAnySkillUsed = function ( _skill, _targetEntity, _properties )
	{
		if (_targetEntity == null || !_skill.isAttack())
		{
			return;
		}

		if (_targetEntity.getSkills().hasSkillOfType(this.Const.SkillType.TemporaryInjury))
		{
			_properties.DamageTotalMult *= 1.2;
		}

		if (_targetEntity.getSkills().hasSkill("effects.stunned") || _targetEntity.getSkills().hasSkill("effects.net") || _targetEntity.getSkills().hasSkill("effects.sleeping") || _targetEntity.getSkills().hasSkill("effects.debilitated") || _targetEntity.getSkills().hasSkill("effects.web"))
		{
			_properties.DamageTotalMult *= 1.2;
		}
	}
});