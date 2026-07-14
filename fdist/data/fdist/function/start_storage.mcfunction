
execute store result storage input y double 1 run data get storage fdistance y 10000

execute as 26fb7c75-b19f-428a-b544-3f17c080b3cb positioned 0.0 0.0 0.0 run function fdist:angle with storage fdistance

execute store result storage fdistance out double 0.0001 run function fdist:sine with storage input
