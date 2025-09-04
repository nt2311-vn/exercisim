function create_inventory(items)

    stock = Dict{String, Int}()

    for item in items
        if !haskey(stock, item)
            stock[item] = 0
        end

        stock[item] += 1
    end

    return stock
end

function add_items(inventory, items)

    for item in items
        if !haskey(inventory, item)
            inventory[item] = 0
        end

        inventory[item] += 1
    end

    return inventory

end

function decrement_items(inventory, items)
    for item in items
        if haskey(inventory, item) && inventory[item] > 0
            inventory[item] -= 1
        end
    end

    return inventory
end

function remove_item(inventory, item)
    if haskey(inventory, item)
        delete!(inventory, item)
    end

    return inventory
end

function list_inventory(inventory)
    inventory_vector = Pair{String, Int}[]
    for key in keys(inventory)
        if inventory[key] > 0
            push!(inventory_vector, key => inventory[key])
        end
    end
    sort!(inventory_vector, by = item -> item.first)
    return inventory_vector
end
