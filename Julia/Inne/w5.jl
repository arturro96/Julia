A=zeros(10,10)
A[1:4:length(A)]=1
#println(A)
println(linspace(0,10,5))
println(round(Int, 4.51))
println([round(Int, s) for s in linspace(0,10,5)])
