//TODO: recheck reforged code

// ::mods_hookExactClass("skills/backgrounds/character_background", function (o)
// {
//     o.Convert = function()
// 	{
// 		this.addBackgroundType(::Const.BackgroundType.ConvertedCultist);
// 		local cultistGroup = [
// 			[],
// 			[
// 				::Const.Perks.PerkDefs.LegendSpecCultHood
// 			],
// 			[
// 				::Const.Perks.PerkDefs.SacrificialRitual
// 			],
// 			[],
// 			[],
// 			[
// 				::Const.Perks.PerkDefs.LegendSpecCultArmor
// 			],
// 			[]
// 		];
// 		this.addPerkGroup(cultistGroup);
// 	}
// });

::mods_hookExactClass("entity/tactical/actor", function (o)
{
    local addDefaultStatusSprites = o.addDefaultStatusSprites;
	o.addDefaultStatusSprites = function()
	{
		addDefaultStatusSprites();
		local compassion = this.addSprite("status_compassion");
		compassion.Visible = false;
	}
});