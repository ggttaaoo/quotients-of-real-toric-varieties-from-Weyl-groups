#Check the contractibility of each guling information obatined from Gluing.jl
function Conty(List::Vector{Any})
    conty = [] # remember the contractibility of all vectors

    # for k in List
    #     eachconty = []
    #     if Trivial1(k[2])[1] == 0
    #         eachconty = [k[1],"trivialone"]
    #         push!(conty, eachconty)
    #         continue
    #     end
    #     if Trivial1(k[2])[1] == 1 && length(k[2])>2
    #         eachconty = [k[1], "trivialtwo"]
    #         push!(conty, eachconty)
    #         continue 
    #     end
    #     if Trivial1(k[2])[1] == 1 && length(k[2])==2
    #         eachconty = [k[1], "noncontractible"]
    #         push!(conty, eachconty)
    #         continue 
    #     end

    #     if Trivial1(k[2])[1] > 2
    #         eachconty = [k[1], k[2]]
    #         push!(conty, eachconty)
    #         continue 
    #     end
        
    #     Flag1 = 0 # determine of contractibilities of components of the union 
    #     Flag2 = 0
    #     Flag3 = 0
    #     if (Trivial1(setdiff(k[2],[Trivial1(k[2])[2][1][1]]))[1]==0) || (Trivial1(setdiff(k[2],[Trivial1(k[2])[2][1][1]]))[1]==1 && length(setdiff(k[2],[Trivial1(k[2])[2][1][1]]))>2)
    #         Flag1 = 1
    #     end

    #     if (Trivial1(setdiff(k[2],[Trivial1(k[2])[2][1][2]]))[1]==0) || (Trivial1(setdiff(k[2],[Trivial1(k[2])[2][1][2]]))[1]==1 && length(setdiff(k[2],[Trivial1(k[2])[2][1][2]]))>2)
    #         Flag2 = 1
    #     end

    #     if (Trivial1(setdiff(k[2],Trivial1(k[2])[2][1]))[1]==0) || (Trivial1(setdiff(k[2],Trivial1(k[2])[2][1]))[1]==1 && length(setdiff(k[2],[Trivial1(k[2])[2][1]]))>2)
    #         Flag3 =1
    #     end

    #     if Flag1 * Flag2 * Flag3 == 1
    #         eachconty = [k[1], "trivialthree"]
    #     else eachconty = [k[1], k[2]]
    #     end

    #     push!(conty, eachconty)
    # end

 for k in List

    eachconty = []

    for kk in k[2] #want to find out a not opposite component

        oppo = 1 # check the existence of an opposite face of kk, 0 means true.
        
        for kkk in k[2]

            if (intersect(kk[1],kkk[2]) == []) && (intersect(kk[2],kkk[1]) == [])
                oppo = oppo * 1
            else oppo = oppo * 0
            end

        end

        if oppo == 1 #if there is a not component, end the loop on kk
            eachconty = [k[1], "trivial"]
            break 
        end
    end

    if eachconty == []
        eachconty = [k[1],k[2]]
    end

    push!(conty, eachconty)
end

    return conty
end

