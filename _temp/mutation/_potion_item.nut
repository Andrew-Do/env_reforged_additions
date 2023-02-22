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

    o.getTooltip <- function()
    {
        local ret = [
            {
                id = 1,
                type = "title",
                text = this.getName()
            },
            {
                id = 2,
                type = "description",
                text = this.getDescription()
            }
        ];
        ret.push({
            id = 66,
            type = "text",
            text = this.getValueString()
        });

        if (this.getIconLarge() != null)
        {
            ret.push({
                id = 3,
                type = "image",
                image = this.getIconLarge(),
                isLarge = true
            });
        }
        else
        {
            ret.push({
                id = 3,
                type = "image",
                image = this.getIcon()
            });
        }
        ret.extend(this.getTooltipPotion());
        return ret;
    }

    o.getTooltipPotion <- function()
    {
        return [];
    }
});