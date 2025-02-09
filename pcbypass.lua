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

print("Carregando Script")

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

print("Carregando Interface")

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
       FolderName = "BypassForMicUp",
       FileName = "Config"
    },
 
    Discord = {
       Enabled = false,
       Invite = "39qBjvX4wD",
       RememberJoins = true
    },
 
    KeySystem = false,
    KeySettings = {
       Title = "null",
       Subtitle = "null",
       Note = "null",
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

print("Carregando Função [NotifySound]")

function NotifySound()
    local User_Input_Service = game:GetService("UserInputService")
        local Sound_Service = game:GetService("SoundService")
        local Sound = Instance.new("Sound",Sound_Service)
        Sound.SoundId = "rbxassetid://8183296024"
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
    function sandbox(var,func)
        local env = getfenv(func)
        local newenv = setmetatable({},{
        __index = function(self,k)
        if k=="script" then
        return var
        else
        return env[k]
        end
        end,
        })
        setfenv(func,newenv)
        return func
        end
        cors = {}
        mas = Instance.new("Model",game:GetService("Lighting"))
        LocalScript0 = Instance.new("LocalScript")
        LocalScript0.Name = "FreeCamera"
        LocalScript0.Parent = mas
        table.insert(cors,sandbox(LocalScript0,function()
        -----------------------------------------------------------------------
        -- Freecam
        -- Cinematic free camera for spectating and video production.
        ------------------------------------------------------------------------
        
        local pi    = math.pi
        local abs   = math.abs
        local clamp = math.clamp
        local exp   = math.exp
        local rad   = math.rad
        local sign  = math.sign
        local sqrt  = math.sqrt
        local tan   = math.tan
        
        local ContextActionService = game:GetService("ContextActionService")
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        local StarterGui = game:GetService("StarterGui")
        local UserInputService = game:GetService("UserInputService")
        
        local LocalPlayer = Players.LocalPlayer
        if not LocalPlayer then
        Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
        LocalPlayer = Players.LocalPlayer
        end
        
        local Camera = workspace.CurrentCamera
        workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
        local newCamera = workspace.CurrentCamera
        if newCamera then
        Camera = newCamera
        end
        end)
        
        ------------------------------------------------------------------------
        
        local TOGGLE_INPUT_PRIORITY = Enum.ContextActionPriority.Low.Value
        local INPUT_PRIORITY = Enum.ContextActionPriority.High.Value
        local FREECAM_MACRO_KB = {Enum.KeyCode.LeftShift, Enum.KeyCode.P}
        
        local NAV_GAIN = Vector3.new(1, 1, 1)*64
        local PAN_GAIN = Vector2.new(0.75, 1)*8
        local FOV_GAIN = 300
        
        local PITCH_LIMIT = rad(90)
        
        local VEL_STIFFNESS = 1.5
        local PAN_STIFFNESS = 1.0
        local FOV_STIFFNESS = 4.0
        
        ------------------------------------------------------------------------
        
        local Spring = {} do
        Spring.__index = Spring
        
        function Spring.new(freq, pos)
        local self = setmetatable({}, Spring)
        self.f = freq
        self.p = pos
        self.v = pos*0
        return self
        end
        
        function Spring:Update(dt, goal)
        local f = self.f*2*pi
        local p0 = self.p
        local v0 = self.v
        
        local offset = goal - p0
        local decay = exp(-f*dt)
        
        local p1 = goal + (v0*dt - offset*(f*dt + 1))*decay
        local v1 = (f*dt*(offset*f - v0) + v0)*decay
        
        self.p = p1
        self.v = v1
        
        return p1
        end
        
        function Spring:Reset(pos)
        self.p = pos
        self.v = pos*0
        end
        end
        
        ------------------------------------------------------------------------
        
        local cameraPos = Vector3.new()
        local cameraRot = Vector2.new()
        local cameraFov = 0
        
        local velSpring = Spring.new(VEL_STIFFNESS, Vector3.new())
        local panSpring = Spring.new(PAN_STIFFNESS, Vector2.new())
        local fovSpring = Spring.new(FOV_STIFFNESS, 0)
        
        ------------------------------------------------------------------------
        
        local Input = {} do
        local thumbstickCurve do
        local K_CURVATURE = 2.0
        local K_DEADZONE = 0.15
        
        local function fCurve(x)
        return (exp(K_CURVATURE*x) - 1)/(exp(K_CURVATURE) - 1)
        end
        
        local function fDeadzone(x)
        return fCurve((x - K_DEADZONE)/(1 - K_DEADZONE))
        end
        
        function thumbstickCurve(x)
        return sign(x)*clamp(fDeadzone(abs(x)), 0, 1)
        end
        end
        
        local gamepad = {
        ButtonX = 0,
        ButtonY = 0,
        DPadDown = 0,
        DPadUp = 0,
        ButtonL2 = 0,
        ButtonR2 = 0,
        Thumbstick1 = Vector2.new(),
        Thumbstick2 = Vector2.new(),
        }
        
        local keyboard = {
        W = 0,
        A = 0,
        S = 0,
        D = 0,
        E = 0,
        Q = 0,
        U = 0,
        H = 0,
        J = 0,
        K = 0,
        I = 0,
        Y = 0,
        Up = 0,
        Down = 0,
        LeftShift = 0,
        RightShift = 0,
        }
        
        local mouse = {
        Delta = Vector2.new(),
        MouseWheel = 0,
        }
        
        local NAV_GAMEPAD_SPEED  = Vector3.new(1, 1, 1)
        local NAV_KEYBOARD_SPEED = Vector3.new(1, 1, 1)
        local PAN_MOUSE_SPEED    = Vector2.new(1, 1)*(pi/64)
        local PAN_GAMEPAD_SPEED  = Vector2.new(1, 1)*(pi/8)
        local FOV_WHEEL_SPEED    = 1.0
        local FOV_GAMEPAD_SPEED  = 0.25
        local NAV_ADJ_SPEED      = 0.75
        local NAV_SHIFT_MUL      = 0.25
        
        local navSpeed = 1
        
        function Input.Vel(dt)
        navSpeed = clamp(navSpeed + dt*(keyboard.Up - keyboard.Down)*NAV_ADJ_SPEED, 0.01, 4)
        
        local kGamepad = Vector3.new(
        thumbstickCurve(gamepad.Thumbstick1.x),
        thumbstickCurve(gamepad.ButtonR2) - thumbstickCurve(gamepad.ButtonL2),
        thumbstickCurve(-gamepad.Thumbstick1.y)
        )*NAV_GAMEPAD_SPEED
        
        local kKeyboard = Vector3.new(
        keyboard.D - keyboard.A + keyboard.K - keyboard.H,
        keyboard.E - keyboard.Q + keyboard.I - keyboard.Y,
        keyboard.S - keyboard.W + keyboard.J - keyboard.U
        )*NAV_KEYBOARD_SPEED
        
        local shift = UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) or UserInputService:IsKeyDown(Enum.KeyCode.RightShift)
        
        return (kGamepad + kKeyboard)*(navSpeed*(shift and NAV_SHIFT_MUL or 1))
        end
        
        function Input.Pan(dt)
        local kGamepad = Vector2.new(
        thumbstickCurve(gamepad.Thumbstick2.y),
        thumbstickCurve(-gamepad.Thumbstick2.x)
        )*PAN_GAMEPAD_SPEED
        local kMouse = mouse.Delta*PAN_MOUSE_SPEED
        mouse.Delta = Vector2.new()
        return kGamepad + kMouse
        end
        
        function Input.Fov(dt)
        local kGamepad = (gamepad.ButtonX - gamepad.ButtonY)*FOV_GAMEPAD_SPEED
        local kMouse = mouse.MouseWheel*FOV_WHEEL_SPEED
        mouse.MouseWheel = 0
        return kGamepad + kMouse
        end
        
        do
        local function Keypress(action, state, input)
        keyboard[input.KeyCode.Name] = state == Enum.UserInputState.Begin and 1 or 0
        return Enum.ContextActionResult.Sink
        end
        
        local function GpButton(action, state, input)
        gamepad[input.KeyCode.Name] = state == Enum.UserInputState.Begin and 1 or 0
        return Enum.ContextActionResult.Sink
        end
        
        local function MousePan(action, state, input)
        local delta = input.Delta
        mouse.Delta = Vector2.new(-delta.y, -delta.x)
        return Enum.ContextActionResult.Sink
        end
        
        local function Thumb(action, state, input)
        gamepad[input.KeyCode.Name] = input.Position
        return Enum.ContextActionResult.Sink
        end
        
        local function Trigger(action, state, input)
        gamepad[input.KeyCode.Name] = input.Position.z
        return Enum.ContextActionResult.Sink
        end
        
        local function MouseWheel(action, state, input)
        mouse[input.UserInputType.Name] = -input.Position.z
        return Enum.ContextActionResult.Sink
        end
        
        local function Zero(t)
        for k, v in pairs(t) do
        t[k] = v*0
        end
        end
        
        function Input.StartCapture()
        ContextActionService:BindActionAtPriority("FreecamKeyboard", Keypress, false, INPUT_PRIORITY,
        Enum.KeyCode.W, Enum.KeyCode.U,
        Enum.KeyCode.A, Enum.KeyCode.H,
        Enum.KeyCode.S, Enum.KeyCode.J,
        Enum.KeyCode.D, Enum.KeyCode.K,
        Enum.KeyCode.E, Enum.KeyCode.I,
        Enum.KeyCode.Q, Enum.KeyCode.Y,
        Enum.KeyCode.Up, Enum.KeyCode.Down
        )
        ContextActionService:BindActionAtPriority("FreecamMousePan",          MousePan,   false, INPUT_PRIORITY, Enum.UserInputType.MouseMovement)
        ContextActionService:BindActionAtPriority("FreecamMouseWheel",        MouseWheel, false, INPUT_PRIORITY, Enum.UserInputType.MouseWheel)
        ContextActionService:BindActionAtPriority("FreecamGamepadButton",     GpButton,   false, INPUT_PRIORITY, Enum.KeyCode.ButtonX, Enum.KeyCode.ButtonY)
        ContextActionService:BindActionAtPriority("FreecamGamepadTrigger",    Trigger,    false, INPUT_PRIORITY, Enum.KeyCode.ButtonR2, Enum.KeyCode.ButtonL2)
        ContextActionService:BindActionAtPriority("FreecamGamepadThumbstick", Thumb,      false, INPUT_PRIORITY, Enum.KeyCode.Thumbstick1, Enum.KeyCode.Thumbstick2)
        end
        
        function Input.StopCapture()
        navSpeed = 1
        Zero(gamepad)
        Zero(keyboard)
        Zero(mouse)
        ContextActionService:UnbindAction("FreecamKeyboard")
        ContextActionService:UnbindAction("FreecamMousePan")
        ContextActionService:UnbindAction("FreecamMouseWheel")
        ContextActionService:UnbindAction("FreecamGamepadButton")
        ContextActionService:UnbindAction("FreecamGamepadTrigger")
        ContextActionService:UnbindAction("FreecamGamepadThumbstick")
        end
        end
        end
        
        local function GetFocusDistance(cameraFrame)
        local znear = 0.1
        local viewport = Camera.ViewportSize
        local projy = 2*tan(cameraFov/2)
        local projx = viewport.x/viewport.y*projy
        local fx = cameraFrame.rightVector
        local fy = cameraFrame.upVector
        local fz = cameraFrame.lookVector
        
        local minVect = Vector3.new()
        local minDist = 512
        
        for x = 0, 1, 0.5 do
        for y = 0, 1, 0.5 do
        local cx = (x - 0.5)*projx
        local cy = (y - 0.5)*projy
        local offset = fx*cx - fy*cy + fz
        local origin = cameraFrame.p + offset*znear
        local part, hit = workspace:FindPartOnRay(Ray.new(origin, offset.unit*minDist))
        local dist = (hit - origin).magnitude
        if minDist > dist then
        minDist = dist
        minVect = offset.unit
        end
        end
        end
        
        return fz:Dot(minVect)*minDist
        end
        
        ------------------------------------------------------------------------
        
        local function StepFreecam(dt)
        local vel = velSpring:Update(dt, Input.Vel(dt))
        local pan = panSpring:Update(dt, Input.Pan(dt))
        local fov = fovSpring:Update(dt, Input.Fov(dt))
        
        local zoomFactor = sqrt(tan(rad(70/2))/tan(rad(cameraFov/2)))
        
        cameraFov = clamp(cameraFov + fov*FOV_GAIN*(dt/zoomFactor), 1, 120)
        cameraRot = cameraRot + pan*PAN_GAIN*(dt/zoomFactor)
        cameraRot = Vector2.new(clamp(cameraRot.x, -PITCH_LIMIT, PITCH_LIMIT), cameraRot.y%(2*pi))
        
        local cameraCFrame = CFrame.new(cameraPos)*CFrame.fromOrientation(cameraRot.x, cameraRot.y, 0)*CFrame.new(vel*NAV_GAIN*dt)
        cameraPos = cameraCFrame.p
        
        Camera.CFrame = cameraCFrame
        Camera.Focus = cameraCFrame*CFrame.new(0, 0, -GetFocusDistance(cameraCFrame))
        Camera.FieldOfView = cameraFov
        end
        
        ------------------------------------------------------------------------
        
        local PlayerState = {} do
        local mouseIconEnabled
        local cameraSubject
        local cameraType
        local cameraFocus
        local cameraCFrame
        local cameraFieldOfView
        local screenGuis = {}
        local coreGuis = {
        Backpack = true,
        Chat = true,
        Health = true,
        PlayerList = true,
        }
        local setCores = {
        BadgesNotificationsActive = true,
        PointsNotificationsActive = true,
        }
        
        -- Save state and set up for freecam
        function PlayerState.Push()
        for name in pairs(coreGuis) do
        coreGuis[name] = StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType[name])
        StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType[name], false)
        end
        for name in pairs(setCores) do
        setCores[name] = StarterGui:GetCore(name)
        StarterGui:SetCore(name, false)
        end
        local playergui = LocalPlayer:FindFirstChildOfClass("PlayerGui")
        if playergui then
        for _, gui in pairs(playergui:GetChildren()) do
        if gui:IsA("ScreenGui") and gui.Enabled then
        screenGuis[#screenGuis + 1] = gui
        gui.Enabled = false
        end
        end
        end
        
        cameraFieldOfView = Camera.FieldOfView
        Camera.FieldOfView = 70
        
        cameraType = Camera.CameraType
        Camera.CameraType = Enum.CameraType.Custom
        
        cameraSubject = Camera.CameraSubject
        Camera.CameraSubject = nil
        
        cameraCFrame = Camera.CFrame
        cameraFocus = Camera.Focus
        
        mouseIconEnabled = UserInputService.MouseIconEnabled
        UserInputService.MouseIconEnabled = false
        
        mouseBehavior = UserInputService.MouseBehavior
        UserInputService.MouseBehavior = Enum.MouseBehavior.Default
        end
        
        -- Restore state
        function PlayerState.Pop()
        for name, isEnabled in pairs(coreGuis) do
        StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType[name], isEnabled)
        end
        for name, isEnabled in pairs(setCores) do
        StarterGui:SetCore(name, isEnabled)
        end
        for _, gui in pairs(screenGuis) do
        if gui.Parent then
        gui.Enabled = true
        end
        end
        
        Camera.FieldOfView = cameraFieldOfView
        cameraFieldOfView = nil
        
        Camera.CameraType = cameraType
        cameraType = nil
        
        Camera.CameraSubject = cameraSubject
        cameraSubject = nil
        
        Camera.CFrame = cameraCFrame
        cameraCFrame = nil
        
        Camera.Focus = cameraFocus
        cameraFocus = nil
        
        UserInputService.MouseIconEnabled = mouseIconEnabled
        mouseIconEnabled = nil
        
        UserInputService.MouseBehavior = mouseBehavior
        mouseBehavior = nil
        end
        end
        
        local function StartFreecam()
        local cameraCFrame = Camera.CFrame
        cameraRot = Vector2.new(cameraCFrame:toEulerAnglesYXZ())
        cameraPos = cameraCFrame.p
        cameraFov = Camera.FieldOfView
        
        velSpring:Reset(Vector3.new())
        panSpring:Reset(Vector2.new())
        fovSpring:Reset(0)
        
        PlayerState.Push()
        RunService:BindToRenderStep("Freecam", Enum.RenderPriority.Camera.Value, StepFreecam)
        Input.StartCapture()
        end
        
        local function StopFreecam()
        Input.StopCapture()
        RunService:UnbindFromRenderStep("Freecam")
        PlayerState.Pop()
        end
        
        ------------------------------------------------------------------------
        
        do
        local enabled = false
        
        local function ToggleFreecam()
        if enabled then
        StopFreecam()
        else
        StartFreecam()
        end
        enabled = not enabled
        end
        
        local function CheckMacro(macro)
        for i = 1, #macro - 1 do
        if not UserInputService:IsKeyDown(macro[i]) then
        return
        end
        end
        ToggleFreecam()
        end
        
        local function HandleActivationInput(action, state, input)
        if state == Enum.UserInputState.Begin then
        if input.KeyCode == FREECAM_MACRO_KB[#FREECAM_MACRO_KB] then
        CheckMacro(FREECAM_MACRO_KB)
        end
        end
        return Enum.ContextActionResult.Pass
        end
        
        ContextActionService:BindActionAtPriority("FreecamToggle", HandleActivationInput, false, TOGGLE_INPUT_PRIORITY, FREECAM_MACRO_KB[#FREECAM_MACRO_KB])
        end
        end))
        for i,v in pairs(mas:GetChildren()) do
        v.Parent = game:GetService("Players").LocalPlayer.PlayerGui
        pcall(function() v:MakeJoints() end)
        end
        mas:Destroy()
        for i,v in pairs(cors) do
        spawn(function()
        pcall(v)
        end)
    end
end

print("Carregando Função [resetLightingSettings]")

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

-- Variável para armazenar o estado de silenciado/desilenciado
local isMuted = false

print("Carregando Função [AudioInputToggle]")

function AudioInputToggle()
    local UserInputService = game:GetService("UserInputService")
    local player = game.Players.LocalPlayer

    -- Certifique-se de que o AudioDeviceInput existe
    local Audio_Device_Input = player:FindFirstChild("AudioDeviceInput")

    if Audio_Device_Input then
        -- Alterna o estado de silenciado
        isMuted = not isMuted
        Audio_Device_Input.Muted = isMuted

        -- Notificação dependendo do estado
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
    Rayfield:Notify({
        NotifySound(),
        Title = "Aplicado!",
        Content = "Você não irá mais morrer após tocar o chão da sala privada. :)",
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

local LoadIY = SCPT:CreateButton({
    Name = "Carregar CMD-X (Luna - PC)",
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
   Name = "Carregar Eclipse Hub (Solara/Nihon/Wave/AWP - PC)",
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
    Name = "Carregar Freecam (Shift + P - PC)",
    Callback = function()
     Rayfield:Notify({
         NotifySound(),
         Title = "Executando script...",
         Content = "Carregando Freecam. Aguarde alguns segundos, por favor.",
         Duration = 2.5,
         Image = "file-code",
      })
        FreecamScriptString()
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

print("@nyxz.os")
print(":)")

wait(10)

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

-- @nyxz.os
-- The script ends here.
