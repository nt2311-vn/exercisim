function score(x::Number, y::Number)::Int
    radius = sqrt(x * x + y * y)
    if radius <= 1
        return 10
    end

    if radius <= 5
        return 5
    end

    if radius <= 10
        return 1
    end

    return 0

end
