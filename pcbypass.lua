if _G.ScriptExecuted == nil then
    _G.ScriptExecuted = false
end

if _G.ScriptExecuted then
    warn("Script já em execução, ative nas configurações para permitir múltiplas execuções.")
    return
else
    _G.ScriptExecuted = true
end

print("Carregando Script")

local scriptversion = 1.7

print("Carregando Interface")

local Rayfield = loadstring(game:HttpGet('https://pastebin.com/raw/2x87Kzr1'))()

Rayfield:Notify({
    Title = "Inicializando...",
    Content = "Por favor, aguarde.",
    Duration = 1.5,
    Image = "triangle-alert",
 })

print("Verificando IDs")

if not Rayfield then
    warn("Interface não foi carregada.")
    return
end

local player = game:GetService("Players").LocalPlayer

local blacklist = {
    4274673149, -- boracalo
    0,
}

local devIds = {
    1827004776, -- nyyztx - owner/dev
    12649735, -- u5auucdp8o5sm3v - owner/dev
    5796556085, -- Taffinii_san - subowner <3
    1340011660, -- weslleygg15
    1027026818, -- howcyber
    1003669370, -- pedroliragenari11
    1356740893, -- GuiFangsOfc_YT
    1241851575, -- SrMado
    5173694911, -- Koduzinho
}

local function isBlacklisted(player)
    for _, id in ipairs(blacklist) do
        if player.UserId == id then
            return true
        end
    end
    return false
end

local function isDeveloper(player)
    for _, id in ipairs(devIds) do
        if player.UserId == id then
            return true
        end
    end
    return false
end

local function sendNotification(player)
    local randomIDBL = tostring(math.random(10000, 99999))
    Rayfield:Notify({
        Title = "Ocorreu um erro.",
        Content = "Por favor, entre em contato com o desenvolvedor. @nyxz.os\nID do Usuário : " .. player.UserId .. "\nCódigo : " .. randomIDBL .. "",
        Duration = 30,
        Image = "user-round-minus",
    })
end

local player = game.Players.LocalPlayer

local function getGreeting()
    local hour = tonumber(os.date("%H")) 

    if hour >= 5 and hour < 12 then
        return "Bom dia"
    elseif hour >= 12 and hour < 18 then
        return "Boa tarde"
    else
        return "Boa noite"
    end
end

local greeting = getGreeting()

local Window = Rayfield:CreateWindow({
    Name = "Midnight.im | " .. player.DisplayName .. " | " .. scriptversion,
    Icon = 90950535175161,
    LoadingTitle = greeting .. ", " .. player.DisplayName .. "!",
    LoadingSubtitle = "Carregando Midnight...",
    Theme = "Default",
 
    DisableRayfieldPrompts = true,
    DisableBuildWarnings = false,
 
    ConfigurationSaving = {
       Enabled = false,
       FolderName = "Midnight.im",
       FileName = "scriptcfg"
    },
 
    Discord = {
       Enabled = false,
       Invite = "39qBjvX4wD",
       RememberJoins = true
    },
    
    KeySystem =  false,
    KeySettings = {
       Title = "nil",
       Subtitle = "nil",
       Note = "nil",
       FileName = "nil",
       SaveKey = false,
       GrabKeyFromSite = false,
       Key = {"nil"}
    }
 })

 if isBlacklisted(player) then
    warn("User : " .. player.Name)
    warn("ID : " .. player.UserId)
    warn("Restricted Account.")
    sendNotification(player)
    return
end

 local function resetExecution()
    _G.ScriptExecuted = false
end

print("Carregando Função [NotifySound]")

function NotifySound()
    local User_Input_Service = game:GetService("UserInputService")
        local Sound_Service = game:GetService("SoundService")
        local Sound = Instance.new("Sound",Sound_Service)
        Sound.SoundId = "rbxassetid://8183296024"
        Sound:Play()
end

print("Carregando Função [NotifySound]")

function NotifyDevSound()
    local User_Input_Service = game:GetService("UserInputService")
        local Sound_Service = game:GetService("SoundService")
        local Sound = Instance.new("Sound",Sound_Service)
        Sound.SoundId = "rbxassetid://8503529653"
        Sound:Play()
end

print("Carregando Função [NotifyErrorSound]")

function NotifyErrorSound()
    local User_Input_Service = game:GetService("UserInputService")
        local Sound_Service = game:GetService("SoundService")
        local Sound = Instance.new("Sound",Sound_Service)
        Sound.SoundId = "rbxassetid://8499261098"
        Sound:Play()
end

Rayfield:Notify({
    NotifySound(),
    Title = "Bem-vindo, " .. player.DisplayName .. "!",
    Content = "Lembre-se, a sua conta poderá ser facilmente suspensa caso seja denunciada em massa, então use com moderação e não venha reclamar comigo depois. :)",
    Duration = 10,
    Image = "triangle-alert",
 })

print("Carregando Função [VCReconnect]")

