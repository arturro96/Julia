abstract Zwierzę

type Drapieżnik <: Zwierzę
  nazwa::String
  x::Int
  y::Int
end

type Ofiara <: Zwierzę
  nazwa::String
  x::Int
  y::Int
end

N=5
A=zeros(Int,N,N)

drapieżnik = Drapieżnik("Lew",2,3)
drapieżnik1 = Drapieżnik("Tygrys",2,2)
ofiara = Ofiara("Mysz",5,5)
ofiara1 = Ofiara("Antylopa",1,2)

function wypiszpołożenie(zwierzę::Zwierzę)
  println("Miejsce [", zwierzę.x,"][",zwierzę.y,"] jest zajęte przez ",zwierzę.nazwa)
end

function printArray(A)
  for i = 1:N
    for j = 1:N
      print(A[i,j]," ")
    end
    println()
  end
  println()
end

function dodaj{Zwierzę}(zwierzę::Zwierzę)
  if A[zwierzę.x,zwierzę.y]==0
    if typeof(zwierzę) == Drapieżnik
      A[zwierzę.x,zwierzę.y]=1
    else
      A[zwierzę.x,zwierzę.y]=2
    end
  else
    println("Miejsce [", zwierzę.x,"][",zwierzę.y,"] już zajęte")
  end
end



function odległość(z1::Zwierzę, z2::Zwierzę)
  x=abs(z1.x-z2.x)
  y=abs(z1.y-z2.y)
  return x+y
end


function interakcja(drapieżnik::Drapieżnik, ofiara::Ofiara)
  A[ofiara.x,ofiara.y]=0
end

function interakcja(ofiara::Ofiara, drapieżnik::Drapieżnik)
  i=0
  while i!=1
    a = randperm(N)[1]
    b = randperm(N)[1]
    if A[a,b]==0
      A[a,b]=2
      i+=1
    end
  end
  A[ofiara.x,ofiara.y]=0
end

function interakcja(drapieżnik::Drapieżnik, drapieżnik1::Drapieżnik)
  println("Wrrrr")
end


function interakcja(ofiara::Ofiara, ofiara1::Ofiara)
  println("Beeee")
end


println("Drapieżnik=1")
println("Ofiara=2")

printArray(A)
println()

dodaj(drapieżnik)
dodaj(ofiara)
dodaj(drapieżnik1)
dodaj(ofiara1)
println("Dodano zwierzęta")
wypiszpołożenie(drapieżnik)
wypiszpołożenie(drapieżnik1)
wypiszpołożenie(ofiara)
wypiszpołożenie(ofiara1)
printArray(A)

q = odległość(drapieżnik, ofiara)
println("Odległość między drapieżnik, a ofiara = ",q)

println("Ofiara z miejsca [", ofiara.x,",",ofiara.y,"] znika")
interakcja(drapieżnik,ofiara)
printArray(A)

println("Ofiara zmienia położenie")
interakcja(ofiara1,drapieżnik)
printArray(A)

interakcja(drapieżnik1,drapieżnik)

interakcja(ofiara,ofiara1)
