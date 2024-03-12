local parseEnv = {}

function parseEnv:read(file)
    local env = {}

    for line in io.lines(file) do
        local key, value = line:match("^%s*(.-)%s*=%s*(.-)%s*$")

        if key and value then
            env[key] = value
        end
    end
    return env    
end

return parseEnv