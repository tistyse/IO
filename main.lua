local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/main/source.lua'))()
local L = game.Lighting
DF = {
    A = L.Ambient,
    B = L.Brightness,
    CT = L.ColorShift_Top,
    CB = L.ColorShift_Bottom,
    EDS = L.EnvironmentDiffuseScale,
    ESS = L.EnvironmentSpecularScale,
    GS = L.GlobalShadows,
    OA = L.OutdoorAmbient,
    SS = L.ShadowSoftness,
    GL = L.GeographicLatitude,
    EC = L.ExposureCompensation,
    FC = L.FogColor,
    FE = L.FogEnd,
    FS = L.FogStart
}
local Window = Rayfield:CreateWindow({
    Name = "IO",
    Icon = "hexagon",
    LoadingTitle = "IO",
    LoadingSubtitle = "by M.D",
    Theme = "Dark",
 
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil,
       FileName = "IO"
    },
 
    Discord = {
       Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
       Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
 
    KeySystem = false, -- Set this to true to use our key system
    KeySettings = {
       Title = "Untitled",
       Subtitle = "Key System",
       Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
       FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
       SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
})
local Tab = Window:CreateTab("Main", "hexagon")
local Section = Tab:CreateSection("General")
local Toggle = Tab:CreateToggle({
    Name = "Fullbright",
    CurrentValue = false,
    Flag = "FB", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        if CurrentValue == false then 
            L.Ambient = (Color3.fromRGB(DF.A))
            L.Brightness = DF.B
            L.ColorShift_Top = (Color3.fromRGB(DF.CT))
            L.ColorShift_Bottom = (Color3.fromRGB(DF.CB))
            L.EnvironmentDiffuseScale = DF.EDS
            L.EnvironmentSpecularScale = DF.ESS
            L.GlobalShadows = DF.GS
            L.OutdoorAmbient = (Color3.fromRGB(DF.OA))
            L.ShadowSoftness = DF.SS
            L.GeographicLatitude = DF.GL
            L.ExposureCompensation = DF.EC
            L.FogColor = (Color3.fromRGB(DF.FC))
            L.FogEnd = DF.FE
            L.FogStart = DF.FS
        end
        if CurrentValue == true then
            L.Ambient = (Color3.fromRGB(70, 70, 70))
            L.Brightness = 3
            L.ColorShift_Top= (Color3.fromRGB(0, 0, 0))
            L.ColorShift_Bottom= (Color3.fromRGB(0, 0, 0))
            L.EnvironmentDiffuseScale=1
            L.EnvironmentSpecularScale=1
            L.GlobalShadows= true
            L.OutdoorAmbient= Color3.fromRGB(127, 127, 127)
            L.ShadowSoftness=0
            L.GeographicLatitude=41
            L.ExposureCompensation=0
            L.FogColor=Color3.fromRGB(185, 185, 185)
            L.FogEnd = 6000
            L.FogStart=0
        end
    end
})
local Button = Tab:CreateButton({
    Name = "OpenAimbot Modified",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tistyse/OpenAimbotModified/refs/heads/main/main.lua", true))()
    end
})
local Label = Tab:CreateLabel("Danger", "triangle-alert", Color3.fromRGB(255, 77, 77))
local Button = Tab:CreateButton({
    Name = "Destroy GUI",
    Callback = function()
        Rayfield:Destroy()
    end
})
