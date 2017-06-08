if nprocs() == 1
    addprocs(4)
end

a = zeros(10)
@sync @parallel for i=1:10
  a[i] = i
end
println(a)

a1=SharedArray(Float64,10)
@sync @parallel for i=1:10
  a1[i] = i
end
println(a1)

a2=SharedArray(Int8,10)
@sync @parallel for i=1:10
  a2[i] = myid()
end
println(a2)
