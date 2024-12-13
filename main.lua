local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local L = game.Lighting
DF = {
    A = game.Lighting.Ambient,
    B = game.Lighting.Brightness,
    CT = game.Lighting.ColorShift_Top,
    CB = game.Lighting.ColorShift_Bottom,
    EDS = game.Lighting.EnvironmentDiffuseScale,
    ESS = game.Lighting.EnvironmentSpecularScale,
    GS = game.Lighting.GlobalShadows,
    OA = game.Lighting.OutdoorAmbient,
    SS = game.Lighting.ShadowSoftness,
    GL = game.Lighting.GeographicLatitude,
    EC = game.Lighting.ExposureCompensation,
    FC = game.Lighting.FogColor,
    FE = game.Lighting.FogEnd,
    FS = game.Lighting.FogStart
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
local Main = Window:CreateTab("Main", "hexagon")
local Misc = Window:CreateTab("Mics", "settings")
local General = Main:CreateSection("General")
local FBTG = Main:CreateToggle({
    Name = "Fullbright",
    CurrentValue = false,
    Flag = "FB", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        if Value == false then 
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
        if Value == true then
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
local AimbotTG = Main:CreateButton({
    Name = "Aimbot",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/AirHub-V2/main/src/Main.lua"))()
        Rayfield:Notify({
            Title = "I/O",
            Content = "Aimbot is enabled",
            Duration = 6.5,
            Image = "paperclip",
         })
    end
})
local INFJPTG = Main:CreateButton({
    Name = "Infinite Jump(toggleable)",
    Callback = function()
        _G.infinjump = not _G.infinjump

        if _G.infinJumpStarted == nil then
            _G.infinJumpStarted = true
            Rayfield:Notify({
                Title = "I/O",
                Content = "Infinite jump is enabled",
                Duration = 6.5,
                Image = "paperclip",
            })
            local plr = game:GetService('Players').LocalPlayer
            local m = plr:GetMouse()
            m.KeyDown:connect(function(k)
                if _G.infinjump then
                    if k:byte() == 32 then
                    humanoid = game:GetService'Players'.LocalPlayer.Character:FindFirstChildOfClass('Humanoid')
                    humanoid:ChangeState('Jumping')
                    wait()
                    humanoid:ChangeState('Seated')
                    end
                end
            end)
        end
    end
})
local FREECAM = Main:CreateButton({
    Name = "Freecam(Shift+P)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tistyse/Scripts/refs/heads/main/freecam.lua", true))()
        Rayfield:Notify({
            Title = "I/O",
            Content = "Freecam is enabled",
            Duration = 6.5,
            Image = "paperclip",
        })
    end
})
local CTRLTPTG = Main:CreateButton({
    Name = "Ctrl+click TP(toggleable)",
    Callback = function()
        if _G.WRDClickTeleport == nil then
            _G.WRDClickTeleport = true
            
            local player = game:GetService("Players").LocalPlayer
            local UserInputService = game:GetService("UserInputService")
            local mouse = player:GetMouse()
            repeat wait() until mouse
            UserInputService.InputBegan:Connect(function(input, gameProcessed)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    if _G.WRDClickTeleport and UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
                        player.Character:MoveTo(Vector3.new(mouse.Hit.x, mouse.Hit.y, mouse.Hit.z)) 
                    end
                end
            end)
        else
            _G.WRDClickTeleport = not _G.WRDClickTeleport
            if _G.WRDClickTeleport then
                Rayfield:Notify({
                    Title = "I/O",
                    Content = "Ctrl+click TP is enabled",
                    Duration = 6.5,
                    Image = "paperclip",
                 })
            else
                Rayfield:Notify({
                    Title = "I/O",
                    Content = "Ctrl+click TP is disabled",
                    Duration = 6.5,
                    Image = "paperclip",
                 })
            end
        end
    end
})
local Destroy = Misc:CreateButton({
    Name = "Destroy GUI",
    Callback = function()
        Rayfield:Destroy()
    end
})
