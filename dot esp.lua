local players = game:GetService("Players")
local runService = game:GetService("RunService")
local localPlayer = players.LocalPlayer
local userInput = game:GetService("UserInputService")

local espEnabled = false
local espDots = {}

local function createESP(player)
    if player == localPlayer or not player.Character then return end
    local character = player.Character
    local torso = character:FindFirstChild("UpperTorso") or character:FindFirstChild("HumanoidRootPart")
    if not torso then return end

    local dot = Instance.new("BillboardGui")
    dot.Name = "ESP_Dot"
    dot.Adornee = torso
    dot.Size = UDim2.new(0, 8, 0, 8)
    dot.StudsOffset = Vector3.new(0, 1.5, 0)
    dot.AlwaysOnTop = true

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundTransparency = 0
    frame.BorderSizePixel = 0
    frame.Parent = dot

    dot.Parent = game.CoreGui
    espDots[player] = {dot = dot, frame = frame}
end

local function removeESP(player)
    if espDots[player] then
        espDots[player].dot:Destroy()
        espDots[player] = nil
    end
end

local function updateESP()
    local hue = tick() % 5 / 5
    local color = Color3.fromHSV(hue, 1, 1)
    for _, v in pairs(espDots) do
        v.frame.BackgroundColor3 = color
    end
end

local function toggleESP()
    espEnabled = not espEnabled
    if not espEnabled then
        for _, v in pairs(espDots) do
            v.dot:Destroy()
        end
        espDots = {}
    else
        for _, player in pairs(players:GetPlayers()) do
            if player ~= localPlayer then
                createESP(player)
            end
        end
    end
end

userInput.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.H then
        toggleESP()
    end
end)

players.PlayerAdded:Connect(function(player)
    if espEnabled then
        createESP(player)
    end
end)

players.PlayerRemoving:Connect(function(player)
    removeESP(player)
end)

runService.RenderStepped:Connect(function()
    if espEnabled then
        updateESP()
    end
end)
