function qs(A,i=1,j=length(A))
    if j > i
        pivot = A[rand(i:j)] # random element of A
        left, right = i, j
        while left <= right
            while A[left] < pivot
                left += 1
            end
            while A[right] > pivot
                right -= 1
            end
            if left <= right
                A[left], A[right] = A[right], A[left]
                left += 1
                right -= 1
            end
        end
        qs(A,i,right)
        qs(A,left,j)
    end
    return A
end

A = [84,77,20,60,47,20,18,97,41,49,31,39,73,68,65,52,1,92,15,9]

println("A: ", A)
println("QS: ", qs(A))