local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local localPlayer = Players.LocalPlayer
local camera = workspace.CurrentCamera
local teleportEnabled = false
local targetPlayer = nil
local originalPosition = nil
local teleportHeight = 6
local whitelistedPlayers = {}

local function getClosestPlayer()
    local closest = nil
    local closestDistance = math.huge

    for _, player in ipairs(Players:GetPlayers()) do
        local character = player.Character
        local humanoid = character and character:FindFirstChild("Humanoid")
        if player ~= localPlayer and not whitelistedPlayers[player.Name] and character and character:FindFirstChild("HumanoidRootPart") and humanoid and humanoid.Health > 0 then
            local distance = (localPlayer.Character.HumanoidRootPart.Position - character.HumanoidRootPart.Position).Magnitude
            if distance < closestDistance then
                closestDistance = distance
                closest = player
            end
        end
    end

    return closest
end

local function teleportAboveTarget(target)
    if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
        local targetRoot = target.Character.HumanoidRootPart
        local newPosition = targetRoot.Position + Vector3.new(0, teleportHeight, 0)
        local humanoidRootPart = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
        local humanoid = localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid")
        if humanoidRootPart and humanoid then
            humanoid.PlatformStand = true
            humanoidRootPart.CFrame = CFrame.new(newPosition)
        end
    end
end

local function mimicAboveTarget()
    if not targetPlayer then return end
    teleportAboveTarget(targetPlayer)
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end

    if input.KeyCode == Enum.KeyCode.K then
        teleportEnabled = not teleportEnabled
        if teleportEnabled then
            targetPlayer = getClosestPlayer()
            if targetPlayer then
                originalPosition = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") and localPlayer.Character.HumanoidRootPart.Position
            else
                teleportEnabled = false
            end
        else
            if originalPosition then
                local humanoidRootPart = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
                local humanoid = localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid")
                if humanoidRootPart and humanoid then
                    humanoidRootPart.CFrame = CFrame.new(originalPosition)
                    humanoid.PlatformStand = false
                end
            end
            targetPlayer = nil
        end
    elseif input.KeyCode == Enum.KeyCode.N and targetPlayer then
        whitelistedPlayers[targetPlayer.Name] = true
    end
end)

RunService.RenderStepped:Connect(function()
    if teleportEnabled then
        mimicAboveTarget()
    end
end)
