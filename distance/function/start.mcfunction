execute store result score #dx distance run random value 0..1000
execute store result score #dy distance run random value 0..1000
execute store result score #dz distance run random value 0..1000

execute if score #dy distance < #dx distance run scoreboard players operation #dy distance >< #dx distance
execute if score #dy distance < #dz distance run scoreboard players operation #dy distance >< #dz distance

execute store result storage distance pos[0] double 0.0000000001 run scoreboard players get #dx distance

execute store result storage distance pos[1] double 0.0000000001 store result storage input y double 10 run scoreboard players get #dy distance

execute store result storage distance pos[2] double 0.0000000001 run scoreboard players get #dz distance

data modify entity 0-0-0-0-2 Pos set from storage distance pos

rotate 0-0-0-0-2 facing 0.0 0.0 0.0

execute store result storage input t int 1 run data get entity 0-0-0-0-2 Rotation[1] 1000

execute store result score #out distance run function distance:math/sine with storage input
