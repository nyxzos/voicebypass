print("Carregando Script")

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

print("Carregando Interface")

local player = game:GetService("Players").LocalPlayer

if not Rayfield then
    warn("Interface não foi carregada.")
    return
end

local blacklist = {
    4274673149, -- boracalo
    0,
}

local devIds = {
    1827004776, -- nyyztx - owner/dev
    5796556085, -- Taffinii_san - subowner <3
    1340011660, -- weslleygg15
    1027026818, -- howcyber
    1003669370, -- pedroliragenari11
    1356740893, -- GuiFangsOfc_YT
    1241851575, -- SrMado
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

Rayfield:Notify({
   Title = "Inicializando...",
   Content = "Por favor, aguarde.",
   Duration = 1.5,
   Image = "triangle-alert",
})

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
    Name = "Bypass de Voz - " .. greeting .. ", " .. player.Name .. "! ",
    Icon = "audio-lines",
    LoadingTitle = greeting .. ", " .. player.Name .. "!",
    LoadingSubtitle = "Feito por @nyxz.os",
    Theme = "Default",
 
    DisableRayfieldPrompts = true,
    DisableBuildWarnings = false,
 
    ConfigurationSaving = {
       Enabled = false,
       FolderName = "BypassForMicUp",
       FileName = "Config"
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
    Title = "Bem-vindo, " .. player.Name .. "!",
    Content = "Aviso! Caso você seja denunciado em massa, sua conta poderá ser banida por um dia ou mais.",
    Duration = 10,
    Image = "triangle-alert",
 })

print("Carregando Função [VCReconnect]")

function VCReconnect()
local voiceChatService = game:GetService("VoiceChatService")
    if voiceChatService then
        voiceChatService:joinVoice()
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
    Content = "O Serviço de voz está sendo reiniciado! Por favor, aguarde.",
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

-- enable or disable shit

local config = {

	Terrain = true;
	ColorCorrection = true;
	Sun = true;
	Lighting = true;
	BloomEffect = true;
	
}

-- settings {

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

-- settings }


if config.ColorCorrection then
	color.Enabled = true
end


if config.Sun then
	sun.Enabled = true
end


if config.Terrain then
	-- settings {
	ter.WaterColor = Color3.fromRGB(10, 10, 24)
	ter.WaterWaveSize = 0.15
	ter.WaterWaveSpeed = 22
	ter.WaterTransparency = 1
	ter.WaterReflectance = 0.05
	-- settings }
end


