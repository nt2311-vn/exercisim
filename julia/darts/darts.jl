const dart_radius = 10
function score(x::Number, y::Number)::Int
    radius = sqrt(x * x + y * y)
    # if radius <= 1
    #     return 10
    # end
    #
    # if radius <= 5
    #     return 5
    # end
    #
    # if radius <= 10
    #     return 1
    # end
    #
    # return 0

    dist = dart_radius - radius
    if dist < 0
        return 0
    elseif dist >= 9
        return 10
    elseif dist >= 5
        return 5
    else
        return 1
    end

end
