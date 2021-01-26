# Computational-Mathematics-Resources
I created these resources while I was studying for the computational mathematics course at the University of Pisa

## Generate the level set of a 2D dimensional function

Once you have opened the Julia interactive command-line, include graphics.jl that contains the level_set function. Level_set has 1 required parameter and then several optional ones:
* **fun** is the function you want to generate the level set of. Some examples are in quadratic_function. 
* **level_center** is a 2-dimensional array that points to the center of the image.
* **rangeX** and **rangeY** determines the width and the height of the image.
* **number_of_levels** indicates the number of levels that will be generated.
* The image will have colored level sets if **color_level** is true. Otherwise, the image will contain only lines.

For instance: 
```
  include("graphics.jl")
  include("quadratic_function.jl")
  p = level_set(not_positive_definite);
  plot(p)
```
