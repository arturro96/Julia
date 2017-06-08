function wypisuj()
  id=1
  @sync for i = [2, 1, 3]
    j=0
    @async begin
       while(j<10)
           if(id==i)
             print(id, " ")
             id=id%3 + 1
             j=j+1
           else
             sleep(0.00001)
           end
         end
       end
    end
    println()
  end

wypisuj()
