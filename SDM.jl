#module SDM

using LinearAlgebra
using Printf

include("utility.jl")
include("graphics.jl")

#export sdm

function sdm(fun, fun_derivative, starting_point, step_size_params, epsilon; display_g=true)
    type = get(step_size_params, "type", "constant")
    method = get(SDM_step_size_methods, type, constant_step_size_sdm)
    return method(fun, fun_derivative, starting_point, step_size_params, epsilon, display_g)
end

function constant_step_size_sdm(fun, fun_derivative, starting_point, step_size_params, epsilon, display_g)
    @printf("Press enter to continue with iterations\n")
    @printf("step\t\tposition\t\tgradient_norm\n")

    gradient = fun_derivative(starting_point[1], starting_point[2])
    x = [starting_point[1], starting_point[2]]

    step_counter = 1
    while(true)
        
        #we move in the opposite direction of the gradient
        d = -gradient
        #step size is constant
        alpha = get(step_size_params, "step_size", 0.1)
        #move to the next point
        movement = alpha*d
        if display_g
            display(add_vector(x, movement))
        end
        x = x + movement

        gradient_norm = norm(gradient, 2)
        @printf("%d\t\t[%g,%g]\t\t%g", step_counter, x[1], x[2], gradient_norm)

        #we stop whenever the norm of the gradient is lower than a certain epsilon
        if (gradient_norm < epsilon)
            break
        end
        
        wait_for_key("")

        step_counter += 1

        #calculate the gradient for the new iteration
        gradient = fun_derivative(x[1], x[2])
    end

    @printf("\n")
    return x
end

function quadratic_step_size_sdm(fun, fun_derivative, starting_point, step_size_params, epsilon, display_g)
    @printf("Press enter to continue with iterations\n")
    @printf("step\t\tposition\t\tgradient_norm\n")

    Q = get(step_size_params, "Q", false)
    if Q==false error("Q not set in step_size_params"); return; end;

    gradient = fun_derivative(starting_point[1], starting_point[2])
    x = [starting_point[1], starting_point[2]]

    step_counter = 1
    while(true)
        
        #we move in the opposite direction of the gradient
        d = -gradient
        #best step size, if the function is a quadratic function
        alpha = (norm(d,2)^2)/(d'*Q*d)
        #move to the next point
        movement = alpha*d
        if display_g
            display(add_vector(x, movement))
        end
        x = x + movement

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

    @printf("\n")
    return x
end

SDM_step_size_methods = Dict([
    ("constant", constant_step_size_sdm), 
    ("quadratic", quadratic_step_size_sdm)
])

#end
