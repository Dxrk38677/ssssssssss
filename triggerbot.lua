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

local function getTarget()
    local target = mouse.Target
    if target then
        local player = players:GetPlayerFromCharacter(target.Parent)
        if player and player ~= localPlayer and isVisible(target) then
            return true
        end
    end
    return false
end

runService.RenderStepped:Connect(function()
    if triggerbotEnabled and getTarget() then
        mouse1click()
    end
end)

userInput.InputBegan:Connect(function(input, isProcessed)
    if isProcessed then return end
    if input.KeyCode == Enum.KeyCode.U then
        triggerbotEnabled = not triggerbotEnabled
    end
end)
