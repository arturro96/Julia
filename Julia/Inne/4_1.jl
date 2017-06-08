using Gadfly, DataFrames
df4=readtable("medical.csv")
print("size is ", size(df4))
df4[1:3, 1:size(df4,2)]
df4[:Płeć]= ifelse(df4[:Płeć].==1, "M", "K")
df4[:Drink]= ifelse(df4[:Drink].==1, "T", "N")
df4[1:3, 1:size(df4,2)]
set_default_plot_size(20cm, 12cm)
p=plot(df4, x="Wiek", y="sBP", color="Płeć", Geom.bar(position=:dodge))
draw(PNG("r3.png", 500, 500), p)
show(df4)
