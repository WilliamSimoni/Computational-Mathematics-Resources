using LinearAlgebra

function positive_definite(x,y)
    Q = [6 -2; -2 6]
    q = [0 ; 0]
    Q_f = ([x y]*Q*[x ; y])[1] * 0.5
    q_f = q' * [x ; y]
    return Q_f + q_f
end

function semi_positive_definite(x,y)
    Q = [0 1; 0 1]
    q = [0 ; 0]
    Q_f = ([x y]*Q*[x ; y])[1] * 0.5
    q_f = q' * [x ; y]
    return Q_f + q_f
end

function not_positive_definite(x,y)
    Q = [-5 -2; -4 -2]
    q = [0 ; 0]
    Q_f = ([x y]*Q*[x ; y])[1] * 0.5
    q_f = q' * [x ; y]
    return Q_f + q_f
end