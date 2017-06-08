using DifferentialEquations

f = @ode_def Rozpad123 begin
  dx = - λ*x
end λ=>1.5

u0 = [8.0]

tspan = (0.0,10.0)

prob = ODEProblem(f,u0,tspan)

sol = solve(prob, RK4(), dt=0.01)

using Gadfly
using DataFrames

df17=DataFrame(t=sol.t, x1=map(x->x[1],sol.u))
show(df17)

#pl = plot(df17,  x="t", y="x1")
#draw(PNG("g3.png", 500, 500), pl)
