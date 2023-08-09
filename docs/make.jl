using AllenSDK
using Documenter

DocMeta.setdocmeta!(AllenSDK, :DocTestSetup, :(using AllenSDK); recursive=true)

makedocs(;
    modules=[AllenSDK],
    authors="brendanjohnharris <brendanjohnharris@gmail.com> and contributors",
    repo="https://github.com/brendanjohnharris/AllenSDK.jl/blob/{commit}{path}#{line}",
    sitename="AllenSDK.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://brendanjohnharris.github.io/AllenSDK.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/brendanjohnharris/AllenSDK.jl",
    devbranch="main",
)
