local players = game:GetService("Players")
local localPlayer = players.LocalPlayer
local userInput = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local mouse = localPlayer:GetMouse()

local triggerbotEnabled = false

local function isVisible(target)
    local character = localPlayer.Character
    if not character then return false end
    local head = character:FindFirstChild("Head")
    if not head then return false end
    local ray = Ray.new(head.Position, (target.Position - head.Position).unit * 1000)
    local part = workspace:FindPartOnRayWithIgnoreList(ray, {character})
    return part and part:IsDescendantOf(target.Parent)
end

local function getHeadTarget()
    local target = mouse.Target
    return target and target.Name == "Head" and players:GetPlayerFromCharacter(target.Parent) and target.Parent ~= localPlayer.Character and isVisible(target)
end

userInput.InputBegan:Connect(function(input, isProcessed)
    if isProcessed then return end
    if input.KeyCode == Enum.KeyCode.E then
        triggerbotEnabled = true
    end
end)

userInput.InputEnded:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.E then
        triggerbotEnabled = false
    end
end)

runService.RenderStepped:Connect(function()
    if triggerbotEnabled and getHeadTarget() then
        mouse1click()
    end
end)
