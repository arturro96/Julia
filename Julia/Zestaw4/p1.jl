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

rozwiązanie = lotka(3.0, 0.5, 1.5, 0.6, 0.0, 10.0)

for i=1:20
  @show rozwiązanie[i]
end



iter=(kon-pocz)/20.0

fname = "savetuple12.csv"
csvfile = open(fname, "w")
write(csvfile, "t,x,y,experiment\n")
for i=1:20
   write(csvfile, string(pocz),",",string(rozwiązanie[i][1]),",",string(rozwiązanie[i][2]),",","exp1", "\n")
   pocz=pocz+iter
end
close(csvfile)
