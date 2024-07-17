execute store result entity @s Pos[0] double 1 run scoreboard players get .dx distance
execute store result entity @s Pos[1] double 1 run scoreboard players get .dy distance
execute store result entity @s Pos[2] double 1 run scoreboard players get .dz distance
execute at @s facing 0.0 0.0 0.0 run tp @s 0 0 0 0 ~
execute store result storage input x int 1 run data get entity @s Rotation[1] 100
