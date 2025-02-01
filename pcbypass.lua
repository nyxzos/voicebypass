if _G.ScriptExecuted == nil then
    _G.ScriptExecuted = false  -- Garantir que a variável comece como 'false'
end

-- Verificando se o script já foi executado
if _G.ScriptExecuted then
    warn("Script já em execução, ative nas configurações para permitir múltiplas execuções.")
    return  -- Impede a execução do script
else
    -- Se o script não foi executado antes, marca como executado
    _G.ScriptExecuted = true
end

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local player = game:GetService("Players").LocalPlayer

if not Rayfield then
    warn("Rayfield não carregado corretamente!")
    return
end

Rayfield:Notify({
   Title = "Inicializando...",
   Content = "Por favor, aguarde.",
   Duration = 1.5,
   Image = "triangle-alert",
})

local Window = Rayfield:CreateWindow({
    Name = "Bypass de Voz - " .. player.Name .. "",
    Icon = "audio-lines",
    LoadingTitle = "Bem-vindo, " .. player.Name .. "!",
    LoadingSubtitle = "Feito por @nyxz.os",
    Theme = "Default",
 
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,
 
    ConfigurationSaving = {
       Enabled = false,
       FolderName = "NyBypassForMicUp",
       FileName = "Config"
    },
 
    Discord = {
       Enabled = true,
       Invite = "39qBjvX4wD",
       RememberJoins = true
    },
 
    KeySystem = false,
    KeySettings = {
       Title = "Untitled",
       Subtitle = "Key System",
       Note = "No method of obtaining the key is provided",
       FileName = "Key",
       SaveKey = true,
       GrabKeyFromSite = false,
       Key = {"Hello"}
    }
 })

 local function resetExecution()
    _G.ScriptExecuted = false
    Rayfield:Notify({
        NotifySound(),
        Title = "Execução Reiniciada!",
        Content = "O script pode ser executado novamente.",
        Duration = 3,
        Image = "check",
    })
end

function NotifySound()
    local User_Input_Service = game:GetService("UserInputService")
        local Sound_Service = game:GetService("SoundService")
        local Sound = Instance.new("Sound",Sound_Service)
        Sound.SoundId = "rbxassetid://8183296024"
        Sound:Play()
end

Rayfield:Notify({
    NotifySound(),
    Title = "Bem-vindo, " .. player.Name .. "!",
    Content = "Aviso! Caso você seja denunciado em massa, sua conta poderá ser banida por um dia ou mais.",
    Duration = 10,
    Image = "triangle-alert",
 })

function VCReconnect()
local voiceChatService = game:GetService("VoiceChatService")
    if voiceChatService then
        voiceChatService:joinVoice()
    else
        warn("VoiceChatService is not available.")
    end
end

