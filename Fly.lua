-- Variables
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local FLYING = false
local flyKey = Enum.KeyCode.L
local iyflyspeed = 1
local vehicleflyspeed = 1
local CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
local lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
local SPEED = 0

local function getRoot(character)
    return character and character:FindFirstChild("HumanoidRootPart")
end

local function FLY(vfly)
    local T = getRoot(Players.LocalPlayer.Character)
    if not T then return end

    -- Create BodyGyro and BodyVelocity
    local BG = Instance.new('BodyGyro')
    local BV = Instance.new('BodyVelocity')
    BG.P = 9e4
    BG.Parent = T
    BV.Parent = T
    BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
    BG.cframe = T.CFrame
    BV.velocity = Vector3.new(0, 0, 0)
    BV.maxForce = Vector3.new(9e9, 9e9, 9e9)

    -- Fly logic
    task.spawn(function()
        repeat wait()
            if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then
                SPEED = 50
            elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0) and SPEED ~= 0 then
                SPEED = 0
            end
            if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then
                BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
                lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
            elseif CONTROL.L + CONTROL.R == 0 and CONTROL.F + CONTROL.B == 0 and CONTROL.Q + CONTROL.E == 0 and SPEED ~= 0 then
                BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
            else
                BV.velocity = Vector3.new(0, 0, 0)
            end
            BG.cframe = workspace.CurrentCamera.CoordinateFrame
        until not FLYING
        CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
        lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
        SPEED = 0
        BG:Destroy()
        BV:Destroy()
    end)
end

-- Stop flying
local function NOFLY()
    FLYING = false
    if Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
        Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
    end
    pcall(function() workspace.CurrentCamera.CameraType = Enum.CameraType.Custom end)
end

-- Toggle flying state with the L key
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == flyKey then
        if FLYING then
            NOFLY()
        else
            FLY()
            FLYING = true
        end
    end
end)

-- Keydown and Keyup events for controlling flight
local flyKeyDown
local flyKeyUp

flyKeyDown = UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if FLYING then
        if input.KeyCode == Enum.KeyCode.W then
            CONTROL.F = iyflyspeed
        elseif input.KeyCode == Enum.KeyCode.S then
            CONTROL.B = -iyflyspeed
        elseif input.KeyCode == Enum.KeyCode.A then
            CONTROL.L = -iyflyspeed
        elseif input.KeyCode == Enum.KeyCode.D then
            CONTROL.R = iyflyspeed
        elseif input.KeyCode == Enum.KeyCode.E then
            CONTROL.Q = iyflyspeed * 2
        elseif input.KeyCode == Enum.KeyCode.Q then
            CONTROL.E = -iyflyspeed * 2
        end
    end
end)

flyKeyUp = UserInputService.InputEnded:Connect(function(input)
    if FLYING then
        if input.KeyCode == Enum.KeyCode.W then
            CONTROL.F = 0
        elseif input.KeyCode == Enum.KeyCode.S then
            CONTROL.B = 0
        elseif input.KeyCode == Enum.KeyCode.A then
            CONTROL.L = 0
        elseif input.KeyCode == Enum.KeyCode.D then
            CONTROL.R = 0
        elseif input.KeyCode == Enum.KeyCode.E then
            CONTROL.Q = 0
        elseif input.KeyCode == Enum.KeyCode.Q then
            CONTROL.E = 0
        end
    end
end)