function VCReconnect()
local voiceChatService = game:GetService("VoiceChatService")
    if voiceChatService then
        voiceChatService:joinVoice()
        Rayfield:Notify({
            NotifySound(),
            Title = "Alerta!",
            Content = "Reiniciando 'VoiceChatService'.",
            Duration = 3,
            Image = "unplug",
         })
    else
        Rayfield:Notify({
            NotifyErrorSound(),
            Title = "Erro!",
            Content = "Algo inesperado aconteceu. 'VoiceChatService' não está disponível. :(",
            Duration = 5,
            Image = "ban",
         })
        warn("VoiceChatService is not available.")
    end
end

print("Carregando Função [AutoVCRC]")

function AutoVCRC()
    local vc_inter = game:GetService("VoiceChatInternal")
    local vc_service = game:GetService("VoiceChatService")
    local reconnecting = false
    local retryCooldown = 0.5

    local function onVoiceChatStateChanged(oldState, newState)
        if newState == Enum.VoiceChatState.Ended and not reconnecting then
            reconnecting = true
            task.spawn(function()
                wait(retryCooldown)
                local success, err = pcall(function()
                    wait(0.5)
                    vc_service:joinVoice()
                    Rayfield:Notify({
                        NotifySound(),
                        Title = "Alerta!",
                        Content = "Reiniciando 'VoiceChatService'.",
                        Duration = 3,
                        Image = "unplug",
                     })
                end)
                if not success then
                    warn("Ocorreu um erro.", err)
                end
                reconnecting = false
            end)
        end
    end

    vc_inter.StateChanged:Connect(onVoiceChatStateChanged)
end

print("Carregando Função [IYScriptString]")

function IYScriptString()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end

print("Carregando Função [CMDXScriptString]")

function CMDXScriptString()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source",true))()    
end

print("Carregando Função [SystemBrokenScriptString]")

function SystemBrokenScriptString()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/H20CalibreYT/SystemBroken/main/script"))()
end

print("Carregando Função [EclipseHubScriptString]")

function EclipseHubScriptString()
    local a,b,c,d=assert,pcall(loadstring,(request or http_request or error("Unsupported"))({Url="https\58//api.eclipsehub.xyz/auth?\116\121pe\61\50",Method="GET"}).Body);a(not b and warn(d) or c());
end

print("Carregando Função [GraphicsEnhancerScriptString]")

function GraphicsEnhancerScriptString()
    local light = game:GetService("Lighting")
for i, v in pairs(light:GetChildren()) do
	v:Destroy()
end

local ter = workspace.Terrain
local color = Instance.new("ColorCorrectionEffect")
local bloom = Instance.new("BloomEffect")
local sun = Instance.new("SunRaysEffect")
local blur = Instance.new("BlurEffect")

color.Parent = light
bloom.Parent = light
sun.Parent = light
blur.Parent = light

local config = {

	Terrain = true;
	ColorCorrection = true;
	Sun = true;
	Lighting = true;
	BloomEffect = true;
	
}

color.Enabled = false
color.Contrast = 0.15
color.Brightness = 0.1
color.Saturation = 0.25
color.TintColor = Color3.fromRGB(255, 222, 211)

bloom.Enabled = false
bloom.Intensity = 0.1

sun.Enabled = false
sun.Intensity = 0.2
sun.Spread = 1

bloom.Enabled = false
bloom.Intensity = 0.05
bloom.Size = 32
bloom.Threshold = 1

blur.Enabled = false
blur.Size = 6


if config.ColorCorrection then
	color.Enabled = true
end


if config.Sun then
	sun.Enabled = true
end


if config.Terrain then
	ter.WaterColor = Color3.fromRGB(10, 10, 24)
	ter.WaterWaveSize = 0.15
	ter.WaterWaveSpeed = 22
	ter.WaterTransparency = 1
	ter.WaterReflectance = 0.05
end


if config.Lighting then
	light.Ambient = Color3.fromRGB(0, 0, 0)
	light.Brightness = 4
	light.ColorShift_Bottom = Color3.fromRGB(0, 0, 0)
	light.ColorShift_Top = Color3.fromRGB(0, 0, 0)
	light.ExposureCompensation = 0
	light.FogColor = Color3.fromRGB(132, 132, 132)
	light.GlobalShadows = true
	light.OutdoorAmbient = Color3.fromRGB(112, 117, 128)
	light.Outlines = false
end
end

print("Carregando Função [FreeEmotesGUIScriptString]")

function FreeEmotesGUIScriptString()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/LmaoItsCrazyBro/qweytguqwebuqt/refs/heads/main/marked_esp_system_ai"))()
end

print("Carregando Função [ReverseScriptString]")

function ReverseScriptString()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Arthurfillipy/Reverse-Mic_Up-Roblox-Pc-and-Mobile/refs/heads/main/Reverse-Mic_Up-Roblox-Pc-and-Mobile-Script.lua"))()
end

print("Carregando Função [FreecamScriptString]")

