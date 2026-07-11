Fast Distance Calculating with Trigonometry
====================

## How to use
Note that this pack is made in 1.21, so the naming convention of the folder `functions` has become `function`. If you want to use this in 1.20, you can change it back.

The pack uses the UUID 26fb7c75-b19f-428a-b544-3f17c080b3cb. So beware of conflicts if your other pack also uses that UUID.

Calculates $sqrt(dx^2 + dy^2 + dz^2)$

Install the datapack into the corresponding folder.
1. Input is from scoreboard
```
scoreboard players set #dx distance 1
scoreboard players set #dy distance 1
scoreboard players set #dz distance 1
# ***dx***, ***dy*** and ***dz*** must be ***Positive***

function fdist:start
scoreboard players get #out distance
```
2. Input is from storage
```
data modify storage minecraft:fdistance x set value 13.12d
data modify storage minecraft:fdistance y set value 13.12d
data modify storage minecraft:fdistance z set value 13.12d
# ***x***, ***y*** and ***z*** must be ***Positive***

function fdist:start_storage
data get storage minecraft:fdistance out
```


The result will be in 4 decimal places.

If you want to change the number of decimal places, you can do it as follows.
Inside, `start.mcfunction` or `start_storage.mcfunction`
```
data get storage fdistance y 10000
```
Change the scale of y
A scale of $10^n$ will result in n decimal places.


## Info
The way we can integrate the 2D method into 3D is through a similar process. First, draw a triangle on the ground; this acts as our dx and dz. Now draw a height on the hypotenuse of the triangle. The newly drawn side and the hypotenuse should form another triangle. The hypotenuse of the new triangle should be our distance. In the picture below, $e$ would be the distance from point 1 to point 2. Therefore, we can say that $dy \over sin(θ)$ would be equivalent to $e$. So our only job is to find θ and sin(θ) efficiently. To find θ, we can make use of `facing` in execute. Let a marker positioned at t(dx,dy,dz), t is an infinitesimal number, and face the origin and rotate it. Then it's y_rotation or Rotation[1] in their nbt will become θ. Since the range of θ can only be 0°~90°, we can create a sine table for it. Meanwhile, because multiplication is much faster than division, we turn the formula $dy \over sin(θ)$ into $dy * {1 \over sin(θ)}$, creating a table of the reciprocal of sine instead.

![triangle](https://github.com/SuperSwordTW/Distance-Trig-Calc-3d/assets/63050705/78ce86d3-4ec3-463d-af5f-c255d9a01402)

## Efficiency

The efficiency of this method is fairly good; it's tested to be faster than other known methods by quite a bit—for example, the entity display method.
Meanwhile, the efficiency of this method is equivalent to using a 6th-iteration Newton-Raphson, yet this method yields greater accuracy.
Benchmarking on my computer gives the relative result that Trig method averages around 61 μs, the entity display averages around 65μs, and Newton rasphon averages around 60μs

This method is faster than the item display method, the 6th-iteration Newton-Raphson.
Below is the benchmark result:
| Method    | Result |
| -------- | ------- |
| `trig`  |  0.00918ms   |
|`item display`|0.01056ms|
|`Newton-Raphson`|

## Accuracy
With the optimized and refined angle calculation, the deviation in the previous version caused by the marker's rotation is now reduced, making the method even more precise.
Below is an actual measurement:
Calculating $sqrt(1^2 + 36991^2 + 21474^2)$
| Method    | Result |
| -------- | ------- |
| Calculator  | 42772.266224    |
| Before Optimization | 42772.6976     |
| Item Display    | 42772.2656    |
| After Optimization | 42772.2680 |
