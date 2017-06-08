using DifferentialEquations

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


soll = lotka(1.0, 1.5, 1.25, 2.25,0.0, 10.0)
using Gadfly
using DataFrames

df17=DataFrame(t=soll.t, x1=map(x->x[1],soll.u))

p=plot(df17,  x="t", y="x1")

draw(PNG("r2.png", 500, 500), p)


#p1= @show solution[1]
#p2 =@show solution[2]
#p3 =@show solution[3]
#p4 =@show solution[4]
#p5 =@show solution[5]
