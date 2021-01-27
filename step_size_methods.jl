function step_size(step_size_params)
    type = get(step_size_params, "type", "constant")
    method = get(step_size_methods, type, constant_step_size)
    return method(step_size_params)
end

function constant_step_size(step_size_params)
    return get(step_size_params, "step_size", 0.1)
end

params = Dict([("type", "constant"), ("step_size", 0.1)])

step_size_methods = Dict([("constant", constant_step_size)])