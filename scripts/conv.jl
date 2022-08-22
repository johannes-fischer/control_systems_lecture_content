using Plots
using DSP
using ControlSystems

dt = 0.001
t0 = -1
T = 100
t = t0:dt:T
σ(t) = t >= 0 ? 1.0 : 0.0
rectangle(t0, w, h) = t -> h * (σ(t - t0) - σ(t - (t0 + w)))
# triangle(t0, w, h) =

plot()

rect = rectangle(1, 3, 1)
x = rect.(t)
x = σ.(t)
plot!(t, x)

rect = rectangle(1, 1, 0.5)
y = rect.(t)
y = σ.(t)
plot!(t, y)

z = dt .* conv(x, y)

supp_x = (t0, T)
supp_y = (t0, T)
supp_z = supp_x .+ supp_y
supp_x = t
supp_y = t
supp_z = extrema(supp_x) .+ extrema(supp_y)
t_z = range(supp_z..., step=dt)
@assert length(t_z) == length(z)
plot!(t_z, z)
