collatz_steps(n::Int)::Int =
if n < 1
    throw(DomainError(n))
else
    return count_steps(n)
end


count_steps(n::Number, acc::Int = 0)::Int =
if n == 1
    return acc
elseif n % 2 == 0
    return count_steps(n / 2, acc + 1)
else
    return count_steps(3 * n + 1, acc + 1)
end
