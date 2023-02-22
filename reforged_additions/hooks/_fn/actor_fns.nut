::R.addPerk <- function (actor, perk, row_num)
{
    //if has skill, remove and refund
    if (actor.getSkills().hasSkill(::Const.Perks.PerkDefObjects[perk].ID))
    {
        actor.getSkills().removeByID(::Const.Perks.PerkDefObjects[perk].ID);
        ++actor.m.PerkPoints;
    }
    //if perk exists, remove it from the tree
    if (actor.getBackground().hasPerk(perk)) actor.getBackground().removePerk(perk);

    //add non-refundable version of perk to tree and add the perk to skills
    actor.getBackground().addPerk(perk, row_num, false);
    actor.getSkills().add(::new(::Const.Perks.PerkDefObjects[perk].Script));
}

::R.removePerk <- function (actor, perk)
{
    actor.getSkills().removeByID(::Const.Perks.PerkDefObjects[perk].ID);
    if (actor.getBackground().hasPerk(perk)) 
        actor.getBackground().removePerk(perk);
}

::R.doMutation <- function (actor, flag)
{
    local time = 0.0;
    if (("State" in this.World) && this.World.State != null && this.World.State.getCombatStartTime() != 0)
        time = this.World.State.getCombatStartTime();
    else time = this.Time.getVirtualTimeF();

    actor.getFlags().increment("PotionsUsed", 1);
    actor.getFlags().set("PotionLastUsed", time);

    //if upgrading a sequence
    if (actor.getFlags().has(flag)) return;

    if (actor.getFlags().getAsInt("ActiveMutations") < 1)
    {
        actor.getFlags().increment("ActiveMutations");
        return;
    }

    //mutation logic - if more than one sequnce, bro will die
    actor.getItems().transferToStash(this.World.Assets.getStash());
    actor.getSkills().onDeath(::Const.FatalityType.None);
    this.World.Statistics.addFallen(actor, "Their mutations went out of control.");
    this.World.getPlayerRoster().remove(actor);
}

/////////

::R.level_health <- function(actor, times, stars)
{
    local lower = 2;
    local upper = 4;
    if (stars > 0) lower += 1;
    if (stars > 1) lower += 1;
    if (stars > 2) upper += 1;

    local h = 0;
    for (local i = 0; i < times; i++)
    {
        h += this.Math.rand(lower, upper);
    }
    actor.m.BaseProperties.Hitpoints += h;
    actor.m.CurrentProperties.Hitpoints += h;
    actor.m.Hitpoints = actor.m.BaseProperties.Hitpoints;
    actor.setHitpoints(actor.getHitpointsMax());
}

::R.level_fatigue <- function(actor, times, stars)
{
    local lower = 2;
    local upper = 4;
    if (stars > 0) lower += 1;
    if (stars > 1) lower += 1;
    if (stars > 2) upper += 1;

    local b = 0;
    for (local i = 0; i < times; i++)
    {
        b += this.Math.rand(lower, upper);
    }
    actor.m.BaseProperties.Stamina += b;
    actor.m.CurrentProperties.Stamina += b;
}


/////////////////////////////

::mods_hookExactClass("entity/tactical/actor", function(o) {

    

    

    o.level_resolve <- function( times, stars )
	{
        local lower = 2;
        local upper = 4;
        if (stars > 0) lower += 1;
        if (stars > 1) lower += 1;
        if (stars > 2) upper += 1;

        for (local i = 0; i < times; i++)
        {
            local b = this.Math.rand(lower, upper);
            this.m.BaseProperties.Bravery += b;
            this.m.CurrentProperties.Bravery += b;
        }
	}

    o.level_initiative <- function( times, stars )
	{
        local lower = 3;
        local upper = 5;
        if (stars > 0) lower += 1;
        if (stars > 1) lower += 1;
        if (stars > 2) upper += 1;

        for (local i = 0; i < times; i++)
        {
            local b = this.Math.rand(lower, upper);
            this.m.BaseProperties.Initiative += b;
            this.m.CurrentProperties.Initiative += b;
        }
	}

    o.level_melee_skill <- function( times, stars )
	{
        local lower = 1;
        local upper = 3;
        if (stars > 0) lower += 1;
        if (stars > 1) lower += 1;
        if (stars > 2) upper += 1;

        for (local i = 0; i < times; i++)
        {
            local b = this.Math.rand(lower, upper);
            this.m.BaseProperties.MeleeSkill += b;
            this.m.CurrentProperties.MeleeSkill += b;
        }
	}

    o.level_ranged_skill <- function( times, stars )
	{
        local lower = 2;
        local upper = 4;
        if (stars > 0) lower += 1;
        if (stars > 1) lower += 1;
        if (stars > 2) upper += 1;

        for (local i = 0; i < times; i++)
        {
            local b = this.Math.rand(lower, upper);
            this.m.BaseProperties.RangedSkill += b;
            this.m.CurrentProperties.RangedSkill += b;
        }
	}

    o.level_melee_defense <- function( times, stars )
	{
        local lower = 1;
        local upper = 3;
        if (stars > 0) lower += 1;
        if (stars > 1) lower += 1;
        if (stars > 2) upper += 1;

        for (local i = 0; i < times; i++)
        {
            local b = this.Math.rand(lower, upper);
            this.m.BaseProperties.MeleeDefense += b;
            this.m.CurrentProperties.MeleeDefense += b;
        }
	}

    o.level_ranged_defense <- function( times, stars )
	{
        local lower = 2;
        local upper = 4;
        if (stars > 0) lower += 1;
        if (stars > 1) lower += 1;
        if (stars > 2) upper += 1;

        for (local i = 0; i < times; i++)
        {
            local b = this.Math.rand(lower, upper);
            this.m.BaseProperties.RangedDefense += b;
            this.m.CurrentProperties.RangedDefense += b;
        }
	}
});