module ComputedGeodesicEquations

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

end # module
