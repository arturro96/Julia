using SymEngine, DifferentialEquations
# Make our initial condition be symbolic expressions from SymEngine
x0,y0 = @vars x0 y0
u0 = [x0;y0]
f = function (t,y,dy)
  dy[1] = 1.5y[1] - y[1]*y[2]
  dy[2] = -3y[2] + y[1]*y[2]
end
prob = ODEProblem(f,u0,(0.0,1.0))
sol = solve(prob,RK4(),dt=1/2)
println(prob)
