summon marker ~ ~ ~ {Tags:["ranber"]}
execute store result score @s Ranber run data get entity @e[type=marker,tag=ranber,limit=1] UUID[0]
scoreboard players operation @s Ranber %= @s RanberRange
kill @e[type=marker,tag=ranber]
scoreboard players add @s Ranber 1