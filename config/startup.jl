
atreplinit() do repl
    try
        @eval using Revise
        @async Revise.wait_steal_repl_backend()
    catch e
        @warn(e.msg)
    end

push!(Revise.dont_watch_pkgs, :Gadfly)
push!(Revise.dont_watch_pkgs, :Compose)
end
