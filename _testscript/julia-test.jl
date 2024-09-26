# test_script.jl

using Test

function add(a, b)
    return a + b
end

@testset "Addition Tests" begin
    @test add(1, 1) == 2
    @test add(-1, 1) == 0
    @test add(0, 0) == 0
    @test isapprox(add(0.1, 0.2), 0.3, atol=1e-7)
end

# Run tests using: julia test_script.jl
