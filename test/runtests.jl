using TriangleSingularity
using TriangleSingularity.Polynomials
using Test

const mπ = 0.13957018
const mK = 0.493677
const mKst = 0.89166
#
const mK² = mK^2
const mπ² = mπ^2
const mKst² = mKst^2

@testset "Basic chech" begin
    ma1² = 1.42^2
    #
    M3², M2², M1² = ma1², mKst², mQ²
    m2², m3² = mπ², mπ²
    m1² = mK²
    #
    @test triangleloop(m1², m2², m3², M1²-iϵ, M2², M3²) isa Complex{Float64}
end

@testset "Position of TS" begin
    mf0 = 0.989
    #
	M2², M1² = mπ², mf0^2
    m1², m2², m3² = mKst², mK², mK²
    #
	x = Polynomial([0im,1])
    P = landau_determinant(m1², m2², m3², M1², M2², x)
    #
	@test round.(sqrt.(roots(P)); digits=2) .|> real == [1.42, 1.46]
end
