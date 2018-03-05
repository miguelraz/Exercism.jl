import JSON

function init()
    config = JSON.parsefile(joinpath(homedir(), ".exercism.json"))
end
