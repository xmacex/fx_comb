local fx  = require("fx/lib/fx")
local mod = require 'core/mods'

local FxComb = fx:new{
    subpath = "/fx_comb"
}

function FxComb:add_params()
    params:add_group("fx_tanh", "FX COMB", 1+3)
    FxComb:add_slot("fx_comb_slot", "slot")
    FxComb:add_taper("fx_comb_delaytime", "delay", "delaytime", 0.0001, 0.2, 0.05, 1.5, "s")
    FxComb:add_taper("fx_comb_decaytime", "decay", "decaytime", -5.0, 5.0, 1.0, 1.3, "s")
end

mod.hook.register("script_pre_init", "fx comb mod pre init", function()
    FxComb:add_params()
end)

mod.hook.register("script_post_cleanup", "fx comb mod post cleanup", function()
end)

return FxComb

-- Local Variables:
-- flycheck-luacheck-standards: ("lua51" "norns")
-- End:
