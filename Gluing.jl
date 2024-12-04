#Get the glued subspace for each cube indexed by a vector.
#Input is the result from OrbitsbyWT.jl

function Gluing(list::Vector{Any})


Vectors = Vecindex(length(list)-1) #get index vectors for cubes

#discard the information of top-dimension cells
Lis = []
for celldex in 2:length(list)
    append!(Lis, list[celldex][2])
end

#List= [...,[(I,J),[orb1,orb2,...]],..]
List = []
for lis in Lis
    push!(List,[lis[1],map(collect,lis[2])])
end

#vecglue remembers the glued subspace
vecglue = []

for v in 1:length(Vectors)-1

    #eachvecglue remembers the glued subspace for each indexed cube
    eachvecglue = []
    #Listempty remembers the glued subspace for each indexed cube
    # Listempty = []

    for L in 1:length(List)

        for LL in 1:length(List[L][2])
            
            if Vectors[v] in List[L][2][LL] && length(List[L][2][LL])!=1
                eachvecglue = Addelmt(eachvecglue, List[L][1])
                List[L][2][LL]=setdiff(List[L][2][LL], [Vectors[v]]) # delete the gluing information given by vector
                # List[L][2] = setdiff(List[L][2],[[]]) # delete empty vector
            end
        
        end

        # if List[L][2]==[]
        #     append!(Listempty,L)
        # end
    end
    # deleteat!(List,Listempty)
    push!(vecglue,[Vectors[v],eachvecglue])
end

return vecglue

end








        





