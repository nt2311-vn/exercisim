function transform(ch::Char)::String

    if isuppercase(ch)
        return "-$(lowercase(ch))"
    elseif ch == '-'
        return "_"
    elseif ch == ' ' || isdigit(ch)
        return ""
    elseif lowercase(ch) in 'α':'ω'
        return "?"
    end

    return string(ch)

end

function clean(str::String)::String
    return join(transform(ch) for ch in str)
end
