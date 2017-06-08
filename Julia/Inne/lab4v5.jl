using Gadfly, DataFrames
df=readtable("savetuple12.csv")

pl_c = plot(df, x=:x, y=:y, color=:experiment, Geom.point, Geom.line)
draw(PNG("pl_c2.png", 500, 500), pl_c)
