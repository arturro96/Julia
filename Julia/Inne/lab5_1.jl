function z1()
  for i=1:10
    println(1)
  end
end

function z2()
  for i=1:10
    println(2)
  end
end

function z3()
  for i=1:10
    println(3)
  end
end


TaskTable = [Task(z1), Task(z2), Task(z3)]
#l = ReentrantLock()

@sync for i in 1:3
  a=0
  for x in TaskTable[i]
     @async begin
       if x == 1
         #print(x)
       end

     end
  end
end


function f2()
@sync begin
for i in 1:3
    @async begin
      println(TaskTable[i])
    end
end
end
end

#f2()

function start()
  z_1 = Task(z1)
  z_2 = Task(z2)
  z_3 = Task(z3)
  for i=1:10
    println(consume(z_1))
    println(consume(z_2))
    println(consume(z_3))
  end
end

#start()
