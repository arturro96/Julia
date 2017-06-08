
# Sample data
n  = 10
x  = collect(1:n)
y1 = rand(n)
y2 = rand(n)
y3 = rand(n)

# Put the data in a DataFrame
using DataFrames
d = DataFrame(
  x = vcat(x,x,x),
  y = vcat(y1,y2,y3),
  group = vcat( Compat.repeat("1",n), Compat.repeat("2",n), Compat.repeat("3",n) )
)

show(d)
