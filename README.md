Fast Distance Calculating with Trigonometry
====================
## Info
The way we can integrate the 2D method into 3D is through a similar process. First, draw a triangle on the ground; this acts as our dx and dz. Now draw a height on the hypotenuse of the triangle. The newly drawn side and the hypotenuse should form another triangle. The hypotenuse of the new triangle should be our distance. In the picture below, $e$ would be the distance from point 1 to point 2. Therefore, we can say that $dy \over sin(θ)$ would be equivalent to $e$. So our only job is to find θ and sin(θ) efficiently. To find θ, we can make use of `facing` in execute. Let a marker face (-dx,-dy,dz) from the origin and teleport it. Then it's y_rotation or Rotation[1] in their nbt will become θ. Since the range of θ can only be 0°~90°, we can create a sine table for it. Meanwhile, because multiplication is much faster than division, we turn the formula $dy \over sin(θ)$ into $dy * {1 \over sin(θ)}$, creating a table of reciprocal of sine instead.

![triangle](https://github.com/SuperSwordTW/Distance-Trig-Calc-3d/assets/63050705/78ce86d3-4ec3-463d-af5f-c255d9a01402)

## Efficiency

The efficiency of this method is fairly good; it's tested to be faster than other known methods by quite a bit—for example, the entity display method.
Meanwhile, the efficiency of this method is eqivilent to using a 6th-iteration Newton-Raphson.
Benchmarking on my computer gives the result that Trig method averages around 61 μs, the entity display averages around 89μs, and Newton rasphon averages around 60μs

Also, if you are intended to calculate 2D distance, you can use the 2D version of this pack, it performs even better! [Distance-Trig-Calc-2d](https://github.com/SuperSwordTW/Distance-Trig-Calc-2d)

## Implementation
Note that this pack is made in 1.21, so the naming convention of the folder `functions` has become `function`. If you want to use this in 1.20, you can change it back.

The pack uses the UUID 0-0-0-0-1. So beware of conflicts if your other pack also uses that UUID.

Install the datapack into the corresponding folder.
`distance:load` function is required to place it in load, or you can manually run it once in the game.
```
scoreboard players set .dx distance [value]
scoreboard players set .dy distance [value]
scoreboard players set .dz distance [value]
```
Set the changes in x,y,z on the scoreboard.
`The input dx dy dz don't need to be scaled, just natural numbers would be fine.`
***dx***, ***dy*** and ***dz*** value must be ***Positive***
```
function distance:start
scoreboard players get .out distance
```
This will give you the result distance with 3-decimal place accuracy.
`This means if the output is 20.153 then the score on .out would be 20153`

## Accuracy
$1/sin$ values are saved in a few digits. Therefore, if the inputs are substantial, the results would be slightly inaccurate, but mostly in the third decimal place.
Overall, some minor errors shouldn't affect its usage.
