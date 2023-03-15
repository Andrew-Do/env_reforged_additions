//FEATURE_1: generate location loot hooks

//TODO: add new reforged weapon to pricelist

//FEATURE_1: this.World.Assets.addMoney
	//overhaul contract pay
	//event pay/prices

//FEATURE_2: overhaul enemy equipment/builds


// 4 gallons of ale: 1 Pence
// 1 hen: 5 Pence
// Brass pot: 2-13 Shillings
// Crossbow: 12 Pence (today’s retail price, several 100$)
// 1 Quiver of crossbow bolts: 16 Pence
// 1 cart-horse: Up to 32 Shillings

//bros will eat 2.0 (DailyFood) units per day
//food unit is 25 so it will last 12 meals
//calculate cost per meal
//base unit is pence

//Harnmaster prices

::Z.Economy <- {};
::Z.Economy.PriceTable <- {
	//Supplies
	"supplies.roots_and_berries" : 3, //poor af food

	"supplies.ground_grains" : 4, //8/50lb | 25
	"supplies.rice" : 4,
	
	"supplies.pickled_mushrooms" : 5,
	"supplies.dates" : 5,
	"supplies.dried_fruits" : 5,
	"supplies.black_marsh_stew" : 5,
	"supplies.bread" : 6, //6.25 d|25 units
	
	"supplies.goat_cheese" : 10,
	
	"supplies.strange_meat" : 15, //2/lb | 25
	"supplies.dried_fish" : 25, //2d/lb || 25d / 25 units
	"supplies.cured_venison" : 25,
	"supplies.smoked_ham" : 25,
	"supplies.dried_lamb" : 25,
	"supplies.cured_rations" : 50,

	"supplies.beer" : 29,
	"supplies.mead" : 55,
	"supplies.preserved_mead" : 66,
	"supplies.wine" : 160,
	
	"supplies.fermented_unhold_heart" : 0,

	"supplies.ammo" : 63,
	"supplies.armor_parts" : 124,
	"supplies.medicine" : 60,

	//Tools
	//TODO: Tool prices
	"ammo.arrows" : 35,
	"ammo.bolts" : 35,
	"ammo.powder" : 50,
	"tool.throwing_net" : 29, //FEATURE_3: rework into ammo
	"tool.reinforced_throwing_net" : 60, 
	"weapon.holy Water" : 100,
	"weapon.faction_banner" : 137,
	"weapon.player_banner" : 137,

	//Accessories
	//FEATURE_1: Remove dog events
	"accessory.cursed_crystal_skull" : 250, //FEATURE_6: Artifact rework + unlock event, must be equipped
	"accessory.wardog" : 12,
	"accessory.armored_wardog" : 48, //TODO: Remove
	"accessory.armored_warhound" : 72, //TODO: Remove
	"accessory.heavily_armored_wardog" : 78, //TODO: Remove
	"accessory.heavily_armored_warhound" : 108, //TODO: Remove
	"accessory.warwolf" : 200, //Trained direwolf
	"accessory.falcon" : 100,
	"accessory.oathtaker_skull_01" : 0,
	"accessory.oathtaker_skull_02" : 0,
	"accessory.arena_collar" : 0,
	//TODO: Accessory prices
	"accessory.slayer_necklace" : 100,
	"accessory.ghoul_trophy" : 250,
	"accessory.sergeant_badge" : 250,
	"accessory.warhound" : 250,
	"accessory.alp_trophy" : 400,
	"accessory.goblin_trophy" : 500,
	"accessory.orc_trophy" : 500,
	"accessory.undead_trophy" : 500,
	"accessory.hexen_trophy" : 550,
	
	//Alchemy
	"accessory.berserker_mushrooms" : 100,
	"accessory.bandage" : 25,
	//FEATURE_1: alchemy item rework & alchemy tree
	"weapon.acid_flask" : 400,
	"weapon.smoke_bomb" : 400,
	"weapon.daze_bomb" : 500,
	"weapon.fire_bomb" : 600,
	"misc.snake_oil" : 650,
	"accessory.antidote" : 150,
	"accessory.spider_poison" : 150,
	"accessory.poison" : 100,
	"misc.miracle_drug" : 450,
	"misc.potion_of_knowledge" : 750,
	"misc.potion_of_oblivion" : 2500,
	"misc.bodily_reward" : 2500,
	"misc.spiritual_reward" : 2500,
	"misc.trade_jug" : 10000,
	"accessory.iron_will_potion" : 300,
	"accessory.lionheart_potion" : 300,
	"accessory.recovery_potion" : 350,
	"accessory.cat_potion" : 350,
	"accessory.night_vision_elixir" : 350,

	//Misc
	"misc.manhunters_ledger" : 0,
	"misc.broken_ritual_armor" : 0,
	"misc.golden_goose" : 3000,
	"misc.black_book" : 1000,
	"misc.legendary_sword_blade" : 2500,
	"misc.legendary_sword_grip" : 2500,
	"misc.happy_powder" : 400,
	//Paint
	"misc.paint_remover" : 10,
	"misc.paint_black" : 20,
	"misc.paint_orange_red" : 20,
	"misc.paint_red" : 20,
	"misc.paint_set_shields" : 20,
	"misc.paint_white_blue" : 20,
	"misc.paint_white_green_yellow" : 20,
	//Trade Goods
	"misc.wardog_armor_upgrade" : 200, //FEATURE_6: wardog -> warwolf? Northern kingdom
	"misc.wardog_heavy_armor_upgrade" : 400, //FEATURE_6: wardog -> warwolf? Northern kingdom
	"misc.peat_bricks" : 100,
	"misc.cloth_rolls" : 140,
	"misc.copper_ingots" : 220,
	"misc.amber_shards" : 260,
	"misc.furs" : 20,
	"misc.valuable_furs" : 120,
	"misc.salt" : 20,
	"misc.spices" : 100,
	"misc.incense" : 70,
	"misc.dies" : 170,
	"misc.silk" : 224,
	"misc.uncut_gems" : 480,
	"misc.gemstones" : 2400,
	//Human Loot
	//TODO: Misc prices
	"misc.bone_figurines" : 180,
	"misc.quality_wood" : 180,
	"misc.signet_ring" : 245,
	"misc.bead_necklace" : 250,
	"misc.silverware" : 350,
	"misc.looted_valuables" : 450,
	"misc.jade_broche" : 400,
	"misc.silver_bowl" : 490,
	"misc.ornate_tome" : 595,
	"misc.white_pearls" : 770,
	"misc.ancient_gold_coins" : 875,
	"misc.golden_chalice" : 980,
	"misc.jeweled_crown" : 1260,
	//Monster Loot
	"misc.poisoned_apple" : 0, //FIXME: removed from drops
	"misc.webbed_valuables" : 0, //FIXME: removed from drops
	"misc.goblin_carved_ivory_iconographs" : 0, //FIXME: removed from drops
	"misc.goblin_minted_coins" : 0, //FIXME: removed from drops
	"misc.goblin_rank_insignia" : 0, //FIXME: removed from drops
	"misc.deformed_valuables" : 0, //FIXME: removed from drops
	"misc.lindwurm_hoard" : 0, //FIXME: remove from drops

	"misc.growth_pearls" : 200,
	"misc.ghoul_brain" : 200,
	"misc.ghoul_teeth" : 200,
	"misc.ghoul_horn" : 375,

	"misc.rainbow_scale" : 200,
	"misc.serpent_skin" : 350,
	"misc.glistening_scales" : 450,

	"misc.poison_gland" : 250,
	"misc.spider_silk" : 350,

	"misc.parched_skin" : 625,
	"misc.soul_splinter" : 300,
	"misc.third_eye" : 750,
	"misc.petrified_scream" : 750,
	
	"misc.glittering_rock" : 500,

	"misc.acidic_saliva" : 500,
	"misc.hyena_fur" : 500,

	"misc.werewolf_pelt" : 500,
	"misc.sabertooth" : 250,
	"misc.adrenaline_gland" : 400,

	"misc.vampire_dust" : 1000,

	"misc.unhold_bones" : 1125,
	"misc.unhold_heart" : 1125,
	"misc.unhold_hide" : 1000,
	"misc.frost_unhold_fur" : 1500,

	"misc.mysterious_herbs" : 1650,
	"misc.sulfurous_rock" : 2000,

	"misc.witch_hair" : 2000,

	"misc.lindwurm_bones" : 2200,
	"misc.lindwurm_scales" : 3000,
	"misc.lindwurm_blood" : 2000,

	"misc.glowing_resin" : 2500,
	"misc.ancient_wood" : 2900,
	"misc.ancient_amber" : 500,
	"misc.heart_of_the_forest" : 3250,

	"misc.kraken_horn_plate" : 4000,
	"misc.kraken_tentacle" : 4000,
	

	//Shields
	"shield.schrat" : 0,
	"shield.goblin_light_shield" : 0,
	"shield.orc_light_shield" : 0,
	"shield.coffin_shield" : 0,
	"shield.auxiliary_shield" : 0,
	"shield.goblin_heavy_shield" : 0,

	"shield.buckler" : 20,
	"shield.wooden_shield_old" : 24,
	"shield.faction_wooden_shield" : 38,
	"shield.wooden_shield" : 38,
	"shield.southern_light_shield" : 38,

	"shield.worn_kite_shield" : 46,
	"shield.kite_shield" : 66,
	"shield.faction_kite_shield" : 66,
	"shield.named_bandit_kite_shield" : 120,
	"shield.named_undead_kite_shield" : 120,
	"shield.named_dragon" : 140,

	"shield.worn_heater_shield" : 46,
	"shield.faction_heater_shield" : 66,
	"shield.heater_shield" : 66,
	"shield.named_bandit_heater" : 120,
	"shield.named_undead_heater_shield" : 120,
	"shield.named_red_white" : 140,
	"shield.named_rider_on_horse" : 140,
	"shield.named_wing" : 140,

	"shield.tower_shield" : 90,

	"shield.metal_round_shield" : 120,
	"shield.named_sipar_shield" : 160,
	"shield.named_golden_round" : 160,
	"shield.orc_heavy_shield" : 90,
	"shield.named_orc_heavy_shield" : 140,
	"shield.named_full_metal_heater" : 160,

	"shield.craftable_lindwurm" : 140,
	"shield.named_lindwurm" : 180,
	"shield.craftable_schrat" : 86,
	"shield.craftable_kraken" : 500,

	"shield.gilders_embrace" : 1000,
	
	
	//Weapons
	//TODO: Weapon prices
	"weapon.barbarian_drum" : 0,
	"weapon.knife" : 0,
	"weapon.wooden_stick" : 0,
	"weapon.wooden_flail" : 0,
	"weapon.wonky_bow" : 0,
	"weapon.claw_club" : 0,
	"weapon.butchers_cleaver" : 0,
	"weapon.lute" : 0,
	"weapon.pickaxe" : 0,
	"weapon.antler_cleaver" : 0,
	"weapon.pitchfork" : 0,
	"weapon.broken_ancient_sword" : 0,
	"weapon.broken_bladed_pike" : 0,

	//Dagger
	"weapon.dagger" : 24,
	"weapon.rondel_dagger" : 48,
	"weapon.qatal_dagger" : 48,

	"weapon.named_dagger" : 1500,
	"weapon.named_qatal_dagger" : 3000,

	//Sword
	"weapon.ancient_sword" : 48,
	"weapon.shortsword" : 90,
	"weapon.goblin_notched_blade" : 90,
	"weapon.saif" : 90,
	"weapon.scimitar" : 108,
	"weapon.goblin_falchion" : 90,
	"weapon.falchion" : 108,
	"weapon.shamshir" : 166,
	"weapon.arming_sword" : 166,
	"weapon.noble_sword" : 207,

	"weapon.fencing_sword" : 166,
	"weapon.rf_estoc" : 207,

	"weapon.rhomphaia" : 100,
	"weapon.warbrand" : 138,
	"weapon.longsword" : 168,
	"weapon.rf_greatsword" : 230,
	"weapon.greatsword" : 266,
	
	"weapon.named_sword" : 269,
	"weapon.named_shamshir" : 269,
	"weapon.named_fencing_sword" : 215,
	"weapon.named_rf_estoc" : 269,
	"weapon.named_greatsword" : 345,

	"weapon.named_goblin_falchion" : 2600,
	"weapon.named_warbrand" : 4000,

	//Hammer
	"weapon.two_handed_wooden_hammer" : 500,
	"weapon.skull_hammer" : 1300,
	
	"weapon.military_pick" : 900,
	"weapon.named_two_handed_hammer" : 4000,
	"weapon.polehammer" : 1500,
	"weapon.two_handed_hammer" : 2000,
	"weapon.warhammer" : 2300,

	"weapon.named_polehammer" : 3200,
	"weapon.named_skullhammer" : 3200,
	"weapon.named_warhammer" : 4200,
	
	//Cleaver
	"weapon.falx" : 350,
	"weapon.blunt_cleaver" : 600,
	"weapon.scramasax" : 700,
	"weapon.orc_cleaver" : 1100,
	"weapon.khopesh" : 1300,
	"weapon.named_orc_cleaver" : 2400,
	"weapon.named_cleaver" : 3800,

	"weapon.battle_whip" : 450,
	"weapon.thorned_whip" : 400,

	"weapon.rusty_warblade" : 1600,
	"weapon.two_handed_saif" : 1800,
	"weapon.military_cleaver" : 1900,
	"weapon.crypt_cleaver" : 2000,
	"weapon.named_battle_whip" : 2200,
	"weapon.named_rusty_warblade" : 3200,
	"weapon.named_crypt_cleaver" : 3200,
	"weapon.named_khopesh" : 3200,
	"weapon.two_handed_scimitar" : 2400,
	"weapon.named_two_handed_scimitar" : 3200,
	

	//Axe
	"weapon.hatchet" : 60,
	"weapon.axehammer" : 800,
	"weapon.crude_axe" : 800,
	"weapon.hand_axe" : 900,
	"weapon.fighting_axe" : 2800,
	"weapon.orc_axe" : 0,

	"weapon.orc_axe_2h" : 1500,
	"weapon.rf_battle_axe" : 1950,
	"weapon.heavy_rusty_axe" : 2000,
	

	"weapon.woodcutters_axe" : 0,
	"weapon.longaxe" : 1200,
	"weapon.bardiche" : 2200,
	"weapon.greataxe" : 2400,

	"weapon.named_axe" : 4000,
	"weapon.named_longaxe" : 3000,
	"weapon.named_orc_axe" : 2400,

	"weapon.named_heavy_rusty_axe" : 3400,
	"weapon.named_rf_battle_axe" : 4000,
	"weapon.named_bardiche" : 4600,
	"weapon.named_greataxe" : 4600,


	//Mace
	"weapon.orc_metal_club" : 0,
	"weapon.orc_wooden_club" : 0,
	"weapon.bludgeon" : 72,
	"weapon.nomad_mace" : 100,
	"weapon.light_southern_mace" : 400,
	"weapon.morning_star" : 650,
	"weapon.two_handed_spiked_mace" : 900,
	"weapon.two_handed_mace" : 1100,

	"weapon.heavy_southern_mace" : 2000,
	"weapon.polemace" : 1400,
	"weapon.two_handed_flanged_mace" : 1900,
	"weapon.winged_mace" : 2000,
	"weapon.named_two_handed_mace" : 3600,
	"weapon.named_mace" : 4000,
	"weapon.named_polemace" : 2600,
	"weapon.named_two_handed_spiked_mace" : 3000,

	//Flail
	"weapon.flail" : 1300,
	
	"weapon.reinforced_wooden_flail" : 300,
	"weapon.two_handed_wooden_flail" : 500,
	"weapon.rf_reinforced_wooden_poleflail" : 700,
	"weapon.orc_flail_2h" : 1300,
	"weapon.three_headed_flail" : 1500,
	"weapon.rf_poleflail" : 1400,
	"weapon.two_handed_flail" : 1400,
	"weapon.named_two_handed_flail" : 2800,

	"weapon.named_flail" : 3400,
	"weapon.named_three_headed_flail" : 3400,
	"weapon.named_rf_poleflail" : 4000,

	//Spear
	"weapon.militia_spear" : 52,
	"weapon.boar_spear" : 78,
	"weapon.fighting_spear" : 117,
	"weapon.firelance" : 750,

	"weapon.ancient_spear" : 52,
	"weapon.goblin_spear" : 52,

	"weapon.goedendag" : 600,

	"weapon.named_spear" : 3200,
	"weapon.named_goblin_spear" : 2000,

	//Polearm
	"weapon.warfork" : 400,
	"weapon.hooked_blade" : 700,
	"weapon.spetum" : 750,
	"weapon.bladed_pike" : 600,

	"weapon.warscythe" : 700,
	"weapon.goblin_pike" : 800,
	
	"weapon.pike" : 900,

	"weapon.swordlance" : 1300,
	"weapon.billhook" : 1400,
	
	"weapon.rf_swordstaff" : 2400,
	"weapon.named_goblin_pike" : 2400,
	"weapon.named_warscythe" : 2800,
	"weapon.named_pike" : 2800,
	"weapon.named_spetum" : 2800,
	"weapon.named_billhook" : 3200,
	"weapon.named_swordlance" : 3200,

	"weapon.named_rf_swordstaff" : 4200,

	//Crossbow
	"weapon.light_crossbow" : 300,
	"weapon.crossbow" : 750,
	"weapon.goblin_crossbow" : 2000,
	"weapon.heavy_crossbow" : 3200,

	"weapon.handgonne" : 3000,

	"weapon.named_crossbow" : 4400,
	"weapon.named_handgonne" : 5000,

	//Bow
	"weapon.short_bow" : 20,
	"weapon.hunting_bow" : 24,
	"weapon.war_bow" : 72,

	"weapon.goblin_bow" : 250,
	"weapon.goblin_heavy_bow" : 500,
	"weapon.composite_bow" : 400,
	
	"weapon.named_goblin_heavy_bow" : 2200,
	"weapon.masterwork_bow" : 3500,
	"weapon.named_warbow" : 4600,
	
	//Sling
	"weapon.staff_sling" : 150,
	"weapon.nomad_sling" : 300,

	//Throwing
	"weapon.throwing_spear" : 80,
	"weapon.orc_javelin" : 0,
	"weapon.javelin" : 200,
	"weapon.throwing_axe" : 200,
	"weapon.goblin_spiked_balls" : 200,
	"weapon.heavy_javelin" : 300,
	"weapon.heavy_throwing_axe" : 300,

	"weapon.named_javelin" : 1400,
	"weapon.named_throwing_axe" : 1400,

	//Staff
	"weapon.goblin_staff" : 1000,

	//artifacts
	"weapon.obsidian_dagger" : 5000,
	"weapon.lightbringer_sword" : 20000,

	//Armor
	//TODO: Armor prices
	"armor.body.tattered_sackcloth" : 0,
	"armor.body.ancient_lich_attire" : 0,
	"armor.body.ancient_priest_attire" : 0,
	"armor.body.ancient_ripped_cloth" : 0,
	"armor.body.barbarian_ritual" : 0,
	"armor.body.unhold_armor_heavy" : 0,
	"armor.body.unhold_armor_light" : 0,
	"armor.head.ancient_laurels" : 0,
	"armor.head.ancient_lich_headpiece" : 0,
	"armor.head.ancient_priest_diadem" : 0,
	"armor.head.barbarian_ritual_helmet" : 0,
	"armor.head.unhold_helmet_heavy" : 0,
	"armor.head.unhold_helmet_light" : 0,

	"armor.body.sackcloth" : 0,
	"armor.head.cultist_hood" : 20,
	"armor.head.noble_headgear" : 20,
	"armor.head.vizier_headgear" : 20,
	"armor.body.cloth_sash" : 30,
	"armor.head.headscarf" : 30,
	"armor.head.wizard_hat" : 30,
	"armor.head.leather_headband" : 30,
	"armor.body.leather_wraps" : 40,
	"armor.body.thick_furs" : 40,
	"armor.head.hood" : 40,
	"armor.head.nomad_head_wrap" : 40,
	"armor.body.linen_tunic" : 45,
	"armor.body.monk_robe" : 45,
	"armor.body.noble_gear" : 45,
	"armor.body.vizier_gear" : 45,
	"armor.body.nomad_robe" : 50,
	"armor.head.engineer_hat" : 50,
	"armor.head.gunner_hat" : 50,
	"armor.head.southern_head_wrap" : 50,
	"armor.body.apron" : 55,
	"armor.body.butcher_apron" : 55,
	"armor.body.wizard_robe" : 60,
	"armor.head.open_leather_cap" : 60,
	"armor.head.straw_hat" : 60,
	"armor.head.assassin_head_wrap" : 60,
	"armor.head.leather_head_wrap" : 60,
	"armor.body.leather_tunic" : 65,
	"armor.body.undertaker_apron" : 65,
	"armor.head.aketon_cap" : 70,
	"armor.head.hunters_hat" : 70,
	"armor.head.jesters_hat" : 70,
	"armor.body.thick_dark_tunic" : 75,
	"armor.body.thick_tunic" : 75,
	"armor.body.animal_hide_armor" : 80,
	"armor.body.thick_nomad_robe" : 80,
	"armor.head.feathered_hat" : 80,
	"armor.head.full_leather_cap" : 80,
	"armor.body.padded_surcoat" : 90,
	"armor.body.noble_tunic" : 100,
	"armor.body.rugged_dark_surcoat" : 100,
	"armor.body.rugged_surcoat" : 100,
	"armor.head.dark_cowl" : 100,
	"armor.head.full_aketon_cap" : 100,
	"armor.head.witchhunter_hat" : 100,
	"armor.head.bear_headpiece" : 100,
	"armor.head.nomad_leather_cap" : 110,
	"armor.body.reinforced_animal_hide_armor" : 120,
	"armor.head.undertaker_hat" : 120,
	"armor.head.desert_stalker_head_wrap" : 120,
	"armor.body.scrap_metal_armor" : 130,
	"armor.body.leather_nomad_robe" : 140,
	"armor.body.padded_vest" : 140,
	"armor.head.cultist_leather_hood" : 140,
	"armor.head.nomad_light_helmet" : 140,
	"armor.body.gambeson" : 150,
	"armor.body.gladiator_harness" : 150,
	"armor.head.rusty_mail_coif" : 150,
	"armor.head.blade_dancer_head_wrap" : 150,
	"armor.body.blotched_gambeson" : 160,
	"armor.head.physician_mask" : 170,
	"armor.body.wanderers_coat" : 180,
	"armor.body.linothorax" : 180,
	"armor.body.padded_leather" : 200,
	"armor.body.stitched_nomad_armor" : 200,
	"armor.head.greatsword_hat" : 200,
	"armor.head.mail_coif" : 200,
	"armor.body.hide_and_bone_armor" : 220,
	"armor.body.cultist_leather_robe" : 240,
	"armor.body.patched_mail_shirt" : 250,
	"armor.head.closed_mail_coif" : 250,
	"armor.head.ancient_household_helmet" : 250,
	"armor.body.leather_lamellar" : 300,
	"armor.head.reinforced_mail_coif" : 300,
	"armor.head.fangshire" : 300,
	"armor.head.leather_helmet" : 320,
	"armor.body.ancient_mail" : 350,
	"armor.body.plated_nomad_mail" : 350,
	"armor.head.dented_nasal_helmet" : 350,
	"armor.head.nasal_helmet" : 350,
	"armor.head.beastmasters_headpiece" : 350,
	"armor.head.wrapped_southern_helmet" : 350,
	"armor.head.heavy_mail_coif" : 375,
	"armor.body.worn_mail_shirt" : 400,
	"armor.body.southern_mail_shirt" : 400,
	"armor.body.basic_mail_shirt" : 450,
	"armor.body.ancient_double_layer_mail" : 450,
	"armor.head.kettle_hat" : 450,
	"armor.head.nomad_reinforced_helmet" : 450,
	"armor.body.reinforced_leather_tunic" : 500,
	"armor.body.werewolf_hide" : 500,
	"armor.head.flat_top_helmet" : 500,
	"armor.head.nordic_helmet" : 500,
	"armor.head.spiked_skull_cap_with_mail" : 500,
	"armor.body.rugged_scale_armor" : 550,
	"armor.head.masked_kettle_helmet" : 550,
	"armor.head.padded_nasal_helmet" : 550,
	"armor.head.crude_metal_helmet" : 550,
	"armor.head.nasal_helmet_with_rusty_mail" : 600,
	"armor.head.ancient_legionary_helmet" : 600,
	"armor.body.mail_shirt" : 650,
	"armor.head.padded_kettle_hat" : 650,
	"armor.head.crude_faceguard_helmet" : 650,
	"armor.body.heavy_iron_armor" : 700,
	"armor.body.ancient_scale_harness" : 750,
	"armor.body.mail_and_lamellar_plating" : 750,
	"armor.body.leather_scale" : 800,
	"armor.head.padded_flat_top_helmet" : 800,
	"armor.head.closed_scrap_metal_helmet" : 800,
	"armor.head.greatsword_faction_helm" : 850,
	"armor.body.werewolf_mail" : 900,
	"armor.body.ancient_breastplate" : 900,
	"armor.body.decayed_reinforced_mail_hauberk" : 1000,
	"armor.body.mail_hauberk" : 1000,
	"armor.head.closed_flat_top_helmet" : 1000,
	"armor.head.ancient_honorguard_helmet" : 1000,
	"armor.body.adorned_mail_shirt" : 1050,
	"armor.head.closed_flat_top_with_neckguard" : 1100,
	"armor.body.thick_plated_barbarian_armor" : 1200,
	"armor.head.sallet_helmet" : 1200,
	"armor.head.decayed_closed_flat_top_with_mail" : 1250,
	"armor.head.decayed_closed_flat_top_with_sack" : 1250,
	"armor.head.nasal_helmet_with_mail" : 1250,
	"armor.head.steppe_helmet_with_mail" : 1250,
	"armor.head.southern_helmet_with_coif" : 1250,
	"armor.body.light_scale_armor" : 1300,
	"armor.head.heavy_horned_plate_helmet" : 1300,
	"armor.body.assassin_robe" : 1400,
	"armor.head.bascinet_with_mail" : 1400,
	"armor.head.decayed_full_helm" : 1500,
	"armor.head.kettle_hat_with_mail" : 1500,
	"armor.body.adorned_warriors_armor" : 1600,
	"armor.body.footman_armor" : 1600,
	"armor.body.southern_long_mail_with_padding" : 1800,
	"armor.head.flat_top_with_mail" : 1800,
	"armor.head.assassin_face_mask" : 1800,
	"armor.body.reinforced_mail_hauberk" : 2000,
	"armor.body.ancient_plated_mail_hauberk" : 2000,
	"armor.body.black_leather" : 2000,
	"armor.head.adorned_closed_flat_top_with_mail" : 2000,
	"armor.head.decayed_great_helm" : 2000,
	"armor.head.nasal_helmet_with_closed_mail" : 2000,
	"armor.head.norse" : 2000,
	"armor.head.wolf" : 2000,
	"armor.head.kettle_hat_with_closed_mail" : 2200,
	"armor.head.gladiator_helmet" : 2200,
	"armor.body.ancient_scale_coat" : 2400,
	"armor.body.noble_mail" : 2500,
	"armor.head.heavy_lamellar_helmet" : 2500,
	"armor.head.barbute_helmet" : 2600,
	"armor.head.conic_helmet_with_closed_mail" : 2600,
	"armor.head.flat_top_with_closed_mail" : 2600,
	"armor.head.nordic_helmet_with_closed_mail" : 2600,
	"armor.body.ancient_plate_harness" : 2800,
	"armor.body.decayed_coat_of_scales" : 3000,
	"armor.body.lamellar_harness" : 3000,
	"armor.head.closed_flat_top_with_mail" : 3000,
	"armor.head.conic_helmet_with_faceguard" : 3000,
	"armor.body.ancient_plated_scale_hauberk" : 3200,
	"armor.head.turban_helmet" : 3200,
	"armor.head.full_helm" : 3500,
	"armor.head.adorned_full_helm" : 3700,
	"armor.body.decaying_coat_of_plates" : 4000,
	"armor.body.scale_armor" : 4000,
	"armor.body.blue_studded_mail" : 4000,
	"armor.body.named_plated_fur_armor" : 4000,
	"armor.body.heraldic_armor" : 4000,
	"armor.head.faction_helm" : 4000,
	"armor.body.sellsword_armor" : 4500,
	"armor.body.heavy_lamellar_armor" : 5000,
	"armor.head.named_metal_nose_horn_helmet" : 5000,
	"armor.head.named_metal_skull_helmet" : 5000,
	"armor.head.named_steppe_helmet_with_mail" : 5000,
	"armor.body.named_noble_mail_armor" : 5500,
	"armor.body.named_skull_and_chain_armor" : 5500,
	"armor.body.padded_mail_and_lamellar_hauberk" : 5600,
	"armor.body.adorned_heavy_mail_hauberk" : 6000,
	"armor.body.coat_of_scales" : 6000,
	"armor.head.golden_feathers" : 6000,
	"armor.head.gold_and_black_turban" : 6000,
	"armor.head.red_and_gold_band_helmet" : 6000,
	"armor.body.coat_of_plates" : 7000,
	"armor.body.heraldic_mail" : 7000,
	"armor.head.nasal_feather" : 7000,
	"armor.head.sallet_green" : 7000,
	"armor.body.lindwurm_armor" : 7500,
	"armor.head.lindwurm_helmet" : 7500,
	"armor.head.named_nordic_helmet_with_closed_mail" : 7500,
	"armor.body.golden_scale" : 8000,
	"armor.head.heraldic_mail" : 8000,
	"armor.head.named_conic_helmet_with_faceguard" : 8000,
	"armor.head.named_metal_bull_helmet" : 8000,
	"armor.body.black_and_gold" : 9000,
	"armor.body.named_bronze_armor" : 9000,
	"armor.body.named_sellswords_armor" : 10000,
	"armor.body.named_golden_lamellar_armor" : 11000,
	"armor.body.ijirok_armor" : 12000,
	"armor.head.ijirok_helmet" : 13000,
	"armor.body.brown_coat_of_plates" : 14000,
	"armor.body.green_coat_of_plates" : 15000,
	"armor.body.leopard_armor" : 15000,

	//Artifacts
	"armor.head.mask_of_davkul" : 20000,
	"armor.body.armor_of_davkul" : 20000,
	"armor.body.emperors_armor" : 20000,
	"armor.head.emperors_countenance" : 20000,
	
	//Armor Upgrades
	"armor_upgrade.negative_moulderedd" : -250,
	"armor_upgrade.negative_falling_apart" : -200,
	"armor_upgrade.negative_weathered" : -150,
	"armor_upgrade.negative_shabby" : -100,
	"armor_upgrade.leather_neckguard" : 100,
	"armor_upgrade.leather_shoulderguards" : 100,
	"armor_upgrade.double_mail" : 200,
	"armor_upgrade.light_gladiator_upgrade" : 200,
	"armor_upgrade.mail_patch" : 200,
	"armor_upgrade.joint_cover" : 300,
	"armor_upgrade.metal_plating" : 300,
	"armor_upgrade.barbarian_horn" : 500,
	"armor_upgrade.heraldic_plates" : 500,
	"armor_upgrade.metal_pauldrons" : 500,
	"armor_upgrade.direwolf_pelt" : 600,
	"armor_upgrade.hyena_fur" : 600,
	"armor_upgrade.serpent_skin" : 600,
	"armor_upgrade.light_padding_replacement" : 650,
	"armor_upgrade.additional_padding" : 700,
	"armor_upgrade.heavy_gladiator_upgrade" : 800,
	"armor_upgrade.lindwurm_scales" : 800,
	"armor_upgrade.bone_platings" : 850,
	"armor_upgrade.unhold_fur" : 1000,
	"armor_upgrade.protective_runes" : 1100,
	"armor_upgrade.horn_plate" : 1200,
};