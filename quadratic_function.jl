using LinearAlgebra

function positive_definite(x,y)
    Q = [6 -2; -2 6]
    q = [0 ; 0]
    return return quadratic_function(x,y,Q,q)
end

function semi_positive_definite(x,y)
    Q = [0 1; 0 1]
    q = [0 ; 0]
    return return quadratic_function(x,y,Q,q)
end

function not_positive_definite(x,y)
    Q = [-5 -2; -4 -2]
    q = [0 ; 0]
    return quadratic_function(x,y,Q,q)
end

function quadratic_function(x,y,Q,q)
    Q_f = ([x y]*Q*[x ; y])[1] * 0.5
    q_f = q' * [x ; y]
    return Q_f + q_f
end

#derivatives

function positive_definite_d(x,y)
    Q = [6 -2; -2 6]
    q = [0 ; 0]
    return return quadratic_function_d(x,y,Q,q)
end

function semi_positive_definite_d(x,y)
    Q = [0 1; 0 1]
    q = [0 ; 0]
    return return quadratic_function_d(x,y,Q,q)
end

function not_positive_definite_d(x,y)
    Q = [-5 -2; -4 -2]
    q = [0 ; 0]
    return quadratic_function_d(x,y,Q,q)
end

function quadratic_function_d(x,y,Q,q)
    return (Q*[x ; y]) + q
end