using Gadfly, DataFrames
df=readtable("savetuple11.csv")

dark_panel = Theme(
    panel_fill=colorant"black",
    default_color=colorant"yellow"
)

Gadfly.push_theme(dark_panel)

df1 = df[df[:experiment].== "exp1", :]
df1_x = df1[:,[:t, :x]]
df1_y = df1[:,[:t, :y]]

p1_x = plot(df1_x,  x="t", y="x")
p1_y = plot(df1_y,  x="t", y="y")

df2 = df[df[:experiment].== "exp2", :]
df2_x = df2[:,[:t, :x]]
df2_y = df2[:,[:t, :y]]

p2_x = plot(df2_x,  x="t", y="x")
p2_y = plot(df2_y,  x="t", y="y")

df3 = df[df[:experiment].== "exp3", :]
df3_x = df3[:,[:t, :x]]
df3_y = df3[:,[:t, :y]]

p3_x = plot(df3_x,  x="t", y="x")
p3_y = plot(df3_y,  x="t", y="y")

df4 = df[df[:experiment].== "exp4", :]
df4_x = df4[:,[:t, :x]]
df4_y = df4[:,[:t, :y]]

p4_x = plot(df4_x,  x="t", y="x")
p4_y = plot(df4_y,  x="t", y="y")

pl_x = gridstack([p1_x p2_x; p3_x p4_x])
pl_y = gridstack([p1_y p2_y; p3_y p4_y])

Gadfly.pop_theme()

draw(PNG("pl_x1.png", 1000, 500), pl_x)
draw(PNG("pl_y1.png", 1000, 500), pl_y)

pl_c = plot(df, x=:x, y=:y, color=:experiment, Geom.point, Geom.line)
draw(PNG("pl_c1.png", 500, 500), pl_c)
