
execute store result storage distance pos[0] double 1 run scoreboard players get .dx distance
execute store result storage distance pos[0] double 1 run scoreboard players get .dy distance
execute store result storage distance pos[0] double 1 run scoreboard players get .dz distance
data modify entity @s Pos set from storage distance pos

execute at @s facing 0.0 0.0 0.0 run tp @s 0 0 0 0 ~
execute store result storage input t int 1 run data get entity @s Rotation[1] 100
