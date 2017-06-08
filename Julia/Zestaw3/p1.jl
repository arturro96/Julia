@generated function harmoniczna{T}(x::T...)
    suma = :(0)
    for i = 1:length(x)
        suma = :($suma + (1 / x[$i]))
    end
    wynik = :(length(x) / $suma)
    return wynik
end

println(harmoniczna(2,2,5,7))
