--- @param file string? The file we want to read
--- @return table env Return a table with all the file keys
---
return function(file)
    local env = {}

    for line in io.lines(file) do
        local key, value = line:match("^%s*(.-)%s*=%s*(.-)%s*$")

        if key and value then
            env[key] = value
        end
    end
    return env    
    
end