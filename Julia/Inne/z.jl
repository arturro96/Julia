macro fill_series(wzór)
  l,r = wzór.args

  idx =
    if isa(l.args[2], Expr) #sprawdzamy czy indeks jest pojedyczym znakiem czy wyrażeniem np. (t+1)
      filter(x -> isa(x, Symbol), l.args[2].args[2:end])[1]   #znajduje symbol
    elseif isa(l.args[2], Symbol)   #czyli gdy np. y[t], wtedy "t" jest idx
      l.args[2]
    end
  if isa(r,Expr)
    println("Jtes")
  end

  println("idx = ",idx)
  #show(wzór)
  k = wzór.args
  println(k[2].args)
end

function offset(ex::Expr)
  isa(ex,Expr) && return [[get_offsets(a) for a in ex_.args[2:end]]...]
end

function get_offset_from_ref(ex_::Expr)
  if isa(ex_,Symbol)
    ex_.args[1] == :+ && return sum([get_offset_from_ref(a) for a in ex_.args[2:end]])
    ex_.args[1] == :- && return (get_offset_from_ref(ex_.args[2]) - sum([get_offset_from_ref(a) for a in ex_.args[3:end]]))
  end
    warning("Didn’t expect to get here")
  return(0)
end

y=zeros(10)
y[1:2]=[1,1]
for i in 3:10
  y[i]=y[i-1]+y[i-2]
end
println(y)

@fill_series y[1+t] = 0.8y[t] + 0.02y[t-2] + e[t+1]
