-- === GEOFFERDEV'S HUB LOADER ===

-- 1. Point to your EXACT Loader2 repository link (with cache bypass)
local database_url = "https://raw.githubusercontent.com/GeoFFerDev/Loader2/refs/heads/main/Loader2.lua?nocache=" .. tostring(os.time())

-- Fetch the database safely
local successDB, Games = pcall(function()
    local response = game:HttpGet(database_url)
    
    -- Safety check: Stop if GitHub returns a 404 Not Found
    if response == "404: Not Found" then 
        return nil 
    end
    
    return loadstring(response)()
end)

if not successDB or type(Games) ~= "table" then
    warn("❌ Error: Could not read Loader2 from GitHub. Check if the raw link is correct.")
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
    warn("You need to add this exact ID to your Loader2 file: [" .. tostring(game.PlaceId) .. "]")
end
