
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/Dxrk38677/ssssssssss/refs/heads/main/rayfieldRshift.txt'))()

local Window = Rayfield:CreateWindow({
   Name = "🔫 Rivals Hub JustAChillCoder",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Loading Rivals Hub",
   LoadingSubtitle = "Made By JustAChillCoder",
   Theme = "default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "RivalsHub"
   },

   Discord = {
      Enabled = true, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "cw6MArs9e4", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = false -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Rivals Hub JustAChillCoder",
      Subtitle = "Key System",
      Note = "No Key? Ask JustAChillCoder For a Key!", -- Use this to tell the user how to get a key
      FileName = "ChillCoderHub", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"https://pastebin.com/raw/kvgtzh3j"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

Rayfield:Notify({
   Title = "Thank You For Using Rivals Hub",
   Content = "Have Fun Cheating :D",
   Duration = 6.5,
   Image = 4483362458,
})

local Tab = Window:CreateTab("ESP", 71893798)

local Button = Tab:CreateButton({
   Name = "Visible ESP(H)",
   Callback = function()
       loadstring(game:HttpGet('https://raw.githubusercontent.com/Dxrk38677/ssssssssss/refs/heads/main/Visible%20ESP.lua'))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Rainbow ESP(H)",
   Callback = function()
       loadstring(game:HttpGet('https://raw.githubusercontent.com/Dxrk38677/ssssssssss/refs/heads/main/Old%20Rainbow%20ESP.lua'))()
   end,
})

local Tab = Window:CreateTab("TP", 4483362459)

local Button = Tab:CreateButton({
   Name = "Tp Behind(J)",
   Callback = function()
       loadstring(game:HttpGet('https://raw.githubusercontent.com/Dxrk38677/ssssssssss/refs/heads/main/Telport%20behind%20(J).lua'))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Tp On Top (K)",
   Callback = function()
       loadstring(game:HttpGet('https://raw.githubusercontent.com/Dxrk38677/ssssssssss/refs/heads/main/teleport%20on%20top%20(K).lua'))()
   end,
})

local Tab = Window:CreateTab("Exploits", 8173398)

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

local Tab = Window:CreateTab("Misc", 8172398)

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

local FlyToggle = Tab:CreateToggle({
    Name = "Fly",
    CurrentValue = false,
    Flag = "fly_toggle",
    Callback = function(Value)
        _G.isFlying = not _G.isFlying
        local player = game:GetService("Players").LocalPlayer
        local character = player.Character
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        
        -- Fly Speed Variables
        local flySpeed = 50
        local moveDirection = Vector3.new(0, 0, 0)
        
        -- Fly Control Keys
        local forward = false
        local backward = false
        local left = false
        local right = false
        local up = false
        local down = false

        -- Update controls based on key input
        local function updateControls()
            if forward then
                moveDirection = moveDirection + humanoidRootPart.CFrame.LookVector
            end
            if backward then
                moveDirection = moveDirection - humanoidRootPart.CFrame.LookVector
            end
            if left then
                moveDirection = moveDirection - humanoidRootPart.CFrame.RightVector
            end
            if right then
                moveDirection = moveDirection + humanoidRootPart.CFrame.RightVector
            end
            if up then
                moveDirection = moveDirection + Vector3.new(0, 1, 0)
            end
            if down then
                moveDirection = moveDirection - Vector3.new(0, 1, 0)
            end

            -- Normalize movement to avoid faster diagonal speeds
            if moveDirection.magnitude > 0 then
                moveDirection = moveDirection.unit * flySpeed
            end
        end

        -- Setup key press events
        game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessedEvent)
            if gameProcessedEvent then return end

            if input.KeyCode == Enum.KeyCode.W then
                forward = true
            elseif input.KeyCode == Enum.KeyCode.S then
                backward = true
            elseif input.KeyCode == Enum.KeyCode.A then
                left = true
            elseif input.KeyCode == Enum.KeyCode.D then
                right = true
            elseif input.KeyCode == Enum.KeyCode.Space then
                up = true
            elseif input.KeyCode == Enum.KeyCode.LeftShift then
                down = true
            end
        end)

        game:GetService("UserInputService").InputEnded:Connect(function(input)
            if input.KeyCode == Enum.KeyCode.W then
                forward = false
            elseif input.KeyCode == Enum.KeyCode.S then
                backward = false
            elseif input.KeyCode == Enum.KeyCode.A then
                left = false
            elseif input.KeyCode == Enum.KeyCode.D then
                right = false
            elseif input.KeyCode == Enum.KeyCode.Space then
                up = false
            elseif input.KeyCode == Enum.KeyCode.LeftShift then
                down = false
            end
        end)

        -- Flying logic
        if _G.isFlying then
            -- Setup the BodyVelocity for smooth movement
            local bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.MaxForce = Vector3.new(400000, 400000, 400000) -- Ensure the force is high enough to enable movement
            bodyVelocity.Velocity = Vector3.new(0, 0, 0)
            bodyVelocity.Parent = humanoidRootPart

            -- Start updating the flying behavior
            local flyConnection
            flyConnection = game:GetService("RunService").Heartbeat:Connect(function()
                if not _G.isFlying then
                    bodyVelocity:Destroy()
                    flyConnection:Disconnect()
                    return
                end

                updateControls() -- Update movement direction based on controls
                bodyVelocity.Velocity = moveDirection
            end)

            -- Notify when flying is activated
            game.StarterGui:SetCore("SendNotification", {Title = "Fly Mode"; Text = "Flying Activated!"; Duration = 5;})

        else
            -- Stop flying and remove BodyVelocity
            if humanoidRootPart:FindFirstChild("BodyVelocity") then
                humanoidRootPart.BodyVelocity:Destroy()
            end
        end
    end,
})


