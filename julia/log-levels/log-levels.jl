function message(msg)
    return strip(split(msg, ":")[2])
end

function log_level(msg)
    return lowercase(replace(split(msg, ":")[1], "[" => "", "]" => ""))
end

function reformat(msg)
    log = log_level(msg)
    sys_message = message(msg)

    return "$sys_message ($log)"
end
