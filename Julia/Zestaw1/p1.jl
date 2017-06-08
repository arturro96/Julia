function bubblesort(A)
  l=length(A)
  for i = 1:l
    for j = 1:l-1
      if A[j] > A[j+1]
        A[j], A[j+1] = A[j+1], A[j]
      end
    end
  end
  return A
end

A = [84,77,20,60,47,20,18,97,41,49,31,39,73,68,65,52,1,92,15,9]
println("A: ",A)
bubblesort(A)
println("A: ",A)
