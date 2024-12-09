tellraw @a {"text":"Thanks for downloading my datapack!", "color":"yellow", "italic":false, "bold": true}

gamerule keepInventory true
gamerule doMobSpawning false
gamerule mobGriefing false

scoreboard objectives add Ranber dummy
scoreboard objectives add RanberRange dummy

scoreboard objectives add Floor dummy
scoreboard players set World Floor 0
scoreboard objectives add MaxFloorSize dummy
scoreboard objectives add MinFloorSize dummy

scoreboard objectives add RoomCount dummy
scoreboard objectives add RoomSuccess dummy
scoreboard objectives add RoomID dummy

scoreboard objectives add Obstructed dummy
scoreboard objectives add EastBlocked dummy
scoreboard objectives add WestBlocked dummy
scoreboard objectives add NorthBlocked dummy
scoreboard objectives add SouthBlocked dummy