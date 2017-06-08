using DifferentialEquations
using DataFrames

function lotka(a, b, c, d, e1, e2)

  f = function (t,u,du) # Define f as an in-place update into du
      du[1] = a*u[1] - b*u[1]*u[2]
      du[2] = -c*u[2]+ d*u[1]*u[2]
  end
  u0 = [1.0;1.0]; tspan = (e1,e2)
  prob = ODEProblem(f,u0,tspan)
  sol = solve(prob,RK4(),dt=1/2)
  return sol
end



data_tableX = zeros(20)
data_tableY = zeros(20)
df1=DataFrame()

println("cos")

for i=1:4
  solution = lotka(1.0, i, 1.25, i+0.25,0.0, 10.0)
  p1= @show solution[1]
  p2 =@show solution[2]
  p3 =@show solution[3]
  p4 =@show solution[4]
  p5 =@show solution[5]
  data_tableX[(i-1)*5  + 1] = p1[1]
  data_tableX[(i-1)*5 + 2 ] = p2[1]
  data_tableX[(i-1)*5 + 3 ] = p3[1]
  data_tableX[(i-1)*5 + 4 ] = p4[1]
  data_tableX[(i-1)*5 + 5 ] = p5[1]
  data_tableY[(i-1)*5  + 1] = p1[2]
  data_tableY[(i-1)*5 + 2 ] = p2[2]
  data_tableY[(i-1)*5 + 3 ] = p3[2]
  data_tableY[(i-1)*5 + 4 ] = p4[2]
  data_tableY[(i-1)*5 + 5 ] = p5[2]

end

df1[:Col2] = data_tableX
df1[:Col3] = data_tableY

data_table_difference = zeros(20)
x_table = df1[1]
y_table = df1[2]
println(x_table)

for i=1:20
  data_table_difference[i] = x_table[i] - y_table[i]
end
df1[:Col4] = data_table_difference
println("min = ",minimum(x_table[1:5]))
for i=1:4
  println(maximum(x_table[(i-1)*5 + 1:(i*5)]))
  println(minimum(x_table[(i-1)*5 + 1:(i*5)]))
  println(maximum(y_table[(i-1)*5 + 1:(i*5)]))
  println(minimum(y_table[(i-1)*5 + 1:(i*5)]))
end

show(df1)