if config.Lighting then
	-- settings {
	light.Ambient = Color3.fromRGB(0, 0, 0)
	light.Brightness = 4
	light.ColorShift_Bottom = Color3.fromRGB(0, 0, 0)
	light.ColorShift_Top = Color3.fromRGB(0, 0, 0)
	light.ExposureCompensation = 0
	light.FogColor = Color3.fromRGB(132, 132, 132)
	light.GlobalShadows = true
	light.OutdoorAmbient = Color3.fromRGB(112, 117, 128)
	light.Outlines = false
	-- settings }
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
        warn("AudioDeviceInput não encontrado!")
        Rayfield:Notify({
            NotifyErrorSound(),
            Title = "Erro!",
            Content = "Algo inesperado aconteceu. 'AudioDeviceInput' não está disponível. :(",
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
        warn("Essa opção não pode ser usado neste jogo. ID " .. currentGameId)
            Rayfield:Notify({
                NotifyErrorSound(),
                Title = "Erro!",
                Content = "Essa opção não está disponível para outros jogos.",
                Duration = 3,
                Image = "ban",
             })
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
            Rayfield:Notify({
                NotifySound(),
                Title = "Aplicado!",
                Content = "Você não irá mais morrer após tocar o chão da sala privada. :)",
                Duration = 3,
                Image = "check",
             })
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

print("Todas funções foram carregadas.")

local VCOP = Window:CreateTab("Opções Gerais", "mic")

local SCPT = Window:CreateTab("Outros Scripts", "file-code-2")

local CFGS = Window:CreateTab("Configurações", "wrench")

-- Voice Options (VCOP)

local VCOPSelf = VCOP:CreateLabel("Coisas relacionadas ao seu player.", "person-standing")

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
    CurrentKeybind = "F",
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

local teleportKeybind = VCOP:CreateKeybind({
    Name = "Atalho para (Teleportar ao Apertar)",
    CurrentKeybind = "LeftControl",
    HoldToInteract = true,
    Flag = "TeleportKeybind",
    Callback = function(Keybind)
    end,
})

local function teleportToPlayer(targetPlayer)
    local character = player.Character
    if character and character:FindFirstChild("HumanoidRootPart") and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
    end
end

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

local function getPlayerByDisplayName(displayName)
    for _, player in pairs(game.Players:GetPlayers()) do
        if player.DisplayName .. " (@" .. player.Name .. ")" == displayName then
            return player
        end
    end
    return nil
end

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

local VCOPService = VCOP:CreateLabel("Opções do serviço de voz.", "radio")

local VCRCButton = VCOP:CreateButton({
   Name = "Reiniciar Serviço de Voz",
   Callback = function()
   VCReconnect()
   Rayfield:Notify({
    NotifySound(),
    Title = "Alerta!",
    Content = "O Serviço de voz está sendo reiniciado! Por favor, aguarde.",
    Duration = 3,
    Image = "unplug",
 })
   end,
})

local VCRCToggle = VCOP:CreateToggle({
   Name = "Reiniciar Serviço de Voz Automaticamente",
   CurrentValue = false,
   Flag = "VCRCToggle",
   Callback = function(Value)
   AutoVCRC()
   end,
})

local KeybindVCRC = VCOP:CreateKeybind({
   Name = "Atalho para (Reiniciar Serviço)",
   CurrentKeybind = "L",
   HoldToInteract = false,
   Flag = "KeybindVCRC",
   Callback = function(Keybind)
   VCReconnect()
   Rayfield:Notify({
    NotifySound(),
    Title = "Alerta!",
    Content = "O Serviço de voz está sendo reiniciado! Por favor, aguarde.",
    Duration = 3,
    Image = "unplug",
 })
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

local VCOPMap = VCOP:CreateLabel("Baseplate e outras coisas relacionada ao mapa.", "map")

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

local PRAK = VCOP:CreateButton({
    Name = "Desativar Morte na Sala Privada",
    Callback = function()
    PrivateRoomAntiKill()
    end,
 })

local VCOPDayTime = VCOP:CreateLabel("Alterar horário do jogo.", "clock")

 local SetNightWithLight = VCOP:CreateButton({
    Name = "Alterar Horário para Noite",
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
    Name = "Alterar Horário para Dia",
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

local SCPTLabel = SCPT:CreateLabel("Carregar outros scripts úteis.", "file-terminal")

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

-- Settings (CFGS)

local notifyOnPlayerJoin = false
local notifyOnPlayerLeave = false
local notifyFriendsOnly = false

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

game.Players.PlayerAdded:Connect(onPlayerAdded)
game.Players.PlayerRemoving:Connect(onPlayerRemoving)

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

local RejoinServer = CFGS:CreateButton({
    Name = "Reingressar no Servidor",
    Callback = function()
        Rayfield:Notify({
            NotifySound(),
            Title = "Reingressando no servidor.",
            Content = "Por favor, aguarde...",
            Duration = 3,
            Image = "server",
         })
    wait(0.5)
    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId) 
    end,
 })

 local AllowMultiInstanceToggle = CFGS:CreateToggle({
    Name = "Permitir que seja executado mais de uma vez",
    CurrentValue = not _G.ScriptExecuted,
    Flag = "AllowMultiInstanceToggle", 
    Callback = function(Value)
        if Value then
            _G.ScriptExecuted = false
            Rayfield:Notify({
                NotifySound(),
                Title = "Execução permitida!",
                Content = "O script pode ser executado mais de uma vez agora.",
                Duration = 3,
                Image = "check",
            })
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
        Title = "Conta de Desenvolvedor",
        Content = "Você está em uma conta que está na lista de desenvolvedor, algumas funções estão exclusivamente disponíveis para essas contas.",
        Duration = 10,
        Image = "code-xml",
    })
end

wait(10.5)

 Rayfield:Notify({
    NotifySound(),
    Title = "Como usar?",
    Content = "Após levar a suspensão, abra o script e aperte na opção de reiniciar o serviço de voz. Você também pode usar o modo automático.",
    Duration = 15,
    Image = "circle-help",
 })

wait(15.5)

local validPlaceIds = {6884319169, 15546218972}

local isValidPlace = false
for _, placeId in pairs(validPlaceIds) do
    if game.PlaceId == placeId then
        isValidPlace = true
        break
    end
end

if not isValidPlace then
	warn("Você está um jogo que não está listado, isso pode causar erros de Callback.")
	warn("Jogos listados :")
    warn("MIC UP")
    warn("MIC UP +17")
    Rayfield:Notify({
    NotifySound(),
    Title = "Alerta!",
    Content = "Algumas funções desse script funcionam somente no (MIC UP), isso pode causar Callback Error se for usada em alguns jogos.",
    Duration = 15,
    Image = "triangle-alert",
 })
end

wait(15.5)

Rayfield:Notify({
    NotifySound(),
    Title = "Versão 1.6 (12/02/25)",
    Content = "[+] Levitação\n[+] Noclip\n[+] Teleportar ao Apertar\nAlgumas melhores e correções de bugs.\nAproveite, " .. player.Name.. ". :)",
    Duration = 15,
    Image = "book-marked",
})

-- This script ends here.