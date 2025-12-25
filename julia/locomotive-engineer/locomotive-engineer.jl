function get_vector_of_wagons(args::Int...)::Vector{UInt}
    return [args...]
end

function fix_vector_of_wagons(each_wagons_id::Vector{Int}, missing_wagons::Vector{Int})::Vector{Int}

    first_wagon, second_wagon, rest_wagon... = each_wagons_id
    head_wagon, tail_wagon... = rest_wagon

    return [head_wagon, missing_wagons..., tail_wagon..., first_wagon, second_wagon]
end

function add_missing_stops(route::Dict, stops::Pair{String, String}...)::Dict{String, Any}
    stop_dict = Dict{String, Any}(route)
    stops_in_order::Vector{String} = [last(stop) for stop in stops]

    stop_dict["stops"] = stops_in_order
    return stop_dict


end

function extend_route_information(route::Dict{String, String}; more_route_information...)::Dict{Any, String}
    route_info = Dict{Any, String}(route)
    for (key::Symbol, value::String) in more_route_information
        route_info[key] = value
    end

    return route_info
end
