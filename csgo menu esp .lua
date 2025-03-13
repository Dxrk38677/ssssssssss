local ArrayField = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/ArrayField/main/Source.lua'))()
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local localPlayer = Players.LocalPlayer
local camera = workspace.CurrentCamera
local espEnabled = false
local rainbowEspEnabled = false
local espObjects = {}
local rainbowEspObjects = {}
local localPlayer = Players.LocalPlayer
local originalPosition = nil
local teleportHeight = 6 -- Distance above the target player
local teleportDistance = 5 -- Distance behind the target player
local teleportOnTopEnabled = false
local teleportBehindEnabled = false
local targetPlayer = nil
local Window = ArrayField:CreateWindow({
   Name = "Rivals Csgo Cheat",
   LoadingTitle = "Loading Rivals Csgo Cheat",
   LoadingSubtitle = "by JustAChillCoder",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "Csgo"
   },
   Discord = {
      Enabled = true,
      Invite = "CxNypMTRHP",
      RememberJoins = true
   },
   KeySystem = true,
   KeySettings = {
      Title = "Rivals Csgo Hub",
      Subtitle = "Key System",
      Note = "Go to The Discord For The Key!",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = true,
      Actions = {
            [1] = {
                Text = 'Click here to copy the key link <--',
                OnPress = function()
                    setclipboard("https://link-target.net/1285424/key-for-rivals")
                end,
                }
            },
      Key = {"https://pastebin.com/raw/kvgtzh3j"}
   }
})

ArrayField:Notify({
   Title = "Thank You For Using Rivals Csgo Hub",
   Content = "Have Fun Cheating :D",
   Duration = 3.5,
   Image = 11351620343,
   Actions = {
      Ignore = {
         Name = "Okay!",
         Callback = function()
         setclipboard("discord.gg/CxNypMTRHP")
      end
   },
 },
})

local Tab = Window:CreateTab("Aim", 4483362458)

local Button = Tab:CreateButton({
   Name = "Csgo Aimbot",
   Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/Dxrk38677/ssssssssss/refs/heads/main/obfuscated_script%5B11%5D.txt"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Rage Aimbot",
   Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/Dxrk38677/Roblox/refs/heads/main/SpinBot..lua"))()
   end,
})

local Tab = Window:CreateTab("Visuals", 4483362458)

local ToggleVisibleEsp = Tab:CreateToggle({
    Name = "Visible ESP",
    CurrentValue = false,
    Flag = "ToggleVisibleESP",
    Callback = function(Value)
        espEnabled = Value
        for _, espGroup in pairs(espObjects) do
            espGroup.Box.Visible = espEnabled
            espGroup.Nametag.Visible = espEnabled
            espGroup.Snapline.Visible = espEnabled
        end
    end,
})

local ToggleRainbowEsp = Tab:CreateToggle({
    Name = "Rainbow ESP",
    CurrentValue = false,
    Flag = "ToggleRainbowESP",
    Callback = function(Value)
        rainbowEspEnabled = Value
        for _, espGroup in pairs(rainbowEspObjects) do
            espGroup.Box.Visible = rainbowEspEnabled
            espGroup.Nametag.Visible = rainbowEspEnabled
            espGroup.Snapline.Visible = rainbowEspEnabled
        end
    end,
})

local Tab = Window:CreateTab("Exploits", 4483362458)

