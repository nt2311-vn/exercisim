function eggcount(number)
    binary_rep = bitstring(number)
    return count(c -> c == '1', binary_rep)
end
