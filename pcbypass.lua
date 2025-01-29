local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Bypass de Voz",
   Icon = "audio-lines", -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Bem-vindo!",
   LoadingSubtitle = "Feito por @nyxz.os",
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = true, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "39qBjvX4wD", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
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

Rayfield:Notify({
   Title = "Bem-vindo!",
   Content = "Aviso! Caso você seja denunciado em massa, sua conta poderá ser banida por um dia ou mais.",
   Duration = 10,
   Image = "triangle-alert",
})

Rayfield:Notify({
   Title = "Como usar?",
   Content = "Após levar a suspensão, abra o script e aperte na opção de reiniciar o serviço de voz. Você também pode usar o modo automático.",
   Duration = 30,
   Image = "circle-help",
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
                    print("Rejoining VoiceChat")
                    vc_service:joinVoice()
                end)
                if not success then
                    warn("Error while rejoining voice chat:", err)
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
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EnterpriseExperience/SystemBroken/main/source"))()
end

function EclipseHubScriptString()
    local a,b,c,d=assert,pcall(loadstring,(request or http_request or error("Unsupported"))({Url="https\58//api.eclipsehub.xyz/auth?\116\121pe\61\50",Method="GET"}).Body);a(not b and warn(d) or c());
end

function GraphicsEnhancerScriptString()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EnterpriseExperience/PublicScriptsOnRobloxExploiting/refs/heads/main/GraphicsEnhancer.lua"))()
end

function FreeEmotesGUIScriptString()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/LmaoItsCrazyBro/qweytguqwebuqt/refs/heads/main/marked_esp_system_ai"))()
end

function ReverseScriptString()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Arthurfillipy/Reverse-Mic_Up-Roblox-Pc-and-Mobile/refs/heads/main/Reverse-Mic_Up-Roblox-Pc-and-Mobile-Script.lua"))()
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

local VCOP = Window:CreateTab("Opções Gerais", "mic") -- Title, Image

local TPSC = Window:CreateTab("Teleportes", "map-pin") -- Title, Image

local SCPT = Window:CreateTab("Outros Scripts", "file-code-2") -- Title, Image

local CFGS = Window:CreateTab("Configurações", "wrench") -- Title, Image

-- Voice Options (VCOP)

local VCRCButton = VCOP:CreateButton({
   Name = "Reiniciar Serviço de Voz",
   Callback = function()
   VCReconnect() -- The function that takes place when the button is pressed
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
   Flag = "KeybindVCRC", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Keybind)
   VCReconnect() -- The function that takes place when the keybind is pressed
   end,
})

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
    PrivateRoomAntiKill() -- The function that takes place when the button is pressed
    end,
 })

 local SetNightWithLight = VCOP:CreateButton({
    Name = "Desativar Morte na Sala Privada",
    Callback = function()
    SetNightWLight() -- The function that takes place when the button is pressed
    end,
 })
 
-- Other Scripts (SCPT)

local LoadIY = SCPT:CreateButton({
   Name = "Carregar Infinite Yield",
   Callback = function()
   IYScriptString() -- The function that takes place when the button is pressed
   end,
})

local LoadSB = SCPT:CreateButton({
   Name = "Carregar System Broken",
   Callback = function()
   SystemBrokenScriptString() -- The function that takes place when the button is pressed
   end,
})

local LoadEH = SCPT:CreateButton({
   Name = "Carregar Eclipse Hub (Solara - PC Somente)",
   Callback = function()
   EclipseHubScriptString() -- The function that takes place when the button is pressed
   end,
})

local LoadGE = SCPT:CreateButton({
   Name = "Carregar Graphics Enhancer",
   Callback = function()
   GraphicsEnhancerScriptString() -- The function that takes place when the button is pressed
   end,
})

local LoadFEG = SCPT:CreateButton({
   Name = "Carregar Free Emotes GUI",
   Callback = function()
   FreeEmotesGUIScriptString() -- The function that takes place when the button is pressed
   end,
})

local LoadRVS = SCPT:CreateButton({
   Name = "Carregar Reverse Script",
   Callback = function()
   ReverseScriptString() -- The function that takes place when the button is pressed
   end,
})

-- Settings (CFGS)

local DestroyGUI = CFGS:CreateButton({
   Name = "Remover Script (Unload)",
   Callback = function()	
   -- The function that takes place when the button is pressed
   end,
})
