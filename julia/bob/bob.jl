function is_question(msg::String)::Bool
    return strip(msg)[end] == '?'
end

function is_yell(msg::String)::Bool
    return msg == uppercase(msg) && any(isuppercase, msg)
end

function bob(stimulus)
    if strip(stimulus) == ""
        return "Fine. Be that way!"
    elseif is_yell(stimulus) && is_question(stimulus)
        return "Calm down, I know what I'm doing!"
    elseif is_yell(stimulus)
        return "Whoa, chill out!"
    elseif is_question(stimulus)
        return "Sure."
    else
        return "Whatever."
    end
end
