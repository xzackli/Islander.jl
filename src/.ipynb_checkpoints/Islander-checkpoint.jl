module Islander

export Enmap, enfft, enifft, enfft!, enifft!
include("Pixell.jl")

using DelimitedFiles
using Distributions
using FFTW
"""
Draws an inverse gamma distribution given the sky map spectrum.
"""
function inverse_gamma(sigma_ell::Array{T,1}) where {T}
    lmax = size(sigma_ell, 1)
    gauss = Normal()
    Cl_realization = zeros(T, lmax)
    for ell in 1:lmax
        rho = 0.0
        for i in 1:2*ell-1
            rho += convert(T,rand(gauss)^2)
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
    return theory_ells, theory_cltt
end

"""
Utility function which prepends some zeros to an array. It makes a copy instead
of modifying the input.
"""
function ellpad(arr::Array{T,N}; nzeros=1) where {T,N}
    result = arr[:]
    pushfirst!(result, zeros(T, nzeros)...)
    return result
end

"""
Quick and dirty binned, flat-sky power spectra.
"""
function ell_binpow( power, ell, Δell, ell_max=2500; use_Dell=false )
    nbin = convert(Int, ceil(ell_max / Δell)) + 1
    bin_centers = zeros(nbin)
    bin_means = zeros(nbin)
    for i in 1:nbin
        bin_left = (i-1) * Δell
        bin_right = bin_left + Δell
        bin_centers[i] = (bin_left + bin_right) / 2.0
        filt = (ell .> bin_left) .& (ell .<= bin_right)
        bin_data = power[filt]
        if use_Dell
            bin_data .*= ell[filt]
        end
        bin_means[i] = sum(bin_data) / size(bin_data,1)
    end
    
    bin_centers, bin_means
end


end # module
