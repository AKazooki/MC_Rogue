scoreboard players operation @s RanberRange = @s Obstructed
function mc_rouge:ranber

execute as @s at @s if score @s Ranber = @s SouthBlocked run fill ~-1 ~ ~6 ~1 ~2 ~6 structure_void
execute as @s at @s if score @s Ranber = @s SouthBlocked run fill ~-1 ~3 ~6 ~1 ~3 ~6 stone

execute as @s at @s if score @s Ranber = @s NorthBlocked run fill ~-1 ~ ~-6 ~1 ~2 ~-6 structure_void
execute as @s at @s if score @s Ranber = @s NorthBlocked run fill ~-1 ~3 ~-6 ~1 ~3 ~-6 stone

execute as @s at @s if score @s Ranber = @s EastBlocked run fill ~6 ~ ~1 ~6 ~2 ~-1 structure_void
execute as @s at @s if score @s Ranber = @s EastBlocked run fill ~6 ~3 ~1 ~6 ~3 ~-1 stone

execute as @s at @s if score @s Ranber = @s WestBlocked run fill ~-6 ~ ~1 ~-6 ~2 ~-1 structure_void
execute as @s at @s if score @s Ranber = @s WestBlocked run fill ~-6 ~3 ~1 ~-6 ~3 ~-1 stone