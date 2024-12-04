#get vectors over F_2 of rank n with an additional coordiante being 1.

function Vecindex(n::Int)
    F = GF(2)
    partial_vector_space = matrix_space(F, 1, n)
    vectors = [vcat(vec[1, :], F(1)) for vec in partial_vector_space]

    return vectors
end