function AutoVCRC()
    local vc_inter = game:GetService("VoiceChatInternal")
    local vc_service = game:GetService("VoiceChatService")
    local reconnecting = false
    local retryCooldown = 3.5

    local function onVoiceChatStateChanged(oldState, newState)
        if newState == Enum.VoiceChatState.Ended and not reconnecting then
            reconnecting = true
            task.spawn(function()
                wait(retryCooldown)
                local success, err = pcall(function()
                    wait(0.5)
                    print("Reiniciando Serviço de Voz, aguarde...")
                    vc_service:joinVoice()
                    Rayfield:Notify({
                        NotifySound(),
    Title = "Alerta!",
    Content = "O Serviço de voz está sendo reiniciado! por favor, aguarde.",
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

function IYScriptString()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end

function SystemBrokenScriptString()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/H20CalibreYT/SystemBroken/main/script"))()
end

function EclipseHubScriptString()
    local a,b,c,d=assert,pcall(loadstring,(request or http_request or error("Unsupported"))({Url="https\58//api.eclipsehub.xyz/auth?\116\121pe\61\50",Method="GET"}).Body);a(not b and warn(d) or c());
end

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

function FreeEmotesGUIScriptString()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/LmaoItsCrazyBro/qweytguqwebuqt/refs/heads/main/marked_esp_system_ai"))()
end

function ReverseScriptString()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Arthurfillipy/Reverse-Mic_Up-Roblox-Pc-and-Mobile/refs/heads/main/Reverse-Mic_Up-Roblox-Pc-and-Mobile-Script.lua"))()
end

function resetLightingSettings()
    local Lighting = game:GetService("Lighting")
    local SunRays = Lighting:FindFirstChildOfClass("SunRaysEffect")

    Lighting.ClockTime = 14.5
    Lighting.Brightness = 3
    wait()
    if not Lighting:FindFirstChildOfClass("Atmosphere") then
        warn("Atmosphere not found, creating...")
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
        print("Atmosphere found, continuing...")
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
        warn("Bloom was not found, creating...")
        wait(0.1)
        local Bloom = Instance.new("BloomEffect")
        Bloom.Name = "Bloom"
        Bloom.Parent = Lighting
        Bloom.Intensity = 1
        Bloom.Enabled = true
        Bloom.Size = 24
        Bloom.Threshold = 2
    else
        print("Found Bloom, continuing...")
        wait(0.1)
        Lighting.Bloom.Intensity = 1
        Lighting.Bloom.Enabled = true
        Lighting.Bloom.Size = 24
        Lighting.Bloom.Threshold = 2
    end
    wait(0.1)
    if not Lighting:FindFirstChildOfClass("DepthOfFieldEffect") then
        warn("DepthOfField not found, creating...")
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
        print("DepthOfField found, continuing...")
        wait(0.1)
        Lighting.DepthOfField.Enabled = false
        Lighting.DepthOfField.FarIntensity = 0.1
        Lighting.DepthOfField.FocusDistance = 0.05
        Lighting.DepthOfField.InFocusRadius = 30
        Lighting.DepthOfField.NearIntensity = 0.75
    end
    wait(0.1)
    if not Lighting:FindFirstChildOfClass("SunRaysEffect") then
        warn("SunRays was not found, creating...")
        wait(0.1)
        local SunRays = Instance.new("SunRaysEffect")
        SunRays.Name = "SunRays"
        SunRays.Parent = Lighting
        SunRays.Enabled = true
        SunRays.Intensity = 0.01
        SunRays.Spread = 0.1
    else
        print("SunRays found, continuing...")
        wait(0.1)
        Lighting.SunRays.Enabled = true
        Lighting.SunRays.Intensity = 0.01
        Lighting.SunRays.Spread = 0.1
    end
end

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

function SetDayTime()
    local Lighting = game:GetService("Lighting")
    Lighting.ClockTime = 12
    wait()
    Lighting.Brightness = 1.5
end

function TeleportService()
    local TeleportService = game:GetService("TeleportService")
end

function AudioInputToggle()
    local UserInputService = game:GetService("UserInputService")
    local Audio_Device_Input = getgenv().LocalPlayer.AudioDeviceInput
    local isMuted = false
    Audio_Device_Input.Muted = isMuted
    local AudioDeviceInput = user:FindFirstChildOfClass("AudioDeviceInput")
    local function onInputBegan(input, gameProcessed)
        if gameProcessed then return end
        if input.KeyCode == Enum.KeyCode.RightControl then
            isMuted = not isMuted
            Audio_Device_Input.Muted = isMuted
            if isMuted then
                Rayfield:Notify({
                    NotifySound(),
                    Title = "Alerta!",
                    Content = "Microfone silenciado!",
                    Duration = 2,
                    Image = "mic-off",
                 })
            else
                Rayfield:Notify({
                    NotifySound(),
                    Title = "Alerta!",
                    Content = "Microfone desilenciado!",
                    Duration = 2,
                    Image = "mic",
                 })
            end
        end
    end
end

function PrivateRoomAntiKill()
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
    Callback = function(Size_New)
        player.Character.Humanoid.WalkSpeed = Size_New
    end,
})

local VCOPService = VCOP:CreateLabel("Opções do serviço de voz.", "radio")

local VCRCButton = VCOP:CreateButton({
   Name = "Reiniciar Serviço de Voz",
   Callback = function()
   VCReconnect()
   Rayfield:Notify({
    NotifySound(),
    Title = "Alerta!",
    Content = "O Serviço de voz está sendo reiniciado! por favor, aguarde.",
    Duration = 3,
    Image = "unplug",
 })
   end,
})

local VCRCToggle = VCOP:CreateToggle({
   Name = "Reiniciar Serviço de Voz Automaticamente",
   CurrentValue = false,
   Flag = "VCRCToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   AutoVCRC() -- The function that takes place when the toggle is pressed
   -- The variable (Value) is a boolean on whether the toggle is true or false
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
    Content = "O Serviço de voz está sendo reiniciado! por favor, aguarde.",
    Duration = 3,
    Image = "unplug",
 })
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
    Rayfield:Notify({
        NotifySound(),
        Title = "Aplicado!",
        Content = "Você não irá mais morrer após tocar o chão da sala privada.",
        Duration = 3,
        Image = "check",
     })
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
        Content = "Alterando horário do jogo para Noite.",
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
        Content = "Alterando horário do jogo para Dia.",
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

local LoadEH = SCPT:CreateButton({
   Name = "Carregar Eclipse Hub (Solara - PC Somente)",
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

local LoadRVS = SCPT:CreateButton({
   Name = "Carregar Reverse Script",
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

-- Settings (CFGS)

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
    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId) 
    end,
 })

 local AllowMultiInstanceToggle = CFGS:CreateToggle({
    Name = "Permitir Execução Múltipla",
    CurrentValue = not _G.ScriptExecuted,
    Flag = "AllowMultiInstanceToggle", 
    Callback = function(Value)
        if Value then
            _G.ScriptExecuted = false
            Rayfield:Notify({
                NotifySound(),
                Title = "Execução Permitida!",
                Content = "O script pode ser executado mais de uma vez agora.",
                Duration = 3,
                Image = "check",
            })
        else
            _G.ScriptExecuted = true
        end
    end,
})

wait(10)

 Rayfield:Notify({
    NotifySound(),
    Title = "Como usar?",
    Content = "Após levar a suspensão, abra o script e aperte na opção de reiniciar o serviço de voz. Você também pode usar o modo automático.",
    Duration = 15,
    Image = "circle-help",
 })

wait(15.5)

Rayfield:Notify({
    NotifySound(),
    Title = "Alerta!",
    Content = "Algumas funções desse script funcionam somente no (MIC UP), isso pode causar Callback Error se for usada em outros jogos.",
    Duration = 15,
    Image = "triangle-alert",
 })
