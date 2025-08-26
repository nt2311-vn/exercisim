function time_to_mix_juice(juice)
    if juice == "Pure Strawberry Joy"
        return 0.5
    elseif juice == "Energizer" || juice == "Green Garden"
        return 1.5
    elseif juice == "Tropical Island"
        return 3
    elseif juice == "All or Nothing"
        return 5
    else
        return 2.5
    end
end

function wedges_from_lime(size)
    if size == "small"
        return 6
    elseif size == "medium"
        return 8
    elseif size == "large"
        return 10
    else
        return 0
    end
end

function limes_to_cut(needed, limes)
    if needed == 0
        return 0
    end

    cutted_lime = 0
    total_needed = 0

    for lime in limes
        if total_needed > needed
            break
        end
        total_needed += wedges_from_lime(lime)
        cutted_lime += 1
    end

    return cutted_lime

end

function order_times(orders)

end

function remaining_orders(time_left, orders)

end
