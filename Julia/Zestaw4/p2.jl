using Gadfly, DataFrames
df4=readtable("savetuple11.csv")
show(df4)

println("\n")
df3 = df4[df4[:experiment].== "exp1", :]
show(df3)

println()
maksima=by(df4, :experiment, df->maximum(df[:x]))
println("Max - ofiary")
show(maksima)
println("\n")
minima=by(df4, :experiment, df->minimum(df[:x]))
println("Min - ofiary")
show(minima)
println("\n")
maksima1=by(df4, :experiment, df->maximum(df[:y]))
println("Max - drapieżnicy")
show(maksima1)
println("\n")
minima1=by(df4, :experiment, df->minimum(df[:y]))
println("Min - drapieżnicy")
show(minima1)
println("\n")
srednia1=by(df4, :experiment, df->mean(df[:x]))
println("Średnia - ofiary")
show(srednia1)
println("\n")
srednia2=by(df4, :experiment, df->mean(df[:y]))
println("Średnia - drapieżnicy")
show(srednia2)
println()
df4[:Różnica] = map((x,y) -> y - x, df4[:x], df4[:y])
show(df4)
println()