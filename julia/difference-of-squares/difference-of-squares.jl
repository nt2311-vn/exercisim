"Square the sum of the first `n` positive integers"
function square_of_sum(n::Int)::Int
    return sum_up_to(n)^2
end

"Sum the squares of the first `n` positive integers"
function sum_of_squares(n)

    if n <= 1
        return n
    else
        return n^2 + sum_of_squares(n - 1)
    end

end

"Subtract the sum of squares from square of the sum of the first `n` positive ints"
function difference(n)
    return square_of_sum(n) - sum_of_squares(n)
end

"Recursion tail call to sum up to `n` positive integer"
sum_up_to(n::Int, acc::Int = 0)::Int =
if n == 0
    return acc
else
    return sum_up_to(n - 1, acc + n)
end
