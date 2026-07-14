$execute run rotate @s facing ~$(x) ~$(y) ~$(z)
execute store result storage input t int 1 run data get entity @s Rotation[1] 1000