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

    local num_mutations = actor.getFlags().getAsInt("ActiveMutations");
    if (num_mutations < 1)
    {
        actor.getFlags().increment("ActiveMutations");
        return;
    }

    if (this.World.Assets.getOrigin().getID() == "scenario.anatomists" && num_mutations < 2 && actor.getSkills().getSkillByID("perk.hold_out") != null)
    {
        actor.getFlags().increment("ActiveMutations");
        return;
    }

    //mutation logic - if too many sequences, brother will die
    actor.getItems().transferToStash(this.World.Assets.getStash());
    actor.getSkills().onDeath(::Const.FatalityType.None);
    this.World.Statistics.addFallen(actor, "Their mutations went out of control.");
    this.World.getPlayerRoster().remove(actor);
}