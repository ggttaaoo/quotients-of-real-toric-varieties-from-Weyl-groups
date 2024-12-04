# Write simple reflections into matrices over Z/2 with an additional coordinate for the trivial translation
function Simpref(roottype::String, rootrank::Int)
    simpref = []

    F = GF(2)
    
    if roottype == "A"
        for k in 1:rootrank
            elements = [i == j ? 1 :
                        (i == rootrank+1 || j == rootrank+1) ? 0 :
                        j != k ? 0 :
                        (i == j - 1 || i == j + 1) ? 1 : 0
                        for i in 1:rootrank+1, j in 1:rootrank+1]
            M = matrix(F, elements)
            push!(simpref, M)
        end

    elseif roottype == "C"
        for k in 1:rootrank
            if k != rootrank - 1
                elements = [i == j ? 1 :
                            (i == rootrank+1 || j == rootrank+1) ? 0 :
                            j != k ? 0 :
                            (i == j - 1 || i == j + 1) ? 1 : 0
                            for i in 1:rootrank+1, j in 1:rootrank+1]
            else
                elements = [i == j ? 1 :
                             (i == rootrank+1 || j == rootrank+1) ? 0 :
                            j != k ? 0 :
                            (i == j - 1) ? 1 : 0
                            for i in 1:rootrank+1, j in 1:rootrank+1]
            end
            M = matrix(F, elements)
            push!(simpref, M)
        end

    elseif roottype == "B"
        for k in 1:rootrank
            if k != rootrank
                elements = [i == j ? 1 :
                            (i == rootrank+1 || j == rootrank+1) ? 0 :
                            j != k ? 0 :
                            (i == j - 1 || i == j + 1) ? 1 : 0
                            for i in 1:rootrank+1, j in 1:rootrank+1]
            else
                elements = [i == j ? 1 : 0
                            for i in 1:rootrank+1, j in 1:rootrank+1]
            end
            M = matrix(F, elements)
            push!(simpref, M)
        end

    elseif roottype == "D"
        for k in 1:(rootrank - 3)
            elements = [i == j ? 1 :
                        (i == rootrank+1 || j == rootrank+1) ? 0 :
                        j != k ? 0 :
                        (i == j - 1 || i == j + 1) ? 1 : 0
                        for i in 1:rootrank+1, j in 1:rootrank+1]
            M = matrix(F, elements)
            push!(simpref, M)
        end

        # Additional specific matrices for type D
        for (k, values) in [(rootrank - 2, [rootrank-3, rootrank-1, rootrank]), 
                            (rootrank - 1, [rootrank-2]), 
                            (rootrank, [rootrank-2])]
            elements = [i == j ? 1 :
                        (i == rootrank+1 || j == rootrank+1) ? 0 :
                        j != k ? 0 :
                        (i in values) ? 1 : 0
                        for i in 1:rootrank+1, j in 1:rootrank+1]
            M = matrix(F, elements)
            push!(simpref, M)
        end

    elseif roottype == "E"
        # Specific matrices for type E
        for (k, values) in [(1,[3]),(2,[4]),(3,[1,4]),(4,[2,3,5])]
            elements = [i == j ? 1 :
                        (i == rootrank+1 || j == rootrank+1) ? 0 :
                        j != k ? 0 :
                        (i in values) ? 1 : 0
                        for i in 1:rootrank+1, j in 1:rootrank+1]
            M = matrix(F, elements)
            push!(simpref, M)
        end

        for k in 5:rootrank
            elements = [i == j ? 1 :
                        (i == rootrank+1 || j == rootrank+1) ? 0 :
                        j != k ? 0 :
                        (i == j - 1 || i == j + 1) ? 1 : 0
                        for i in 1:rootrank+1, j in 1:rootrank+1]
            M = matrix(F, elements)
            push!(simpref, M)
        end

    elseif roottype == "F"
        for k in 1:4
            if k != 3
                elements = [i == j ? 1 :
                            (i == rootrank+1 || j == rootrank+1) ? 0 :
                            j != k ? 0 :
                            (i == j - 1 || i == j + 1) ? 1 : 0
                            for i in 1:rootrank+1, j in 1:rootrank+1]
            else
                elements = [i == j ? 1 :
                           (i == rootrank+1 || j == rootrank+1) ? 0 :
                            j != k ? 0 :
                            (i == j + 1) ? 1 : 0
                            for i in 1:rootrank+1, j in 1:rootrank+1]
            end
            M = matrix(F, elements)
            push!(simpref, M)
        end

    else
        for k in 1:2
            elements = [i == j ? 1 :
                        (i == rootrank+1 || j == rootrank+1) ? 0 :
                        j != k ? 0 :
                        (i == j - 1 || i == j + 1) ? 1 : 0
                        for i in 1:3, j in 1:3]
            M = matrix(F, elements)
            push!(simpref, M)
        end
    end

    return simpref
end


