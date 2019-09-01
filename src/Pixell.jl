"""
Map utilities for rectangular pixels.
"""
module Pixell

using WCS  # wraps the WCSLIB C library
using FFTW


"""
Map type, contains an AbstractArray and a WCS object, but behaves like the
AbstractArray it contains for array operations.
"""
struct Enmap{T,N,AA<:AbstractArray} <: AbstractArray{T,N}
    data::AA  # some kind of abstract array
    wcs::WCSTransform  # WCS object from WCS.jl
end

# getters
Base.parent(A::Enmap) = A.data
get_wcs(A::Enmap) = A.wcs

# constructor
Enmap(A::AbstractArray{T,N}, wcs::WCSTransform) where {T,N} =
    Enmap{T,N,typeof(A)}(A, wcs)

# array details
parenttype(::Type{Enmap{T,N,AA}}) where {T,N,AA} = AA
parenttype(A::Enmap) = parenttype(typeof(A))
Base.eachindex(::IndexCartesian, A::Enmap) = CartesianIndices(axes(A))
Base.IndexStyle(::Type{EM}) where {EM<:Enmap} = IndexStyle(parenttype(EM))
Base.size(A::Enmap) = size(parent(A))
Base.size(A::Enmap, d) = size(parent(A), d)

# create a similar map by making a deep copy of the WCS
function Base.similar(A::Enmap, ::Type{T}, dims::Dims) where T
    B = Enmap(similar(parent(A), T, dims), deepcopy(get_wcs(A)))
end

# send all the get and set to the data inside the enmap
@inline function Base.getindex(A::Enmap{T,N,AA}, I::Vararg{Int,N}) where {T,N,AA}
    parent(A)[I...]
end
@inline function Base.getindex(A::Enmap{T,N,AA}, i::Int) where {T,N,AA}
    parent(A)[i]
end
@inline function Base.setindex!(A::Enmap{T,N,AA}, val, I::Vararg{Int,N}) where {T,N,AA}
    parent(A)[I...] = val
end
@inline function Base.setindex!(A::Enmap{T,N,AA}, val, i::Int) where {T,N,AA}
    parent(A)[i] = val
end


"""
Generate a plate carree WCS object.

pixell python reference:
pos :
def car(pos, res=None, shape=None, rowmajor=False, ref=None):
	pos, res, shape, mid = validate(pos, res, shape, rowmajor)
	w = WCS(naxis=2)
	w.wcs.ctype = ["RA---CAR", "DEC--CAR"]
	w.wcs.crval = np.array([mid[0],0])
	if ref is "standard": ref = (0,0)
	return finalize(w, pos, res, shape, ref=ref)
"""
function car(pos, res, shape)
    # WCSTransform(2;
    #     cdelt = [-0.066667, 0.066667],
    #     ctype = ["RA---CAR", "DEC--CAR"],
    #     crpix = [-234.75, 8.3393],
    #     crval = [0., -90],
    #     pv    = [(2, 1, 45.0)])
    WCSTransform(2) # placeholder
end

end # module
