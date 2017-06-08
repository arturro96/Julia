using Plots
Plots.gr()

# punkt o współrzędnych (x,y) należy do zbioru Julii o parametrze  c
# jeśli dla liczby zespolonej z=x+i*y
# ciąg zₙ₊₁=zₙ²+c , nie dąży do nieskończoności

# dążenie do nieskończoności sprawdzamy ustawiająć maksymalną liczbę iteracji i sprawdzając
# czy kolejne wyrazy ciągu nie przekroczą zadanego progu (tutaj 2) w tej (bądź mniejszej)
# liczbie iteracji

# funkcja sprawdzająca, czy punkt z należy do zbioru Julii o parametrze c
function generate_julia(z; c=2, maxiter=200)
    for i=1:maxiter
        if abs(z) > 2
            return i-1
        end
        z = z^2 + c
    end
    maxiter
end

# obliczamy zbiór Julii na płaszczyźnie punktów od-do.

function calc_julia!(julia_set, xrange, yrange; maxiter=200, height=400, width_start=1, width_end=400)
   for x=width_start:width_end
        for y=1:height
            z = xrange[x] + 1im*yrange[y]
            julia_set[x, y] = generate_julia(z, c=-0.70176-0.3842im, maxiter=maxiter)
        end
    end
end

# główna funkcja

function calc_julia_main(h,w)
  # ustawiamy płaszczyznę
    xmin, xmax = -2,2
   ymin, ymax = -1,1
   xrange = linspace(xmin, xmax, w)
   yrange = linspace(ymin, ymax, h)
	println(xrange[100],yrange[101])
   julia_set = Array(Int64, (w, h))

   # obliczamy
   @time calc_julia!(julia_set, xrange, yrange, height=h, width_end=w)

    # rysujemy
   pl=Plots.heatmap(xrange, yrange, julia_set)
   png("julia")
   return pl
end


calc_julia_main(2000,2000)
