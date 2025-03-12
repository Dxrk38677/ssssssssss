-- Made By Dxrk3867
-- Made With Luv <3

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")

-- Variables
local localPlayer = Players.LocalPlayer
local camera = Workspace.CurrentCamera
local espEnabled = true
local keybind = Enum.KeyCode.H
local espObjects = {}

-- Function to calculate box size and position
local function getBoundingBox(character)
    local minVec, maxVec
    for _, part in pairs(character:GetChildren()) do
        if part:IsA("BasePart") then
            local partCFrame, size = part.CFrame, part.Size
            local cornerPositions = {
                partCFrame * CFrame.new(size.X / 2, size.Y / 2, size.Z / 2),
                partCFrame * CFrame.new(-size.X / 2, size.Y / 2, size.Z / 2),
                partCFrame * CFrame.new(size.X / 2, -size.Y / 2, size.Z / 2),
                partCFrame * CFrame.new(-size.X / 2, -size.Y / 2, size.Z / 2),
            }
            for _, corner in ipairs(cornerPositions) do
                local screenPos = camera:WorldToViewportPoint(corner.Position)
                if not minVec or not maxVec then
                    minVec = screenPos
                    maxVec = screenPos
                else
                    minVec = Vector2.new(math.min(minVec.X, screenPos.X), math.min(minVec.Y, screenPos.Y))
                    maxVec = Vector2.new(math.max(maxVec.X, screenPos.X), math.max(maxVec.Y, screenPos.Y))
                end
            end
        end
    end
    return minVec, maxVec
end

-- Function to determine visibility
local function isVisible(target)
    local origin = camera.CFrame.Position
    local targetPosition = target.Position
    local ray = Ray.new(origin, (targetPosition - origin).Unit * 1000)
    local part = Workspace:FindPartOnRayWithIgnoreList(ray, {localPlayer.Character})
    return part and part:IsDescendantOf(target.Parent)
end

-- Function to create ESP elements
local function createESP(player)
    if player == localPlayer then return end -- Skip the local player

    local espGroup = {}

    -- Nametag
    local nametag = Drawing.new("Text")
    nametag.Size = 16
    nametag.Center = true
    nametag.Outline = true
    nametag.Visible = false

    -- Box
    local box = Drawing.new("Square")
    box.Thickness = 1
    box.Filled = false
    box.Visible = false

    -- Snapline
    local snapline = Drawing.new("Line")
    snapline.Thickness = 1
    snapline.Visible = false

    espGroup.Nametag = nametag
    espGroup.Box = box
    espGroup.Snapline = snapline

    espObjects[player] = espGroup
end

-- Function to update ESP elements
local function updateESP()
    for player, espGroup in pairs(espObjects) do
        local character = player.Character
        local nametag = espGroup.Nametag
        local box = espGroup.Box
        local snapline = espGroup.Snapline

        if character and character:FindFirstChild("HumanoidRootPart") then
            local hrp = character.HumanoidRootPart
            local chest = character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso") or hrp
            local chestPosition, onScreen = camera:WorldToViewportPoint(chest.Position)

            if onScreen then
                local visible = isVisible(hrp)
                local espColor = visible and Color3.new(0, 1, 0) or Color3.new(1, 0, 0) -- Green if visible, red if not
                local distance = (localPlayer.Character.HumanoidRootPart.Position - hrp.Position).Magnitude
                local health = 0

                -- Get health if Humanoid exists
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    health = math.floor(humanoid.Health) -- Round health to an integer
                end

                -- Calculate bounding box
                local minVec, maxVec = getBoundingBox(character)
                if minVec and maxVec then
                    local boxPosition = minVec
                    local boxSize = maxVec - minVec

                    -- Update box
                    box.Visible = espEnabled
                    box.Position = boxPosition
                    box.Size = boxSize
                    box.Color = espColor

                    -- Update nametag with health
                    nametag.Visible = espEnabled
                    nametag.Text = string.format("%s | %.1f m | (%d)", player.Name, distance, health)
                    nametag.Position = Vector2.new(boxPosition.X + boxSize.X / 2, boxPosition.Y - 20)
                    nametag.Color = espColor

                    -- Update snapline
                    snapline.Visible = espEnabled
                    snapline.Color = espColor
                    snapline.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y)
                    snapline.To = Vector2.new(chestPosition.X, chestPosition.Y)
                end
            else
                nametag.Visible = false
                box.Visible = false
                snapline.Visible = false
            end
        else
            nametag.Visible = false
            box.Visible = false
            snapline.Visible = false
        end
    end
end

-- Function to clean up ESP elements
local function removeESP(player)
    if espObjects[player] then
        espObjects[player].Nametag:Remove()
        espObjects[player].Box:Remove()
        espObjects[player].Snapline:Remove()
        espObjects[player] = nil
    end
end

-- Player added event
Players.PlayerAdded:Connect(function(player)
    createESP(player)
end)

-- Player removing event
Players.PlayerRemoving:Connect(removeESP)

-- Initialize ESP for existing players
for _, player in ipairs(Players:GetPlayers()) do
    createESP(player)
end

-- Update ESP on every frame
RunService.RenderStepped:Connect(function()
    if espEnabled then
        updateESP()
    end
end)

-- Toggle ESP visibility with hotkey 'H'
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end

    if input.KeyCode == keybind then
        espEnabled = not espEnabled
        for _, espGroup in pairs(espObjects) do
            espGroup.Box.Visible = espEnabled
            espGroup.Nametag.Visible = espEnabled
            espGroup.Snapline.Visible = espEnabled
        end
    end
end)
