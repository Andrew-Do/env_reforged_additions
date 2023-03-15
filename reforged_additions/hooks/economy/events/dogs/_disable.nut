//disable dog events
//FEATURE_7: remove dogs from troops
::mods_hookExactClass("events/events/adopt_wardog_event", function (o)
{
    o.onUpdateScore = function() { return; }
});

::mods_hookExactClass("events/events/butcher_vs_wardog_event", function (o)
{
    o.onUpdateScore = function() { return; }
});

::mods_hookExactClass("events/events/butcher_wardogs_event", function (o)
{
    o.onUpdateScore = function() { return; }
});

::mods_hookExactClass("events/events/childrens_crusade_event", function (o)
{
    o.onUpdateScore = function() { return; }
});

::mods_hookExactClass("events/events/dogfighting_event", function (o)
{
    o.onUpdateScore = function() { return; }
});

::mods_hookExactClass("events/events/dogs_dig_up_loot_event", function (o)
{
    o.onUpdateScore = function() { return; }
});

::mods_hookExactClass("events/events/houndmaster_tames_wolf_event", function (o)
{
    o.onUpdateScore = function() { return; }
});

::mods_hookExactClass("events/events/wardogs_fight_each_other_event", function (o)
{
    o.onUpdateScore = function() { return; }
});

::mods_hookExactClass("events/events/dlc2/dog_in_swamp_event", function (o)
{
    o.onUpdateScore = function() { return; }
});

::mods_hookExactClass("events/events/dlc8/anatomist_vs_dog_event", function (o)
{
    o.onUpdateScore = function() { return; }
});