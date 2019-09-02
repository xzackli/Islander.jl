using Islander
using WCS
using Test

@testset "Islander.jl" begin
    # write some test for what will go in Islander
end

@testset "Pixell.jl" begin

    a = Enmap(3.0 .* ones(2,3), WCSTransform(2))
    b = Enmap(2.0 .* ones(2,3), WCSTransform(2))

    # broadcasting
    @test a .+ b ≈ (5.0 .* ones(2,3))
    @test a .* b ≈ (6.0 .* ones(2,3))
    @test a .- b ≈ (1.0 .* ones(2,3))
    @test a ./ b ≈ (1.5 .* ones(2,3))

    # get / set
    c = Enmap(3.0 .* ones(2,3), WCSTransform(2))
    c[1,1] = 1.0
    @test c[1,1] ≈ 1.0
    @test c[2,1] ≈ 3.0

end
