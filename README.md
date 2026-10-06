Optimization_Armsworth

MATLAB implementation of a simplified version of the conservation-funding optimization 
framework in Armsworth et al. (2020, Ecological Applications) and Armsworth et al. 
(2023, Frontiers in Ecology and the Environment, WebPanel 1).
Question: given a fixed budget, how should protection funding be allocated across U.S. counties
to maximize the sum of species persistence probabilities?

Model summary
For each species j, persistence probability is
P_j = 1 - exp(-phi_j * S_j)
where S_j is the landscape suitability score of the species' range. For each county, the suitability fraction is
f = (r0 + r1(x) + alpha * u2(x)) / a
a: county area (ha)
r0: already-protected area (GAP 1 + GAP 2)
r1(x) = x / c: newly protected area bought with spending x at cost c per ha
u2(x): unprotected, unconverted land remaining after protection and projected conversion (weighted by alpha)
S_j is the sum over counties of f times the hectares of species j's range in that county. The optimizer then solves
max_x  sum_j  w_j * P_j(S_j(x))     subject to   sum(x) <= budget,  x >= 0
using fmincon (the objective is negated, since fmincon minimizes).