function FreecamScriptString()
   loadstring(game:HttpGet("https://pastebin.com/raw/4JrUuEqn"))()
end

print("Carregando Função [InvisibleScriptString]")

function InvisibleScriptString()
    loadstring(game:HttpGet("https://pastebin.com/raw/UWZDK9Q8"))()
 end

 print("Carregando Função [DEXExplorerScriptString]")

 local function DEXExplorerScriptString()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
end

print("Carregando Função [resetLightingSettings]")

function resetLightingSettings()
    local Lighting = game:GetService("Lighting")
    local SunRays = Lighting:FindFirstChildOfClass("SunRaysEffect")

    Lighting.ClockTime = 14.5
    Lighting.Brightness = 3
    wait()
    if not Lighting:FindFirstChildOfClass("Atmosphere") then
        wait(0.1)
        local Atmosphere = Instance.new("Atmosphere")
        Atmosphere.Name = "Atmosphere"
        Atmosphere.Parent = Lighting
        Atmosphere.Density = 0.3
        Atmosphere.Offset = 0.25
        Atmosphere.Color = Color3.fromRGB(199, 199, 199)
        Atmosphere.Decay = Color3.fromRGB(106, 112, 125)
        Atmosphere.Glare = 0
        Atmosphere.Haze = 0
    else
        wait(0.1)
        Lighting.Atmosphere.Density = 0.3
        Lighting.Atmosphere.Offset = 0.25
        Lighting.Atmosphere.Color = Color3.fromRGB(199, 199, 199)
        Lighting.Atmosphere.Decay = Color3.fromRGB(106, 112, 125)
        Lighting.Atmosphere.Glare = 0
        Lighting.Atmosphere.Haze = 0
    end
    wait(0.1)
    if not Lighting:FindFirstChildOfClass("BloomEffect") then
        wait(0.1)
        local Bloom = Instance.new("BloomEffect")
        Bloom.Name = "Bloom"
        Bloom.Parent = Lighting
        Bloom.Intensity = 1
        Bloom.Enabled = true
        Bloom.Size = 24
        Bloom.Threshold = 2
    else
        wait(0.1)
        Lighting.Bloom.Intensity = 1
        Lighting.Bloom.Enabled = true
        Lighting.Bloom.Size = 24
        Lighting.Bloom.Threshold = 2
    end
    wait(0.1)
    if not Lighting:FindFirstChildOfClass("DepthOfFieldEffect") then
        wait(0.1)
        local DepthOfField = Instance.new("DepthOfFieldEffect")
        DepthOfField.Name = "DepthOfField"
        DepthOfField.Parent = Lighting
        DepthOfField.Enabled = false
        DepthOfField.FarIntensity = 0.1
        DepthOfField.FocusDistance = 0.05
        DepthOfField.InFocusRadius = 30
        DepthOfField.NearIntensity = 0.75
    else
        wait(0.1)
        Lighting.DepthOfField.Enabled = false
        Lighting.DepthOfField.FarIntensity = 0.1
        Lighting.DepthOfField.FocusDistance = 0.05
        Lighting.DepthOfField.InFocusRadius = 30
        Lighting.DepthOfField.NearIntensity = 0.75
    end
    wait(0.1)
    if not Lighting:FindFirstChildOfClass("SunRaysEffect") then
        wait(0.1)
        local SunRays = Instance.new("SunRaysEffect")
        SunRays.Name = "SunRays"
        SunRays.Parent = Lighting
        SunRays.Enabled = true
        SunRays.Intensity = 0.01
        SunRays.Spread = 0.1
    else
        wait(0.1)
        Lighting.SunRays.Enabled = true
        Lighting.SunRays.Intensity = 0.01
        Lighting.SunRays.Spread = 0.1
    end
end

print("Carregando Função [SetNightWLight]")

function SetNightWLight()
    local Lighting = game:GetService("Lighting")
    if Lighting.ClockTime <= 2 then
        Lighting.ClockTime = 1
    wait()
        Lighting.Brightness = 2
    else
        resetLightingSettings()
        wait(0.2)
        Lighting.ClockTime = 0
        wait()
        Lighting.Brightness = 0
    end
end

print("Carregando Função [SetDayTime]")

function SetDayTime()
    local Lighting = game:GetService("Lighting")
    Lighting.ClockTime = 12
    wait()
    Lighting.Brightness = 1.5
end

print("Carregando Função [TeleportService]")

function TeleportService()
    local TeleportService = game:GetService("TeleportService")
end

local isMuted = false

print("Carregando Função [AudioInputToggle]")

