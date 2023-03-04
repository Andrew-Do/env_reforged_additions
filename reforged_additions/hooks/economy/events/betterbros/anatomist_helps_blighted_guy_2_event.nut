//FEATURE_1: Event bros have a better chance of high rolling logical stars - fixes problem of getting bro with event and then firing him
//FEATURE_1: Create feature doc
::mods_hookExactClass("events/events/dlc8/anatomist_helps_blighted_guy_2_event", function (o)
{
    o.onUpdateScore = function()
	{
		if (!::Const.DLC.Paladins) return;
		if (this.World.Assets.getOrigin().getID() != "scenario.anatomists") return;
		
		local brothers = this.World.getPlayerRoster().getAll();
		local candidate;

		foreach( bro in brothers )
		{
			if (!bro.getSkills().hasSkillOfType(::Const.SkillType.TemporaryInjury) && !bro.getSkills().hasSkillOfType(::Const.SkillType.SemiInjury) && bro.getDaysWithCompany() >= 5 && bro.getFlags().get("IsMilitiaCaptain"))
			{
				candidate = bro;
				break;
			}
		}

		if (candidate == null) return;
		this.m.MilitiaCaptain = candidate;
		this.m.Score = 500;
	}


});