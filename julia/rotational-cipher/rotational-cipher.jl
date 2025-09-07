function rotate(shift_number::Int, ch::Char)::Char
    base = isuppercase(ch) ? 'A' : 'a'

    if isletter(ch)
        return Char(mod(Int(ch - base) + shift_number, 26) + Int(base))
    end

    return ch
end

function rotate(shift_number::Int, message::String)::String
    return String([rotate(shift_number, ch) for ch in message])
end
