-- This is what users paste into Delta

-- 1. Fetch your GameList database from GitHub
local database_url = "https://raw.githubusercontent.com/GeoFFerDev/Loader2/refs/heads/main/Loader2.lua"
local Games = loadstring(game:HttpGet(database_url))()

-- 2. Check if the game they are currently playing is in your database
local script_url = Games[game.PlaceId]

if script_url then
    -- 3. If the game is supported, download and run the obfuscated VM
    local success, result = pcall(function()
        return game:HttpGet(script_url)
    end)

    if success then
        loadstring(result)()
    else
        warn("Failed to load script. Check your internet connection.")
    end
else
    -- 4. If the game is not in the list, tell the user
    warn("This game is not currently supported by GeoFFerDev's Hub!")
end
