

summon marker 0 200 0 {Tags:["start","roomgen","active"]}
execute as @e[type=marker,tag=start] at @s run function mc_rouge:roomgen/start
