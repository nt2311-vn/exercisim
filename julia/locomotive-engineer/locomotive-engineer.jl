function get_vector_of_wagons(args::Int...)::Vector{UInt}
    return [args...]
end

function fix_vector_of_wagons(each_wagons_id::Vector{Int}, missing_wagons::Vector{Int})::Vector{Int}

    first_wagon, second_wagon, rest_wagon... = each_wagons_id
    head_wagon, tail_wagon... = rest_wagon

    return [head_wagon, missing_wagons..., tail_wagon..., first_wagon, second_wagon]
end

function add_missing_stops(route, stops...)

end

function extend_route_information(route; more_route_information...)

end