local Button = Tab:CreateButton({
   Name = "Teleport On Top (K)",
   Callback = function()
   loadstring(game:HttpGet("https://pastebin.com/raw/43mErhDh"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Teleport Behind (J)",
   Callback = function()
   loadstring(game:HttpGet("https://pastebin.com/raw/JQgtJkL2"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Anti Flash",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Dxrk38677/Roblox/refs/heads/main/AntiFlashRivals.lua"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Anti Paintball",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Dxrk38677/Roblox/refs/heads/main/antisplatgui.lua"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Delete Smokes",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Dxrk38677/Roblox/refs/heads/main/DeleteSmokes.lua"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Highlight Satchels",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Dxrk38677/Roblox/refs/heads/main/SatchelRedMark.lua"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Highlight Tripmines",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Dxrk38677/Roblox/refs/heads/main/Highlighttripmine"))()
   end,
})

local Toggle = Tab:CreateToggle({
   Name = "Infinite Jump",
   CurrentValue = false,
   Flag = "infjumpp",
   Callback = function(Value)
       _G.infinjump = not _G.infinjump

if _G.infinJumpStarted == nil then
	_G.infinJumpStarted = true
	game.StarterGui:SetCore("SendNotification", {Title="Youtube Hub"; Text="Infinite Jump Activated!"; Duration=5;})

	local plr = game:GetService('Players').LocalPlayer
	local m = plr:GetMouse()
	m.KeyDown:connect(function(k)
		if _G.infinjump then
			if k:byte() == 32 then
			humanoid = game:GetService'Players'.LocalPlayer.Character:FindFirstChildOfClass('Humanoid')
			humanoid:ChangeState('Jumping')
			wait()
			humanoid:ChangeState('Seated')
			end
		end
	end)
end
   end,
})

Tab = Window:CreateTab("Hubs", 4483362458)

local Button = Tab:CreateButton({
   Name = "IY",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/DarkNetworks/Infinite-Yield/refs/heads/main/latest.lua"))()
   end,
})

local Tab = Window:CreateTab("Misc", 4483362458)
local Label = Tab:CreateLabel("Coming Soon....")

local Tab = Window:CreateTab("Credits", 4483362458) 
local Label = Tab:CreateLabel("Made By Dxrk3867 And JustAChillCoder ")
local Label = Tab:CreateLabel("Our First Script Together I Hope You Like It :D")
local Label = Tab:CreateLabel("Join Our Discord --> Discord.gg/CxNypMTRHP")

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

local function isVisible(target)
    local origin = camera.CFrame.Position
    local targetPosition = target.Position
    local ray = Ray.new(origin, (targetPosition - origin).Unit * 1000)
    local part = Workspace:FindPartOnRayWithIgnoreList(ray, {localPlayer.Character})
    return part and part:IsDescendantOf(target.Parent)
end

local function getRainbowColor()
    local hue = tick() % 5 / 5
    return Color3.fromHSV(hue, 1, 1)
end

local function createESP(player)
    if player == localPlayer then return end
    local espGroup = {}
    local nametag = Drawing.new("Text")
    nametag.Size = 16
    nametag.Center = true
    nametag.Outline = true
    nametag.Visible = false
    local box = Drawing.new("Square")
    box.Thickness = 1
    box.Filled = false
    box.Visible = false
    local snapline = Drawing.new("Line")
    snapline.Thickness = 1
    snapline.Visible = false
    espGroup.Nametag = nametag
    espGroup.Box = box
    espGroup.Snapline = snapline
    espObjects[player] = espGroup
end

local function updateVisibleESP()
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
                local espColor = visible and Color3.new(0, 1, 0) or Color3.new(1, 0, 0)
                local distance = (localPlayer.Character.HumanoidRootPart.Position - hrp.Position).Magnitude
                local minVec, maxVec = getBoundingBox(character)
                if minVec and maxVec then
                    local boxPosition = minVec
                    local boxSize = maxVec - minVec
                    box.Visible = espEnabled
                    box.Position = boxPosition
                    box.Size = boxSize
                    box.Color = espColor
                    nametag.Visible = espEnabled
                    nametag.Text = string.format("%s | %.1f m", player.Name, distance)
                    nametag.Position = Vector2.new(boxPosition.X + boxSize.X / 2, boxPosition.Y - 20)
                    nametag.Color = espColor
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

local function updateRainbowESP()
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
                local rainbowColor = getRainbowColor()
                local distance = (localPlayer.Character.HumanoidRootPart.Position - hrp.Position).Magnitude
                local minVec, maxVec = getBoundingBox(character)
                if minVec and maxVec then
                    local boxPosition = minVec
                    local boxSize = maxVec - minVec
                    box.Visible = rainbowEspEnabled
                    box.Position = boxPosition
                    box.Size = boxSize
                    box.Color = rainbowColor
                    nametag.Visible = rainbowEspEnabled
                    nametag.Text = string.format("%s | %.1f m", player.Name, distance)
                    nametag.Position = Vector2.new(boxPosition.X + boxSize.X / 2, boxPosition.Y - 20)
                    nametag.Color = rainbowColor
                    snapline.Visible = rainbowEspEnabled
                    snapline.Color = rainbowColor
                    snapline.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
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

local function removeESP(player)
    if espObjects[player] then
        espObjects[player].Nametag:Remove()
        espObjects[player].Box:Remove()
        espObjects[player].Snapline:Remove()
        espObjects[player] = nil
    end
end

Players.PlayerAdded:Connect(function(player)
    createESP(player)
end)

Players.PlayerRemoving:Connect(removeESP)

for _, player in ipairs(Players:GetPlayers()) do
    createESP(player)
end

RunService.RenderStepped:Connect(function()
    if espEnabled then
        updateVisibleESP()
    end
    if rainbowEspEnabled then
        updateRainbowESP()
    end
end)
