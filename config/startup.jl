atreplinit() do repl
    try
        @eval using Pkg
        haskey(Pkg.installed(), "Revise") || @eval Pkg.add("Revise")
    catch
    end
    try
        @eval using Revise
        @async Revise.wait_steal_repl_backend()
#  Don't track Gadfly with Revise
push!(Revise.dont_watch_pkgs, :Gadfly)
push!(Revise.dont_watch_pkgs, :Compose)
    catch
    end
end

