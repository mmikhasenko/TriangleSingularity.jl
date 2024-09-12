using TriangleSingularity
using Test

begin
    const mπ = 0.13957018
    const mK = 0.493677
    const mB = 5.279
    const mKst = 0.89166
    const mQ = 2mπ-0.01
    #
    const mK² = mK^2
    const mπ² = mπ^2
    const mB² = mB^2
    const mKst² = mKst^2
    const mQ² = mQ^2
    #
    const iϵ = 1e-10im
end


@testset "Basic chech" begin
    M3², M2², M1² = mB², mKst², mQ²
    m2², m3² = mπ², mπ²
    m1² = mK²
    #
    @test triangleloop(m1², m2², m3², M1²-iϵ, M2², M3²) isa Complex{Float64}
end
