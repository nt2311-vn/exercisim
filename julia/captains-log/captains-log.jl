const possible_planet::Vector{Char} = ['D', 'H', 'J', 'K', 'L', 'M', 'N', 'R', 'T', 'Y']

function random_planet()::Char
    index = rand(1:10)
    return possible_planet[index]
end

function random_ship_registry_number()::String
    registry_number = rand(1000:9999)
    return "NCC-$registry_number"
end

function random_stardate()::Float64
    return rand() * 1000 + 41000.0
end

function random_stardate_v2()
    return rand(41000.0:0.1:42000.0)
end

function pick_starships(starships::Vector{String}, number_needed::Int)::Vector{String}
    # total_starship = length(starships)
    # random_starships = Vector{String}()
    # pick = number_needed
    #
    # while pick >= 1
    #     index = rand(1:total_starship)
    #     while starships[index] in random_starships
    #         index = rand(1:total_starship)
    #     end
    #     push!(random_starships, starships[index])
    #     pick -= 1
    # end
    # return random_starships

    if number_needed < 0 || number_needed > length(starships)
        error("number_needed must bue non-negative and not exceed the number of starships")
    end

    return shuffle(starships)[1:number_needed]
end
