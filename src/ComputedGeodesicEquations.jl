module ComputedGeodesicEquations

using Parameters
import GeodesicBase:
    AbstractMetricParams, geodesic_eq, geodesic_eq!, constrain, on_chart, inner_radius

"""
    let_unpack(u, v, expr)

Helper utility which unpacks a position four-vector `u` and a velocity four-vector `v` into
predefined symbols, via

```julia
t, r, θ, ϕ = u[1:4]
v_t, v_r, v_theta, v_phi = v[1:4]
```

Wraps `expr` in a `let` block, with these symbols defined locally.
"""
macro let_unpack(u, v, expr)
    quote
        @inbounds let t = $u[1],
            r = $u[2],
            θ = $u[3],
            ϕ = $u[4],
            v_t = $v[1],
            v_r = $v[2],
            v_theta = $v[3],
            v_phi = $v[4]

            $expr
        end
    end |> esc
end

include("boyer-lindquist.jl")
include("eddington-finkelstein.jl")
include("morris-thorne.jl")

export geodesic_eq, geodesic_eq!, constrain, on_chart, inner_radius 

end # module
