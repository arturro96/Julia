function typy(A)
  x=A
  i=1
  while A!=Any    #wyznaczam wielkość tablicy
    A = supertype(A)
    i+=1
  end
  array=Array{Any}(i)
  array[1]=x
  i=2
  while x!=Any
    array[i]=supertype(x)
    x = supertype(x)
    i+=1
  end
  i=length(array)
  while i!=1
    print(array[i],"-->")
    i-=1
  end
  println(array[1])
end

typy(Float16)
