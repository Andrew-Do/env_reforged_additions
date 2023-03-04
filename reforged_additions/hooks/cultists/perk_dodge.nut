//Make it so adding the dodge perk refunds devotion, logic is vice versa
::mods_hookExactClass("skills/perks/perk_dodge", function (o)
{
	o.onAdded <- function()
	{
		local actor = this.getContainer().getActor();
		if (!actor.isPlayerControlled()) return;
		if (!actor.getSkills().hasSkill("perk.devotion")) return;
		actor.m.Skills.removeByID("perk.devotion");
		actor.m.PerkPoints += 1;
		actor.m.PerkPointsSpent -= 1;
	}
});