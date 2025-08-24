function get_item(stack::Vector{Int64}, position::Int64)::Int64
    if position <= 0 || position > length(stack)
        return -1
    else
        return stack[position]
    end
end

function set_item!(stack::Vector{Int64}, position::Int64, replacement_card::Int64)::Vector{Int64}
    if position > 0 && position <= length(stack)
        stack[position] = replacement_card
    end

    return stack
end

function insert_item_at_top!(stack::Vector{Int64}, new_card::Int64)::Vector{Int64}
    return push!(stack, new_card)
end

function remove_item!(stack::Vector{Int64}, position::Int64)::Vector{Int64}
    if position > 0 && position <= length(stack)
        deleteat!(stack, position)
    end
    return stack

end

function remove_item_from_top!(stack::Vector{Int64})::Vector{Int64}
    if length(stack) > 0
        pop!(stack)
    end

    return stack
end

function insert_item_at_bottom!(stack::Vector{Int64}, new_card::Int64)::Vector{Int64}
    pushfirst!(stack, new_card)
    return stack
end

function remove_item_at_bottom!(stack::Vector{Int64})::Vector{Int64}
    if length(stack) > 0
        popfirst!(stack)
    end
    return stack
end

function check_size_of_stack(stack::AbstractVector, stack_size::Int64)::Bool
    return length(stack) == stack_size
end
