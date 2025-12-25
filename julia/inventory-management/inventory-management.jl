function create_inventory(items::Vector{String})::Dict{String, Int}
    stock = Dict{String, Int}()
    for item::String in items
        stock[item] = get(stock, item, 0) + 1
    end
    return stock
end

function add_items(inventory::Dict, items::Vector{String})::Dict{String, Int}

    for item::String in items
        inventory[item] = get(inventory, item, 0) + 1
    end

    return inventory
end

function decrement_items(inventory::Dict, items::Vector{String})::Dict

    for item::String in items
        if get(inventory, item, 0) > 0
            inventory[item] -= 1
        end
    end
    return inventory
end

function remove_item(inventory::Dict, item::String)::Dict
    if haskey(inventory, item)
        delete!(inventory, item)
    end

    return inventory
end

function list_inventory(inventory::Dict)::Vector{Pair{String, Int}}
    return sort([(k => v) for (k, v) in inventory if v > 0], by = x -> x.first)
end