function AudioInputToggle()
    local UserInputService = game:GetService("UserInputService")
    local player = game.Players.LocalPlayer

    local Audio_Device_Input = player:FindFirstChild("AudioDeviceInput")

    if Audio_Device_Input then
        isMuted = not isMuted
        Audio_Device_Input.Muted = isMuted

        if isMuted then
            Rayfield:Notify({
                NotifySound(),
                Title = "Alerta!",
                Content = "Microfone silenciado.",
                Duration = 2,
                Image = "mic-off",
             })
        else
            Rayfield:Notify({
                NotifySound(),
                Title = "Alerta!",
                Content = "Microfone desilenciado.",
                Duration = 2,
                Image = "mic",
             })
        end
    else
        Rayfield:Notify({
            NotifyErrorSound(),
            Title = "Erro!",
            Content = "Algo inesperado aconteceu. AudioDeviceInput não está disponível. :(",
            Duration = 5,
            Image = "ban",
         })
    end
end

print("Carregando Função [PrivateRoomAntiKill]")

function PrivateRoomAntiKill()
    local allowedGameIds = {6884319169, 15546218972}
    local currentGameId = game.PlaceId
    local isAllowed = false
    
    for _, id in pairs(allowedGameIds) do
        if currentGameId == id then
            isAllowed = true
            break
        end
    end

    if not isAllowed then
        return
    end
    
    for _, descendant in pairs(workspace:GetDescendants()) do
        if descendant:IsA("Script") and descendant.Name == "Kill" then
            local parent = descendant.Parent
            local touchInterest = parent:FindFirstChild("TouchInterest")
            if touchInterest then
                touchInterest:Destroy()
            end
            descendant:Destroy()
        end
    end
end

print("Carregando Função [Fly]")

local function getRoot(char)
    local rootPart = char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso")
    return rootPart
end

local IYMouse = player:GetMouse()

local flySpeed = 10

local function sFLY(vfly)
    repeat wait() until player and player.Character and getRoot(player.Character) and player.Character:FindFirstChildOfClass("Humanoid")
    repeat wait() until IYMouse
    if flyKeyDown or flyKeyUp then flyKeyDown:Disconnect() flyKeyUp:Disconnect() end

    local T = getRoot(player.Character)
    local CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
    local lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
    local SPEED = 0

    local function FLY()
        FLYING = true
        local BG = Instance.new('BodyGyro')
        local BV = Instance.new('BodyVelocity')
        BG.P = 9e4
        BG.Parent = T
        BV.Parent = T
        BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
        BG.cframe = T.CFrame
        BV.velocity = Vector3.new(0, 0, 0)
        BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
        task.spawn(function()
            repeat wait()
                if not vfly and player.Character:FindFirstChildOfClass('Humanoid') then
                    player.Character:FindFirstChildOfClass('Humanoid').PlatformStand = true
                end
                if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then
                    SPEED = flySpeed
                elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0) and SPEED ~= 0 then
                    SPEED = 0
                end
                if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 or (CONTROL.Q + CONTROL.E) ~= 0 then
                    BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
                    lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
                elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and (CONTROL.Q + CONTROL.E) == 0 and SPEED ~= 0 then
                    BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
                else
                    BV.velocity = Vector3.new(0, 0, 0)
                end
                BG.cframe = workspace.CurrentCamera.CoordinateFrame
            until not FLYING
            CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
            lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
            SPEED = 0
            BG:Destroy()
            BV:Destroy()
            if player.Character:FindFirstChildOfClass('Humanoid') then
                player.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
            end
        end)
    end
    flyKeyDown = IYMouse.KeyDown:Connect(function(KEY)
        if KEY:lower() == 'w' then
            CONTROL.F = (vfly and vehicleflyspeed or flySpeed)
        elseif KEY:lower() == 's' then
            CONTROL.B = - (vfly and vehicleflyspeed or flySpeed)
        elseif KEY:lower() == 'a' then
            CONTROL.L = - (vfly and vehicleflyspeed or flySpeed)
        elseif KEY:lower() == 'd' then 
            CONTROL.R = (vfly and vehicleflyspeed or flySpeed)
        elseif QEfly and KEY:lower() == 'e' then
            CONTROL.Q = (vfly and vehicleflyspeed or flySpeed)*2
        elseif QEfly and KEY:lower() == 'q' then
            CONTROL.E = -(vfly and vehicleflyspeed or flySpeed)*2
        end
        pcall(function() workspace.CurrentCamera.CameraType = Enum.CameraType.Track end)
    end)
    flyKeyUp = IYMouse.KeyUp:Connect(function(KEY)
        if KEY:lower() == 'w' then
            CONTROL.F = 0
        elseif KEY:lower() == 's' then
            CONTROL.B = 0
        elseif KEY:lower() == 'a' then
            CONTROL.L = 0
        elseif KEY:lower() == 'd' then
            CONTROL.R = 0
        elseif KEY:lower() == 'e' then
            CONTROL.Q = 0
        elseif KEY:lower() == 'q' then
            CONTROL.E = 0
        end
    end)
    FLY()
end

local function NOFLY()
    FLYING = false
    if flyKeyDown or flyKeyUp then flyKeyDown:Disconnect() flyKeyUp:Disconnect() end
    if player.Character:FindFirstChildOfClass('Humanoid') then
        player.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
    end
    pcall(function() workspace.CurrentCamera.CameraType = Enum.CameraType.Custom end)
