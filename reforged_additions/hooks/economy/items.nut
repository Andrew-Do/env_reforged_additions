::mods_hookDescendants("items/item", function (o)
{
    local create = o.create;
	o.create = function()
	{
		create();
		if (this.m.ID in ::Z.Economy.PriceTable)
            this.m.Value = ::Z.Economy.PriceTable[this.m.ID];
	}
});

