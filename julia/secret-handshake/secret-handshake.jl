function secret_handshake(code)
    should_reverse, jump, close_eyes, double_blink, wink = split(bitstring(Int8(code))[4:8], "")

    actions = []

    if wink == "1"
        push!(actions, "wink")
    end

    if double_blink == "1"
        push!(actions, "double blink")
    end

    if close_eyes == "1"
        push!(actions, "close your eyes")
    end

    if jump == "1"
        push!(actions, "jump")
    end

    if should_reverse == "1"
        actions = reverse(actions)
    end


    return actions
end