end

local function toggleFly()
    if FLYING then
        NOFLY()
        Rayfield:Notify({
            NotifySound(),
            Title = "Alerta!",
            Content = "Desativei a levitação. :)",
            Duration = 1.5,
            Image = "plane",
         })
    else
        sFLY(false)
        Rayfield:Notify({
            NotifySound(),
            Title = "Alerta!",
            Content = "Ativei a levitação. :)",
            Duration = 1.5,
            Image = "plane",
         })
    end
end

print("Carregando Função [toggleNoclip]")

local noclipEnabled = false

local function toggleNoclip()
    noclipEnabled = not noclipEnabled
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    
    if noclipEnabled then
        Rayfield:Notify({
            NotifySound(),
            Title = "Alerta!",
            Content = "Noclip ativado.",
            Duration = 2,
            Image = "ghost",
        })
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    else
        Rayfield:Notify({
            NotifySound(),
            Title = "Alerta!",
            Content = "Noclip desativado.",
            Duration = 2,
            Image = "ghost",
        })
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = true
            end
        end
    end
end

print("Carregando Função [ClickTP]")

local UserInputService = game:GetService("UserInputService")
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

local function teleportToCursor()
    local targetPosition = mouse.Hit.p
    local character = player.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        character.HumanoidRootPart.CFrame = CFrame.new(targetPosition)
    end
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if input.UserInputType == Enum.UserInputType.MouseButton1 and UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) and not gameProcessed then
        teleportToCursor()
    end
end)

print("Carregando Função [ClearChat]")

local function ClearChat()
    if game:GetService("TextChatService").ChatVersion == Enum.ChatVersion.TextChatService then
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("hi\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\rCleared Chat.")
    end
end

print("Carregando Função [teleportToPlayer]")

local function teleportToPlayer(targetPlayer)
    local character = player.Character
    if character and character:FindFirstChild("HumanoidRootPart") and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
    end
end

print("Carregando Função [getPlayerDisplayNames]")

local function getPlayerDisplayNames()
    local displayNames = {}
    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer then
            table.insert(displayNames, player.DisplayName .. " (@" .. player.Name .. ")")
        end
    end
    table.sort(displayNames)
    return displayNames
end

print("Carregando Função [getPlayerByDisplayName]")

local function getPlayerByDisplayName(displayName)
    for _, player in pairs(game.Players:GetPlayers()) do
        if player.DisplayName .. " (@" .. player.Name .. ")" == displayName then
            return player
        end
    end
    return nil
end

local notifyOnPlayerJoin = true
local notifyOnPlayerLeave = true
local notifyFriendsOnly = true

print("Carregando Função [onPlayerAdded]")

local function onPlayerAdded(player)
    if notifyOnPlayerJoin then
        if not notifyFriendsOnly or game.Players.LocalPlayer:IsFriendsWith(player.UserId) then
            Rayfield:Notify({
                NotifySound(),
                Title = "Jogador entrou!",
                Content = player.DisplayName .. " (@" .. player.Name .. ") entrou no jogo.",
                Duration = 5,
                Image = "user-plus",
            })
        end
    end
end

print("Carregando Função [onPlayerRemoving]")

local function onPlayerRemoving(player)
    if notifyOnPlayerLeave then
        if not notifyFriendsOnly or game.Players.LocalPlayer:IsFriendsWith(player.UserId) then
            Rayfield:Notify({
                NotifySound(),
                Title = "Jogador saiu!",
                Content = player.DisplayName .. " (@" .. player.Name .. ") saiu do jogo.",
                Duration = 5,
                Image = "user-minus",
            })
        end
    end
end

print("Carregando Função [toggleAntiAfk]")

local function toggleAntiAfk()
    antiAfkEnabled = not antiAfkEnabled
    if antiAfkEnabled then
        print("Anti-AFK ativado.")
        game:GetService("Players").LocalPlayer.Idled:Connect(function()
            if antiAfkEnabled then
                game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
                wait(1)
                game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            end
        end)
    else
        print("Anti-AFK desativado.")
    end
end

print("Todas funções foram carregadas.")

-- Auto Execute Function

PrivateRoomAntiKill()

-- Tabs

local VCOP = Window:CreateTab("Opções Gerais", "user-round")

local SCPT = Window:CreateTab("Outros Scripts", "package")

local CFGS = Window:CreateTab("Configurações", "settings")

-- Voice Options (VCOP)

local SelfOptionsSection = VCOP:CreateSection("Personagem")

local PlayerWalkspeed = VCOP:CreateSlider({
    Name = "Velocidade do Player",
    Range = {0, 150},
    Increment = 1,
    Suffix = " Speed",
    CurrentValue = 16,
    Flag = "PlayerWalkspeed", 
    Callback = function(PlayerWS)
        player.Character.Humanoid.WalkSpeed = PlayerWS
    end,
})

playerWalkspeedSlider = PlayerWalkspeed

