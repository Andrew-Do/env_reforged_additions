//prevent event bros from leaving
::mods_hookExactClass("events/events/crisis/undead_crusader_leaves_event", function (o)
{
    o.onUpdateScore = function() { return; }
});

::mods_hookExactClass("events/events/crisis/greenskins_slayer_leaves_event", function (o)
{
    o.onUpdateScore = function() { return; }
});