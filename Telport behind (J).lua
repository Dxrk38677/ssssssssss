local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local localPlayer = Players.LocalPlayer
local camera = workspace.CurrentCamera
local teleportEnabled = false
local targetPlayer = nil
local originalPosition = nil
local teleportDistance = 5
local whitelist = {} -- List of players to exclude from teleportation

local function getClosestPlayer()
    local closest = nil
    local closestDistance = math.huge

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= localPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and not whitelist[player.Name] then
            local humanoid = player.Character:FindFirstChild("Humanoid")
            if humanoid and humanoid.Health > 0 then
                local distance = (localPlayer.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                if distance < closestDistance then
                    closestDistance = distance
                    closest = player
                end
            end
        end
    end

    return closest
end

local function teleportBehindTarget(target)
    if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
        local targetRoot = target.Character.HumanoidRootPart
        local targetCFrame = targetRoot.CFrame
        local offset = targetCFrame.LookVector * -teleportDistance
        local newPosition = targetRoot.Position + offset

        local humanoidRootPart = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
        if humanoidRootPart then
            humanoidRootPart.CFrame = CFrame.new(newPosition, targetRoot.Position)
        end
    end
end

local function mimicTarget()
    if not targetPlayer then return end
    teleportBehindTarget(targetPlayer)
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end

    if input.KeyCode == Enum.KeyCode.J then
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
                if humanoidRootPart then
                    humanoidRootPart.CFrame = CFrame.new(originalPosition)
                end
            end
            targetPlayer = nil
        end
    end

    if input.KeyCode == Enum.KeyCode.N then
        if targetPlayer then
            whitelist[targetPlayer.Name] = true
            print(targetPlayer.Name .. " added to whitelist.")
        end
    end
end)

RunService.RenderStepped:Connect(function()
    if teleportEnabled then
        mimicTarget()
    end
end)