local DefaultPlayerWS = VCOP:CreateButton({
    Name = "Definir Velocidade Padrão do Player",
    Callback = function()
        player.Character.Humanoid.WalkSpeed = 16
        playerWalkspeedSlider:Set(16)
    end,
})

local FlyKeybind = VCOP:CreateKeybind({
    Name = "Atalho para (Levitação)",
    CurrentKeybind = "V",
    HoldToInteract = false,
    Flag = "FlyKeybind",
    Callback = function(Keybind)
        toggleFly()
    end,
})

local FlySpeedSlider = VCOP:CreateSlider({
    Name = "Velocidade da Levitação",
    Range = {0, 150},
    Increment = 1,
    Suffix = " Speed",
    CurrentValue = flySpeed,
    Flag = "FlySpeed",
    Callback = function(speed)
        flySpeed = speed
    end,
})

local NoclipToggle = VCOP:CreateToggle({
    Name = "Ativar/Desativar Noclip",
    CurrentValue = false,
    Flag = "NoclipToggle",
    Callback = function(Value)
        if Value ~= noclipEnabled then
            toggleNoclip()
        end
    end,
})

local NoclipKeybind = VCOP:CreateKeybind({
    Name = "Atalho para (Noclip)",
    CurrentKeybind = "N",
    HoldToInteract = false,
    Flag = "NoclipKeybind",
    Callback = function(Keybind)
        toggleNoclip()
        NoclipToggle:Set(noclipEnabled)
    end,
})

local PlayerTPSection = VCOP:CreateSection("Teleporte")

local teleportKeybind = VCOP:CreateKeybind({
    Name = "Atalho para (Teleportar ao Apertar)",
    CurrentKeybind = "LeftControl",
    HoldToInteract = true,
    Flag = "TeleportKeybind",
    Callback = function(Keybind)
    end,
})

local teleportDropdown = VCOP:CreateDropdown({
    Name = "Teleportar para Jogador",
    Options = getPlayerDisplayNames(),
    CurrentOption = {},
    MultipleOptions = false,
    Flag = "TeleportDropdown",
    Callback = function(Options)
        local targetPlayer = getPlayerByDisplayName(Options[1])
        if targetPlayer then
            teleportToPlayer(targetPlayer)
        end
    end,
})

game.Players.PlayerAdded:Connect(function()
    teleportDropdown:Refresh(getPlayerDisplayNames(), true)
end)

game.Players.PlayerRemoving:Connect(function()
    teleportDropdown:Refresh(getPlayerDisplayNames(), true)
end)

local ChatRelatedSection = VCOP:CreateSection("Chat (Voz/Texto)")

local VCRCButton = VCOP:CreateButton({
   Name = "Reiniciar Voice Chat",
   Callback = function()
   VCReconnect()
   end,
})

local VCRCToggle = VCOP:CreateToggle({
   Name = "Reiniciar Voice Chat Automaticamente",
   CurrentValue = false,
   Flag = "VCRCToggle",
   Callback = function(Value)
   AutoVCRC()
   end,
})

local KeybindVCRC = VCOP:CreateKeybind({
   Name = "Atalho para (Reiniciar Voice Chat)",
   CurrentKeybind = "L",
   HoldToInteract = false,
   Flag = "KeybindVCRC",
   Callback = function(Keybind)
   VCReconnect()
   end,
})

local KeybindMicInput = VCOP:CreateKeybind({
    Name = "Silenciar/Desilenciar Microfone",
    CurrentKeybind = "RightControl",
    HoldToInteract = false,
    Flag = "KeybindVCRC",
    Callback = function(Keybind)
    AudioInputToggle()
    end,
 })

 local ClearChatButton = VCOP:CreateButton({
    Name = "Limpar o chat de texto (Whitelist Option)",
    Callback = function()
        if isDeveloper(player) then
            ClearChat()
        else
            Rayfield:Notify({
                NotifyErrorSound(),
                Title = "Acesso negado.",
                Content = "A sua conta não tem permissão para usar esta função, somente contas de desenvolvedores.",
                Duration = 3,
                Image = "file-lock-2",
            })
        end
    end,
 })

local MapRelatedSection = VCOP:CreateSection("Mapa")

local BaseplateSizeZ = VCOP:CreateSlider({
    Name = "Tamanho do Baseplate (Z)",
    Range = {50, 2048},
    Increment = 1,
    Suffix = "",
    CurrentValue = 400,
    Flag = "ChangingBaseSize",
    Callback = function(Sized_Z)
        local BasePlate_Normal = game:GetService("Workspace"):FindFirstChild("Baseplate")
    
        BasePlate_Normal.CanCollide = true
        BasePlate_Normal.Size = Vector3.new(BasePlate_Normal.Size.X, BasePlate_Normal.Size.Y, Sized_Z)
end,
})
   
