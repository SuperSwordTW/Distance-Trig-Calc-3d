execute if score .dy distance matches 0 run scoreboard players operation .dy distance >< .dx distance
execute if score .dy distance matches 0 run scoreboard players operation .dy distance >< .dz distance
execute store result storage input x int 1 run scoreboard players get .dx distance
execute store result storage input y int 1 run scoreboard players get .dy distance
execute store result storage input z int 1 run scoreboard players get .dz distance
function distance:trig with storage input
