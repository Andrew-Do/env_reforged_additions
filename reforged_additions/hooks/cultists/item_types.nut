//hook items to add cultist type

::mods_hookExactClass("items/armor/cultist_leather_robe", function (o)
{
    local create = o.create;
	o.create = function()
	{
		create();
		this.m.ItemType = this.m.ItemType | ::Const.Items.ItemType.Cultist;
	}
});

::mods_hookExactClass("items/helmets/cultist_hood", function (o)
{
    local create = o.create;
	o.create = function()
	{
		create();
		this.m.ItemType = this.m.ItemType | ::Const.Items.ItemType.Cultist;
	}
});

::mods_hookExactClass("items/helmets/cultist_leather_hood", function (o)
{
    local create = o.create;
	o.create = function()
	{
		create();
		this.m.ItemType = this.m.ItemType | ::Const.Items.ItemType.Cultist;
	}
});