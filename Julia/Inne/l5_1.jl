
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

function f2()
  @sync begin
    napis=""
    for i in 1:3
      @async begin
        napis=napis * "zadanie $i "
        yield()
        napis=napis * " ($i) etap 1 "
        yield()
        napis= napis * " ($i) etap 2 "
        yield()
      end
    end
  end
  println(napis)
end

f2()
