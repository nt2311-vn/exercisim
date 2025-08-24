isperfect(number::Int)::Bool =
if number <= 0
    throw(DomainError(number, "Number must be positive"))
else
    return number == sum_of_divisors(number)
end

isabundant(number::Int)::Bool =
if number <= 0
    throw(DomainError(number, "Number must be positive"))
else
    return number < sum_of_divisors(number)
end

isdeficient(number::Int)::Bool =
if number <= 0
    throw(DomainError(number, "Number must be positive"))
else
    return number > sum_of_divisors(number)
end

function sum_of_divisors(number::Int)::Int
    if number == 1
        return 0
    end
    limit = floor(Int, sqrt(number))
    total = 1
    for d in 2:limit
        if number % d == 0
            pair = number / d
            if d == pair
                total += d
            else
                total += d + pair
            end
        end
    end
    return total
end
