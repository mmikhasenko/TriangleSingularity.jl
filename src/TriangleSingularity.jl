module TriangleSingularity

using QuadGK
using Polynomials

export triangleloop
include("triangleloop.jl")

export landau_determinant
include("determinant.jl")

end
