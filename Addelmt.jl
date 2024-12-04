#An assistant function used in Gluing.jl
#Add a element to an existing vector, before which check whether this element is bigger among the vector
#The order of elements is given by the correspondent faces

function Addelmt(Elist::Vector{Any},elmt::Tuple{Vector{Int64}, Vector{Int64}})
    diffset = [] # the vector of elements in Elist that are smaller than elmt
    Flag = 0 #whether elmt is smaller than any elements in Elist
    if Elist == []
        push!(Elist, elmt)
    else 
        for i in 1:length(Elist)
            if issubset(elmt[1],Elist[i][1]) && issubset(elmt[2],Elist[i][2]) && (⊊(elmt[1],Elist[i][1]) || ⊊(elmt[2],Elist[i][2]))
                diffset = push!(diffset, Elist[i])
            end
            if issubset(Elist[i][1],elmt[1]) && issubset(Elist[i][2],elmt[2])
                Flag = 1
            end
        end
        Elist = setdiff(Elist,diffset)
        
        if Flag == 0
            push!(Elist, elmt)
        end
        
    end
    

    return Elist

end


    