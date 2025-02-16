execute if score .dy distance < .dx distance run scoreboard players operation .dy distance >< .dx distance
execute if score .dy distance < .dx distance run scoreboard players operation .dy distance >< .dz distance
execute as 0-0-0-0-1 run function distance:tp
execute store result storage input y int 1000 run scoreboard players get .dy distance
function distance:math/sine with storage input