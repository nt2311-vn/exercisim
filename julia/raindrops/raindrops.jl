function raindrops(number)
    if number % 3 == 0 && number % 5 != 0 && number % 7 != 0
        return "Pling"
    elseif number % 5 == 0 && number % 3 != 0 && number % 7 != 0
        return "Plang"
    elseif number % 7 == 0 && number % 3 != 0 && number % 5 != 0
        return "Plong"
    elseif number % 3 == 0 && number % 5 == 0 && number % 7 != 0
        return "PlingPlang"
    elseif number % 5 == 0 && number % 7 == 0 && number % 3 != 0
        return "PlangPlong"
    elseif number % 7 == 0 && number % 3 == 0 && number % 5 != 0
        return "PlingPlong"
    elseif number % 3 == 0 && number % 5 == 0 && number % 7 == 0
        return "PlingPlangPlong"
    else
        return string(number)
    end

end
