if (!("LA" in this.getroottable())) ::RA <- {};
::R.Version <- "1.0.0";
::R.ModID <- "mod_RA";
::R.Name <- "Reforged Additions";

::mods_registerMod(::R.ModID, ::R.Version, ::R.Name);

::mods_queue(::R.ModID, ">mod_reforged, mod_msu(>=1.2.0-rc.2)", function()
{
	::R.Mod <- ::MSU.Class.Mod(::R.ModID, ::R.Version, ::R.Name);
	::include("reforged_additions/load.nut");
});