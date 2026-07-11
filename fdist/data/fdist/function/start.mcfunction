execute if score #dy distance < #dx distance run scoreboard players operation #dy distance >< #dx distance
execute if score #dy distance < #dz distance run scoreboard players operation #dy distance >< #dz distance

execute store result storage fdistance x double 1 run scoreboard players get #dx distance

execute store result storage fdistance y double 1 store result storage input y double 10000 run scoreboard players get #dy distance

execute store result storage fdistance z double 1 run scoreboard players get #dz distance

execute as 26fb7c75-b19f-428a-b544-3f17c080b3cb run function fdist:angle with storage fdistance

execute store result score #out distance run function fdist:sine with storage input
