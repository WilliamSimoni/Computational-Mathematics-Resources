using Plots

#import Pkg; Pkg.add("Plots")

function level_set(fun; level_center = [0,0], rangeX = [-1,1], rangeY = [-1,1], number_of_levels = 50, color_level = true)
    plotly()
    
    centered_RangeX = [level_center[1] + rangeX[1], level_center[1] + rangeX[2]]
    centered_RangeY = [level_center[2] + rangeY[1], level_center[2] + rangeY[2]]

    lengthX = (centered_RangeX[2] - centered_RangeX[1])/number_of_levels
    x = centered_RangeX[1]:lengthX:centered_RangeX[2]
    lengthY = (centered_RangeY[2] - centered_RangeY[1])/number_of_levels
    y = centered_RangeY[1]:lengthY:centered_RangeY[2]

    X = repeat(reshape(x, 1, :), length(y), 1)
    Y = repeat(y, 1, length(x))
    Z = map(fun, X, Y)
    p1 = contour(x, y, fun, fill = color_level, c = :starrynight)

    return p1
end