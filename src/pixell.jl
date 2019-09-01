
"""
Map class which will eventually have enmap functionality.
"""
mutable struct Enmap{T}
    data::Array{T}
    # presumably some WCS solution here
end

"""
Another test function in `pixell.jl`.
"""
function test()
    println("test")
end
