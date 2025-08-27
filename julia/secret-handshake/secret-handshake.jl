function secret_handshake(n::Integer)
    # should_reverse, jump, close_eyes, double_blink, wink = split(bitstring(Int8(code))[4:8], "")
    #
    # actions = []
    #
    # if wink == "1"
    #     push!(actions, "wink")
    # end
    #
    # if double_blink == "1"
    #     push!(actions, "double blink")
    # end
    #
    # if close_eyes == "1"
    #     push!(actions, "close your eyes")
    # end
    #
    # if jump == "1"
    #     push!(actions, "jump")
    # end
    #
    # if should_reverse == "1"
    #     actions = reverse(actions)
    # end
    #
    #
    # return actions

    actions = ["wink", "double blink", "close your eyes", "jump"]
    result = String[]
    for i in 1:4
        if (n >> (i - 1)) & 1 == 1
            push!(result, actions[i])
        end
    end
    if (n >> 4) & 1 == 1
        reverse!(result)
    end
    return result
end
