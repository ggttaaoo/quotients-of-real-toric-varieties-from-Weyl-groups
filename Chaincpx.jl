#get chain complex from the cell information via OrbitsbyWT.jl
#input is the vecotr obtained from OrbitsbyWT.jl
#output is a vector of boundary maps in the form of matrices from the top dimension on: the map Z^m to Z^n is a matrix of size m×n
function Chaincpx(list::Vector{Any})

    chaincpx = []

  for celldeg in 1:length(list)-1

    boundarymapsh = []

    for II in list[celldeg][2]
        
        boundarymapsv = []

        for JJ in list[celldeg+1][2]

            if issubset(II[1][1],JJ[1][1]) &&  Set(II[1][2]) == Set(JJ[1][2]) #if the two cells W_I1T_J1 and W_I2T_J2 satisfy that I1⊂I2, J1==J2
                    boundarycoeff = (-1)^(length(setdiff(collect(1:setdiff(JJ[1][1],II[1][1])[1]),vcat(II[1][1],II[1][2]))))
                    boundarymap = [issubset(collect(i),collect(j)) ? boundarycoeff : 0
                                for j in JJ[2], i in II[2]]
                elseif issubset(II[1][2],JJ[1][2]) && Set(II[1][1]) == Set(JJ[1][1]) #if the two cells W_I1T_J1 and W_I2T_J2 satisfy that I1==I2, J1⊂ J2
                    boundarycoeff = (-1)*(-1)^(length(setdiff(collect(1:setdiff(JJ[1][2],II[1][2])[1]),vcat(II[1][1],II[1][2]))))
                    boundarymap = [issubset(collect(i),collect(j)) ? boundarycoeff : 0
                                for j in JJ[2], i in II[2]]
                else  boundarymap = [0 for j in JJ[2], i in II[2]]
            end

            if boundarymapsv == []
                boundarymapsv = boundarymap
            else boundarymapsv = vcat(boundarymapsv, boundarymap)
            end

        end
        
        if boundarymapsh == []
            boundarymapsh = boundarymapsv
        else boundarymapsh = hcat(boundarymapsh, boundarymapsv)
        end
        
    end

    push!(chaincpx, transpose(boundarymapsh))

    
   end
                 
   # cpx = [ModuleHomomorphism(free_module(ZZ,size(mat)[1]),free_module(ZZ,size(mat)[2]),matrix(ZZ,mat)) for mat in chaincpx]
       
   

 return chaincpx 





end




