# Define the `expected_bake_time` constant`
const expected_bake_time = 60

# Define the `preparation_time(layers)` function.
preparation_time(layers::Int64)::Int64 = layers * 2

# Define the `remaining_time(time_in_oven)` function.
function remaining_time(time_in_oven::Int64)::Int64
    return expected_bake_time - time_in_oven
end

# Define the `total_working_time(layers, time_in_oven)` function.
total_working_time(layers::Int64, time_in_oven::Int64)::Int64 = preparation_time(layers) + time_in_oven
