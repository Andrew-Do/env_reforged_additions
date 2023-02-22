//give sickness when consuming potions
::mods_hookExactClass("items/misc/anatomist/anatomist_potion_item", function (o)
{
    local onUse = o.onUse;
    o.onUse = function( _actor, _item = null )
    {
        if (!_actor.getFlags().has("SequencesUsed"))
        {
            _actor.getFlags().add("SequencesUsed", 0)
        }
        _actor.getFlags().increment("SequencesUsed", 1);

        //give sickness
        this.Sound.play("sounds/combat/drink_0" + this.Math.rand(1, 3) + ".wav", ::Const.Sound.Volume.Inventory);
        if (!_actor.getSkills().hasSkill("injury.sickness"))
        {
            _actor.getSkills().add(::new("scripts/skills/injury/sickness_injury"));
        }
        _actor.getSkills().getSkillByID("injury.sickness").addHealingTime(_actor.getFlags().getAsInt("ActiveMutations") * 3);

        //play screaming sounds
        this.Sound.play("sounds/humans/2/human_death_01" + ".wav", ::Const.Sound.Volume.Inventory);
        this.Sound.play("sounds/humans/2/human_flee_01" + ".wav", ::Const.Sound.Volume.Inventory);
        return true;
    }
});