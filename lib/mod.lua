local fx  = require("fx/lib/fx")
local mod = require 'core/mods'

local WIDTH  = 128
local HEIGHT = 64

local FxComb = fx:new{
    subpath = "/fx_comb"
}

function FxComb:add_params()
    params:add_group("fx_tanh", "FX COMB", 1+3)
    FxComb:add_slot("fx_comb_slot", "slot")
    FxComb:add_taper("fx_comb_delaytime", "delay", "delaytime", 0.0001, 0.2, 0.05, 1.5, "s")
    FxComb:add_taper("fx_comb_decaytime", "decay", "decaytime", -5.0, 5.0, 1.0, 1.3, "s")
end

--- menu

local m = {}
local ui_metro = nil

m.init = function()
   ui_metro = metro.init(mod.menu.redraw, 1/30)
   ui_metro:start()
end

m.key = function(n, z)
   if n == 2 and z == 1 then
      metro.free(ui_metro.id)
      mod.menu.exit()
   end
end

m.enc = function(n, d)
   if params.lookup['fx_comb_delaytime'] then
      if n == 2 then
	 params:delta('fx_comb_delaytime', d)
      elseif n == 3 then
	 params:delta('fx_comb_decaytime', d)
      end
   end
end

m.redraw = function()
   screen.clear()
   screen.blend_mode('xor')
   screen.font_face(16)
   screen.font_size(16)
   screen.move(WIDTH/2, HEIGHT/2)
   screen.text_center("comb comb")
   if params.lookup['fx_comb_delaytime'] then
      local xoffset = WIDTH/2  * params:get('fx_comb_delaytime')
      local yoffset = 16 * (-params:get('fx_comb_decaytime')/5)
      screen.move(WIDTH/2+xoffset, HEIGHT/2+yoffset)
      screen.text_center("comb comb")
   end
   screen.update()
end

m.deinit = function()
   screen.font_face(1)
   screen.font_size(8)
end

--- hooks

mod.hook.register("script_pre_init", "fx comb mod pre init", function()
    FxComb:add_params()
end)

mod.hook.register("script_post_cleanup", "fx comb mod post cleanup", function()
end)

mod.menu.register(mod.this_name, m)

return FxComb

-- Local Variables:
-- flycheck-luacheck-standards: ("lua51" "norns")
-- End:
