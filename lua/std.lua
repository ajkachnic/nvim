-- standard library functions
-- basic utils
local M = {
	string = {},
	table = {},
}


function M.string.starts_with(str, start)
   return str:sub(1, #start) == start
end

function M.string.ends_with(str, ending)
   return ending == "" or str:sub(-#ending) == ending
end

function M.table.merge(a, b)
    local merged = M.table.copy(a)

    for k, v in pairs (b) do
        merged[k] = v
    end

    return merged
end

--- make a shallow copy of a table
function M.table.copy(t)
    local copied = {}
    for k, v in pairs(t) do
        copied[k] = v
    end

    return copied
end

return M