local BaseplateSizeX = VCOP:CreateSlider({
    Name = "Tamanho do Baseplate (X)",
Range = {50, 2048},
Increment = 1,
Suffix = "",
CurrentValue = 400,
Flag = "ChangingBasePlateSized",
Callback = function(Size_New)
    local BasePlate_Normal = game:GetService("Workspace"):FindFirstChild("Baseplate")

    BasePlate_Normal.CanCollide = true
    BasePlate_Normal.Size = Vector3.new(Size_New, BasePlate_Normal.Size.Y, BasePlate_Normal.Size.Z)
end,
})

local LightingSection = VCOP:CreateSection("Iluminação")

 local SetNightWithLight = VCOP:CreateButton({
    Name = "Alterar horário para noite",
    Callback = function()
    SetNightWLight()
    Rayfield:Notify({
        NotifySound(),
        Title = "Boa noite!",
        Content = "Alterando horário do jogo para noite. :)",
        Duration = 3,
        Image = "moon",
     })
    end,
 })
 
 local SetDayTime = VCOP:CreateButton({
    Name = "Alterar horário para dia",
    Callback = function()
    SetDayTime() NotifySound()
    Rayfield:Notify({
        NotifySound(),
        Title = "Bom dia!",
        Content = "Alterando horário do jogo para dia. :)",
        Duration = 3,
        Image = "sun",
     })
    end,
 })

-- Other Scripts (SCPT)

local OtherScriptsSection = SCPT:CreateSection("Scripts disponíveis")

local LoadIY = SCPT:CreateButton({
   Name = "Carregar Infinite Yield",
   Callback = function()
    Rayfield:Notify({
        NotifySound(),
        Title = "Executando script...",
        Content = "Carregando Infinite Yield. Aguarde alguns segundos, por favor.",
        Duration = 2.5,
        Image = "file-code",
    })
   IYScriptString()
   end,
})

local LoadSB = SCPT:CreateButton({
   Name = "Carregar System Broken",
   Callback = function()
   Rayfield:Notify({
    NotifySound(),
    Title = "Executando script...",
    Content = "Carregando System Broken. Aguarde alguns segundos, por favor.",
    Duration = 2.5,
    Image = "file-code",
    })
   SystemBrokenScriptString()
   end,
})

local LoadFEG = SCPT:CreateButton({
   Name = "Carregar Free Emotes GUI",
   Callback = function()
    Rayfield:Notify({
        NotifySound(),
        Title = "Executando script...",
        Content = "Carregando Free Emotes GUI. Aguarde alguns segundos, por favor.",
        Duration = 2.5,
        Image = "file-code",
     })
   FreeEmotesGUIScriptString()
   end,
})

local LoadGE = SCPT:CreateButton({
    Name = "Carregar Graphics Enhancer",
    Callback = function()
     Rayfield:Notify({
         NotifySound(),
         Title = "Executando script...",
         Content = "Carregando Graphics Enhancer. Aguarde alguns segundos, por favor.",
         Duration = 2.5,
         Image = "file-code",
      })
    GraphicsEnhancerScriptString()
    end,
 })

local LoadEH = SCPT:CreateButton({
    Name = "Carregar Eclipse Hub Lite (PC)",
    Callback = function()
     Rayfield:Notify({
         NotifySound(),
         Title = "Executando script...",
         Content = "Carregando Eclipse Hub. Aguarde alguns segundos, por favor.",
         Duration = 2.5,
         Image = "file-code",
      })
    EclipseHubScriptString()
    end,
 })

 local LoadIY = SCPT:CreateButton({
    Name = "Carregar CMD-X (PC)",
    Callback = function()
     Rayfield:Notify({
         NotifySound(),
         Title = "Executando script...",
         Content = "Carregando CMD-X. Aguarde alguns segundos, por favor.",
         Duration = 2.5,
         Image = "file-code",
     })
    CMDXScriptString()
    end,
 })

local LoadRVS = SCPT:CreateButton({
   Name = "Carregar Reverse Script (Segure E - PC)",
   Callback = function()
    Rayfield:Notify({
        NotifySound(),
        Title = "Executando script...",
        Content = "Carregando Reverse Script. Aguarde alguns segundos, por favor.",
        Duration = 2.5,
        Image = "file-code",
     })
   ReverseScriptString()
   end,
})

local LoadFC = SCPT:CreateButton({
    Name = "Carregar Freecam Script (Shift + P - PC)",
    Callback = function()
     Rayfield:Notify({
         NotifySound(),
         Title = "Executando script...",
         Content = "Carregando Freecam Script. Aguarde alguns segundos, por favor.",
         Duration = 2.5,
         Image = "file-code",
      })
        FreecamScriptString()
    end,
 })

local LoadFC = SCPT:CreateButton({
    Name = "Carregar Invisible Script (Aperte C - PC)",
    Callback = function()
     Rayfield:Notify({
         NotifySound(),
         Title = "Executando script...",
         Content = "Carregando Invisible Script. Aguarde alguns segundos, por favor.",
         Duration = 2.5,
         Image = "file-code",
      })
        InvisibleScriptString()
    end,
})

