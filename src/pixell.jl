"""
Map utilities for CAR pixelization.
"""
module Pixell

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

end # module