this.potion_gruesome_feast <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.potion_gruesome_feast";
		this.m.Name = ::Const.Strings.PerkName.GruesomeFeast;
		this.m.Description = ::Const.Strings.PerkDescription.GruesomeFeast;
		this.m.Icon = "ui/perks/gruesome_circle.png";
		this.m.IconDisabled = "ui/perks/gruesome_circle_bw.png";
		this.m.Type = ::Const.SkillType.Perk;
		this.m.Order = ::Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.potion_gruesome_feast"))
		{
			this.m.Container.add(::new("scripts/skills/actives/potion_gruesome_feast"));
		}
	}

	function onRemoved()
	{
		if (!this.m.Container.hasSkill("perk.potion_gruesome_feast"))
		{
			this.m.Container.removeByID("actives.potion_gruesome_feast");
		}
	}

});

