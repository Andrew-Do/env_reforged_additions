::mods_hookDescendants("skills/backgrounds/character_background", function (o)
{
    local create = o.create;
	o.create = function()
	{
		create();
		if (this.m.ID in ::Z.Backgrounds.Wages) 
        {
            this.m.HiringCost = ::Z.Backgrounds.Wages[this.m.ID].HiringCost;
		    this.m.DailyCost = ::Z.Backgrounds.Wages[this.m.ID].DailyCost;
        }
	}

	if ("onAddEquipment" in o) 
	{
		local onAddEquipment = o.onAddEquipment;
		o.onAddEquipment = function()
		{
			if (this.m.ID in ::Z.Backgrounds.Equipment) 
			{
				local actor = this.getContainer().getActor();
				local items = actor.getItems();
				local equipment_table = ::Z.Backgrounds.Equipment[this.m.ID]
				local flag_2h = false;
				local upgrade = null;

				foreach (group in equipment_table) 
				{
					local itm = ::new(::MSU.Array.rand(group));
					if (items.getItemAtSlot(itm.m.SlotType) != null) continue;
					if (flag_2h && itm.m.SlotType == ::Const.ItemSlot.Offhand) continue;
					

					//make sure upgrade in groups is before armor
					if (itm.getID().find("armor_upgrade") != null)
					{
						upgrade = itm;
						continue;
					}

					if (itm.m.SlotType == ::Const.ItemSlot.Body && upgrade != null)
						itm.setUpgrade(upgrade);

					if (itm.m.BlockedSlotType != null && itm.m.BlockedSlotType == ::Const.ItemSlot.Offhand) 
						flag_2h = true;
					
					items.equip(itm);

					//if ranged weapon, add ranged weapon set
					if (itm.isItemType(::Const.Items.ItemType.RangedWeapon) && itm.getAmmoID() != "")
					{
						switch(itm.getAmmoID())
						{
							case "ammo.bolts":
								items.equip(::new("scripts/items/ammo/quiver_of_bolts"));
								break;
							case "ammo.arrows":
								items.equip(::new("scripts/items/ammo/quiver_of_arrows"));	
								break;
						}
						items.addToBag(::new("scripts/items/weapons/knife"));
					}
					
				}
				return;
			}
			onAddEquipment();
		}
	}
	
});