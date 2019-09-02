module Islander

export Enmap, car
include("Pixell.jl")

using DelimitedFiles

"""
Draws an inverse gamma distribution given the sky map spectrum.
"""
function inverse_gamma(sigma_ell)
    lmax = size(sigma_ell, 1)
    Cl_realization = zeros(lmax)
    for ell in 1:lmax
        rho = 0.0
        for i in 1:2*ell-1
            rho += rand(gauss)^2
        end
        Cl_realization[ell] = (2 * ell + 1) * sigma_ell[ell] / rho
    end
    return Cl_realization
end


"""
Utility function to load ``C_{\\ell}^{TT}`` when working in the notebooks.
"""
function util_get_cltt(lmax=10000)
    camb = readdlm("../data/camb_theory.dat", skipstart=1)
    camb_ells = convert.(Int64, camb[1:lmax-1,1])
    camb_cltt = camb[1:lmax-1,2]
    theory_ells = collect(1:lmax)
    theory_cltt = zeros(lmax)
    theory_cltt[ camb_ells ] = (camb_cltt
        .* 2π ./ camb_ells ./ (camb_ells .+ 1))
    return theory_cltt, theory_ells
end

"""
Utility function which prepends some zeros to an array. It makes a copy instead
of modifying the input.
"""
function ellpad(arr; nzeros=1)
    result = arr[:]
    pushfirst!(result, zeros(nzeros)...)
    return result
end

end # module
