function producer()
         produce("start")
         for n=1:4
           produce(2n)
         end
         produce("stop")
end

p = Task(producer)

println(consume(p))
println(consume(p))
println(consume(p))
println(consume(p))
println(consume(p))
println(consume(p))


println("--->")

function producent()
    println("+ producent zaczyna")
    produce("produkt 1 ")

    produce("produkt 2")
    println("+ producent kończy")
end

function konsument(p::Task)
    println("* konsument zaczyna")
    for s in p
        println("odebrałem ", s)
    end
    println("* konsument kończy")
end

@sync begin
    a = @async producent()
    @async konsument(a)
end

println("<---")

function f1()
 @sync begin
    napis=""
    for i in 1:3
        @async begin
            napis=napis * "zadanie $i "

            napis=napis * " ($i) etap 1 "

            napis= napis * " ($i) etap 2 "

        end
    end
 end
 println(napis)
end

f1()