local SpinToggle = Tab:CreateToggle({
   Name = "Spinbot",
   CurrentValue = false,
   Flag = "spinbot_toggle",
   Callback = function(Value)
       _G.isSpinning = not _G.isSpinning
       local player = game:GetService("Players").LocalPlayer
       local character = player.Character
       local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

       -- Speed at which you spin
       local spinSpeed = 1000

       if _G.isSpinning then
           game.StarterGui:SetCore("SendNotification", {Title = "Spinbot"; Text = "Spinning Activated!"; Duration = 5;})

           -- Infinite spinning while toggled on
           local spinConnection
           spinConnection = game:GetService("RunService").Heartbeat:Connect(function()
               if not _G.isSpinning then
                   spinConnection:Disconnect()
                   return
               end

               -- Spin the character's humanoid root part around the Y-axis
               humanoidRootPart.CFrame = humanoidRootPart.CFrame * CFrame.Angles(0, math.rad(spinSpeed), 0)
           end)

       else
           -- Stop spinning when toggle is off
           if spinConnection then
               spinConnection:Disconnect()
           end
       end
   end,
})

local WalkspeedBoostToggle = Tab:CreateToggle({
    Name = "Walkspeed Boost (CFrame)",
    CurrentValue = false,
    Flag = "walkspeed_boost_toggle",
    Callback = function(Value)
        _G.isWalkspeedBoosted = Value
        local player = game:GetService("Players").LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

        local moveDistance = 4 -- Move by 1 meter (stud) per tick
        local moveSpeed = 0.05 -- How fast the teleport loop runs
        local userInputService = game:GetService("UserInputService")
        local runService = game:GetService("RunService")

        local moving = {W = false, A = false, S = false, D = false}
        
        local function canMoveTo(targetPosition)
            local ray = Ray.new(humanoidRootPart.Position, (targetPosition - humanoidRootPart.Position).unit * moveDistance)
            local part = workspace:FindPartOnRayWithIgnoreList(ray, {character})
            return part == nil -- True if no wall is hit
        end

        local function movePlayer()
            while _G.isWalkspeedBoosted do
                local currentCFrame = humanoidRootPart.CFrame
                local newPosition = currentCFrame.Position

                if moving.W then
                    local forward = currentCFrame.LookVector * moveDistance
                    if canMoveTo(newPosition + forward) then
                        newPosition = newPosition + forward
                    end
                end
                if moving.S then
                    local backward = -currentCFrame.LookVector * moveDistance
                    if canMoveTo(newPosition + backward) then
                        newPosition = newPosition + backward
                    end
                end
                if moving.A then
                    local left = -currentCFrame.RightVector * moveDistance
                    if canMoveTo(newPosition + left) then
                        newPosition = newPosition + left
                    end
                end
                if moving.D then
                    local right = currentCFrame.RightVector * moveDistance
                    if canMoveTo(newPosition + right) then
                        newPosition = newPosition + right
                    end
                end

                humanoidRootPart.CFrame = CFrame.new(newPosition, newPosition + currentCFrame.LookVector)
                task.wait(moveSpeed)
            end
        end

        local inputConnection
        local releaseConnection

        if _G.isWalkspeedBoosted then
            inputConnection = userInputService.InputBegan:Connect(function(input, isProcessed)
                if not isProcessed then
                    if input.KeyCode == Enum.KeyCode.W then moving.W = true end
                    if input.KeyCode == Enum.KeyCode.S then moving.S = true end
                    if input.KeyCode == Enum.KeyCode.A then moving.A = true end
                    if input.KeyCode == Enum.KeyCode.D then moving.D = true end
                end
            end)

            releaseConnection = userInputService.InputEnded:Connect(function(input)
                if input.KeyCode == Enum.KeyCode.W then moving.W = false end
                if input.KeyCode == Enum.KeyCode.S then moving.S = false end
                if input.KeyCode == Enum.KeyCode.A then moving.A = false end
                if input.KeyCode == Enum.KeyCode.D then moving.D = false end
            end)

            coroutine.wrap(movePlayer)()
        else
            if inputConnection then inputConnection:Disconnect() end
            if releaseConnection then releaseConnection:Disconnect() end
        end
    end,
})

