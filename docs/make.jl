using TriangleSingularity
using Documenter

DocMeta.setdocmeta!(TriangleSingularity, :DocTestSetup, :(using TriangleSingularity); recursive = true)

const page_rename = Dict("developer.md" => "Developer docs") # Without the numbers
const numbered_pages = [
  file for
  file in readdir(joinpath(@__DIR__, "src")) if file != "index.md" && splitext(file)[2] == ".md"
]

makedocs(;
    modules = [TriangleSingularity],
    authors = "Misha Mikhasenko <mikhail.mikhasenko@gmail.com>",
    repo = "https://github.com/mmikhasenko/TriangleSingularity.jl/blob/{commit}{path}#{line}",
    sitename = "TriangleSingularity.jl",
    format = Documenter.HTML(; canonical = "https://mmikhasenko.github.io/TriangleSingularity.jl"),
    pages = ["index.md"; numbered_pages],
)

deploydocs(; repo = "github.com/mmikhasenko/TriangleSingularity.jl")
