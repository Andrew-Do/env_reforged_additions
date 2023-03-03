//TODO: Recreate perk
::mods_hookExactClass("skills/perks/perk_legend_specialist_cult_armor", function (o)
{
    o.create = function()
	{
		this.m.ID = "perk.legend_specialist_cult_armor";
		this.m.Name = ::Const.Strings.PerkName.LegendSpecCultArmor;
		this.m.Description = "Reduce the effects that permenant injuries has on this character or transform the injury in some eldritch way. This character is no longer affected by allies dying or losing hitpoints.";
		this.m.Icon = "ui/perks/penance_circle2.png";
		this.m.Type = ::Const.SkillType.Perk;
		this.m.Order = ::Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

    o.isHidden = function() { return false; }

	o.onUpdate = function( _properties ) 
	{
		_properties.IsAffectedByDyingAllies = false;
		_properties.IsAffectedByLosingHitpoints = false;
	}
});