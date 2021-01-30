# Computational-Mathematics-Resources
I created these resources while I was studying for the computational mathematics course at the University of Pisa

## Generate the level sets of a 2-dimensional function

Once you have opened the Julia interactive command-line, include graphics.jl that contains the level_set function. Level_set has 1 required parameter and then several optional ones:
* **fun** is the function you want to generate the level set of. Some examples are in quadratic_function. 
* **level_center** is a 2-dimensional array that points to the center of the image.
* **rangeX** and **rangeY** determines the width and the height of the image.
* **number_of_levels** indicates the number of levels that will be generated.
* The image will have colored level sets if **color_level** is true. Otherwise, the image will contain only lines.

For instance: 
``` julia
  include("graphics.jl")
  include("quadratic_function.jl")
  p = level_set(not_positive_definite);
  plot(p)
```
And you will get this image:

![level set of a non positive quadratic function](https://github.com/WilliamSimoni/Computational-Mathematics-Resources/blob/main/images/non_positive_definite_plot.png?raw=true)

Of course, you can define your own function. The only thing that matter is that it must have two inputs: 
``` julia
  fun(x,y) = cos(x) + sin(y)^2 + cos(x)^3 + sin(y)^4;
  p = level_set(fun);
  plot(p)
```

The level sets of this thing are these:

![level set of function cos(x) + sin(y)^2 + cos(x)^3 + sin(y)^4](https://github.com/WilliamSimoni/Computational-Mathematics-Resources/blob/main/images/custom_function_plot.png?raw=true)

## Use Steep Descent Algorithm (SDM)

The SDM method implementation is included in the SDM.jl file. So, once you have opened the Julia interactive command-line, exec the following commands:

``` julia
  include("SDM.jl");
  using .SDM
```

You can now call the sdm function that has the following arguments:
* **fun** is the function (of two arguments) you want to find the minimum of.
* **fun_derivative** is the derivative of **fun**.
* **starting_point** is the point from which the algorithm will start. 
* **step_size_params** is a dictionary object in which you define how the algorithm is going determining the step size. 
* **epsilon** is a number. When the norm of the gradient becomes smaller than **epsilon**, the algorithm stops.
* **display_g** is an optional boolean parameter. If true the algorithm will print the steps. (Defaults to true)

This seems a mess. So let us try to define everything we need to apply this algorithm. First thing first, we need to define a function and its derivative (some examples are in quadratic_function.jl). In this example, will we define the Rosenbrock function (with a = 1 and b = 100):

``` julia
  f(x,y) = (1-x)^2 + 100(y-x^2)^2;
  f_derivative(x,y) = [
       2 * (200x^3 - 200x*y + x - 1)
       200 * (y - x^2)
  ];
```

The step_size_params templates are defined in step_size_methods. As you will notice, every method type has its own name and properties. For instance, we could choose the constant method and we set the step_size to 0.2 (defaults to 0.1):

``` julia
  include("step_size_methods.jl")
  constant["step_size"] = 0.001
```

We can finally execute the method setting the starting_point to [-1,1], epsilon to 1 and display_g=false:
``` julia
  x = sdm(f, f_derivative, [1,-1], constant, 1, display_g=false)
```

## Visualize the Steep Descent Algorithm (SDM)
Of course, you can visualize the algorithm in action. You just need to generate the level sets of f, and the game is done (note that display_g is not set to false):

``` julia
  include("graphics.jl")
  level_set(f);
  sdm(f, f_derivative, [1,-1], constant, 1)
```

This is the result:

![execution of the gradient](https://github.com/WilliamSimoni/Computational-Mathematics-Resources/blob/main/images/gradient_execution.PNG?raw=true)

You can apply again the algorithm on a different point:

![execution of the gradient](https://github.com/WilliamSimoni/Computational-Mathematics-Resources/blob/main/images/gradient_execution_2.PNG?raw=true)

And if you want to clean the plot, you have to create again the level set.



