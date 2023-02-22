this.acidic_blood <- this.inherit("scripts/skills/mutation/mutation", {
	m = {},
	function create()
	{
		this.mutation.create();
		this.m.ID = "effects.acidic_blood";
		this.m.Name = "Acidic blood";
		this.m.Icon = "skills/status_effect_140.png";
		this.m.IconMini = "status_effect_140_mini";
		this.m.Overlay = "status_effect_140";
	}

	function getDescription()
	{
		return "This character\'s blood is highly pressurized and burns upon prolonged exposure to air. Attackers who break skin will find themselves unpleasantly surprised by the resultant spray.";
	}

	function getTooltipPotion()
	{
		local ret = [
			{
				id = 11,
				type = "text",
				icon = "ui/icons/special.png",
				text = "This character\'s blood burns with acid, damaging adjacent attackers whenever they deal hitpoint damage",
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/health.png",
				text = "+" + ::MSU.Text.colorGreen( "30" ) + " Hitpoints"
			}
		];
		return ret;
	}

});