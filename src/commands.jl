const cli_prefix = joinpath(Pkg.dir("Exercism"), "bin", "exercism")

"Call the exercism cli binary with given args."
function run_cli(args::Cmd)
    run(`$cli_prefix $args`)
end

"Fetch the next unsubmitted problem."
function fetch()
    run_cli(`fetch julia`)
end

"Fetch a specific problem."
function fetch(exercise)
    run_cli(`fetch julia $exercise`)
end

"List all available problems."
function list()
    run_cli(`list julia`)
end

"Fetch information about the progress with the track."
function status()
    run_cli(`status julia`)
end

"Skip a problem given its slug."
function skip(exercise)
    run_cli(`skip julia $exercise`)
end

"Write config values to ~/.exercism.json."
function configure(options)
    # Check if option keys are valid
    for k in keys(options)
        k ∉ ("apiKey", "dir", "api", "xapi") && throw(ArgumentError("Option $k is not supported."))
    end

    for (k, v) in options
        config[k] = v
    end

    # Write to config file
    open(joinpath(homedir(), ".exercism.json"), "w") do f
        write(f, JSON.json(config))
    end
end
