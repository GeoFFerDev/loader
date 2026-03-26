-- This goes in loader.lua
local payload_url = "https://raw.githubusercontent.com/GeoFFerDev/hpspy/refs/heads/main/hpspy.lua" -- Put the raw link to the scrambled script here

local success, response = pcall(function()
    return game:HttpGet(payload_url)
end)

if success then
    local func, err = loadstring(response)
    if func then
        func()
    else
        warn("Failed to load script: " .. tostring(err))
    end
else
    warn("Failed to download script. Check your internet connection.")
end
