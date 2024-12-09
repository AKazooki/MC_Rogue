# Increment Room Count

scoreboard players add Floor RoomCount 1 
scoreboard players operation @s RoomID = Floor RoomCount

# Generate Room

fill ~6 ~3 ~6 ~-6 ~3 ~-6 barrier replace air
fill ~6 ~-1 ~6 ~-6 ~-1 ~-6 stone replace air
fill ~6 ~ ~6 ~6 ~2 ~-6 stone replace air
fill ~6 ~ ~6 ~-6 ~2 ~6 stone replace air
fill ~6 ~ ~-6 ~-6 ~2 ~-6 stone replace air
fill ~-6 ~ ~-6 ~-6 ~2 ~6 stone replace air

# Check for walls with already generated rooms behind them

scoreboard players set @s Obstructed 0
scoreboard players set @s WestBlocked 0
scoreboard players set @s EastBlocked 0
scoreboard players set @s NorthBlocked 0
scoreboard players set @s SouthBlocked 0

execute as @s at @s positioned ~ ~ ~12 if entity @e[type=marker,tag=roomgen,distance=..1] run scoreboard players add @s Obstructed 1
execute as @s at @s positioned ~ ~ ~12 if entity @e[type=marker,tag=roomgen,distance=..1] run scoreboard players operation @s SouthBlocked = @s Obstructed

execute as @s at @s positioned ~ ~ ~-12 if entity @e[type=marker,tag=roomgen,distance=..1] run scoreboard players add @s Obstructed 1
execute as @s at @s positioned ~ ~ ~-12 if entity @e[type=marker,tag=roomgen,distance=..1] run scoreboard players operation @s NorthBlocked = @s Obstructed

execute as @s at @s positioned ~12 ~ ~ if entity @e[type=marker,tag=roomgen,distance=..1] run scoreboard players add @s Obstructed 1
execute as @s at @s positioned ~12 ~ ~ if entity @e[type=marker,tag=roomgen,distance=..1] run scoreboard players operation @s EastBlocked = @s Obstructed

execute as @s at @s positioned ~-12 ~ ~ if entity @e[type=marker,tag=roomgen,distance=..1] run scoreboard players add @s Obstructed 1
execute as @s at @s positioned ~-12 ~ ~ if entity @e[type=marker,tag=roomgen,distance=..1] run scoreboard players operation @s WestBlocked = @s Obstructed

# Force at least one door to generate between blocked off rooms

execute as @s[scores={Obstructed=1..}] at @s run function mc_rouge:roomgen/forcegen/wall

# Run RNG checks for doors to generate on every other wall.

scoreboard players set @s RanberRange 2
function mc_rouge:ranber
execute as @s[scores={Ranber=1,SouthBlocked=..0}] at @s if score Floor RoomCount < Floor MaxFloorSize run fill ~-1 ~ ~6 ~1 ~2 ~6 structure_void
execute as @s[scores={Ranber=1,SouthBlocked=..0}] at @s if score Floor RoomCount < Floor MaxFloorSize run fill ~-1 ~3 ~6 ~1 ~3 ~6 stone
execute as @s[scores={Ranber=1,SouthBlocked=..0}] if score Floor RoomCount < Floor MaxFloorSize run scoreboard players add @s RoomSuccess 1

execute as @s[scores={Ranber=1,SouthBlocked=..0}] at @s positioned ~ ~ ~12 if score Floor RoomCount < Floor MaxFloorSize run summon marker ~ ~ ~ {Tags:["roomgen","chain","active"]}
execute as @s[scores={Ranber=1,SouthBlocked=..0}] at @s positioned ~ ~ ~12 if score Floor RoomCount < Floor MaxFloorSize run execute as @e[type=marker,tag=roomgen,tag=chain,limit=1,sort=nearest] at @s run function mc_rouge:roomgen/chain


scoreboard players set @s RanberRange 2
function mc_rouge:ranber
execute as @s[scores={Ranber=1,NorthBlocked=..0}] at @s if score Floor RoomCount < Floor MaxFloorSize run fill ~-1 ~ ~-6 ~1 ~2 ~-6 structure_void
execute as @s[scores={Ranber=1,NorthBlocked=..0}] at @s if score Floor RoomCount < Floor MaxFloorSize run fill ~-1 ~3 ~-6 ~1 ~3 ~-6 stone
execute as @s[scores={Ranber=1,NorthBlocked=..0}] if score Floor RoomCount < Floor MaxFloorSize run scoreboard players add @s RoomSuccess 1

execute as @s[scores={Ranber=1,NorthBlocked=..0}] at @s positioned ~ ~ ~-12 if score Floor RoomCount < Floor MaxFloorSize run summon marker ~ ~ ~ {Tags:["roomgen","chain","active"]}
execute as @s[scores={Ranber=1,NorthBlocked=..0}] at @s positioned ~ ~ ~-12 if score Floor RoomCount < Floor MaxFloorSize run execute as @e[type=marker,tag=roomgen,tag=chain,limit=1,sort=nearest] at @s run function mc_rouge:roomgen/chain


scoreboard players set @s RanberRange 2
function mc_rouge:ranber
execute as @s[scores={Ranber=1,EastBlocked=..0}] at @s if score Floor RoomCount < Floor MaxFloorSize run fill ~6 ~ ~1 ~6 ~2 ~-1 structure_void
execute as @s[scores={Ranber=1,EastBlocked=..0}] at @s if score Floor RoomCount < Floor MaxFloorSize run fill ~6 ~3 ~-1 ~6 ~3 ~1 stone
execute as @s[scores={Ranber=1,EastBlocked=..0}] if score Floor RoomCount < Floor MaxFloorSize run scoreboard players add @s RoomSuccess 1

execute as @s[scores={Ranber=1,EastBlocked=..0}] at @s positioned ~12 ~ ~ if score Floor RoomCount < Floor MaxFloorSize run summon marker ~ ~ ~ {Tags:["roomgen","chain","active"]}
execute as @s[scores={Ranber=1,EastBlocked=..0}] at @s positioned ~12 ~ ~ if score Floor RoomCount < Floor MaxFloorSize run execute as @e[type=marker,tag=roomgen,tag=chain,limit=1,sort=nearest] at @s run function mc_rouge:roomgen/chain


scoreboard players set @s RanberRange 2
function mc_rouge:ranber
execute as @s[scores={Ranber=1,WestBlocked=..0}] at @s if score Floor RoomCount < Floor MaxFloorSize run fill ~-6 ~ ~-1 ~-6 ~2 ~1 structure_void
execute as @s[scores={Ranber=1,WestBlocked=..0}] at @s if score Floor RoomCount < Floor MaxFloorSize run fill ~-6 ~3 ~1 ~-6 ~3 ~-1 stone
execute as @s[scores={Ranber=1,WestBlocked=..0}] if score Floor RoomCount < Floor MaxFloorSize run scoreboard players add @s RoomSuccess 1

execute as @s[scores={Ranber=1,WestBlocked=..0}] at @s positioned ~-12 ~ ~ if score Floor RoomCount < Floor MaxFloorSize run summon marker ~ ~ ~ {Tags:["roomgen","chain","active"]}
execute as @s[scores={Ranber=1,WestBlocked=..0}] at @s positioned ~-12 ~ ~ if score Floor RoomCount < Floor MaxFloorSize run execute as @e[type=marker,tag=roomgen,tag=chain,limit=1,sort=nearest] at @s run function mc_rouge:roomgen/chain

# Forces a Door to generate from the remaining walls if all other generation fails and the floor hasn't reached its minimum size yet

tag @s remove active