function iterate()
     for i=1:2
         println(1)
     end
end


function iterate2()
     for i=1:2
         println(2)
     end
end


function iterate3()
     for i=1:2
         println(3)
     end
end

################################################################################

TaskTable = [Task(iterate), Task(iterate2), Task(iterate3)]


l = ReentrantLock()

@sync for i in 1:3
  a=0
  for x in TaskTable[i]
     @async begin
     println("cos")
     lock(l)
     try
       print(x)
     finally
       unlock(l)
     end
   end
  end
  end
