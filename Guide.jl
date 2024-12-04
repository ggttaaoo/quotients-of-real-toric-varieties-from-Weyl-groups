#one-step code: just copy and paste

#just in case 
using Oscar
using Combinatorics
include("Addelmt.jl")
include("Conty.jl")
include("Faceindex.jl")
include("OrbitsbyWT.jl")
include("Simpref.jl")
include("Vecindex.jl")
include("Gluing.jl")



con=Conty(Gluing(OrbitsbyWT("B",8))) # get contractibilities of all glued spaces of the root system of type B, rank 8.

# You may need a simpler array, 
cons = []
for i in con #if the output cons is empty, then all GS's are contractible.
    if i[2]!="trivialone" && i[2]!="trivialtwo" && i[2]!="trivial"
    push!(cons,i)
    end
end
