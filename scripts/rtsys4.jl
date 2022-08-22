# This script solves GMRT exercise sheet 5 completely in Julia

using LinearAlgebra
using ControlSystems
using ModelingToolkit
using DifferentialEquations
using Plots
using LaTeXStrings

##
"""
    Aufgabe 1.1 - Stabilität des Systems
"""

# @variables t z(t) y(t)
# @parameters u(t)
# D = Differential(t)

# eqs = [
#     D(z) ~ z + 5u,
#     y ~ 2z
# ]

# @named dynamics = ODESystem(eqs)

# # Remove equation for y(t) since it is an algebraic equation, not an ODE
# simplified = structural_simplify(dynamics)
# states(simplified)
# equations(simplified)
# observed(simplified)

# # Simulate system step response (u=1) and plot solution
# prob = ODEProblem(
#     simplified,
#     [z => 0],
#     (0, 1),
#     [u => 1]
# )
# sol = solve(prob)
# plot(sol)
# # Output y is not lost in simplification
# plot(sol, vars=[z, y])

##

# Define state space representation
A = 1
b = 5
c = 2
d = 0

# Create state space system MATLAB-style
sys = ss(A, b, c, d)

# Plot step and impulse response
plot(step(sys, 1), ylim=(-1, 30), label="open-loop step response")
plot(impulse(sys, 1), ylim=(-1, 30), label="open-loop impulse response")

##
"""
    Aufgabe 1.2 - Rückführungsvector und Vorfilter für Zustandsregler
"""

λ = -1
R = (1 - λ) / 5

V = -λ / 10

##
# Closed loop control system:
sys_cl = ss(A - b * R, V * b, c, d)

## Plot closed-loop step response
# plot(step(sys_cl, 5), label=L"\lambda=%$λ")
res = step(sys_cl, 5)
plot(res, label="y(t)")
u = V * res.u' - R * res.x'
plot!(res.t, u, label="u(t)")
plot!(t -> 1, label="step")

##
"""
    Aufgabe 1.3: P-Regler
"""

K = 1.5

λ = 1 - 10K

sys_cl = ss(A - K * b * c, K * b, c, d)

## Plot closed-loop step response
# plot(step(sys_cl, 5), label=L"\lambda=%$λ")
res = step(sys_cl, 5)
plot!(res, label="y(t)")
u = K * (res.u' - res.y')
plot!(res.t, u, label="u(t)")
plot!(t -> 1, label="step")

