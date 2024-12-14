local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
local Options = Fluent.Options
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
local IO = Fluent:CreateWindow({
    Title = "IO",
    SubTitle = "by M.D",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark Typewriter",
    MinimizeKey = Enum.KeyCode.LeftAlt -- Used when theres no MinimizeKeybind
})
local Tabs = {
    Main = IO:AddTab({Title = "Main", Icon = "hexagon" }),
}
IO:SelectTab(1)
do
    local Fullbright = Tabs.Main:AddToggle("Fullbright", {Title = "Fullbright", Default = false})
    Fullbright:OnChanged(function()
        if Options.Fullbright.Value == false then 
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
        if Options.Fullbright.Value == true then
            L.Ambient = (Color3.fromRGB(70, 70, 70))
            L.Brightness = 3
            L.ColorShift_Top= (Color3.fromRGB(0, 0, 0))
            L.ColorShift_Bottom= (Color3.fromRGB(0, 0, 0))
            L.EnvironmentDiffuseScale=1
            L.EnvironmentSpecularScale=1
            L.GlobalShadows= true
            L.OutdoorAmbient= Color3.fromRGB(120, 120, 120)
            L.ShadowSoftness=0
            L.GeographicLatitude=41
            L.ExposureCompensation=0
            L.FogColor=Color3.fromRGB(150, 150, 150)
            L.FogEnd = 6000
            L.FogStart=0
        end
    end)
    Tabs.Main:AddButton({
        Title = "Aimbot",
        Description = "Opens Aimbot Tab",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/tistyse/OpenAimbotModified/refs/heads/main/main.lua", true))()
        end
    })
    local InfiniteJump = Tabs.Main:AddToggle("InfiniteJump", {Title = "Infinite Jump", Default = false})
    InfiniteJump:OnChanged(function()
        local plr = game:GetService('Players').LocalPlayer
        local m = plr:GetMouse()
        m.KeyDown:connect(function(k)
            if Options.InfiniteJump.Value == true then
                if k:byte() == 32 then
                humanoid = game:GetService'Players'.LocalPlayer.Character:FindFirstChildOfClass('Humanoid')
                humanoid:ChangeState('Jumping')
                wait()
                humanoid:ChangeState('Seated')
                end
            end
        end)
    end)
    Tabs.Main:AddButton({
        Title = "Freecam",
        Description = "Shift+P to toggle Freecam",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/tistyse/Scripts/refs/heads/main/freecam.lua", true))()
        end
    })
    local CtrlTP = Tabs.Main:AddToggle("CtrlTP", {Title = "Ctrl+Click TP", Default = false})
    CtrlTP:OnChanged(function()
        local player = game:GetService("Players").LocalPlayer
        local UserInputService = game:GetService("UserInputService")
        local mouse = player:GetMouse()
        repeat wait() until mouse
        UserInputService.InputBegan:Connect(function(input, gameProcessed)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                if Options.CtrlTP.Value == true and UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
                    player.Character:MoveTo(Vector3.new(mouse.Hit.x, mouse.Hit.y, mouse.Hit.z)) 
                end
            end
        end)
    end)
end
