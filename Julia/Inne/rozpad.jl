
# równanie rozpadu promieniotwórczego

using DifferentialEquations

f = @ode_def Rozpad123 begin
  dx = - λ*x
end λ=>1.5

u0 = [8.0]

tspan = (0.0,10.0)

prob = ODEProblem(f,u0,tspan)

sol = solve(prob, RK4(), dt=0.01)
