scoreboard players set @s Obstructed 0
scoreboard players set @s WestBlocked 0
scoreboard players set @s EastBlocked 0
scoreboard players set @s NorthBlocked 0
scoreboard players set @s SouthBlocked 0

# Detect which walls are NOT obstructed. The Obstructed and Blocked scoreboards are being used for the inverse of what they're named lol.

execute as @s at @s positioned ~ ~ ~12 unless entity @e[type=marker,tag=roomgen,distance=..1] run scoreboard players add @s Obstructed 1
execute as @s at @s positioned ~ ~ ~12 unless entity @e[type=marker,tag=roomgen,distance=..1] run scoreboard players operation @s SouthBlocked = @s Obstructed

execute as @s at @s positioned ~ ~ ~-12 unless entity @e[type=marker,tag=roomgen,distance=..1] run scoreboard players add @s Obstructed 1
execute as @s at @s positioned ~ ~ ~-12 unless entity @e[type=marker,tag=roomgen,distance=..1] run scoreboard players operation @s NorthBlocked = @s Obstructed

execute as @s at @s positioned ~12 ~ ~ unless entity @e[type=marker,tag=roomgen,distance=..1] run scoreboard players add @s Obstructed 1
execute as @s at @s positioned ~12 ~ ~ unless entity @e[type=marker,tag=roomgen,distance=..1] run scoreboard players operation @s EastBlocked = @s Obstructed

execute as @s at @s positioned ~-12 ~ ~ unless entity @e[type=marker,tag=roomgen,distance=..1] run scoreboard players add @s Obstructed 1
execute as @s at @s positioned ~-12 ~ ~ unless entity @e[type=marker,tag=roomgen,distance=..1] run scoreboard players operation @s WestBlocked = @s Obstructed

# Generate a room at at least one unobstructed wall.

scoreboard players operation @s RanberRange = @s Obstructed
function mc_rouge:ranber

execute as @s at @s if score @s Ranber = @s SouthBlocked run fill ~-1 ~ ~6 ~1 ~2 ~6 structure_void
execute as @s at @s if score @s Ranber = @s SouthBlocked run fill ~-1 ~3 ~6 ~1 ~3 ~6 stone

execute as @s at @s if score @s Ranber = @s SouthBlocked at @s positioned ~ ~ ~12 run summon marker ~ ~ ~ {Tags:["roomgen","chain","active"]}
execute as @s at @s if score @s Ranber = @s SouthBlocked at @s positioned ~ ~ ~12 run execute as @e[type=marker,tag=roomgen,tag=chain,limit=1,sort=nearest] at @s run function mc_rouge:roomgen/chain


execute as @s at @s if score @s Ranber = @s NorthBlocked run fill ~-1 ~ ~-6 ~1 ~2 ~-6 structure_void
execute as @s at @s if score @s Ranber = @s NorthBlocked run fill ~-1 ~3 ~-6 ~1 ~3 ~-6 stone

execute as @s at @s if score @s Ranber = @s NorthBlocked at @s positioned ~ ~ ~-12 run summon marker ~ ~ ~ {Tags:["roomgen","chain","active"]}
execute as @s at @s if score @s Ranber = @s NorthBlocked at @s positioned ~ ~ ~-12 run execute as @e[type=marker,tag=roomgen,tag=chain,limit=1,sort=nearest] at @s run function mc_rouge:roomgen/chain


execute as @s at @s if score @s Ranber = @s EastBlocked run fill ~6 ~ ~1 ~6 ~2 ~-1 structure_void
execute as @s at @s if score @s Ranber = @s EastBlocked run fill ~6 ~3 ~1 ~6 ~3 ~-1 stone

execute as @s at @s if score @s Ranber = @s EastBlocked at @s positioned ~12 ~ ~ run summon marker ~ ~ ~ {Tags:["roomgen","chain","active"]}
execute as @s at @s if score @s Ranber = @s EastBlocked at @s positioned ~12 ~ ~ run execute as @e[type=marker,tag=roomgen,tag=chain,limit=1,sort=nearest] at @s run function mc_rouge:roomgen/chain


execute as @s at @s if score @s Ranber = @s WestBlocked run fill ~-6 ~ ~-1 ~-6 ~2 ~1 structure_void
execute as @s at @s if score @s Ranber = @s WestBlocked run fill ~-6 ~3 ~1 ~-6 ~3 ~-1 stone
execute as @s at @s if score @s Ranber = @s WestBlocked run scoreboard players add @s RoomSuccess 1

execute as @s at @s if score @s Ranber = @s WestBlocked at @s positioned ~-12 ~ ~ run summon marker ~ ~ ~ {Tags:["roomgen","chain","active"]}
execute as @s at @s if score @s Ranber = @s WestBlocked at @s positioned ~-12 ~ ~ run execute as @e[type=marker,tag=roomgen,tag=chain,limit=1,sort=nearest] at @s run function mc_rouge:roomgen/chain

