using Documenter, WAdag

makedocs(modules=[WAdag],
	sitename="WAdag.jl",
	analytics="UA-132838790-1",
	pages=[
        "Introduction" => "index.md"
    ])

deploydocs(repo="github.com/queryverse/WAdag.jl.git")
