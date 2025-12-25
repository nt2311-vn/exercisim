function get_coordinate(line)
    return line[2]
end

function convert_coordinate(coordinate)
    return (coordinate[1], coordinate[2])
end

function compare_records(azara_record, rui_record)
    format_coordinate = convert_coordinate(get_coordinate(azara_record))
    rui_coordinae = rui_record[2]

    return format_coordinate == rui_coordinae
end

function create_record(azara_record, rui_record)
    matched = compare_records(azara_record, rui_record)
    if matched
        return (get_coordinate(azara_record), rui_record[1], rui_record[3], azara_record[1])
    end

    return ()
end
