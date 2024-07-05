Fast Distance Calculating with Trigonometry
====================
## Info
The way we can integrate the 2D method into 3D is through a similar process. First, draw a triangle on the ground; this acts as our dx and dz. Now draw a height on the hypotenuse of the triangle. The newly drawn side and the hypotenuse should form another triangle. The hypotenuse of the new triangle should be our distance. In the picture below, $e$ would be the distance from point 1 to point 2. Therefore, we can say that $dy \over sin(θ)$ would be equivalent to $e$. So our only job is to find θ and sin(θ) efficiently. To find θ, we can make use of `facing` in execute. Let a marker face (-dx,-dy,dz) from the origin and teleport it. Then it's y_rotation or Rotation[1] in their nbt will become θ. Since the range of θ can only be 0°~90°, we can create a sine table for it. Meanwhile, because multiplication is much faster than division, we turn the formula $dy \over sin(θ)$ into $dy * {1 \over sin(θ)}$.

![triangle](https://github.com/SuperSwordTW/Distance-Trig-Calc-3d/assets/63050705/78ce86d3-4ec3-463d-af5f-c255d9a01402)

## Efficiency

The efficiency of this method is fairly good; it's tested to be faster than other known methods by quite a bit—for example, the entity display method and 4th-iteration Newton rasphon.
Benchmarking on my computer gives the result that Trig method averages around 22 μs, the entity display averages around 39μs, and Newton rasphon averages around 36μs

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
***dx***, ***dy*** and ***dz*** value must be ***Positive***
```
function distance:start
scoreboard players get .out distance
```
This will give you the result distance with 3-decimal place accuracy.

## Accuracy
$1/sin$ values are saved in a few digits. Therefore, if the inputs are substantial, the results would be slightly inaccurate, but mostly in the third decimal place.
Overall, some minor errors shouldn't affect its usage.
