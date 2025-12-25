function message(msg)
    return strip(split(msg, ":")[2])
end

function log_level(msg)
    return lowercase(replace(split(msg, ":")[1], "[" => "", "]" => ""))
end

function reformat(msg)
    log, sys_message = split(msg, ":")
    return "$(strip(sys_message)) $(lowercase(replace(log, "[" => "(", "]" => ")")))"
end
