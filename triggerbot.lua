local players = game:GetService("Players")
local localPlayer = players.LocalPlayer
local userInput = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local mouse = localPlayer:GetMouse()

local triggerbotEnabled = false

-- Function to check if the target is visible
local function isVisible(target)
    local character = localPlayer.Character
    if not character then return false end
    local head = character:FindFirstChild("Head")
    if not head then return false end
    local ray = Ray.new(head.Position, (target.Position - head.Position).unit * 1000)
    local part = workspace:FindPartOnRayWithIgnoreList(ray, {character})
    return part and part:IsDescendantOf(target.Parent)
end

-- Function to check if the target is a valid player
local function getTarget()
    local target = mouse.Target
    if target then
        local player = players:GetPlayerFromCharacter(target.Parent)
        if player and player ~= localPlayer and isVisible(target) then
            -- Check if the target is part of the head or body (Torso)
            if target.Name == "Head" or target.Name == "UpperTorso" or target.Name == "LowerTorso" then
                return target
            end
        end
    end
    return nil
end

-- Triggerbot activation
userInput.InputBegan:Connect(function(input, isProcessed)
    if isProcessed then return end
    if input.KeyCode == Enum.KeyCode.E then
        triggerbotEnabled = true
    end
end)

-- Deactivation of triggerbot
userInput.InputEnded:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.E then
        triggerbotEnabled = false
    end
end)

-- The main logic for shooting with 100% accuracy when on head or body
runService.RenderStepped:Connect(function()
    if triggerbotEnabled then
        local target = getTarget()
        if target then
            -- Shoot directly at the target (head or body)
            mouse1click()
        end
    end
end)
