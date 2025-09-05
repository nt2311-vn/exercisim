function clean_ingredients(dish_name::String, dish_ingredients::Vector)::Tuple{String, Set}
    return (dish_name, Set(dish_ingredients))
end

function check_drinks(drink_name::String, drink_ingredients::Vector)::String
    return any(in(ALCOHOLS), drink_ingredients) ? "$drink_name Cocktail" : "$drink_name Mocktail"
end

function categorize_dish(dish_name::String, dish_ingredients::Set)::String
    dish_category = ""

    if all(ingredient -> ingredient in VEGAN, dish_ingredients)
        dish_category = "VEGAN"
    elseif all(ingredient -> ingredient in VEGETARIAN, dish_ingredients)
        dish_category = "VEGETARIAN"
    elseif all(ingredient -> ingredient in PALEO, dish_ingredients)
        dish_category = "PALEO"
    elseif all(ingredient -> ingredient in KETO, dish_ingredients)
        dish_category = "KETO"
    elseif all(ingredient -> ingredient in OMNIVORE, dish_ingredients)
        dish_category = "OMNIVORE"
    end

    return "$dish_name: $dish_category"

end

function tag_special_ingredients(dish::Tuple)::Tuple{String, Set{String}}
    dish_name::String = dish[1]
    ingredients::Union{Vector, Set} = dish[2]
    allergent::Set{String} = Set([ingredient for ingredient in ingredients if ingredient in SPECIAL_INGREDIENTS])

    return (dish_name, allergent)

end

function compile_ingredients(dishes::Vector{Set{String}})::Set{String}
    master_list::Set{String} = Set()
    for ingredients::Set{String} in dishes
        master_list = union(master_list, ingredients)
    end

    return master_list
end

function separate_appetizers(dishes::Vector{String}, appetizers::Vector{String})::Vector{String}

    return [item for item in setdiff(Set(dishes), Set(appetizers))]
end

function singleton_ingredients(dishes::Vector, intersection)
    all_ingredients = reduce(union, dishes)
    return setdiff(all_ingredients, intersection)
end
