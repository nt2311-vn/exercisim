collatz_steps(n::Int)::Int =
if n < 1
    throw(DomainError(n))
elseif n == 1
    return 0
else
    steps = 0
    number = n
    while number != 1
        if number % 2 == 0
            number = number / 2
            steps = steps + 1
        else
            number = 3 * number + 1
            steps = steps + 1
        end
    end

    return steps
end


count_steps(n::Number, acc::Int = 0)::Int =
if n == 1
    return acc
elseif n % 2 == 0
    return count_steps(n / 2, acc + 1)
else
    return count_steps(3 * n + 1, acc + 1)
end
