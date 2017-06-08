if nprocs() == 1
    addprocs(4)
end
# wszystkie procesy
nprocs() |> println
# procesy workerów
# tablica identyfikatorów
workers() |> println
# ilość
nworkers()|> println

ref = remotecall(myid,workers()[1])
println(ref)

_id = fetch(ref)
println(_id)
tic()
ref = remotecall(x->(sleep(x);10x),workers()[1],2)
toc()

r = @spawn rand(2,2)
s = @spawn 1 .+ fetch(r)
id = fetch(s)
println(id)
