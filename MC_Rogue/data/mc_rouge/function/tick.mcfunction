# Check if more rooms generated than were supposed to for this floor

execute unless entity @e[type=marker,tag=active] as @e[type=marker,tag=roomgen,tag=chain] at @s if score @s RoomID > Floor MaxFloorSize run function mc_rouge:roomgen/forcegen/delete

# Check if not enough rooms were generated this floor

execute unless entity @e[type=marker,tag=active] if score Floor RoomCount < Floor MinFloorSize run execute as @e[type=marker,tag=roomgen,tag=chain] at @s run execute if score @s RoomID = Floor RoomCount run function mc_rouge:roomgen/forcegen/chain