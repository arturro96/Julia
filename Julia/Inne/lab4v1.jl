using DifferentialEquations

pocz=0.0
kkon=0.0

function lotka(a, b, c, d, e1, e2)
  global pocz, kon
  pocz=e1
  kon=e2
  f = function (t,u,du) # Define f as an in-place update into du
      du[1] = a*u[1] - b*u[1]*u[2]
      du[2] = -d*u[2]+ c*u[1]*u[2]
  end
  u0 = [1.0;1.0]; tspan = (e1,e2)
  prob = ODEProblem(f,u0,tspan)
  sol = solve(prob,RK4(),dt=1/2)
  return sol
end

#a - częstość narodzin ofiar lub współczynnik przyrostu ofiar,
#b - częstość umierania ofiar na skutek drapieżnictwa,
#c - częstość narodzin drapieżników lub współczynnik przyrostu drapieżników,
#d - częstość umierania drapieżników lub współczynnik ubywania drapieżników,

solution = lotka(2.00, 0.01, 0.09, 0.05, 0.0, 5.0)

p1= @show solution[1]
p2 =@show solution[2]
p3 =@show solution[3]
p4 =@show solution[4]
p5 =@show solution[5]

p=[p1,p2,p3,p4,p5]

iter=(kon-pocz)/5.0

fname = "savetuple.csv"
csvfile = open(fname, "w")
write(csvfile, "t,x,y,experiment\n")
for i=1:5
    write(csvfile, string(pocz),",",string(p[i][1]),",",string(p[i][2]),",","exp1", "\n")
    pocz=pocz+iter
end
close(csvfile)
