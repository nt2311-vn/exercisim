function rationalize(successes::Vector{Int}, trials::Vector{Int})::Vector{Number}
    return [research_pair[1] // research_pair[2] for research_pair in zip(successes, trials)]

end

function probabilities(successes::Vector{Int}, trials::Vector{Int})::Vector{Float64}
    return [research_pair[1] / research_pair[2] for research_pair in zip(successes, trials)]

end

function checkmean(successes::Vector{Int}, trials::Vector{Int})::Union{Bool, Number}
    rationalize_mean = sum(rationalize(successes, trials)) / length(successes)
    probabilities_mean = sum(probabilities(successes, trials)) / length(successes)

    if Float64(rationalize_mean) == probabilities_mean
        return true
    end

    return rationalize_mean
end

function checkprob(successes::Vector{Int}, trials::Vector{Int})::Union{Bool, Rational{Int}}

    prod_rat = prod(rationalize(successes, trials))
    prod_prob = prod(probabilities(successes, trials))

    return Float64(prod_rat) == prod_prob ? true : prod_rat

end
