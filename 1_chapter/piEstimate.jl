using PyPlot, PyCall
@pyimport matplotlib.patches as patch

srand(1)
N = 10^5
data = [[rand(),rand()] for _ in 1:N]
indata = filter((x)-> (norm(x) <= 1), data)
outdata = filter((x)-> (norm(x) > 1), data)
piApprox = 4*length(indata)/N
println("Pi Estimate: ", piApprox)

fig = figure("Primitives",figsize=(5,5))
plot(first.(indata),last.(indata),".",ms=0.2);
plot(first.(outdata),last.(outdata),".",ms=0.2);
ax = fig[:add_subplot](1,1,1)
ax[:set_aspect]("equal")
r1 = patch.Wedge([0,0],1,0, 90,fc="none",ec="red")
ax[:add_artist](r1)