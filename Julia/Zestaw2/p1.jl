function f1()
    for i = 1:1000000
      j = rand(1:300)
      x = sin(j)
      #println(j)
    end
end

function f2()
    for i = 1:100000
      j = rand(1:300)
      x = sin(j)
      #println(j)
    end
end

@timev f1()
Profile.clear()
@profile f1()
Profile.print()

@timev f2()
Profile.clear()
@profile f2()
Profile.print()
