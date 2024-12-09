scoreboard players add World Floor 1

scoreboard players set Floor RoomCount 1 
scoreboard players operation @s RoomID = Floor RoomCount

scoreboard players set @s RoomSuccess 0

execute if score World Floor matches 1 run scoreboard players set Floor MaxFloorSize 10
execute if score World Floor matches 2 run scoreboard players set Floor MaxFloorSize 12
execute if score World Floor matches 3 run scoreboard players set Floor MaxFloorSize 14
execute if score World Floor matches 4 run scoreboard players set Floor MaxFloorSize 16
execute if score World Floor matches 5 run scoreboard players set Floor MaxFloorSize 18
execute if score World Floor matches 6.. run scoreboard players set Floor MaxFloorSize 20

execute if score World Floor matches 1 run scoreboard players set Floor MinFloorSize 5
execute if score World Floor matches 2 run scoreboard players set Floor MinFloorSize 7
execute if score World Floor matches 3 run scoreboard players set Floor MinFloorSize 9
execute if score World Floor matches 4 run scoreboard players set Floor MinFloorSize 11
execute if score World Floor matches 5 run scoreboard players set Floor MinFloorSize 13
execute if score World Floor matches 6.. run scoreboard players set Floor MinFloorSize 15

# Generate Room

fill ~6 ~3 ~6 ~-6 ~3 ~-6 barrier
fill ~6 ~-1 ~6 ~-6 ~-1 ~-6 stone
fill ~6 ~ ~6 ~6 ~2 ~-6 stone
fill ~6 ~ ~6 ~-6 ~2 ~6 stone
fill ~6 ~ ~-6 ~-6 ~2 ~-6 stone
fill ~-6 ~ ~-6 ~-6 ~2 ~6 stone
fill ~ ~-1 ~ ~ ~-1 ~ obsidian

# Run RNG checks for doors to generate on each wall

scoreboard players set @s RanberRange 2
function mc_rouge:ranber
execute as @s[scores={Ranber=1}] at @s run fill ~-1 ~ ~6 ~1 ~2 ~6 structure_void
execute as @s[scores={Ranber=1}] at @s run fill ~-1 ~3 ~6 ~1 ~3 ~6 stone
execute as @s[scores={Ranber=1}] at @s run scoreboard players add @s RoomSuccess 1

execute as @s[scores={Ranber=1}] at @s positioned ~ ~ ~12 run summon marker ~ ~ ~ {Tags:["roomgen","chain","active"]}
execute as @s[scores={Ranber=1}] at @s positioned ~ ~ ~12 run execute as @e[type=marker,tag=roomgen,tag=chain,limit=1,sort=nearest] at @s run function mc_rouge:roomgen/chain


scoreboard players set @s RanberRange 2
function mc_rouge:ranber
execute as @s[scores={Ranber=1}] at @s run fill ~-1 ~ ~-6 ~1 ~2 ~-6 structure_void
execute as @s[scores={Ranber=1}] at @s run fill ~-1 ~3 ~-6 ~1 ~3 ~-6 stone
execute as @s[scores={Ranber=1}] at @s run scoreboard players add @s RoomSuccess 1

execute as @s[scores={Ranber=1}] at @s positioned ~ ~ ~-12 run summon marker ~ ~ ~ {Tags:["roomgen","chain","active"]}
execute as @s[scores={Ranber=1}] at @s positioned ~ ~ ~-12 run execute as @e[type=marker,tag=roomgen,tag=chain,limit=1,sort=nearest] at @s run function mc_rouge:roomgen/chain


scoreboard players set @s RanberRange 2
function mc_rouge:ranber
execute as @s[scores={Ranber=1}] at @s run fill ~6 ~ ~1 ~6 ~2 ~-1 structure_void
execute as @s[scores={Ranber=1}] at @s run fill ~6 ~3 ~-1 ~6 ~3 ~1 stone
execute as @s[scores={Ranber=1}] at @s run scoreboard players add @s RoomSuccess 1

execute as @s[scores={Ranber=1}] at @s positioned ~12 ~ ~ run summon marker ~ ~ ~ {Tags:["roomgen","chain","active"]}
execute as @s[scores={Ranber=1}] at @s positioned ~12 ~ ~ run execute as @e[type=marker,tag=roomgen,tag=chain,limit=1,sort=nearest] at @s run function mc_rouge:roomgen/chain


scoreboard players set @s RanberRange 2
function mc_rouge:ranber
execute as @s[scores={Ranber=1}] at @s run fill ~-6 ~ ~-1 ~-6 ~2 ~1 structure_void
execute as @s[scores={Ranber=1}] at @s run fill ~-6 ~3 ~1 ~-6 ~3 ~-1 stone
execute as @s[scores={Ranber=1}] at @s run scoreboard players add @s RoomSuccess 1

execute as @s[scores={Ranber=1}] at @s positioned ~-12 ~ ~ run summon marker ~ ~ ~ {Tags:["roomgen","chain","active"]}
execute as @s[scores={Ranber=1}] at @s positioned ~-12 ~ ~ run execute as @e[type=marker,tag=roomgen,tag=chain,limit=1,sort=nearest] at @s run function mc_rouge:roomgen/chain

# If RNG checks to generate doors fails on all walls, force a door to generate on a random wall

execute if score @s RoomSuccess matches ..0 run function mc_rouge:roomgen/forcegen/start

tag @s remove active