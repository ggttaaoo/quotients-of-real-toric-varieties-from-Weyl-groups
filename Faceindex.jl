# Function to generate pairs of disjoint subsets with a total of k elements for each k in 0:n
# get indices of faces of the cube of dimension n
# Pkg: Using combitorics
function Faceindex(n::Int)
    # Generate the full set {1, 2, ..., n}
    full_set = collect(1:n)

    results = []
for k in 0:n

    result = []

    # Iterate over all combinations of size m from the full set, where m ≤ k
    for m in 0:k
        for subset1 in combinations(full_set, m)
            # Elements not in subset1 form the potential elements of subset2
            remaining_elements = setdiff(full_set, subset1)

            # Subset2 must contain exactly (k - m) elements from the remaining elements
            for subset2 in combinations(remaining_elements, k - m)
                push!(result, (subset1, subset2))
            end
        end
    end

    push!(results, [k, result])
end

    return results
end
