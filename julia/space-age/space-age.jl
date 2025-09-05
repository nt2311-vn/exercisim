const earth_year_in_second = 31_557_600
const mecury_period_to_earth = 0.2408467
const venus_period_to_earth = 0.61519726
const mars_period_to_earth = 1.8808158
const jupiter_period_to_earth = 11.862615
const saturn_period_to_earth = 29.447498
const uranus_period_to_earth = 84.016846
const neptune_period_to_earth = 164.79132

function onEarth(seconds)
    return round(seconds / earth_year_in_second, digits = 2)
end

function onMercury(seconds)
    return round((seconds / earth_year_in_second) / mecury_period_to_earth, digits = 2)
end

function onVenus(seconds)
    return round((seconds / earth_year_in_second) / venus_period_to_earth, digits = 2)
end

function onMars(seconds)
    return round((seconds / earth_year_in_second) / mars_period_to_earth, digits = 2)
end

function onJupiter(seconds)
    return round((seconds / earth_year_in_second) / jupiter_period_to_earth, digits = 2)
end

function onSaturn(seconds)
    return round((seconds / earth_year_in_second) / saturn_period_to_earth, digits = 2)
end

function onUranus(seconds)
    return round((seconds / earth_year_in_second) / uranus_period_to_earth, digits = 2)
end

function onNeptune(seconds)
    return round((seconds / earth_year_in_second) / neptune_period_to_earth, digits = 2)
end
