function rows(letter::String)::Vector
    target = only(letter)
    n = Int(target - 'A')
    size = 2 * n + 1
    diamond::Vector{String} = []

    for i in 0:n
        row = fill(' ', size)
        row[n - i + 1] = Char('A' + i)
        row[n + i + 1] = Char('A' + i)
        push!(diamond, String(row))
    end

    for i in (n - 1):-1:0
        row = fill(' ', size)
        row[n - i + 1] = Char('A' + i)
        row[n + i + 1] = Char('A' + i)
        push!(diamond, String(row))
    end

    return diamond

end
