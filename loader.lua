-- === GEOFFERDEV'S HUB LOADER ===

-- 1. Point to your new 'Loader2' file on GitHub (with the cache bypass trick)
local database_url = "https://raw.githubusercontent.com/GeoFFerDev/loader/main/Loader2.lua?nocache=" .. tostring(os.time())

-- Fetch the database safely
local successDB, Games = pcall(function()
    return loadstring(game:HttpGet(database_url))()
end)

if not successDB or type(Games) ~= "table" then
    warn("❌ Error: Could not read Loader2 from GitHub. Check if the filename exactly matches the link.")
    return
end

-- 2. The Detective: Print the exact Place ID Delta is running inside
print("--------------------------------------------------")
print("🔍 DEBUG INFO:")
print("The ID of the server you are currently in is: " .. tostring(game.PlaceId))
print("--------------------------------------------------")

-- 3. Check if this ID exists inside your Loader2 file
local script_url = Games[game.PlaceId]

if script_url then
    print("✅ Game recognized! Downloading obfuscated VM...")
    local successScript, result = pcall(function()
        return game:HttpGet(script_url)
    end)

    if successScript then
        loadstring(result)()
    else
        warn("❌ Failed to download the game script. Check your connection.")
    end
else
    -- 4. If the game isn't found, it tells you exactly what number is missing
    warn("❌ Game not supported!")
    warn("You are missing this exact ID in your Loader2 file: [" .. tostring(game.PlaceId) .. "]")
end