local DevOnlyScptSection = SCPT:CreateSection("Scripts (Desenvolvedores)")

local LoadDEXEX = SCPT:CreateButton({
    Name = "Carregar DEX Explorer",
    Callback = function()
        if isDeveloper(player) then
            Rayfield:Notify({
                NotifyDevSound(),
                Title = "Executando script...",
                Content = "Carregando DEX Explorer. Aguarde alguns segundos, por favor.",
                Duration = 2.5,
                Image = "file-code",
            })
            DEXExplorerScriptString()
        else
            Rayfield:Notify({
                NotifyErrorSound(),
                Title = "Acesso negado.",
                Content = "A sua conta não tem permissão para usar esta função, somente contas de desenvolvedores.",
                Duration = 5,
                Image = "file-lock-2",
            })
        end
    end,
})

-- Settings (CFGS)

game.Players.PlayerAdded:Connect(onPlayerAdded)
game.Players.PlayerRemoving:Connect(onPlayerRemoving)

local NotifySettingsSection = CFGS:CreateSection("Notificações")

local NotifyOnJoinToggle = CFGS:CreateToggle({
    Name = "Notificar Entrada de Jogadores",
    CurrentValue = notifyOnPlayerJoin,
    Flag = "NotifyOnJoinToggle",
    Callback = function(Value)
        notifyOnPlayerJoin = Value
    end,
})

local NotifyOnLeaveToggle = CFGS:CreateToggle({
    Name = "Notificar Saída de Jogadores",
    CurrentValue = notifyOnPlayerLeave,
    Flag = "NotifyOnLeaveToggle",
    Callback = function(Value)
        notifyOnPlayerLeave = Value
    end,
})

local NotifyFriendsOnlyToggle = CFGS:CreateToggle({
    Name = "Notificar Entrada/Saida Somente de Amigos",
    CurrentValue = notifyFriendsOnly,
    Flag = "NotifyFriendsOnlyToggle",
    Callback = function(Value)
        notifyFriendsOnly = Value
    end,
})

local ServerRelatedSection = CFGS:CreateSection("Servidor")

local RejoinServer = CFGS:CreateButton({
    Name = "Reconectar ao servidor",
    Callback = function()
        Rayfield:Notify({
            NotifySound(),
            Title = "Reconectando.",
            Content = "Por favor, aguarde.",
            Duration = 3,
            Image = "server",
         })
    wait(0.5)
    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId) 
    end,
 })

 local RejoinServerAuto = CFGS:CreateToggle({
    Name = "Reconectar automaticamente após desconexão",
    CurrentValue = false,
    Flag = "RejoinServerAutoToggle", 
    Callback = function(Value)
        repeat wait() until game.CoreGui:FindFirstChild('RobloxPromptGui')

        local lp = game:GetService('Players').LocalPlayer
        local po = game.CoreGui.RobloxPromptGui.promptOverlay
        local ts = game:GetService('TeleportService')

        po.ChildAdded:Connect(function(a)
        if a.Name == 'ErrorPrompt' then
            repeat
                ts:Teleport(game.PlaceId)
                wait(2)
            until false
        end
    end)

    game:GetService("Players").PlayerRemoving:Connect(function(player)
        if player == lp then
            ts:Teleport(game.PlaceId)
            end
        end)
    end,
})

local AntiAfkToggle = CFGS:CreateToggle({
    Name = "Não ser expulso por inatividade",
    CurrentValue = antiAfkEnabled,
    Flag = "AntiAfkToggle",
    Callback = function(Value)
        toggleAntiAfk()
    end,
})

local ScriptSection = CFGS:CreateSection("Script")

 local AllowMultiInstanceToggle = CFGS:CreateToggle({
    Name = "Permitir que seja executado mais de uma vez",
    CurrentValue =  _G.ScriptExecuted,
    Flag = "AllowMultiInstanceToggle", 
    Callback = function(Value)
        if Value then
            _G.ScriptExecuted = false
        else
            _G.ScriptExecuted = true
        end
    end,
})

print("@nyxz.os")
print(":)")

if isDeveloper(player) then
	wait(10.5)
    Rayfield:Notify({
        NotifyDevSound(),
        Title = "Ativação concluída.",
        Content = "Account ID : " .. player.UserId,
        Duration = 5,
        Image = "badge-check",
    })
end

wait(10.5)

 Rayfield:Notify({
    NotifySound(),
    Title = "Precisa de ajuda?",
    Content = "Deixa de ser bobo e aprende a usar o script sozinho. :)",
    Duration = 5,
    Image = "circle-help",
 })

wait(5.5)

Rayfield:Notify({
    NotifySound(),
    Title = "Versão do Midnight : " .. scriptversion,
    Content = "Caso você tenha alguma sugestão ou queira reportar um bug, entre em contato comigo. :)",
    Duration = 5,
    Image = 90950535175161,
})

-- This script ends here.
