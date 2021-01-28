using LinearAlgebra
using Printf

include("utility.jl")
include("step_size_methods.jl")

function steepest_descent_method(fun, fun_derivative, starting_point, step_size_params, epsilon)
    @printf("Press enter to continue with iterations\n")
    @printf("step\t\tposition\t\tgradient_norm\n")

    gradient = fun_derivative(starting_point[1], starting_point[2])
    x = [starting_point[1], starting_point[2]]

    step_counter = 1
    while(true)
        
        #we move in the opposite direction of the gradient
        d = -gradient
        #compute the step size
        alpha = step_size(step_size_params)
        #move to the next point
        x = x + alpha*d

        gradient_norm = norm(gradient, 2)
        @printf("%d\t\t[%f,%f]\t\t%g", step_counter, x[1], x[2], gradient_norm)

        #we stop whenever the norm of the gradient is lower than a certain epsilon
        if (gradient_norm < epsilon)
            break
        end
        
        wait_for_key("")

        step_counter += 1

        #calculate the gradient for the new iteration
        gradient = fun_derivative(x[1], x[2])
    end

end