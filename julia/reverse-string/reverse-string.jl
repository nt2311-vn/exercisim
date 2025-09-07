function myreverse(phrase::String)::String

    buf = IOBuffer()
    i = lastindex(phrase)

    while i >= firstindex(phrase)
        print(buf, phrase[i])
        i = prevind(phrase, i)
    end

    return String(take!(buf))
end
