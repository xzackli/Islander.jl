using Documenter, Islander

makedocs(;
    modules=[Islander, Pixell],
    format=Documenter.HTML(),
    pages=[
        "Home" => "index.md",
    ],
    repo="https://github.com/xzackli/Islander.jl/blob/{commit}{path}#L{line}",
    sitename="Islander.jl",
    authors="xzackli",
    assets=String[],
)

deploydocs(
    repo = "github.com/xzackli/Islander.jl.git",
)
