using Gadfly
p1 = plot(x=[1,2,3], y=[4,5,6])
p2 = plot(x=[1,2,3], y=[6,7,8])
vstack(p1,p2)

p3 = plot(x=[5,7,8], y=[8,9,10])
p4 = plot(x=[5,7,8], y=[10,11,12])

# to jest to samo
#vstack(hstack(p1,p2),hstack(p3,p4))
pl = gridstack([p1 p2; p3 p4])
draw(PNG("g2.png", 500, 500), pl)
