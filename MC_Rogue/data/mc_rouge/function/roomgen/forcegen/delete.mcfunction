fill ~6 ~3 ~6 ~-6 ~3 ~-6 barrier
fill ~6 ~-1 ~6 ~-6 ~-1 ~-6 stone
fill ~6 ~ ~6 ~6 ~2 ~-6 stone
fill ~6 ~ ~6 ~-6 ~2 ~6 stone
fill ~6 ~ ~-6 ~-6 ~2 ~-6 stone
fill ~-6 ~ ~-6 ~-6 ~2 ~6 stone

fill ~5 ~3 ~5 ~-5 ~-1 ~-5 air


scoreboard players set @s WestBlocked 0
scoreboard players set @s EastBlocked 0
scoreboard players set @s NorthBlocked 0
scoreboard players set @s SouthBlocked 0

# Detect which walls are NOT obstructed. The Blocked scoreboards are being used for the inverse of what they're named lol.

execute as @s at @s positioned ~ ~ ~12 unless entity @e[type=marker,tag=roomgen,distance=..1] run scoreboard players set @s SouthBlocked 1
execute as @s at @s positioned ~ ~ ~-12 unless entity @e[type=marker,tag=roomgen,distance=..1] run scoreboard players set @s NorthBlocked 1
execute as @s at @s positioned ~12 ~ ~ unless entity @e[type=marker,tag=roomgen,distance=..1] run scoreboard players set @s EastBlocked 1
execute as @s at @s positioned ~-12 ~ ~ unless entity @e[type=marker,tag=roomgen,distance=..1] run scoreboard players set @s WestBlocked 1

execute as @s[scores={NorthBlocked=1..}] at @s run fill ~6 ~-1 ~-6 ~-6 ~2 ~-6 air
execute as @s[scores={SouthBlocked=1..}] at @s run fill ~6 ~-1 ~6 ~-6 ~2 ~6 air
execute as @s[scores={EastBlocked=1..}] at @s run fill ~6 ~-1 ~6 ~6 ~2 ~-6 air
execute as @s[scores={WestBlocked=1..}] at @s run fill ~-6 ~-1 ~-6 ~-6 ~2 ~6 air

# Detect which walls ARE obstructed. This is just meant for cleanup to make the deletion look as seamless as possible.

scoreboard players set @s WestBlocked 0
scoreboard players set @s EastBlocked 0
scoreboard players set @s NorthBlocked 0
scoreboard players set @s SouthBlocked 0

execute as @s at @s positioned ~ ~ ~12 if entity @e[type=marker,tag=roomgen,distance=..1] run scoreboard players set @s SouthBlocked 1
execute as @s at @s positioned ~ ~ ~-12 if entity @e[type=marker,tag=roomgen,distance=..1] run scoreboard players set @s NorthBlocked 1
execute as @s at @s positioned ~12 ~ ~ if entity @e[type=marker,tag=roomgen,distance=..1] run scoreboard players set @s EastBlocked 1
execute as @s at @s positioned ~-12 ~ ~ if entity @e[type=marker,tag=roomgen,distance=..1] run scoreboard players set @s WestBlocked 1

execute as @s[scores={NorthBlocked=1..}] at @s run fill ~6 ~-1 ~-6 ~-6 ~2 ~-6 stone
execute as @s[scores={SouthBlocked=1..}] at @s run fill ~6 ~-1 ~6 ~-6 ~2 ~6 stone
execute as @s[scores={EastBlocked=1..}] at @s run fill ~6 ~-1 ~6 ~6 ~2 ~-6 stone
execute as @s[scores={WestBlocked=1..}] at @s run fill ~-6 ~-1 ~-6 ~-6 ~2 ~6 stone


scoreboard players remove Floor RoomCount 1
kill @s