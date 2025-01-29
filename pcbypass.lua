local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.CoreGui

local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 200, 0, 40)  -- Adjusted button size (200x40 pixels)
button.Position = UDim2.new(0.5, -100, 0, 20)  -- Centered at the top of the screen
button.Text = "Reconectar Voice"
button.TextSize = 20  -- Smaller text size
button.BackgroundTransparency = 1  -- Transparent background to allow gradient
button.TextScaled = true
-- Purple gradient background
local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(128, 0, 128)),  -- Dark purple
    ColorSequenceKeypoint.new(1, Color3.fromRGB(186, 85, 211))  -- Light purple
}
gradient.Parent = button

button.TextColor3 = Color3.fromRGB(255, 255, 255)  -- White text
button.Parent = screenGui

-- Button click action
button.MouseButton1Click:Connect(function()
    local voiceChatService = game:GetService("VoiceChatService")
    if voiceChatService then
        voiceChatService:joinVoice()  -- Join voice chat when clicked
        
        -- Show message "VC Suspension Bypassed" for 3 seconds
        local message = Instance.new("Message")
        message.Text = "VC Suspension Bypassed"
        message.Parent = workspace  -- Display the message in the workspace
        wait(3)  -- Wait for 3 seconds
        message:Destroy()  -- Remove the message
    else
        warn("VoiceChatService is not available.")
    end
end)
