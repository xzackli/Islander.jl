using Documenter, Islander

makedocs(;
    modules=[Islander],
    format=Documenter.HTML(assets=String[]),
    pages=[
        "Home" => "index.md",
    ],
    repo="https://github.com/xzackli/Islander.jl/blob/{commit}{path}#L{line}",
    sitename="Islander.jl",
    authors="xzackli"
)

deploydocs(
    repo = "github.com/xzackli/Islander.jl.git",
)
