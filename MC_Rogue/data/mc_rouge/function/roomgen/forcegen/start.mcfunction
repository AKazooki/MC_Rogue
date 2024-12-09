scoreboard players set @s RanberRange 4
function mc_rouge:ranber

execute as @s[scores={Ranber=1}] at @s run fill ~-1 ~ ~6 ~1 ~2 ~6 structure_void
execute as @s[scores={Ranber=1}] at @s run fill ~-1 ~3 ~6 ~1 ~3 ~6 stone

execute as @s[scores={Ranber=1}] at @s positioned ~ ~ ~12 run summon marker ~ ~ ~ {Tags:["roomgen","chain","active"]}
execute as @s[scores={Ranber=1}] at @s positioned ~ ~ ~12 run execute as @e[type=marker,tag=roomgen,tag=chain,limit=1,sort=nearest] at @s run function mc_rouge:roomgen/chain


execute as @s[scores={Ranber=2}] at @s run fill ~-1 ~ ~-6 ~1 ~2 ~-6 structure_void
execute as @s[scores={Ranber=2}] at @s run fill ~-1 ~3 ~-6 ~1 ~3 ~-6 stone

execute as @s[scores={Ranber=2}] at @s positioned ~ ~ ~-12 run summon marker ~ ~ ~ {Tags:["roomgen","chain","active"]}
execute as @s[scores={Ranber=2}] at @s positioned ~ ~ ~-12 run execute as @e[type=marker,tag=roomgen,tag=chain,limit=1,sort=nearest] at @s run function mc_rouge:roomgen/chain


execute as @s[scores={Ranber=3}] at @s run fill ~6 ~ ~1 ~6 ~2 ~-1 structure_void
execute as @s[scores={Ranber=3}] at @s run fill ~6 ~3 ~-1 ~6 ~3 ~1 stone

execute as @s[scores={Ranber=3}] at @s positioned ~12 ~ ~ run summon marker ~ ~ ~ {Tags:["roomgen","chain","active"]}
execute as @s[scores={Ranber=3}] at @s positioned ~112 ~ ~ run execute as @e[type=marker,tag=roomgen,tag=chain,limit=1,sort=nearest] at @s run function mc_rouge:roomgen/chain


execute as @s[scores={Ranber=4}] at @s run fill ~-6 ~ ~-1 ~-6 ~2 ~1 structure_void
execute as @s[scores={Ranber=4}] at @s run fill ~-6 ~3 ~1 ~-6 ~3 ~-1 stone

execute as @s[scores={Ranber=4}] at @s positioned ~-12 ~ ~ run summon marker ~ ~ ~ {Tags:["roomgen","chain","active"]}
execute as @s[scores={Ranber=4}] at @s positioned ~-12 ~ ~ run execute as @e[type=marker,tag=roomgen,tag=chain,limit=1,sort=nearest] at @s run function mc_rouge:roomgen/chain
