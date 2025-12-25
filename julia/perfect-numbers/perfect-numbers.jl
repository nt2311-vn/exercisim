isperfect(number::Int)::Bool =
if number <= 0
    throw(DomainError(number, "Number must be positive"))
else
    return number == sum(factors(number))
end

isabundant(number::Int)::Bool =
if number <= 0
    throw(DomainError(number, "Number must be positive"))
else
    return number < sum(factors(number))
end

isdeficient(number::Int)::Bool =
if number <= 0
    throw(DomainError(number, "Number must be positive"))
else
    return number > sum(factors(number))
end

factors(n::Int)::Array{Integer} =
    [i for i in 1:(n / 2) if n % i == 0]

#=
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
=#
