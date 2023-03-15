//hide mood
::mods_hookExactClass("skills/special/mood_check", function (o)
{
    local create = o.create;
    o.create = function()
    {
        create();
        this.m.IsHidden = true;
    }

});