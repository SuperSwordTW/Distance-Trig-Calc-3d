$execute positioned 0.5 0.0 0.5 facing -$(x) -$(y) $(z) run tp 0-0-0-0-1 ~ ~ ~ ~ ~
execute store result storage input t int 1 run data get entity 0-0-0-0-1 Rotation[1] 100
function distance:math/sine with storage input
scoreboard players operation .out distance *= .dy distance
