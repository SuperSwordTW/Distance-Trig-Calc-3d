Fast 2D Distance Calculating with Trigonometry
====================
## Info
When calculating a distance between two points, we usually use the Pythagorean theorem. $\sqrt{a^2+b^2}=c$.
But squaring in Minecraft can cause some problems, especially when we are scaling things up
Because it can easily run out of scoreboard space, which is an integer (2147483647).
Instead of relying on the Pythagorean theorem, we can use Trigonometry to solve the problem.

Draw a right triangle with two points. The two sides are labeled $a,b$ and the hypotenuse is $c$. Then $tan^-1({a \over b})$ represents $θ$. Since $sin(θ)$= $a \over c$.
So, $a \over {sin(tan^-1({a \over b}))}$ would equal $c$.

Now that we have the formula, we need to calculate it in Minecraft.

$sine$ can be calculated in a few ways. Such as by using a marker at the origin (0,0,0) and setting its rotation, then tp it ^ ^ ^1, so the opposite side length is divided by 1 (hypotenuse)
would result in a sin value. Although, as you can see, maneuvering markers is not efficient. Instead, we can observe the domain, which is 0°~90°. Therefore, we can just create a table for every angle that would be needed. With 2 decimal places of accuracy, it's a 9000-element table.

With some observation on the $tan^-1$, or inverse tangent function, we see that as the value passes around 60, the result is just approaching 90 deg. So we just assume it is 90 degrees.
Hence, using the same logic, we can create a table for it.

And why stop here, we can create a table that maps values to $1/sin(tan^-1(x))$. Now to get our distance, we only need to multiply $a$ which is the side length to this value.

## Efficiency

The efficiency of this method is fairly good; it's tested to be faster than the entity display method and 4th-iteration Newton rasphon by quite a bit.

`Note that this is only for 2D distance; using this method, you can calculate 3D distance as well, but the efficiency would drop a bit. It is almost the same as the entity display method.
So if you plan on calculating 3D distance, use the entity display method. `

## Implementation
Note that this pack is made in 1.21, so the naming convention of the folder `functions` has become `function`. If you want to use this in 1.20, you can change it back.

Install the datapack into the corresponding folder.
`distance:load` function is required to place it in load, or you can manually run it once in the game.
```
scoreboard players set .dx distance [value]
scoreboard players set .dz distance [value]
```
Set the changes in x and z on the scoreboard.
***dx*** and ***dz*** value must be ***Positive***
```
function distance:start
scoreboard players get .out distance
```
This will give you the result distance with 3-decimal place accuracy.

## Accuracy
$1/sin(tan^-1)$ values are saved in a few digits. Therefore, if the inputs are substantial, the results would be inaccurate, but mostly in the third decimal place.
Overall, some minor errors shouldn't affect its usage.
