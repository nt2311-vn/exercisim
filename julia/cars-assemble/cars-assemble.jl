const standard_produce_perhour = 221

function success_rate(speed::Int)::Float64
    if speed == 0
        return 0
    elseif speed == 10
        return 0.77
    elseif speed === 9
        return 0.8
    elseif speed >= 5 && speed <= 8
        return 0.9
    elseif speed >= 1 && speed <= 4
        return 1.0
    end

end

function production_rate_per_hour(speed::Int)::Float64
    return success_rate(speed) * speed * standard_produce_perhour
end

function working_items_per_minute(speed::Int)::Int
    return round(success_rate(speed) * speed * standard_produce_perhour / 60, RoundDown)
end
