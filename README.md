# minetest-csm-anvilhack
Allows you to repair screwdriver on the anvil
* As you know, you can't just put the screwdriver on the anvil. This CSM provides a little "hack" to make it possible.
### Usage
* The usage depends on server's settings (csm_restriction_flags)
  * If the `lookup_nodes` is restricted, you have to **stand directly** on the anvil and execute `.anvilhack` command.
  * Otherwise, you can just look at the anvil at the distance(max 6 meters) and execute `.anvilhack`.
* However, the mod will notify you about restricted `lookup_nodes` when you try to execute `.anvilhack` at the distance.
