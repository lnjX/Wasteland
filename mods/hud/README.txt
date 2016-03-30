This mod is part of Minetest TNG
================================
Better HUD, Version: 2.1.5 (modified)

License of source code:
-----------------------
Copyright (C) 2013-2016 BlockMen <blockmen2015@gmail.com>
Copyright (C) 2016 LNJ <lnj.git@gmail.com>

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation; either version 2.1 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License along
with this program; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.


License of media (textures, sounds, meshes):
--------------------------------------------
(by Authors)

BlockMen (CC BY-SA 3.0):
  hud_heart_fg.png, based on texture by celeron55 (CC BY-SA 3.0)
  hud_heart_bg.png, based on texture by celeron55 (CC BY-SA 3.0)
  hud_hunger_fg.png, based on texture by PilzAdam (WTFPL)
  hud_hunger_bg.png, based on texture by PilzAdam (WTFPL)
  hud_air_fg.png, based on texture by kaeza (WTFPL)


About this mod:
~~~~~~~~~~~~~~~
This mod improves the HUD of Minetest and adds (hidden by default) statbars for Hunger and Armor.
Also it provides an API to add new statbars easily, see API.txt for more informations.

Changes in builtin HUD items:
- Adds background for Health bar
- Uses better textures for Hotbar
- Uses texture for crosshair
- Positions of builtin statbars can be changed via "hud.conf" file
- Experimental "ItemWheel" that replaces the hotbar (must be enabled by adding "hud_item_wheel = true" in minetest.conf)

This mod gets provided as Modpack aswell, which includes the hunger mod (https://github.com/BlockMen/hud_hunger)
More information concerning the hunger mechanics can be get there.
