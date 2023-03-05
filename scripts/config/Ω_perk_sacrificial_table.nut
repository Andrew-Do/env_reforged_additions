::Const.PerkInfo <- {};
::Const.PerkInfo.SacrificialRitual <- {};

//Helper fns

::Const.PerkInfo.SacrificialRitual.hasReward <- function(actor, params)
{
	return actor.getFlags().get("Davkul1stReward") == params[0]
		|| actor.getFlags().get("Davkul2ndReward") == params[0]
		|| actor.getFlags().get("Davkul3rdReward") == params[0];
}

::Const.PerkInfo.SacrificialRitual.hasRewardNot <- function(actor, params)
{
	return !::Const.PerkInfo.SacrificialRitual.hasReward(actor, params);
}

::Const.PerkInfo.SacrificialRitual.hasSkill <- function(actor, params)
{
	return actor.getSkills().hasSkill(params[0]);
}

::Const.PerkInfo.SacrificialRitual.hasSkillNot <- function(actor, params)
{
	return !::Const.PerkInfo.SacrificialRitual.hasSkill(actor, params);
}

::Const.PerkInfo.SacrificialRitual.canLucky <- function(actor, params)
{
	return !actor.getSkills().hasSkill(params[0]) || actor.getFlags().getAsInt("Lucky") < 9;
}

::Const.PerkInfo.SacrificialRitual.addFlag <- function(actor, params)
{
	actor.getFlags().add(params[0], params[1]);
}

::Const.PerkInfo.SacrificialRitual.addPerk <- function(actor, params)
{
	::R.addPerk(actor, params[0], params[1]);
}

::Const.PerkInfo.SacrificialRitual.lucky <- function(actor, params)
{
	if(actor.getSkills().hasSkill("trait.lucky"))
	{
		local lucky = actor.getSkills().getSkillByID("trait.lucky");
		lucky.boostLuck();
	}
	else actor.getSkills().add(::new("scripts/skills/traits/natural_trait"));
}

//Tables

::Const.PerkInfo.SacrificialRitual.Rewards <- [
	{
		ID = "Davkul1stReward",
		Rolls = [
			{
				ID = "Eldritch Blast",
				Validator = [],
				Params = [],
				Chance = 10
			},
			{
				ID = "Pain Ritual",
				Validator = [],
				Params = [],
				Chance = 45
			},
			{
				ID = "Lacerate",
				Validator = [],
				Params = [],
				Chance = 100
			}
		]
	},
	{
		ID = "Davkul2ndReward",
		Rolls = [
			{
				ID = "Agonizing Blast",
				Validator = [
					::Const.PerkInfo.SacrificialRitual.hasReward
				], 
				Params = [
					["Eldritch Blast"]
				],
				Chance = 75
			},
			{
				ID = "Brink of Death",
				Validator = [],
				Params = [],
				Chance = 5
			},
			{
				ID = "Eyes on the Inside",
				Validator = [
					::Const.PerkInfo.SacrificialRitual.hasSkillNot
				],
				Params = [
					["perk.eyes_on_the_inside"]
				],
				Chance = 20
			},
			{
				ID = "Spirit Vessel",
				Validator = [],
				Params = [],
				Chance = 35
			},
			{
				ID = "Writhing Flesh",
				Validator = [],
				Params = [],
				Chance = 100
			}
		]
	},
	{
		ID = "Davkul3rdReward",
		Rolls = [
			{
				ID = "Instinctive Blast",
				Validator = [
					::Const.PerkInfo.SacrificialRitual.hasReward
				], 
				Params = [
					["Eldritch Blast"]
				],
				Chance = 76
			},
			{
				ID = "Brink of Death",
				Validator = [
					::Const.PerkInfo.SacrificialRitual.hasRewardNot
				],
				Params = [
					["Brink of Death"]
				],
				Chance = 5
			},
			{
				ID = "Eyes on the Inside",
				Validator = [
					::Const.PerkInfo.SacrificialRitual.hasSkillNot,
					::Const.PerkInfo.SacrificialRitual.hasRewardNot
				],
				Params = [
					["perk.eyes_on_the_inside"],
					["Eyes on the Inside"]
				],
				Chance = 20
			},
			{
				ID = "Spirit Vessel",
				Validator = [
					::Const.PerkInfo.SacrificialRitual.hasRewardNot
				],
				Params = [
					["Spirit Vessel"]
				],
				Chance = 35
			},
			{
				ID = "Perfect Spirit Vessel",
				Validator = [
					::Const.PerkInfo.SacrificialRitual.hasReward
				],
				Params = [
					["Spirit Vessel"]
				],
				Chance = 35
			},
			{
				ID = "Writhing Flesh",
				Validator = [
					::Const.PerkInfo.SacrificialRitual.hasRewardNot
				],
				Params = [
					["Writhing Flesh"]
				],
				Chance = 60
			},
			{
				ID = "Compassion Ritual",
				Validator = [],
				Params = [],
				Chance = 100
			}
		]
	}
];



::Const.PerkInfo.SacrificialRitual.RewardTable <- {
	//TIer 1
	"Eldritch Blast" : {
		"functions" : [
			::Const.PerkInfo.SacrificialRitual.addPerk
		],
		"params" : [::Const.Perks.PerkDefs.EldritchBlast, 2]
	},
	"Pain Ritual" : {
		"functions" : [
			::Const.PerkInfo.SacrificialRitual.addPerk
		],
		"params" : [::Const.Perks.PerkDefs.PainRitual, 2]
	},
	"Lacerate" : {
		"functions" : [
			::Const.PerkInfo.SacrificialRitual.addPerk
		],
		"params" : [::Const.Perks.PerkDefs.LegendLacerate, 2]
	},

	//Tier 2
	"Agonizing Blast" : {
		"functions" : [
			::Const.PerkInfo.SacrificialRitual.addFlag
		],
		"params" : ["AgonizingBlast", true]
	},
	"Brink of Death" : {
		"functions" : [
			::Const.PerkInfo.SacrificialRitual.addPerk
		],
		"params" : [::Const.Perks.PerkDefs.LegendBrinkOfDeath, 3]
	},
	"Eyes on the Inside" : {
		"functions" : [
			::Const.PerkInfo.SacrificialRitual.addPerk
		],
		"params" : [::Const.Perks.PerkDefs.EyesOnTheInside, 3]
	},
	"Spirit Vessel" : {
		"functions" : [
			::Const.PerkInfo.SacrificialRitual.addPerk
		],
		"params" : [::Const.Perks.PerkDefs.SpiritVessel, 3]
	},
	"Writhing Flesh" : {
		"functions" : [
			::Const.PerkInfo.SacrificialRitual.addPerk
		],
		"params" : [::Const.Perks.PerkDefs.WrithingFlesh, 3]
	},

	//Tier 3
	"Instinctive Blast" : {
		"functions" : [
			::Const.PerkInfo.SacrificialRitual.addFlag
		],
		"params" : ["InstinctiveBlast", true]
	},
	"Perfect Spirit Vessel" : {
		"functions" : [
			::Const.PerkInfo.SacrificialRitual.addFlag
		],
		"params" : ["PerfectSpiritVessel", true]
	},
	"Compassion Ritual" : {
		"functions" : [
			::Const.PerkInfo.SacrificialRitual.addPerk
		],
		"params" : [::Const.Perks.PerkDefs.CompassionRitual, 4]
	}
		
};