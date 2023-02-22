//add potion code to actor class
//TODO: refactor logic to config table
::mods_hookExactClass("entity/tactical/actor", function (o)
{
    o.add_potion <- function(name, complete)
    {
        switch(name)
        {
            case "direwolf":
                this.getFlags().add("werewolf");
                // this.m.Skills.add(::new("scripts/skills/effects/direwolf_potion_effect"));
                // this.m.Skills.add(::new("scripts/skills/perks/perk_ptr_survival_instinct"));

                if (complete)
                {
                    this.getFlags().add("werewolf_8");
                }
                break;
            case "ghoul":
                this.getFlags().add("ghoul");

                if (complete)
                {
                    this.getFlags().add("ghoul_8");
                    
                }
                break;
            case "spider":
                this.getFlags().add("spider");
               

                if (complete)
                {
                    this.getFlags().add("spider_8");
                    
                }
                break;
            case "unhold":
                this.getFlags().add("unhold");
                this.m.Skills.add(::new("scripts/skills/traits/huge_trait"));

                

                if (complete)
                {
                    this.getFlags().add("unhold_8");
                   
                }
                break;
            case "orc":
                this.getFlags().add("orc");
                

                if (complete)
                {
                    this.getFlags().add("orc_8");
                    
                }
                break;
            case "necrosavant":
                this.getFlags().add("vampire");
                

                if (complete)
                {
                    this.getFlags().add("vampire_8");
                   
                }

                local agent = this.actor.getAIAgent();
                if (agent.findBehavior(::Const.AI.Behavior.ID.Darkflight) == null)
                {
                    agent.addBehavior(::new("scripts/ai/tactical/behaviors/ai_darkflight"));
                    agent.finalizeBehaviors();
                }
                break;
            case "goblin":
                this.getFlags().add("goblin");
                this.m.Skills.add(::new("scripts/skills/traits/tiny_trait"));
                this.m.Skills.add(::new("scripts/skills/effects/goblin_overseer_potion_effect"));

                break;
        }

    }

});

//////////////////////////////// AI ///////////////////////////////////////////
//TODO: modify vanilla darkflight for players onupdate costs