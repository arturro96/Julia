import Base.Meta: isexpr

macro fill_series(wzór)
  lewa_strona, prawa_strona = wzór.args
  if isexpr(lewa_strona.args[2], :call) #sprawdzamy czy indeks jest symbolem czy callem
    indeks = filter(znak -> isa(znak, Symbol), lewa_strona.args[2].args[2:end])[1] #znajduje symbol
  elseif isa(lewa_strona.args[2], Symbol) #gdy indeks nie jest wyrażeniem
    indeks = lewa_strona.args[2]
  end
  lewy_offset = wylicz_offsety(lewa_strona)  #zwraca tablicę przesunięć w wyrażeniu po lewej stronie
  prawy_offset = wylicz_offsety(prawa_strona)  #zwraca tablicę przesunięć w wyrażeniu po prawej stronie
  l_min = minimum(lewy_offset)
  l_max = maximum(lewy_offset)
  p_min = minimum(prawy_offset)
  p_max = maximum(prawy_offset)
  indeks_pocz = min(l_min,p_min)
  maksimum = max(l_max,p_max)
  quote   #tworzę wyrażenie
    for $indeks in $:($(1 - indeks_pocz):(length($(lewa_strona.args[1])) - $maksimum))
      $wzór
    end
  end
end

function wylicz_offsety(wzór_::Expr)
  isexpr(wzór_,:call) && return [[wylicz_offsety(a) for a in wzór_.args[2:end]]...] #rekurencja aż dojdziemy do indeksów
  isexpr(wzór_,:ref) && return wylicz_offset_z_ref(wzór_.args[2]) #dla każdego :ref wyznaczamy offset
  return Int64[]
end

wylicz_offsety(x) = Int64[]
wylicz_offset_z_ref(s::Symbol) = 0
wylicz_offset_z_ref(x::Number) = x

function wylicz_offset_z_ref(wzór_::Expr)
  #wzór_.args[1] = znak w indeksie, plus albo minus
  if isexpr(wzór_,:call)
    wzór_.args[1] == :+ && return sum([wylicz_offset_z_ref(a) for a in wzór_.args[2:end]])
    wzór_.args[1] == :- && return (wylicz_offset_z_ref(wzór_.args[2]) - sum([wylicz_offset_z_ref(a) for a in wzór_.args[3:end]]))
  end
  return(0)
end

y=zeros(10)
y[1:3]=[-1,1,1]

@fill_series y[t+1] = y[t] + y[t-1] + y[t-2]
println(y)
