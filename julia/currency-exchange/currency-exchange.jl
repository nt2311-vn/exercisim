function exchange_money(budget, exchange_rate)
    return budget / exchange_rate
end

function get_change(budget, exchanging_value)
    return budget - exchanging_value
end

function get_value_of_bills(denomination, number_of_bills)
    return round(denomination * number_of_bills)
end

function get_number_of_bills(amount, denomination)
    return round(amount / denomination, RoundDown)
end

function get_leftover_of_bills(amount, denomination)
    return amount % denomination
end

function exchangeable_value(budget, exchange_rate, spread, denomination)
    money_collectable = round(budget / (exchange_rate * (1 + spread / 100) * denomination), RoundDown)

    return money_collectable * denomination
end
