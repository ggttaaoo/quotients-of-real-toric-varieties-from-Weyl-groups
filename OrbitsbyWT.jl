#get the the face information, the output consists of vectors [m,[[n_1,o_1],...,[n_r,o_r]]] where m is codimension of faces, n_1=[I,J] determines the face, o_1 is the orbit of V under W_IT_J action. 

function OrbitsbyWT(roottype::String, rootrank::Int)

    F = GF(2)

#define the translation on vectors
    Translations = [] 
    for k in 1:rootrank
        elements = [i == j ? 1 :
                    (i == k && j == rootrank+1) ? 1 : 0
                    for i in 1:rootrank+1, j in 1:rootrank+1]
        M = matrix(F, elements)
        push!(Translations, M)
    end

#get vectors over F_2 with an additional coordiante being 1.
vectors = Vecindex(rootrank)

#get the simple reflections from Simpref.jl
Simprefs = Simpref(roottype,rootrank)

#get all face indices of the cube
Faceindices = Faceindex(rootrank)

#define the action of the extended affine Weyl group on vectors
action = (omega, g) -> inv(g) * omega

orbitsbyWT = [];

#generate all cells of each dimension m
for m in Faceindices

    eachorbitbyWT = [] # the orbits by WT action of each dimension

    for n in m[2]
        

        if n[1] == [] && n[2] == []
            WT = matrix_group(identity_matrix(F,rootrank+1))
        elseif   n[1] == [] && n[2] != []  #generate the extended affine Weyl group action on the face W_IT_J with n=(I,J)
            WT = matrix_group([Translations[j] for j in n[2]])
        elseif n[2] == [] && n[1] != [] 
            WT = matrix_group([Simprefs[i] for i in n[1]])
        else
            WT = matrix_group([[Simprefs[i] for i in n[1]];[Translations[j] for j in n[2]]])
        end

        #get orbits of vectors under the extended affine Weyl group action
        push!(eachorbitbyWT, [n, orbits(gset(WT,action, vectors))])
    end

    push!(orbitsbyWT, [m, eachorbitbyWT])

end

    return orbitsbyWT
end