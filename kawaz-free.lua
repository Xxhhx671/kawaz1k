local _dkurpTable = {["A"] = 0, ["B"] = 1, ["C"] = 2, ["D"] = 3, ["E"] = 4, ["F"] = 5, ["G"] = 6, ["H"] = 7, ["I"] = 8, ["J"] = 9, ["K"] = 10, ["L"] = 11, ["M"] = 12, ["N"] = 13, ["O"] = 14, ["P"] = 15, ["Q"] = 16, ["R"] = 17, ["S"] = 18, ["T"] = 19, ["U"] = 20, ["V"] = 21, ["W"] = 22, ["X"] = 23, ["Y"] = 24, ["Z"] = 25, ["a"] = 26, ["b"] = 27, ["c"] = 28, ["d"] = 29, ["e"] = 30, ["f"] = 31, ["g"] = 32, ["h"] = 33, ["i"] = 34, ["j"] = 35, ["k"] = 36, ["l"] = 37, ["m"] = 38, ["n"] = 39, ["o"] = 40, ["p"] = 41, ["q"] = 42, ["r"] = 43, ["s"] = 44, ["t"] = 45, ["u"] = 46, ["v"] = 47, ["w"] = 48, ["x"] = 49, ["y"] = 50, ["z"] = 51, ["0"] = 52, ["1"] = 53, ["2"] = 54, ["3"] = 55, ["4"] = 56, ["5"] = 57, ["6"] = 58, ["7"] = 59, ["8"] = 60, ["9"] = 61, ["+"] = 62, ["/"] = 63}
local function _dkurp(s)
    local bytes = {}
    local buffer, bits = 0, 0
    for i = 1, #s do
        local ch = s:sub(i, i)
        if ch == "=" then break end
        local val = _dkurpTable[ch]
        if val ~= nil then
            buffer = bit32.bor(bit32.lshift(buffer, 6), val)
            bits = bits + 6
            if bits >= 8 then
                bits = bits - 8
                bytes[#bytes + 1] = bit32.band(bit32.rshift(buffer, bits), 0xFF)
            end
        end
    end
    local key = "gyewtnnsoxox"
    local out = {}
    for i = 1, #bytes do
        local k = key:byte(((i - 1) % #key) + 1)
        out[i] = string.char(bit32.bxor(bytes[i], k))
    end
    return table.concat(out)
end


local TweenService     = game:GetService(_dkurp("Mw4AEho9CwEZEQwd"))
local UserInputService = game:GetService(_dkurp("MgoABT0AHgYbKwoKERAGEg=="))
local RunService       = game:GetService(_dkurp("NQwLJBEcGBoMHQ=="))
local CoreGui          = game:GetService(_dkurp("JBYXEjMbBw=="))
local Players          = game:GetService(_dkurp("NxUEDhEcHQ=="))
local Lighting         = game:GetService(_dkurp("KxACHwAHABQ="))
local Stats            = game:GetService(_dkurp("NA0EAwc="))

local LocalPlayer = Players.LocalPlayer or Players.PlayerAdded:Wait()
local IS_MOBILE   = UserInputService.TouchEnabled and not UserInputService.MouseEnabled
local Camera      = workspace.CurrentCamera

local CUSTOM_LOGO_ID = _dkurp("FRsdFgcdCwcGHFVXSEhWTkFYVkVeSl1BU0tdRA==")


pcall(function()
    local p = (gethui and gethui()) or CoreGui or LocalPlayer:WaitForChild(_dkurp("NxUEDhEcKQYG"))
    for _, child in ipairs(p:GetChildren()) do
        if child.Name:find(_dkurp("KQwXBAECGhIB")) then child:Destroy() end
    end
end)

pcall(function()
    local b1 = Lighting:FindFirstChild(_dkurp("KQwXBAECGhIBJyYWEwsKNRgbHA=="))
    local b2 = Lighting:FindFirstChild(_dkurp("KQwXBAECGhIBNQoWEjsJAgY="))
    if b1 then b1:Destroy() end
    if b2 then b2:Destroy() end
end)

local ScreenGui = Instance.new(_dkurp("NBoXEhEAKQYG"))
ScreenGui.Name = _dkurp("KQwXBAECGhIBOwAVFxUAAxE7Jw==")
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true

pcall(function()
    ScreenGui.Parent = (gethui and gethui()) or CoreGui or LocalPlayer:WaitForChild(_dkurp("NxUEDhEcKQYG"))
end)
if not ScreenGui.Parent then ScreenGui.Parent = CoreGui end

local BlurEffect = Lighting:FindFirstChild(_dkurp("KQwXBAECGhIBNQoWEjsJAgY="))
if not BlurEffect then
    BlurEffect = Instance.new(_dkurp("JRUQBTEICBYMDA=="))
    BlurEffect.Name = _dkurp("KQwXBAECGhIBNQoWEjsJAgY=")
    BlurEffect.Size = 0
    BlurEffect.Enabled = false
    BlurEffect.Parent = Lighting
end

local function setMenuBlur(active)
    pcall(function()
        if active then
            BlurEffect.Enabled = true
            TweenService:Create(BlurEffect, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = (25 - 10)}):Play()
        else
            local tw = TweenService:Create(BlurEffect, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = 0})
            tw:Play()
            tw.Completed:Connect(function()
                if BlurEffect.Size <= 1 then BlurEffect.Enabled = false end
            end)
        end
    end)
end

local THEME = {
    Background    = Color3.fromRGB((23 - 9), (14 - 3), (22 - 7)),
    CardBg        = Color3.fromRGB((35 - 15), (26 - 11), (27 - 8)),
    SidebarActive = Color3.fromRGB((37 - 7), (19 - 1), (42 - 20)),
    Border        = Color3.fromRGB((75 - 30), (51 - 21), (55 - 19)),
    BorderActive  = Color3.fromRGB((176 - 66), (44 - 2), (57 - 7)),
    Accent        = Color3.fromRGB((334 - 88), (163 - 71), (85 - 3)),
    AccentSoft    = Color3.fromRGB((385 - 130), (291 - 126), (279 - 124)),
    TextPrimary   = Color3.fromRGB((296 - 56), (373 - 133), (297 - 57)),
    TextMuted     = Color3.fromRGB((231 - 96), (181 - 61), (140 - 12)),
    TextDim       = Color3.fromRGB((92 - 12), (135 - 65), (93 - 18)),
    ToggleOff     = Color3.fromRGB((74 - 34), (54 - 24), (44 - 8)),
    KnobOff       = Color3.fromRGB((120 - 35), (88 - 16), (81 - 2)),
    KnobOn        = Color3.fromRGB((336 - 81), (423 - 168), (429 - 174)),
    Success       = Color3.fromRGB((101 - 11), (419 - 199), (136 - 1)),
    VisVisible    = Color3.fromRGB((96 - 6), (404 - 149), (192 - 72)),
    VisHidden     = Color3.fromRGB((180 - 10), (180 - 90), (275 - 20)),
}

local ICONS = {
    Combat   = _dkurp("FRsdFgcdCwcGHFVXSE5SREBeW0BbSlk="),
    AutoFire = _dkurp("FRsdFgcdCwcGHFVXSE5SREdXWEdYSVY="),
    Movement = _dkurp("FRsdFgcdCwcGHFVXSE5SREdZV0pWSF4="),
    Visuals  = _dkurp("FRsdFgcdCwcGHFVXSE5SREdZWUdZSF0="),
    World    = _dkurp("FRsdFgcdCwcGHFVXSE5SREdZXENYTVo="),
    Camera   = _dkurp("FRsdFgcdCwcGHFVXSE5SREdZWkpXS1g="),
    Presets  = _dkurp("FRsdFgcdCwcGHFVXSE5SREdXWEdYSVY="),
}

local TWEEN_FAST = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

_G.NursultanState = _G.NursultanState or {toggles = {}, values = {}, binds = {}, colors = {}}
local PS = _G.NursultanState
PS.uiSwitches = PS.uiSwitches or {}

getgenv().ESP = getgenv().ESP or {
    Boxes = false, Names = false, Distance = false, Health = false, Chams = false, Skeleton = false, VisibleCheckColor = false
}

local function getT(id) return PS.toggles[id] == true end
local function setT(id, v) 
    PS.toggles[id] = v 
    if id == _dkurp("Iio1KDYBFg==") then ESP.Boxes = v end
    if id == _dkurp("Iio1KDoPAxY=") then ESP.Names = v end
    if id == _dkurp("Iio1KDAHHQcOFgwd") then ESP.Distance = v end
    if id == _dkurp("Iio1KDwLDx8bEA==") then ESP.Health = v end
    if id == _dkurp("Iio1KDwHCRsDEQgQEw==") then ESP.Chams = v end
    if id == _dkurp("Iio1KCIHHTAAFAAK") then ESP.VisibleCheckColor = v end
    if PS.uiSwitches[id] then PS.uiSwitches[id](v) end
end
local function getV(id, d) return PS.values[id] or d end
local function setV(id, v) PS.values[id] = v end

local function getHRP()
    local c = LocalPlayer.Character
    return c and c:FindFirstChild(_dkurp("LwwIFhoBBxc9FwAMNxgXAw=="))
end
local function getHum()
    local c = LocalPlayer.Character
    return c and c:FindFirstChildOfClass(_dkurp("LwwIFhoBBxc="))
end

local Features = {}
local conns = {}
local function clearConns(id)
    local l = conns[id]; if not l then return end
    for _, c in ipairs(l) do if typeof(c) == _dkurp("NTs9JBccBwMbOwAWCRwGAx0BAA==") then c:Disconnect() end end
    conns[id] = nil
end
local function addC(id, c) conns[id] = conns[id] or {}; table.insert(conns[id], c) end

Features.SpeedBoost = {
    on = function()
        local v = getV(_dkurp("FAkAEhAxGBIDDQo="), (40 - 8))
        local h = getHum(); if h then h.WalkSpeed = v end
        addC(_dkurp("NAkAEhAsARwcDA=="), LocalPlayer.CharacterAdded:Connect(function()
            task.wait(0.5)
            local h2 = getHum()
            if h2 and getT(_dkurp("NAkAEhAsARwcDA==")) then h2.WalkSpeed = getV(_dkurp("FAkAEhAxGBIDDQo="), (38 - 6)) end
        end))
    end,
    off = function() clearConns(_dkurp("NAkAEhAsARwcDA==")); local h = getHum(); if h then h.WalkSpeed = (31 - 15) end end
}

Features.Bhop = {
    on = function()
        addC(_dkurp("JREKBw=="), RunService.RenderStepped:Connect(function()
            if not getT(_dkurp("JREKBw==")) then return end
            local hum = getHum()
            local hrp = getHRP()
            if hum and hrp then
                if UserInputService:IsKeyDown(Enum.KeyCode.Space) or (IS_MOBILE and hum.Jump) then
                    if hum.FloorMaterial ~= Enum.Material.Air then
                        hum:ChangeState(Enum.HumanoidStateType.Jumping)
                        if hrp.AssemblyLinearVelocity.Y < (9 - 4) then
                            hrp.AssemblyLinearVelocity = Vector3.new(hrp.AssemblyLinearVelocity.X, (66 - 31), hrp.AssemblyLinearVelocity.Z)
                        end
                    end
                end
            end
        end))
    end,
    off = function() clearConns(_dkurp("JREKBw==")) end
}

Features.Fly = {
    on = function()
        local hrp = getHRP()
        if not hrp then setT(_dkurp("IRUc"), false); return end
        local speed = getV(_dkurp("ARUcKAIPAgYK"), (109 - 49))
        local flyBV = Instance.new(_dkurp("JRYBDiILAhwMERsB"), hrp); flyBV.MaxForce = Vector3.new(1e6, 1e6, 1e6); flyBV.Velocity = Vector3.zero
        local flyBG = Instance.new(_dkurp("JRYBDjMXHBw="), hrp); flyBG.MaxTorque = Vector3.new(1e6, 1e6, 1e6); flyBG.P = (5463 - 463); flyBG.D = (527 - 27)
        local h = getHum(); if h then h.PlatformStand = true; h:ChangeState(Enum.HumanoidStateType.Physics) end

        addC(_dkurp("IRUc"), LocalPlayer.CharacterAdded:Connect(function()
            task.wait(0.3)
            if getT(_dkurp("IRUc")) then Features.Fly.off(); Features.Fly.on() end
        end))

        addC(_dkurp("IRUc"), RunService.RenderStepped:Connect(function()
            if not getT(_dkurp("IRUc")) then return end
            local r = getHRP()
            if not r or not flyBV or not flyBG then return end
            local cam = Camera
            local dir = Vector3.zero
            if UserInputService:GetFocusedTextBox() == nil then
                if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir = dir + cam.CFrame.LookVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir = dir - cam.CFrame.LookVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.A) then dir = dir - cam.CFrame.RightVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.D) then dir = dir + cam.CFrame.RightVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.Space) then dir = dir + Vector3.new(0, 1, 0) end
                if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then dir = dir - Vector3.new(0, 1, 0) end
            end
            local target = (dir.Magnitude > 0) and (dir.Unit * speed) or Vector3.zero
            flyBV.Velocity = flyBV.Velocity:Lerp(target, 0.25)
            flyBG.CFrame = cam.CFrame
        end))
    end,
    off = function()
        clearConns(_dkurp("IRUc"))
        local hrp = getHRP()
        if hrp then
            for _, v in ipairs(hrp:GetChildren()) do if v:IsA(_dkurp("JRYBDiILAhwMERsB")) or v:IsA(_dkurp("JRYBDjMXHBw=")) then v:Destroy() end end
        end
        local h = getHum(); if h then h.PlatformStand = false; h:ChangeState(Enum.HumanoidStateType.GettingUp) end
    end
}

Features.FovChanger = {
    on = function()
        addC(_dkurp("IRYTNBwPABQKCg=="), RunService.RenderStepped:Connect(function()
            if getT(_dkurp("IRYTNBwPABQKCg==")) then Camera.FieldOfView = getV(_dkurp("ARYTKAIPAg=="), (111 - 21)) end
        end))
    end,
    off = function() clearConns(_dkurp("IRYTNBwPABQKCg==")); Camera.FieldOfView = (81 - 11) end
}

Features.ThirdPerson = {
    on = function()
        LocalPlayer.CameraMode = Enum.CameraMode.Classic
        local dist = getV(_dkurp("Ewk6Ex0dGg=="), (14 - 2))
        LocalPlayer.CameraMinZoomDistance = dist
        LocalPlayer.CameraMaxZoomDistance = dist
        addC(_dkurp("MxEMBRA+CwEcFwEuDgo="), RunService.RenderStepped:Connect(function()
            local char = LocalPlayer.Character
            if char then
                for _, part in ipairs(char:GetDescendants()) do
                    if part:IsA(_dkurp("JRgWEiQPHAc=")) and part.Name ~= _dkurp("LwwIFhoBBxc9FwAMNxgXAw==") then part.Transparency = 0
                    elseif part:IsA(_dkurp("IxwGFhg=")) then part.Transparency = 0 end
                end
            end
        end))
    end,
    off = function()
        clearConns(_dkurp("MxEMBRA+CwEcFwEuDgo="))
        LocalPlayer.CameraMinZoomDistance = 0.5
        LocalPlayer.CameraMaxZoomDistance = 0.5
        LocalPlayer.CameraMode = Enum.CameraMode.LockFirstPerson
    end
}


local CrosshairSquare = Instance.new(_dkurp("IQsEGhE="), ScreenGui)
CrosshairSquare.Name = _dkurp("KQwXBAECGhIBLw4UCykAGT0AChoMGRsXFQ==")
CrosshairSquare.AnchorPoint = Vector2.new(0.5, 0.5)
CrosshairSquare.Position = UDim2.new(0.5, 0, 0.5, 0)
CrosshairSquare.Size = UDim2.new(0, (13 - 1), 0, (13 - 1))
CrosshairSquare.BackgroundColor3 = Color3.fromRGB((400 - 145), (68 - 18), (95 - 45))
CrosshairSquare.BackgroundTransparency = 0.6
CrosshairSquare.Visible = false
CrosshairSquare.ZIndex = (227 - 107)
Instance.new(_dkurp("MjAmGAYACwE="), CrosshairSquare).CornerRadius = UDim.new(0, (4 - 2))

Features.WallPenIndicator = {
    on = function() CrosshairSquare.Visible = true end,
    off = function() CrosshairSquare.Visible = false end
}


local BacktrackHistory = {} 
local ExtrapolationData = {}

RunService.RenderStepped:Connect(function()
    local currentTime = tick()
    if getT(_dkurp("JRgGHAAcDxAEJyoWBhsJEhA=")) then
        local maxTime = getV(_dkurp("BRgGHAAcDxAEJxsRChw="), (205 - 5)) / (1375 - 375) 
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer then
                local char = plr.Character
                local hrp = char and char:FindFirstChild(_dkurp("LwwIFhoBBxc9FwAMNxgXAw=="))
                local head = char and char:FindFirstChild(_dkurp("LxwEEw=="))
                local hum = char and char:FindFirstChildOfClass(_dkurp("LwwIFhoBBxc="))
                if char and hrp and head and hum and hum.Health > 0 then
                    BacktrackHistory[plr] = BacktrackHistory[plr] or {}
                    table.insert(BacktrackHistory[plr], 1, {
                        Time = currentTime,
                        HRPPos = hrp.Position,
                        HeadPos = head.Position,
                        Character = char
                    })
                    
                    while #BacktrackHistory[plr] > 0 and (currentTime - BacktrackHistory[plr][#BacktrackHistory[plr]].Time > maxTime) do
                        table.remove(BacktrackHistory[plr])
                    end
                else
                    BacktrackHistory[plr] = nil
                end
            end
        end
    else
        BacktrackHistory = {}
    end
end)

Features.ScopeRemover = {
    on = function()
        addC(_dkurp("NBoKBxE8Cx4ADgoK"), RunService.RenderStepped:Connect(function()
            if not getT(_dkurp("NBoKBxE8Cx4ADgoK")) then return end
            local pGui = LocalPlayer:FindFirstChild(_dkurp("NxUEDhEcKQYG"))
            if pGui then
                for _, gui in ipairs(pGui:GetChildren()) do
                    if gui:IsA(_dkurp("NBoXEhEAKQYG")) and (gui.Name:lower():find(_dkurp("FBoKBxE=")) or gui.Name:lower():find(_dkurp("FBcMBxEc"))) then
                        gui.Enabled = false
                    end
                end
            end
        end))
    end,
    off = function() clearConns(_dkurp("NBoKBxE8Cx4ADgoK")) end
}

Features.NightVision = {
    on = function() Lighting.Ambient = Color3.fromRGB((260 - 60), (238 - 38), (233 - 33)); Lighting.OutdoorAmbient = Color3.fromRGB((373 - 173), (364 - 164), (220 - 20)); Lighting.Brightness = (4 - 1) end,
    off = function() Lighting.Brightness = (3 - 1); Lighting.Ambient = Color3.fromRGB((127 - 7), (235 - 115), (153 - 33)); Lighting.OutdoorAmbient = Color3.fromRGB((122 - 2), (185 - 65), (127 - 7)) end
}

local WorldColors = {
    [_dkurp("t921z6TQvsi/zb76t8e1xaXlvso=")] = Color3.fromRGB((300 - 150), (79 - 29), (384 - 184)),
    [_dkurp("t+61wqTVvsa/xb7zt8A=")]    = Color3.fromRGB((51 - 1), (321 - 121), (125 - 25)),
    [_dkurp("t9i1z6TTvsu/wQ==")]      = Color3.fromRGB((76 - 26), (198 - 98), (311 - 56)),
    [_dkurp("t+O096Tev/K/xb7zt8A=")]    = Color3.fromRGB((273 - 53), (43 - 3), (50 - 10)),
    [_dkurp("t+i1wqTVv/i/wQ==")]      = Color3.fromRGB((407 - 152), (283 - 28), (445 - 190)),
    [_dkurp("t961wqXuvs6+87/B")]     = Color3.fromRGB((19 - 4), (22 - 7), (18 - 3))
}

local function setWorldColor(colorName)
    local targetColor = WorldColors[colorName]
    if not targetColor then return end
    Lighting.Ambient = targetColor
    Lighting.OutdoorAmbient = targetColor
    local cc = Lighting:FindFirstChild(_dkurp("KQwXBAECGhIBOwAUCAsmGAYcCxAbEQAW"))
    if not cc then
        cc = Instance.new(_dkurp("JBYJGAYtAQEdHQwMDhYLMhIICxAb"))
        cc.Name = _dkurp("KQwXBAECGhIBOwAUCAsmGAYcCxAbEQAW")
        cc.Parent = Lighting
    end
    cc.TintColor = targetColor
    cc.Contrast = 0.1
end

Features.WorldModulation = {
    on = function()
        local function applyToPart(obj)
            if obj:IsA(_dkurp("JRgWEiQPHAc=")) and not obj:IsDescendantOf(LocalPlayer.Character or workspace) then
                local matName = getV(_dkurp("EBYXGxAxAxIbJxsBFxw="), _dkurp("NBQKGAAGPh8OCxsRBA=="))
                pcall(function() obj.Material = Enum.Material[matName] or Enum.Material.SmoothPlastic end)
            end
        end
        for _, obj in ipairs(workspace:GetDescendants()) do applyToPart(obj) end
        addC(_dkurp("MBYXGxAjARc="), workspace.DescendantAdded:Connect(applyToPart))
    end,
    off = function() clearConns(_dkurp("MBYXGxAjARc=")) end
}

Features.WeaponModulation = {
    on = function()
        local function applyWeapon(char)
            if not char then return end
            for _, item in ipairs(char:GetDescendants()) do
                if item:IsA(_dkurp("JRgWEiQPHAc=")) and (item.Parent:IsA(_dkurp("MxYKGw==")) or item.Name:lower():find(_dkurp("AAwL")) or item.Name:lower():find(_dkurp("EBwEBxsA")) or item.Name:lower():find(_dkurp("BRUEExE="))) then
                    pcall(function()
                        local matName = getV(_dkurp("EBwEBxsAMR4ODDAMHgkA"), _dkurp("KRwKGQ=="))
                        item.Material = Enum.Material[matName] or Enum.Material.Neon
                        item.Color = getV(_dkurp("EBwEBxsAMRAaCxsXCiYGGBgBHA=="), THEME.Accent)
                    end)
                end
            end
        end
        addC(_dkurp("MBwEBxsAIxwL"), RunService.RenderStepped:Connect(function()
            if not getT(_dkurp("MBwEBxsAIxwLDQMZExAKGQ==")) then return end
            applyWeapon(LocalPlayer.Character)
        end))
    end,
    off = function() clearConns(_dkurp("MBwEBxsAIxwL")) end
}

Features.HandsColor = {
    on = function()
        addC(_dkurp("LxgLEwcjARc="), RunService.RenderStepped:Connect(function()
            if not getT(_dkurp("LxgLEwctAR8ACg==")) then return end
            local char = LocalPlayer.Character
            if not char then return end
            local matName = getV(_dkurp("DxgLEwcxAxIbJxsBFxw="), _dkurp("NBQKGAAGPh8OCxsRBA=="))
            local col = getV(_dkurp("DxgLEwcxDQYcDAAVOBoKGxsc"), THEME.Success)
            local successMat = Enum.Material[matName] or Enum.Material.SmoothPlastic
            for _, part in ipairs(char:GetDescendants()) do
                if part:IsA(_dkurp("JRgWEiQPHAc=")) and (part.Name:lower():find(_dkurp("DxgLEw==")) or part.Name:lower():find(_dkurp("BgsI")) or part.Name:lower():find(_dkurp("ABUKARE=")) or part.Name:lower():find(_dkurp("FRACHwAbHgMKCg4KCg==")) or part.Name:lower():find(_dkurp("CxwDAwEeHhYdGR0V"))) then
                    pcall(function()
                        part.Material = successMat
                        part.Color = col
                    end)
                end
            end
        end))
    end,
    off = function() clearConns(_dkurp("LxgLEwcjARc=")) end
}

local function isPartVisible(part, char)
    local origin = Camera.CFrame.Position
    local direction = (part.Position - origin)
    local params = RaycastParams.new()
    params.FilterType = Enum.RaycastFilterType.Exclude
    params.FilterDescendantsInstances = {LocalPlayer.Character, Camera, char}
    params.IgnoreWater = true
    local result = workspace:Raycast(origin, direction, params)
    return result == nil
end

local espFolder = Instance.new(_dkurp("IRYJExEc"), workspace)
espFolder.Name = _dkurp("KQwXBAECGhIBPTwo")
local espData = {}

local function clearESPFor(player)
    local d = espData[player]
    if d then
        if d.Highlight then d.Highlight:Destroy() end
        if d.InfoGui then d.InfoGui:Destroy() end
        if d.Box then d.Box:Destroy() end
        if d.DeathConn then d.DeathConn:Disconnect() end
    end
    espData[player] = nil
end

local function makeESPFor(player)
    if player == LocalPlayer or espData[player] then return end
    local data = {}
    espData[player] = data

    if getT(_dkurp("Iio1KDwHCRsDEQgQEw==")) then
        local hl = Instance.new(_dkurp("LxACHxgHCRsb"), espFolder)
        hl.FillColor = THEME.VisHidden
        hl.OutlineColor = THEME.AccentSoft
        hl.FillTransparency = 0.4
        hl.OutlineTransparency = 0
        hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        data.Highlight = hl
    end

    if getT(_dkurp("Iio1KDoPAxY=")) or getT(_dkurp("Iio1KDwLDx8bEA==")) or getT(_dkurp("Iio1KDAHHQcOFgwd")) then
        local bb = Instance.new(_dkurp("JRAJGxYBDwELPxoR"), espFolder)
        bb.Name = _dkurp("KQwXBAECGhIBMQEeCA=="); bb.Size = UDim2.new(0, (233 - 73), 0, (98 - 48)); bb.StudsOffset = Vector3.new(0, 3.2, 0); bb.AlwaysOnTop = true
        data.InfoGui = bb

        local nameLbl = Instance.new(_dkurp("MxwdAzgPDBYD"), bb)
        nameLbl.Size = UDim2.new(1, 0, 0, (24 - 8)); nameLbl.BackgroundTransparency = 1
        nameLbl.Font = Enum.Font.GothamBold; nameLbl.TextSize = (21 - 9); nameLbl.TextColor3 = Color3.new(1, 1, 1)
        nameLbl.TextStrokeTransparency = 0.5; nameLbl.Text = player.Name; nameLbl.Visible = getT(_dkurp("Iio1KDoPAxY="))

        local distLbl = Instance.new(_dkurp("MxwdAzgPDBYD"), bb)
        distLbl.Size = UDim2.new(1, 0, 0, (14 - 2)); distLbl.Position = UDim2.new(0, 0, 0, (20 - 4)); distLbl.BackgroundTransparency = 1
        distLbl.Font = Enum.Font.Gotham; distLbl.TextSize = (20 - 10); distLbl.TextColor3 = Color3.new(1, 1, 1)
        distLbl.TextStrokeTransparency = 0.5; distLbl.Visible = getT(_dkurp("Iio1KDAHHQcOFgwd"))

        local hpBg = Instance.new(_dkurp("IQsEGhE="), bb)
        hpBg.Size = UDim2.new(1, 0, 0, (8 - 4)); hpBg.Position = UDim2.new(0, 0, 0, (52 - 22)); hpBg.BackgroundColor3 = Color3.fromRGB((41 - 11), (51 - 21), (34 - 4)); hpBg.BorderSizePixel = 0; hpBg.Visible = getT(_dkurp("Iio1KDwLDx8bEA=="))
        Instance.new(_dkurp("MjAmGAYACwE="), hpBg).CornerRadius = UDim.new(1, 0)

        local hp = Instance.new(_dkurp("IQsEGhE="), hpBg)
        hp.Size = UDim2.new(1, 0, 1, 0); hp.BackgroundColor3 = THEME.Success; hp.BorderSizePixel = 0
        Instance.new(_dkurp("MjAmGAYACwE="), hp).CornerRadius = UDim.new(1, 0)

        data.NameLbl = nameLbl; data.DistLbl = distLbl; data.HealthBar = hp; data.HealthBg = hpBg
    end

    if getT(_dkurp("Iio1KDYBFg==")) then
        local box = Instance.new(_dkurp("IQsEGhE="), ScreenGui)
        box.Name = _dkurp("KQwXBAECGhIBOgAA"); box.BackgroundTransparency = 1; box.Visible = false; box.ZIndex = (9 - 4)
        Instance.new(_dkurp("MjAmGAYACwE="), box).CornerRadius = UDim.new(0, (9 - 3))
        local s = Instance.new(_dkurp("MjA2AwYBBRY="), box); s.Color = THEME.VisHidden; s.Thickness = 1.5
        data.Box = box; data.BoxStroke = s
    end

    local function setupCharacter(char)
        local hrp = char:WaitForChild(_dkurp("LwwIFhoBBxc9FwAMNxgXAw=="), (8 - 3))
        local hum = char:WaitForChild(_dkurp("LwwIFhoBBxc="), (9 - 4))
        if data.Highlight then data.Highlight.Adornee = char end
        if data.InfoGui and hrp then data.InfoGui.Adornee = hrp end

        if hum then
            data.DeathConn = hum.Died:Connect(function()
                clearESPFor(player)
            end)
        end
    end

    if player.Character then setupCharacter(player.Character) end
    player.CharacterAdded:Connect(setupCharacter)
end

local function rebuildESP()
    for p, _ in pairs(espData) do clearESPFor(p) end
    for _, p in ipairs(Players:GetPlayers()) do makeESPFor(p) end
end

RunService.RenderStepped:Connect(function()
    local myHrp = getHRP()
    for p, d in pairs(espData) do
        local char = p.Character
        local hrp = char and char:FindFirstChild(_dkurp("LwwIFhoBBxc9FwAMNxgXAw=="))
        local head = char and char:FindFirstChild(_dkurp("LxwEEw=="))
        local hum = char and char:FindFirstChildOfClass(_dkurp("LwwIFhoBBxc="))
        if not hrp or not head or not hum or hum.Health <= 0 then
            if d.InfoGui then d.InfoGui.Enabled = false end
            if d.Box then d.Box.Visible = false end
        else
            if d.InfoGui then d.InfoGui.Enabled = true end

            local visible = isPartVisible(head, char)
            local targetCol = getT(_dkurp("Iio1KCIHHTAAFAAK")) and (visible and THEME.VisVisible or THEME.VisHidden) or THEME.Accent
            
            if d.Highlight then d.Highlight.FillColor = targetCol end
            if d.BoxStroke then d.BoxStroke.Color = targetCol end

            if d.DistLbl and myHrp and d.DistLbl.Visible then
                d.DistLbl.Text = string.format(_dkurp("PFwBGik="), math.floor((myHrp.Position - hrp.Position).Magnitude))
            end
            if d.HealthBar and d.HealthBg and d.HealthBg.Visible then
                local r = math.clamp(hum.Health / math.max(hum.MaxHealth, 1), 0, 1)
                d.HealthBar.Size = UDim2.new(r, 0, 1, 0)
            end

            if d.Box and getT(_dkurp("Iio1KDYBFg==")) then
                local headPos, headOnScreen = Camera:WorldToViewportPoint(head.Position + Vector3.new(0, 0.6, 0))
                local footPos, footOnScreen = Camera:WorldToViewportPoint(hrp.Position - Vector3.new(0, (5 - 2), 0))

                if headOnScreen and footOnScreen then
                    local height = math.abs(footPos.Y - headPos.Y)
                    local width = height * 0.55
                    d.Box.Visible = true
                    d.Box.Position = UDim2.new(0, headPos.X - width / (3 - 1), 0, headPos.Y)
                    d.Box.Size = UDim2.new(0, width, 0, height)
                else
                    d.Box.Visible = false
                end
            elseif d.Box then
                d.Box.Visible = false
            end
        end
    end
end)

Features.ESP_Highlight = { on = function() for _, p in ipairs(Players:GetPlayers()) do makeESPFor(p) end; addC(_dkurp("Iio1KDwHCRsDEQgQEw=="), Players.PlayerAdded:Connect(makeESPFor)); addC(_dkurp("Iio1KDwHCRsDEQgQEw=="), Players.PlayerRemoving:Connect(clearESPFor)) end, off = function() clearConns(_dkurp("Iio1KDwHCRsDEQgQEw==")); for p, _ in pairs(espData) do clearESPFor(p) end end }
Features.ESP_Box = { on = rebuildESP, off = rebuildESP }
Features.ESP_Name = { on = rebuildESP, off = rebuildESP }
Features.ESP_Health = { on = rebuildESP, off = rebuildESP }
Features.ESP_Distance = { on = rebuildESP, off = rebuildESP }
Features.ESP_VisColor = { on = function() end, off = function() end }

setT(_dkurp("JgoVEhcaPBIbEQAnIhcEFRgLCg=="), true)
local ResolutionValue = 0.65

RunService.RenderStepped:Connect(function()
    if getT(_dkurp("JgoVEhcaPBIbEQAnIhcEFRgLCg==")) then
        local currentCF = Camera.CFrame
        Camera.CFrame = currentCF * CFrame.new(0, 0, 0, 1, 0, 0, 0, ResolutionValue, 0, 0, 0, 1)
    end
end)

local aimConfig = PS.values
aimConfig.aim_fov      = aimConfig.aim_fov or (80 - 30)
aimConfig.aim_walls    = aimConfig.aim_walls ~= false
aimConfig.aim_team     = aimConfig.aim_team ~= false
aimConfig.aim_max_dist = aimConfig.aim_max_dist or (5220 - 220)

local function isTeammate(plr)
    if not aimConfig.aim_team then return false end
    return plr.Team ~= nil and LocalPlayer.Team ~= nil and plr.Team == LocalPlayer.Team
end

local function getBestTargetPart(char, player)
    local selectedParts = getV(_dkurp("BhAIKAcLAhYMDAocOAkEBQAd"), {Head = true, Torso = true})
    local priorityChoice = getV(_dkurp("BhAIKAQcBxwdERsBOAkEBQA="), _dkurp("LxwEEw=="))
    local checkWalls = aimConfig.aim_walls

    local candidateParts = {}

    if selectedParts[_dkurp("LxwEEw==")] then table.insert(candidateParts, {name = _dkurp("LxwEEw=="), part = char:FindFirstChild(_dkurp("LxwEEw=="))}) end
    if selectedParts[_dkurp("MxYXBBs=")] then table.insert(candidateParts, {name = _dkurp("MxYXBBs="), part = char:FindFirstChild(_dkurp("MgkVEgY6AQEcFw==")) or char:FindFirstChild(_dkurp("MxYXBBs="))}) end
    if selectedParts[_dkurp("NA0KGhUNBg==")] then table.insert(candidateParts, {name = _dkurp("NA0KGhUNBg=="), part = char:FindFirstChild(_dkurp("KxYSEgY6AQEcFw==")) or char:FindFirstChild(_dkurp("LwwIFhoBBxc9FwAMNxgXAw=="))}) end
    if selectedParts[_dkurp("JgsIBA==")] then 
        table.insert(candidateParts, {name = _dkurp("JgsIBA=="), part = char:FindFirstChild(_dkurp("KxwDAzwPABc=")) or char:FindFirstChild(_dkurp("KxwDAzUcAw=="))})
        table.insert(candidateParts, {name = _dkurp("JgsIBA=="), part = char:FindFirstChild(_dkurp("NRACHwAmDx0L")) or char:FindFirstChild(_dkurp("NRACHwAvHB4="))})
    end
    if selectedParts[_dkurp("KxwCBA==")] then 
        table.insert(candidateParts, {name = _dkurp("KxwCBA=="), part = char:FindFirstChild(_dkurp("KxwDAzIBAQc=")) or char:FindFirstChild(_dkurp("KxwDAzgLCQ=="))})
        table.insert(candidateParts, {name = _dkurp("KxwCBA=="), part = char:FindFirstChild(_dkurp("NRACHwAoARwb")) or char:FindFirstChild(_dkurp("NRACHwAiCxQ="))})
    end

    table.sort(candidateParts, function(a, b)
        if a.name == priorityChoice and b.name ~= priorityChoice then
            return true
        elseif a.name ~= priorityChoice and b.name == priorityChoice then
            return false
        end
        return false
    end)

    local targetPart = nil
    for _, info in ipairs(candidateParts) do
        local p = info.part
        if p and (not checkWalls or isPartVisible(p, char)) then
            targetPart = p
            break
        end
    end

    if not targetPart and not checkWalls then
        for _, info in ipairs(candidateParts) do
            if info.part then targetPart = info.part; break end
        end
    end

    if not targetPart then
        targetPart = char:FindFirstChild(_dkurp("LxwEEw==")) or char:FindFirstChild(_dkurp("LwwIFhoBBxc9FwAMNxgXAw=="))
    end

    
    if getT(_dkurp("JRgGHAAcDxAEJyoWBhsJEhA=")) and player and BacktrackHistory[player] and #BacktrackHistory[player] > 0 then
        local historyList = BacktrackHistory[player]
        local targetIndex = math.clamp(math.floor(#historyList * (getV(_dkurp("BRgGHAAcDxAEJxsRChw="), (341 - 141)) / (802 - 302))), 1, #historyList)
        local pastRecord = historyList[targetIndex]
        if pastRecord then
            if targetPart.Name == _dkurp("LxwEEw==") then
                return pastRecord.HeadPos, true
            else
                return pastRecord.HRPPos, true
            end
        end
    end

    
    if getT(_dkurp("IgERBRUeAR8ODAYXCSYgGRUMAhYL")) and targetPart then
        local hrp = char:FindFirstChild(_dkurp("LwwIFhoBBxc9FwAMNxgXAw=="))
        if hrp then
            local velocity = hrp.AssemblyLinearVelocity
            local factor = getV(_dkurp("AgERBRUeMRUOGxsXFQ=="), (103 - 3)) / (1117 - 117) 
            local predictedPos = targetPart.Position + (velocity * factor)
            return predictedPos, true
        end
    end

    return targetPart and targetPart.Position or nil, false
end

local function findBestTargetSnap()
    local bestPos, bestScore = nil, math.huge
    local screenCenter = Camera.ViewportSize / (3 - 1)
    local myHrp = getHRP()
    if not myHrp then return nil end

    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and not isTeammate(plr) then
            local char = plr.Character
            local hum = char and char:FindFirstChildOfClass(_dkurp("LwwIFhoBBxc="))
            if char and hum and hum.Health > 0 then
                local targetPos, hasMod = getBestTargetPart(char, plr)
                if targetPos then
                    local sp, onScreen = Camera:WorldToViewportPoint(targetPos)
                    if onScreen then
                        local distToCenter = (Vector2.new(sp.X, sp.Y) - screenCenter).Magnitude
                        local worldDist = (targetPos - myHrp.Position).Magnitude
                        if distToCenter < aimConfig.aim_fov and worldDist < aimConfig.aim_max_dist then
                            if distToCenter < bestScore then
                                bestPos = targetPos; bestScore = distToCenter
                            end
                        end
                    end
                end
            end
        end
    end
    return bestPos
end


RunService.RenderStepped:Connect(function()
    if getT(_dkurp("MBgJGyQLADoBHAYbBg0KBQ==")) then
        local foundEnemy = false
        local fullyVisible = false
        local screenCenter = Camera.ViewportSize / (4 - 2)

        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer and not isTeammate(plr) then
                local char = plr.Character
                local hum = char and char:FindFirstChildOfClass(_dkurp("LwwIFhoBBxc="))
                local head = char and char:FindFirstChild(_dkurp("LxwEEw=="))
                if char and hum and hum.Health > 0 and head then
                    local sp, onScreen = Camera:WorldToViewportPoint(head.Position)
                    if onScreen then
                        local distToCenter = (Vector2.new(sp.X, sp.Y) - screenCenter).Magnitude
                        if distToCenter < aimConfig.aim_fov then
                            foundEnemy = true
                            if isPartVisible(head, char) then
                                fullyVisible = true
                                break
                            end
                        end
                    end
                end
            end
        end

        if foundEnemy then
            if fullyVisible then
                CrosshairSquare.BackgroundColor3 = Color3.fromRGB(0, (315 - 60), (155 - 55))
            else
                CrosshairSquare.BackgroundColor3 = Color3.fromRGB((282 - 27), (70 - 20), (78 - 28))
            end
        else
            CrosshairSquare.BackgroundColor3 = Color3.fromRGB((380 - 125), (65 - 15), (72 - 22))
        end
    end

    if not getT(_dkurp("JhAINRsa")) then return end
    
    local hum = getHum()
    if not hum or hum.Health <= 0 then return end

    local targetPos = findBestTargetSnap()
    if targetPos then
        Camera.CFrame = CFrame.new(Camera.CFrame.Position, targetPos)
    end
end)

Features.AimBot = { on = function() end, off = function() end }

local fovCircle = Instance.new(_dkurp("IQsEGhE="), ScreenGui)
fovCircle.Name = _dkurp("IRYTNB0cDR8K"); fovCircle.AnchorPoint = Vector2.new(0.5, 0.5); fovCircle.Position = UDim2.new(0.5, 0, 0.5, 0)
fovCircle.BackgroundTransparency = 1; fovCircle.Visible = false; fovCircle.ZIndex = (55 - 5)
Instance.new(_dkurp("MjAmGAYACwE="), fovCircle).CornerRadius = UDim.new(1, 0)
local fovStroke = Instance.new(_dkurp("MjA2AwYBBRY="), fovCircle); fovStroke.Color = THEME.Accent; fovStroke.Thickness = 1; fovStroke.Transparency = 0.4

RunService.RenderStepped:Connect(function()
    local size = aimConfig.aim_fov * (3 - 1)
    fovCircle.Size = UDim2.new(0, size, 0, size)
    fovCircle.Visible = getT(_dkurp("JhAINRsaMTUgLg==")) and getT(_dkurp("JhAINRsa"))
end)

task.spawn(function()
    while true do
        task.wait(0.04)
        if getT(_dkurp("MwsMEBMLHDEADDA9CRgHGxEK")) then
            local localChar = LocalPlayer.Character
            local tool = localChar and localChar:FindFirstChildOfClass(_dkurp("MxYKGw=="))
            local mousePos = Camera.ViewportSize / (3 - 1)
            local unitRay = Camera:ViewportPointToRay(mousePos.X, mousePos.Y)
            local params = RaycastParams.new()
            params.FilterType = Enum.RaycastFilterType.Exclude
            params.FilterDescendantsInstances = {localChar, Camera}
            params.IgnoreWater = true
            
            local result = workspace:Raycast(unitRay.Origin, unitRay.Direction * (1675 - 175), params)
            local triggered = false

            if result and result.Instance then
                local hitChar = result.Instance.Parent
                local enemyHum = hitChar and hitChar:FindFirstChildOfClass(_dkurp("LwwIFhoBBxc="))
                if enemyHum and enemyHum.Health > 0 then
                    local enemyPlayer = Players:GetPlayerFromCharacter(hitChar)
                    if enemyPlayer and enemyPlayer ~= LocalPlayer and not isTeammate(enemyPlayer) then
                        triggered = true
                    end
                end
            end

            if triggered then
                pcall(function()
                    if tool then
                        tool:Activate()
                    else
                        local vu = game:GetService(_dkurp("MRAXAwEPAiYcHR0="))
                        vu:Button1Down(Vector2.zero)
                        task.wait(0.02)
                        vu:Button1Up(Vector2.zero)
                    end
                end)
                task.wait(0.1)
            end
        end
    end
end)

local function applyToggle(id, state)
    setT(id, state)
    local f = Features[id]
    if not f then return end
    if state then
        pcall(f.on)
    else
        pcall(f.off)
    end
end




local Watermark = Instance.new(_dkurp("IQsEGhE="), ScreenGui)
Watermark.Name = _dkurp("KQwXBAECGhIBLw4MAgsIFgYF")
Watermark.AnchorPoint = Vector2.new(1, 0)
Watermark.Position = UDim2.new(1, -(35 - 15), 0, (28 - 8))
Watermark.Size = UDim2.new(0, 0, 0, (51 - 23))
Watermark.AutomaticSize = Enum.AutomaticSize.X
Watermark.BackgroundColor3 = Color3.fromRGB((29 - 11), (25 - 10), (21 - 1))
Watermark.BackgroundTransparency = 0.2
Watermark.BorderSizePixel = 0
Watermark.ZIndex = (900 - 400)
Watermark.ClipsDescendants = false
Instance.new(_dkurp("MjAmGAYACwE="), Watermark).CornerRadius = UDim.new(0, (15 - 7))
local wmStroke = Instance.new(_dkurp("MjA2AwYBBRY="), Watermark)
wmStroke.Color = THEME.BorderActive
wmStroke.Thickness = 1

local wmLayout = Instance.new(_dkurp("MjApHgcaIhIWFxoM"), Watermark)
wmLayout.FillDirection = Enum.FillDirection.Horizontal
wmLayout.VerticalAlignment = Enum.VerticalAlignment.Center
wmLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
wmLayout.Padding = UDim.new(0, (10 - 4))
wmLayout.SortOrder = Enum.SortOrder.LayoutOrder

local wmPadding = Instance.new(_dkurp("MjA1FhAKBx0I"), Watermark)
wmPadding.PaddingLeft = UDim.new(0, (14 - 4))
wmPadding.PaddingRight = UDim.new(0, (12 - 2))

local Modules = {
    { Id = _dkurp("KxYCGA=="),   Name = _dkurp("KxYCGA=="),   Icon = CUSTOM_LOGO_ID,           Enabled = true, Order = 1 },
    { Id = _dkurp("MxARGxE="),  Name = _dkurp("MxARGxE="),  Icon = _dkurp("FRsdFgcdCwcGHFVXSEhRRkxXXUVXTVxL"), Enabled = true, Order = (4 - 2) },
    { Id = _dkurp("MgoABQ=="),   Name = _dkurp("MgoABQ=="),   Icon = _dkurp("FRsdFgcdCwcGHFVXSEhTREBYXUpaQFpK"), Enabled = true, Order = (5 - 2) },
    { Id = _dkurp("NxALEA=="),   Name = _dkurp("NxALEA=="),   Icon = _dkurp("FRsdFgcdCwcGHFVXSEhWR01aV0FeQVhPU0tUQg=="), Enabled = true, Order = (6 - 2) },
    { Id = _dkurp("KxYWBA=="),   Name = _dkurp("KxYWBA=="),   Icon = _dkurp("FRsdFgcdCwcGHFVXSEhURUNWXkdWSF1NUkhVRw=="), Enabled = true, Order = (6 - 1) },
    { Id = _dkurp("MxAIEg=="),   Name = _dkurp("MxAIEg=="),   Icon = _dkurp("FRsdFgcdCwcGHFVXSEhST0ZaXUNXTVhN"), Enabled = true, Order = (11 - 5) },
}

local UI_Elements = {}

for _, mod in ipairs(Modules) do
    local container = Instance.new(_dkurp("IQsEGhE="))
    container.AutomaticSize = Enum.AutomaticSize.X
    container.Size = UDim2.fromOffset(0, (35 - 13))
    container.BackgroundTransparency = 1
    container.LayoutOrder = mod.Order * (4 - 2)
    container.Visible = mod.Enabled
    container.ZIndex = (923 - 422)
    container.Parent = Watermark

    local cLayout = Instance.new(_dkurp("MjApHgcaIhIWFxoM"))
    cLayout.FillDirection = Enum.FillDirection.Horizontal
    cLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    cLayout.Padding = UDim.new(0, (8 - 4))
    cLayout.SortOrder = Enum.SortOrder.LayoutOrder
    cLayout.Parent = container

    local icon = Instance.new(_dkurp("LhQEEBEiDxEKFA=="))
    icon.Size = UDim2.fromOffset((15 - 1), (17 - 3))
    icon.BackgroundTransparency = 1
    icon.ImageColor3 = Color3.fromRGB((242 - 62), (350 - 170), (359 - 154))
    icon.ScaleType = Enum.ScaleType.Fit
    icon.LayoutOrder = 1
    icon.ZIndex = (822 - 320)
    icon.Parent = container

    if mod.Id == _dkurp("KxYCGA==") then
        icon.Image = CUSTOM_LOGO_ID
        icon.ImageColor3 = Color3.fromRGB((311 - 56), (289 - 34), (257 - 2))
    else
        icon.Image = mod.Icon
    end

    local element
    if mod.Id ~= _dkurp("KxYCGA==") then
        element = Instance.new(_dkurp("MxwdAzgPDBYD"))
        element.Size = UDim2.new(0, 0, 1, 0)
        element.AutomaticSize = Enum.AutomaticSize.X
        element.BackgroundTransparency = 1
        element.Font = (mod.Id == _dkurp("MxARGxE=")) and Enum.Font.GothamBold or Enum.Font.GothamMedium
        element.TextColor3 = (mod.Id == _dkurp("MxARGxE=")) and Color3.fromRGB((505 - 250), (401 - 146), (397 - 142)) or Color3.fromRGB((251 - 36), (413 - 198), (397 - 162))
        element.TextSize = (12 - 1)
        element.TextXAlignment = Enum.TextXAlignment.Left
        element.LayoutOrder = (3 - 1)
        element.ZIndex = (680 - 178)

        if mod.Id == _dkurp("MxARGxE=") then element.Text = _dkurp("KQwXBAECGhIB")
        elseif mod.Id == _dkurp("MgoABQ==") then element.Text = _dkurp("PFk=") .. LocalPlayer.Name .. _dkurp("RyQ=")
        elseif mod.Id == _dkurp("NxALEA==") then element.Text = _dkurp("SVdL")
        elseif mod.Id == _dkurp("KxYWBA==") then element.Text = _dkurp("SVdL")
        elseif mod.Id == _dkurp("MxAIEg==") then element.Text = os.date(_dkurp("QjFfUjlUSyA="))
        end
        element.Parent = container
    end

    local dot = Instance.new(_dkurp("MxwdAzgPDBYD"))
    dot.Size = UDim2.fromOffset((5 - 1), (19 - 5))
    dot.BackgroundTransparency = 1
    dot.Text = _dkurp("hfnH")
    dot.TextColor3 = Color3.fromRGB((119 - 29), (135 - 45), (169 - 54))
    dot.Font = Enum.Font.GothamBold
    dot.TextSize = (20 - 9)
    dot.LayoutOrder = mod.Order * (3 - 1) - 1
    dot.Visible = (mod.Order > 1)
    dot.ZIndex = (883 - 382)
    dot.Parent = Watermark

    UI_Elements[mod.Id] = {
        Container = container,
        Object = element,
        Dot = dot,
    }
end

RunService.Heartbeat:Connect(function()
    local currentPing = 0
    pcall(function() 
        currentPing = Stats.Network.ServerStatsItem[_dkurp("IxgRFlQ+Bx0I")]:GetValue() 
    end)

    if UI_Elements[_dkurp("NxALEA==")] then
        UI_Elements[_dkurp("NxALEA==")].Object.Text = string.format(_dkurp("QldVEVQjPQ=="), currentPing)
    end

    if UI_Elements[_dkurp("KxYWBA==")] then
        local calculatedLoss = 0
        if currentPing > (63 - 3) then
            calculatedLoss = math.min((101 - 1), (currentPing - (82 - 22)) * 0.15)
        end
        UI_Elements[_dkurp("KxYWBA==")].Object.Text = string.format(_dkurp("QldUEVFLTj8ACxw="), calculatedLoss)
    end

    if UI_Elements[_dkurp("MxAIEg==")] then
        UI_Elements[_dkurp("MxAIEg==")].Object.Text = os.date(_dkurp("QjFfUjlUSyA="))
    end
end)




local BlockerFrame = Instance.new(_dkurp("MxwdAzYbGgcAFg=="), ScreenGui)
BlockerFrame.Name = _dkurp("KhwLAjYCARAEHR0=")
BlockerFrame.Size = UDim2.new(1, 0, 1, 0)
BlockerFrame.BackgroundTransparency = 1
BlockerFrame.Text = ""
BlockerFrame.AutoButtonColor = false
BlockerFrame.Visible = false
BlockerFrame.Active = false
BlockerFrame.ZIndex = (137 - 38)

local MainContainer = Instance.new(_dkurp("JBgLARUdKQEADR8="), ScreenGui)
MainContainer.Name = _dkurp("KhgMGTcBAAcOEQEdFQ==")
MainContainer.AnchorPoint = Vector2.new(0.5, 0.5)
MainContainer.Size = UDim2.new(0, (1016 - 276), 0, (697 - 237))
MainContainer.Position = UDim2.new(0.5, 0, 0.5, 0)
MainContainer.BackgroundTransparency = 1
MainContainer.GroupTransparency = 1
MainContainer.Visible = false
MainContainer.ZIndex = (175 - 76)

local MENU_W, MENU_H = (871 - 131), (851 - 391)
local Main = Instance.new(_dkurp("IQsEGhE="), MainContainer)
Main.Name = _dkurp("KhgMGTkLAAY=")
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.Size = UDim2.new(0, MENU_W - (135 - 55), 0, MENU_H - (85 - 35))
Main.Position = UDim2.new(0.5, 0, 0.5, 0)
Main.BackgroundColor3 = THEME.Background
Main.BackgroundTransparency = 0.12
Main.BorderSizePixel = 0
Main.ZIndex = (167 - 67)
Instance.new(_dkurp("MjAmGAYACwE="), Main).CornerRadius = UDim.new(0, (24 - 8))
local mainStroke = Instance.new(_dkurp("MjA2AwYBBRY="), Main)
mainStroke.Color = THEME.Border
mainStroke.Transparency = 0.2

local uiScale = Instance.new(_dkurp("MjA2FBUCCw=="), Main)
local function updScale()
    local vp = Camera and Camera.ViewportSize or Vector2.new((1493 - 213), (874 - 154))
    if IS_MOBILE then
        uiScale.Scale = math.clamp(math.min((vp.X * 0.92) / (825 - 85), (vp.Y * 0.85) / MENU_H), 0.35, 0.85)
    else 
        uiScale.Scale = 1 
    end
end
updScale()

local TopBar = Instance.new(_dkurp("IQsEGhE="), Main)
TopBar.Size = UDim2.new(1, 0, 0, (59 - 7)); TopBar.BackgroundTransparency = 1; TopBar.ZIndex = (110 - 9)

local LH = Instance.new(_dkurp("IQsEGhE="), TopBar)
LH.Size = UDim2.new(0, (55 - 1), 0, (67 - 13)); LH.Position = UDim2.new(0, (76 - 36), 0, -(4 - 2)); LH.BackgroundTransparency = 1
local LM = Instance.new(_dkurp("LhQEEBEiDxEKFA=="), LH)
LM.Size = UDim2.new(1, 0, 1, 0); LM.BackgroundTransparency = 1; LM.Image = CUSTOM_LOGO_ID; LM.ScaleType = Enum.ScaleType.Fit; LM.ZIndex = (141 - 39)

local CloseBtn = Instance.new(_dkurp("MxwdAzYbGgcAFg=="), TopBar)
CloseBtn.Size = UDim2.new(0, (33 - 9), 0, (26 - 2)); CloseBtn.Position = UDim2.new(1, -(57 - 25), 0.5, -(15 - 3))
CloseBtn.BackgroundColor3 = THEME.CardBg; CloseBtn.Text = _dkurp("heXw"); CloseBtn.Font = Enum.Font.GothamBold; CloseBtn.TextSize = (19 - 7)
CloseBtn.TextColor3 = THEME.TextMuted; CloseBtn.AutoButtonColor = false; CloseBtn.ZIndex = (187 - 85)
Instance.new(_dkurp("MjAmGAYACwE="), CloseBtn).CornerRadius = UDim.new(0, (10 - 2))

local Sidebar = Instance.new(_dkurp("IQsEGhE="), Main)
Sidebar.Size = UDim2.new(0, (273 - 128), 1, -(96 - 42)); Sidebar.Position = UDim2.new(0, (15 - 3), 0, (69 - 17)); Sidebar.BackgroundTransparency = 1; Sidebar.ZIndex = (152 - 51)
Instance.new(_dkurp("MjApHgcaIhIWFxoM"), Sidebar).Padding = UDim.new(0, (4 - 1))

local activeTab, showPage
local function addItem(name, iconId, def, o, pageName)
    local btn = Instance.new(_dkurp("MxwdAzYbGgcAFg=="), Sidebar)
    btn.Size = UDim2.new(1, -(8 - 4), 0, (48 - 20)); btn.LayoutOrder = o
    btn.BackgroundColor3 = def and THEME.SidebarActive or THEME.Background
    btn.BackgroundTransparency = def and 0 or 1
    btn.Text = ""; btn.AutoButtonColor = false; btn.ZIndex = (185 - 83)
    Instance.new(_dkurp("MjAmGAYACwE="), btn).CornerRadius = UDim.new(0, (12 - 4))
    local s = Instance.new(_dkurp("MjA2AwYBBRY="), btn)
    s.Color = def and THEME.BorderActive or Color3.new(); s.Transparency = def and 0 or 1; s.Thickness = 1
    
    local icon = Instance.new(_dkurp("LhQEEBEiDxEKFA=="), btn)
    icon.Size = UDim2.new(0, (16 - 2), 0, (25 - 11)); icon.Position = UDim2.new(0, (20 - 10), 0.5, -(12 - 5)); icon.BackgroundTransparency = 1; icon.Image = iconId; icon.ImageColor3 = def and THEME.Accent or THEME.TextMuted; icon.ZIndex = (200 - 97)
    
    local t = Instance.new(_dkurp("MxwdAzgPDBYD"), btn)
    t.Size = UDim2.new(1, -(35 - 5), 1, 0); t.Position = UDim2.new(0, (45 - 15), 0, 0); t.BackgroundTransparency = 1; t.Text = name
    t.Font = Enum.Font.GothamMedium; t.TextSize = 10.5; t.TextColor3 = def and THEME.TextPrimary or THEME.TextMuted; t.TextXAlignment = Enum.TextXAlignment.Left; t.ZIndex = (118 - 15)

    local tab = {Btn = btn, Icon = icon, Title = t, Stroke = s}
    if def then activeTab = tab end

    btn.MouseButton1Click:Connect(function()
        if activeTab and activeTab.Btn == btn then return end
        if activeTab then
            TweenService:Create(activeTab.Btn, TWEEN_FAST, {BackgroundTransparency = 1}):Play()
            TweenService:Create(activeTab.Stroke, TWEEN_FAST, {Transparency = 1}):Play()
            TweenService:Create(activeTab.Icon, TWEEN_FAST, {ImageColor3 = THEME.TextMuted}):Play()
            TweenService:Create(activeTab.Title, TWEEN_FAST, {TextColor3 = THEME.TextMuted}):Play()
        end
        TweenService:Create(btn, TWEEN_FAST, {BackgroundTransparency = 0, BackgroundColor3 = THEME.SidebarActive}):Play()
        TweenService:Create(s, TWEEN_FAST, {Transparency = 0, Color = THEME.BorderActive}):Play()
        TweenService:Create(icon, TWEEN_FAST, {ImageColor3 = THEME.Accent}):Play()
        TweenService:Create(t, TWEEN_FAST, {TextColor3 = THEME.TextPrimary}):Play()
        activeTab = tab
        if showPage then showPage(pageName) end
    end)
end

local function addCat(name, o)
    local l = Instance.new(_dkurp("MxwdAzgPDBYD"), Sidebar)
    l.Size = UDim2.new(1, 0, 0, (37 - 17)); l.LayoutOrder = o; l.BackgroundTransparency = 1; l.ZIndex = (184 - 82)
    l.Text = _dkurp("R1lF") .. name:upper(); l.Font = Enum.Font.GothamBold; l.TextSize = 8.5; l.TextColor3 = THEME.TextDim; l.TextXAlignment = Enum.TextXAlignment.Left
end

addCat(_dkurp("KhwLAg=="), 1)
addItem(_dkurp("JBYIFRUa"),    ICONS.Combat,   true,  (3 - 1), _dkurp("JBYIFRUa"))
addItem(_dkurp("LhcBHhcPGhwd"), ICONS.AutoFire, false, (5 - 2), _dkurp("LhcBHhcPGhwd"))
addItem(_dkurp("MwsMEBMLHA=="),   ICONS.AutoFire, false, (5 - 1), _dkurp("MwsMEBMLHA=="))
addItem(_dkurp("KhYTEhkLAAc="),  ICONS.Movement, false, (9 - 4), _dkurp("KhYTEhkLAAc="))
addItem(_dkurp("MRAWAhUCHQ=="),   ICONS.Visuals,  false, (11 - 5), _dkurp("MRAWAhUCHQ=="))
addItem(_dkurp("MBYXGxBOIxwL"), ICONS.World,    false, (8 - 1), _dkurp("MBYXGxA="))
addItem(_dkurp("JBgIEgYP"),    ICONS.Camera,   false, (14 - 6), _dkurp("JBgIEgYP"))
addItem(_dkurp("NwsABBEaHQ=="),   ICONS.Presets,  false, (14 - 5), _dkurp("NwsABBEaHQ=="))

local ContentArea = Instance.new(_dkurp("IQsEGhE="), Main)
ContentArea.Size = UDim2.new(1, -(334 - 159), 1, -(105 - 49)); ContentArea.Position = UDim2.new(0, (173 - 8), 0, (56 - 4)); ContentArea.BackgroundTransparency = 1; ContentArea.ClipsDescendants = true; ContentArea.ZIndex = (141 - 40)

local pages = {}
local function createPage(name)
    local p = Instance.new(_dkurp("IQsEGhE="), ContentArea)
    p.Size = UDim2.new(1, 0, 1, 0)
    p.BackgroundTransparency = 1
    p.Visible = false
    p.ZIndex = (184 - 82)
    
    local c1 = Instance.new(_dkurp("NBoXGBgCBx0IPh0ZChw="), p)
    c1.Size = UDim2.new(0.485, 0, 1, 0); c1.BackgroundTransparency = 1; c1.ScrollBarThickness = (4 - 1); c1.ScrollBarImageColor3 = THEME.Accent; c1.AutomaticCanvasSize = Enum.AutomaticSize.Y; c1.CanvasSize = UDim2.new(); c1.ZIndex = (111 - 8)
    Instance.new(_dkurp("MjApHgcaIhIWFxoM"), c1).Padding = UDim.new(0, (11 - 1))
    
    local c2 = Instance.new(_dkurp("NBoXGBgCBx0IPh0ZChw="), p)
    c2.Size = UDim2.new(0.485, 0, 1, 0); c2.Position = UDim2.new(0.515, 0, 0, 0); c2.BackgroundTransparency = 1; c2.ScrollBarThickness = (6 - 3); c2.ScrollBarImageColor3 = THEME.Accent; c2.AutomaticCanvasSize = Enum.AutomaticSize.Y; c2.CanvasSize = UDim2.new(); c2.ZIndex = (146 - 43)
    Instance.new(_dkurp("MjApHgcaIhIWFxoM"), c2).Padding = UDim.new(0, (20 - 10))
    
    pages[name] = {Frame = p, Col1 = c1, Col2 = c2}
end

for _, n in ipairs({_dkurp("JBYIFRUa"),_dkurp("LhcBHhcPGhwd"),_dkurp("MwsMEBMLHA=="),_dkurp("KhYTEhkLAAc="),_dkurp("MRAWAhUCHQ=="),_dkurp("MBYXGxA="),_dkurp("JBgIEgYP"),_dkurp("NwsABBEaHQ==")}) do createPage(n) end

showPage = function(name)
    for n, p in pairs(pages) do
        if n == name then
            p.Frame.Visible = true
            p.Frame.Position = UDim2.new(0, (29 - 14), 0, 0)
            p.Frame.BackgroundTransparency = 1
            TweenService:Create(p.Frame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Position = UDim2.new(0, 0, 0, 0),
                BackgroundTransparency = 1
            }):Play()
        else
            p.Frame.Visible = false
        end
    end
end
showPage(_dkurp("JBYIFRUa"))

local function createCard(parent, title, order)
    local card = Instance.new(_dkurp("IQsEGhE="), parent)
    card.Size = UDim2.new(1, 0, 0, 0); card.AutomaticSize = Enum.AutomaticSize.Y
    card.BackgroundColor3 = THEME.CardBg; card.BackgroundTransparency = 0.2; card.BorderSizePixel = 0; card.LayoutOrder = order; card.ClipsDescendants = true; card.ZIndex = (162 - 58)
    Instance.new(_dkurp("MjAmGAYACwE="), card).CornerRadius = UDim.new(0, (19 - 7))
    local cs = Instance.new(_dkurp("MjA2AwYBBRY="), card); cs.Color = THEME.Border; cs.Transparency = 0.3
    local p = Instance.new(_dkurp("MjA1FhAKBx0I"), card); p.PaddingTop = UDim.new(0, (24 - 12)); p.PaddingBottom = UDim.new(0, (18 - 6)); p.PaddingLeft = UDim.new(0, (23 - 11)); p.PaddingRight = UDim.new(0, (16 - 4))
    local mainLayout = Instance.new(_dkurp("MjApHgcaIhIWFxoM"), card); mainLayout.Padding = UDim.new(0, (19 - 9))
    
    local h = Instance.new(_dkurp("IQsEGhE="), card); h.Size = UDim2.new(1, 0, 0, (28 - 12)); h.BackgroundTransparency = 1; h.LayoutOrder = -1; h.ZIndex = (176 - 71)
    local t = Instance.new(_dkurp("MxwdAzgPDBYD"), h); t.Size = UDim2.new(1, -(26 - 6), 1, 0); t.BackgroundTransparency = 1; t.Text = title; t.Font = Enum.Font.GothamBold; t.TextSize = (16 - 5); t.TextColor3 = THEME.TextPrimary; t.TextXAlignment = Enum.TextXAlignment.Left; t.ZIndex = (202 - 97)
    
    local body = Instance.new(_dkurp("IQsEGhE="), card); body.Size = UDim2.new(1, 0, 0, 0); body.AutomaticSize = Enum.AutomaticSize.Y; body.BackgroundTransparency = 1; body.ClipsDescendants = true; body.ZIndex = (143 - 38)
    local bodyLayout = Instance.new(_dkurp("MjApHgcaIhIWFxoM"), body); bodyLayout.Padding = UDim.new(0, (16 - 6))
    
    return body, card
end

local function addToggle(parent, name, desc, def, id, cb)
    local rowHeight = desc and (58 - 26) or (48 - 20)
    local row = Instance.new(_dkurp("IQsEGhE="), parent); row.Size = UDim2.new(1, 0, 0, rowHeight); row.BackgroundTransparency = 1; row.ZIndex = (199 - 93)
    local txt = Instance.new(_dkurp("IQsEGhE="), row); txt.Size = UDim2.new(1, -(49 - 7), 1, 0); txt.BackgroundTransparency = 1; txt.ZIndex = (202 - 96)
    local t = Instance.new(_dkurp("MxwdAzgPDBYD"), txt); t.Size = UDim2.new(1, 0, 0, (16 - 2)); t.BackgroundTransparency = 1; t.Text = name; t.Font = Enum.Font.GothamMedium; t.TextSize = 10.5; t.TextColor3 = THEME.TextPrimary; t.TextXAlignment = Enum.TextXAlignment.Left; t.ZIndex = (152 - 46)
    if desc then
        local d = Instance.new(_dkurp("MxwdAzgPDBYD"), txt); d.Size = UDim2.new(1, 0, 0, (23 - 11)); d.Position = UDim2.new(0, 0, 0, (17 - 3)); d.BackgroundTransparency = 1; d.Text = desc; d.Font = Enum.Font.Gotham; d.TextSize = 8.5; d.TextColor3 = THEME.TextMuted; d.TextXAlignment = Enum.TextXAlignment.Left; t.ZIndex = (188 - 82)
    end

    local sw = Instance.new(_dkurp("MxwdAzYbGgcAFg=="), row); sw.Size = UDim2.new(0, (52 - 18), 0, (24 - 7)); sw.Position = UDim2.new(1, -(63 - 29), 0.5, -8.5); sw.Text = ""; sw.AutoButtonColor = false; sw.ZIndex = (120 - 13)
    Instance.new(_dkurp("MjAmGAYACwE="), sw).CornerRadius = UDim.new(1, 0)
    local knob = Instance.new(_dkurp("IQsEGhE="), sw); knob.Size = UDim2.new(0, (25 - 12), 0, (23 - 10)); knob.BorderSizePixel = 0; knob.ZIndex = (190 - 82)
    Instance.new(_dkurp("MjAmGAYACwE="), knob).CornerRadius = UDim.new(1, 0)

    local isOn = def
    local function render(v, immediate)
        local bgCol = v and THEME.Accent or THEME.ToggleOff
        local knobCol = v and THEME.KnobOn or THEME.KnobOff
        local knobPos = v and UDim2.new(1, -(23 - 8), 0.5, -6.5) or UDim2.new(0, (4 - 2), 0.5, -6.5)

        if immediate then
            sw.BackgroundColor3 = bgCol
            knob.BackgroundColor3 = knobCol
            knob.Position = knobPos
        else
            TweenService:Create(sw, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = bgCol}):Play()
            TweenService:Create(knob, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = knobCol, Position = knobPos}):Play()
        end
    end
    render(isOn, true)

    PS.uiSwitches[id] = function(v) isOn = v; render(v); if cb then cb(v) end end
    sw.MouseButton1Click:Connect(function() 
        isOn = not isOn
        render(isOn, false)
        if cb then cb(isOn) end
        applyToggle(id, isOn)
    end)
end

local function addSlider(parent, name, minV, maxV, defV, id, cb)
    local row = Instance.new(_dkurp("IQsEGhE="), parent); row.Size = UDim2.new(1, 0, 0, (34 - 2)); row.BackgroundTransparency = 1; row.ZIndex = (132 - 26)
    local t = Instance.new(_dkurp("MxwdAzgPDBYD"), row); t.Size = UDim2.new(1, -(75 - 30), 0, (18 - 5)); t.BackgroundTransparency = 1; t.Text = name; t.Font = Enum.Font.GothamMedium; t.TextSize = 10.5; t.TextColor3 = THEME.TextPrimary; t.TextXAlignment = Enum.TextXAlignment.Left; t.ZIndex = (128 - 22)
    local v = Instance.new(_dkurp("MxwdAzgPDBYD"), row); v.Size = UDim2.new(0, (56 - 21), 0, (23 - 10)); v.Position = UDim2.new(1, -(56 - 21), 0, 0); v.BackgroundTransparency = 1; v.Text = tostring(defV); v.Font = Enum.Font.GothamBold; v.TextSize = 9.5; v.TextColor3 = THEME.Accent; v.TextXAlignment = Enum.TextXAlignment.Right; t.ZIndex = (145 - 39)

    local track = Instance.new(_dkurp("IQsEGhE="), row); track.Size = UDim2.new(1, 0, 0, (16 - 8)); track.Position = UDim2.new(0, 0, 0, (23 - 3)); track.BackgroundColor3 = THEME.ToggleOff; track.BorderSizePixel = 0; track.ZIndex = (118 - 12)
    Instance.new(_dkurp("MjAmGAYACwE="), track).CornerRadius = UDim.new(1, 0)
    local fill = Instance.new(_dkurp("IQsEGhE="), track); fill.Size = UDim2.new((defV - minV) / (maxV - minV), 0, 1, 0); fill.BackgroundColor3 = THEME.Accent; fill.BorderSizePixel = 0; fill.ZIndex = (163 - 56)
    Instance.new(_dkurp("MjAmGAYACwE="), fill).CornerRadius = UDim.new(1, 0)

    local function setVal(nv)
        nv = math.clamp(math.floor(nv + 0.5), minV, maxV)
        v.Text = tostring(nv); fill.Size = UDim2.new((nv - minV) / (maxV - minV), 0, 1, 0)
        setV(id, nv); if cb then cb(nv) end
    end

    local dragging = false
    track.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then dragging = true; setVal(minV + math.clamp((i.Position.X - track.AbsolutePosition.X) / track.AbsoluteSize.X, 0, 1) * (maxV - minV)) end end)
    UserInputService.InputChanged:Connect(function(i)
        if dragging and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
            setVal(minV + math.clamp((i.Position.X - track.AbsolutePosition.X) / track.AbsoluteSize.X, 0, 1) * (maxV - minV))
        end
    end)
    UserInputService.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then dragging = false end end)
    setV(id, defV)
end

local function addDropdown(parent, name, items, defaultItem, cb)
    local row = Instance.new(_dkurp("IQsEGhE="), parent); row.Size = UDim2.new(1, 0, 0, (61 - 21)); row.BackgroundTransparency = 1; row.ZIndex = (176 - 70)
    local t = Instance.new(_dkurp("MxwdAzgPDBYD"), row); t.Size = UDim2.new(1, 0, 0, (20 - 7)); t.BackgroundTransparency = 1; t.Text = name; t.Font = Enum.Font.GothamMedium; t.TextSize = 10.5; t.TextColor3 = THEME.TextPrimary; t.TextXAlignment = Enum.TextXAlignment.Left; t.ZIndex = (143 - 37)

    local dropBtn = Instance.new(_dkurp("MxwdAzYbGgcAFg=="), row); dropBtn.Size = UDim2.new(1, 0, 0, (28 - 6)); dropBtn.Position = UDim2.new(0, 0, 0, (22 - 6)); dropBtn.BackgroundColor3 = THEME.CardBg; dropBtn.Text = _dkurp("R1k=") .. defaultItem; dropBtn.Font = Enum.Font.Gotham; dropBtn.TextSize = 10.5; dropBtn.TextColor3 = THEME.TextPrimary; dropBtn.TextXAlignment = Enum.TextXAlignment.Left; dropBtn.AutoButtonColor = false; dropBtn.ZIndex = (136 - 29)
    Instance.new(_dkurp("MjAmGAYACwE="), dropBtn).CornerRadius = UDim.new(0, (12 - 4))
    Instance.new(_dkurp("MjA2AwYBBRY="), dropBtn).Color = THEME.BorderActive

    local listFrame = Instance.new(_dkurp("NBoXGBgCBx0IPh0ZChw="), ScreenGui)
    listFrame.Size = UDim2.new(0, (146 - 6), 0, #items * (30 - 8) + (15 - 7)); listFrame.BackgroundColor3 = THEME.CardBg; listFrame.Visible = false; listFrame.ZIndex = (420 - 170); listFrame.CanvasSize = UDim2.new(0,0,0,#items * (41 - 19))
    Instance.new(_dkurp("MjAmGAYACwE="), listFrame).CornerRadius = UDim.new(0, (12 - 4))
    Instance.new(_dkurp("MjA2AwYBBRY="), listFrame).Color = THEME.BorderActive
    local layout = Instance.new(_dkurp("MjApHgcaIhIWFxoM"), listFrame); layout.Padding = UDim.new(0, (4 - 2))

    for _, item in ipairs(items) do
        local ibtn = Instance.new(_dkurp("MxwdAzYbGgcAFg=="), listFrame)
        ibtn.Size = UDim2.new(1, 0, 0, (40 - 18)); ibtn.BackgroundTransparency = 1; ibtn.Text = _dkurp("R1k=") .. item; ibtn.Font = Enum.Font.Gotham; ibtn.TextSize = 10.5; ibtn.TextColor3 = THEME.TextPrimary; ibtn.TextXAlignment = Enum.TextXAlignment.Left; ibtn.ZIndex = (364 - 113)
        ibtn.MouseButton1Click:Connect(function()
            dropBtn.Text = _dkurp("R1k=") .. item
            listFrame.Visible = false
            if cb then cb(item) end
        end)
    end

    dropBtn.MouseButton1Click:Connect(function()
        listFrame.Visible = not listFrame.Visible
        if listFrame.Visible then
            local absPos = dropBtn.AbsolutePosition
            listFrame.Position = UDim2.new(0, absPos.X, 0, absPos.Y + (34 - 8))
        end
    end)
end


do
    local c1 = createCard(pages[_dkurp("JBYIFRUa")].Col1, _dkurp("NBcEB1QvBx5PXk8sBgsCEgA="), 1)
    addToggle(c1, _dkurp("JhAINRsaTjYBGQ0UAh0="), _dkurp("JhUSFg0dThIMDAYOAllNJxEcAxIBHQEMTg=="), false, _dkurp("JhAINRsa"))
    addToggle(c1, _dkurp("NBEKAFQoISU="), _dkurp("IwsEAFQoISVPGwYKBBUA"), true, _dkurp("JhAINRsaMTUgLg=="))
    addSlider(c1, _dkurp("ITYzVyYPChoaCw=="), (13 - 3), (488 - 188), (68 - 18), _dkurp("BhAIKBIBGA=="), function(v) aimConfig.aim_fov = v end)
    addToggle(c1, _dkurp("KxYGHFQvBx5POhoMExYL"), _dkurp("KxYGHFQDAREGFApYJjAoVxYbGgcAFk8ICAoMAx0BAA=="), false, _dkurp("KxYGHDUHAzEaDBsXCQ=="))

    addDropdown(c1, _dkurp("JhAIVyQcBxwdERsB"), {_dkurp("LxwEEw=="), _dkurp("MxYXBBs="), _dkurp("NA0KGhUNBg=="), _dkurp("JgsIBA=="), _dkurp("KxwCBA==")}, _dkurp("LxwEEw=="), function(item)
        setV(_dkurp("BhAIKAQcBxwdERsBOAkEBQA="), item)
    end)

    
    local btCard = createCard(pages[_dkurp("JBYIFRUa")].Col1, _dkurp("JRgGHAAcDxAEWDwdEw0MGRMd"), (3 - 1))
    addToggle(btCard, _dkurp("JRgGHAAcDxAEWCoWBhsJEhA="), _dkurp("LxARVxEACx4GHRxYBg1FBxUdGlMfFxwRExAKGQc="), false, _dkurp("JRgGHAAcDxAEJyoWBhsJEhA="))
    addSlider(btCard, _dkurp("JRgGHAAcDxAEWDsRChxFXxkdRw=="), (98 - 48), (662 - 162), (391 - 191), _dkurp("BRgGHAAcDxAEJxsRChw="), function(v) setV(_dkurp("BRgGHAAcDxAEJxsRChw="), v) end)

    
    local extCard = createCard(pages[_dkurp("JBYIFRUa")].Col1, _dkurp("IgERBRUeAR8ODAYXCVk2EgAaBx0ICw=="), (4 - 1))
    addToggle(extCard, _dkurp("IgERBRUeAR8ODAYXCVkgGRUMAhYL"), _dkurp("NwsAEx0NGlMCFxkRCR5FAxUcCRYbC08ZDxwEEw=="), false, _dkurp("IgERBRUeAR8ODAYXCSYgGRUMAhYL"))
    addSlider(extCard, _dkurp("NwsAEx0NGhoAFk8+BhoRGAY="), (19 - 9), (524 - 224), (119 - 19), _dkurp("AgERBRUeMRUOGxsXFQ=="), function(v) setV(_dkurp("AgERBRUeMRUOGxsXFQ=="), v) end)

    local partsCard = createCard(pages[_dkurp("JBYIFRUa")].Col2, _dkurp("MxgXEBEaTjsGDA0XHxwWV1wjGx8bEUIrAhUAFABH"), 1)
    setV(_dkurp("BhAIKAcLAhYMDAocOAkEBQAd"), {Head = true, Torso = true, Stomach = false, Arms = false, Legs = false})
    
    addToggle(partsCard, _dkurp("MxgXEBEaTjsKGQs="), _dkurp("LhcGGwEKC1MnHQ4c"), true, _dkurp("JhAIKCQPHAcwMAoZAw=="), function(v)
        local ps = getV(_dkurp("BhAIKAcLAhYMDAocOAkEBQAd"), {})
        ps[_dkurp("LxwEEw==")] = v
        setV(_dkurp("BhAIKAcLAhYMDAocOAkEBQAd"), ps)
    end)
    addToggle(partsCard, _dkurp("MxgXEBEaTicAChwX"), _dkurp("LhcGGwEKC1M7Fx0LCA=="), true, _dkurp("JhAIKCQPHAcwLAAKFBY="), function(v)
        local ps = getV(_dkurp("BhAIKAcLAhYMDAocOAkEBQAd"), {})
        ps[_dkurp("MxYXBBs=")] = v
        setV(_dkurp("BhAIKAcLAhYMDAocOAkEBQAd"), ps)
    end)
    addToggle(partsCard, _dkurp("MxgXEBEaTiAbFwIZBBE="), _dkurp("LhcGGwEKC1M8DAAVBhoN"), false, _dkurp("JhAIKCQPHAcwKxsXChgGHw=="), function(v)
        local ps = getV(_dkurp("BhAIKAcLAhYMDAocOAkEBQAd"), {})
        ps[_dkurp("NA0KGhUNBg==")] = v
        setV(_dkurp("BhAIKAcLAhYMDAocOAkEBQAd"), ps)
    end)
    addToggle(partsCard, _dkurp("MxgXEBEaTjIdFRw="), _dkurp("LhcGGwEKC1MuCgIL"), false, _dkurp("JhAIKCQPHAcwOR0VFA=="), function(v)
        local ps = getV(_dkurp("BhAIKAcLAhYMDAocOAkEBQAd"), {})
        ps[_dkurp("JgsIBA==")] = v
        setV(_dkurp("BhAIKAcLAhYMDAocOAkEBQAd"), ps)
    end)
    addToggle(partsCard, _dkurp("MxgXEBEaTj8KHxw="), _dkurp("LhcGGwEKC1MjHQgL"), false, _dkurp("JhAIKCQPHAcwNAofFA=="), function(v)
        local ps = getV(_dkurp("BhAIKAcLAhYMDAocOAkEBQAd"), {})
        ps[_dkurp("KxwCBA==")] = v
        setV(_dkurp("BhAIKAcLAhYMDAocOAkEBQAd"), ps)
    end)

    local indCard = createCard(pages[_dkurp("LhcBHhcPGhwd")].Col1, _dkurp("MBgJG1Q+Cx0KDB0ZExAKGVQnABcGGw4MCAs="), 1)
    addToggle(indCard, _dkurp("IhcEFRgLTjoBHAYbBg0KBQ=="), _dkurp("NBEKAFQNCx0bHR1YFAgQFgYLThoBHAYbBg0KBQ=="), false, _dkurp("MBgJGyQLADoBHAYbBg0KBQ=="), function(v)
        if v then Features.WallPenIndicator.on() else Features.WallPenIndicator.off() end
    end)
    addSlider(indCard, _dkurp("NAgQFgYLTiAGAgo="), (8 - 4), (35 - 5), (13 - 1), _dkurp("DhcBHhcPGhwdJxwRHRw="), function(v)
        CrosshairSquare.Size = UDim2.new(0, v, 0, v)
    end)

    local c2 = createCard(pages[_dkurp("JBYIFRUa")].Col2, _dkurp("IRAJAxEcHVNJWDsPAhgOBA=="), (3 - 1))
    addToggle(c2, _dkurp("MBgJG1QtBhYMEw=="), _dkurp("MRAWHhYCC1MbGR0fAg0WVxsAAgo="), true, _dkurp("JhAINRsaMSQOFAML"), function(v) aimConfig.aim_walls = v end)
    addToggle(c2, _dkurp("MxwEGlQtBhYMEw=="), _dkurp("Lh4LGAYLTgcKGQIVBg0ABA=="), true, _dkurp("JhAINRsaMScKGQI="), function(v) aimConfig.aim_team = v end)
    addToggle(c2, _dkurp("MRAWAhUCTj0AVT0dBBYMGw=="), _dkurp("NA0KBwdODRICHR0ZRxIMFB8="), false, _dkurp("MRAWAhUCIBw9HQwXDhU="))
    addToggle(c2, _dkurp("LxARFRsWTjYXDAoWAxwX"), _dkurp("IhcJFgYJC1MKFgoVHlkRFgYJCwdPCA4KEwo="), false, _dkurp("LxARFRsWKwsbHQEcAgs="))
    addSlider(c2, _dkurp("LxARFRsWTiAGAgo="), (4 - 2), (13 - 3), (6 - 2), _dkurp("DxARFRsWMQAGAgo="), function(v) setV(_dkurp("DxARFRsWMQAGAgo="), v) end)

    local tf1 = createCard(pages[_dkurp("MwsMEBMLHA==")].Col1, _dkurp("Jh0TFhoNCxdPLB0RAB4ABTYBGg=="), 1)
    addToggle(tf1, _dkurp("MwsMEBMLHDEADE89CRgHGxEK"), _dkurp("LxACH1keHBYMERwRCBdFHhodGhIBDE8eDgsA"), false, _dkurp("MwsMEBMLHDEADDA9CRgHGxEK"))

    local m1 = createCard(pages[_dkurp("KhYTEhkLAAc=")].Col1, _dkurp("NAkAEhBOSFMtEAAI"), 1)
    addToggle(m1, _dkurp("NAkAEhBOLBwACxs="), _dkurp("JAwWAxsDTgQOFARYFAkAEhA="), false, _dkurp("NAkAEhAsARwcDA=="))
    addSlider(m1, _dkurp("NAkAEhBOOBIDDQo="), (26 - 10), (206 - 6), (35 - 3), _dkurp("FAkAEhAxGBIDDQo="), function(v) if getT(_dkurp("NAkAEhAsARwcDA==")) then local h = getHum(); if h then h.WalkSpeed = v end end end)
    addToggle(m1, _dkurp("JREKB1RGOhoCHQtR"), _dkurp("LQwIB1QHAx4KHAYZExwJDlQBAFMDGQEcDhcC"), false, _dkurp("JREKBw=="))

    local m2 = createCard(pages[_dkurp("KhYTEhkLAAc=")].Col2, _dkurp("IRUMEBwaTiAWCxsdCg=="), 1)
    addToggle(m2, _dkurp("IRUcVzkBChY="), _dkurp("IQsAElQIAhoIEBtYChYTEhkLAAc="), false, _dkurp("IRUc"))
    addSlider(m2, _dkurp("IRUcVyceCxYL"), (28 - 8), (582 - 282), (65 - 5), _dkurp("ARUcKAIPAgYK"))

    local v1 = createCard(pages[_dkurp("MRAWAhUCHQ==")].Col1, _dkurp("Iio1VzECCx4KFhsL"), 1)
    addToggle(v1, _dkurp("LxACHxgHCRsb"), _dkurp("KAwRGx0AC1MMEA4KBhoREgZOCR8ADw=="), false, _dkurp("Iio1KDwHCRsDEQgQEw=="), function(v) ESP.Chams = v end)
    addToggle(v1, _dkurp("MRAWHhYCC1MsEAobDFkmGBgBHA=="), _dkurp("NwwXBxgLTls4GQMUTllKVzoLAR1PPx0dAhdFXyIHHRoNFApR"), false, _dkurp("Iio1KCIHHTAAFAAK"))
    addToggle(v1, _dkurp("JRYd"), _dkurp("IwALFhkHDVMNFxoWAxgXDlQMAQs="), false, _dkurp("Iio1KDYBFg=="), function(v) ESP.Boxes = v end)
    addToggle(v1, _dkurp("KRgIEg=="), _dkurp("NBEKAFQbHRYdFg4VAgo="), false, _dkurp("Iio1KDoPAxY="), function(v) ESP.Names = v end)
    addToggle(v1, _dkurp("LxwEGwAGTjEOCg=="), _dkurp("LylFHhoKBxAODAAK"), false, _dkurp("Iio1KDwLDx8bEA=="), function(v) ESP.Health = v end)
    addToggle(v1, _dkurp("IxAWAxUADRY="), _dkurp("IxAWAxUADRZPEQFYChwREgYd"), false, _dkurp("Iio1KDAHHQcOFgwd"), function(v) ESP.Distance = v end)
    addToggle(v1, _dkurp("NBIAGxEaAR0="), _dkurp("NBEKAFQMAR0KWAUXDhcRBA=="), false, _dkurp("Iio1KCcFCx8KDAAW"), function(v) ESP.Skeleton = v end)

    local v2 = createCard(pages[_dkurp("MRAWAhUCHQ==")].Col2, _dkurp("Ih8DEhcaHVNJWCwXCh8KBQA="), 1)
    addToggle(v2, _dkurp("JAwWAxsDTjAdFxwLDxgMBQ=="), _dkurp("NA0cGx0dBlMMHQEMAgtFExsa"), false, _dkurp("JAwWAxsDLQEACxwQBhAX"))
    addToggle(v2, _dkurp("NBoKBxFOPBYCFxkdFQ=="), _dkurp("IxAWFhYCC1McFgYIAgtFGAILHB8OARw="), false, _dkurp("NBoKBxE8Cx4ADgoK"))

    local w1 = createCard(pages[_dkurp("MBYXGxA=")].Col1, _dkurp("MBYXGxBOIxwLDQMZExAKGVRITjAAFQkXFQ0="), 1)
    addToggle(w1, _dkurp("MBYXGxBOIxwLDQMZExAKGQ=="), _dkurp("JgkVGw1ODQYcDAAVDgMAE1QZAQEDHE8VBg0ABR0PAgA="), false, _dkurp("MBYXGxAjARcaFA4MDhYL"), function(v)
        if v then Features.WorldModulation.on() else Features.WorldModulation.off() end
    end)
    addDropdown(w1, _dkurp("MBYXGxBOIxIbHR0RBhU="), {_dkurp("NBQKGAAGPh8OCxsRBA=="), _dkurp("IBUEBAc="), _dkurp("KRwKGQ=="), _dkurp("MBYKEw=="), _dkurp("KhwRFhg="), _dkurp("NBUEAxE="), _dkurp("IRYXFBEoBxYDHA==")}, _dkurp("NBQKGAAGPh8OCxsRBA=="), function(item)
        setV(_dkurp("EBYXGxAxAxIbJxsBFxw="), item)
    end)
    addDropdown(w1, _dkurp("MBYXGxBOLx4NEQoWE1kmGBgBHA=="), {_dkurp("t921z6TQvsi/zb76t8e1xaXlvso="), _dkurp("t+61wqTVvsa/xb7zt8A="), _dkurp("t9i1z6TTvsu/wQ=="), _dkurp("t+O096Tev/K/xb7zt8A="), _dkurp("t+i1wqTVv/i/wQ=="), _dkurp("t961wqXuvs6+87/B")}, _dkurp("t921z6TQvsi/zb76t8e1xaXlvso="), function(item)
        setWorldColor(item)
    end)
    addToggle(w1, _dkurp("KRACHwBOOBocEQAW"), _dkurp("JQsMEBwaCx1PFQ4IRwoNFhABGQBPHgAKRxoKGhIBHAc="), false, _dkurp("KRACHwA4BwAGFwE="), function(v)
        if v then Features.NightVision.on() else Features.NightVision.off() end
    end)

    local w2 = createCard(pages[_dkurp("MBYXGxA=")].Col2, _dkurp("MBwEBxsATlVPMA4WAwpFOhsKGx8ODAYXCQ=="), 1)
    addToggle(w2, _dkurp("MBwEBxsATj4AHBoUBg0MGBo="), _dkurp("JBEEGRMLTgQKGR8XCVkREgwaGwEKVwIZExwXHhUC"), false, _dkurp("MBwEBxsAIxwLDQMZExAKGQ=="), function(v)
        if v then Features.WeaponModulation.on() else Features.WeaponModulation.off() end
    end)
    addDropdown(w2, _dkurp("MBwEBxsATj4ODAoKDhgJ"), {_dkurp("KRwKGQ=="), _dkurp("IBUEBAc="), _dkurp("KhwRFhg="), _dkurp("NBQKGAAGPh8OCxsRBA=="), _dkurp("MBYKEw=="), _dkurp("IAsEGR0aCw==")}, _dkurp("KRwKGQ=="), function(item)
        setV(_dkurp("EBwEBxsAMR4ODDAMHgkA"), item)
    end)
    addDropdown(w2, _dkurp("MBwEBxsATjAAFAAK"), {_dkurp("t+O096Tev/K/xb7zt8A="), _dkurp("t921z6TQvsi/zb76t8e1xaXlvso="), _dkurp("t+61wqTVvsa/xb7zt8A="), _dkurp("t9i1z6TTvsu/wQ==")}, _dkurp("t+O096Tev/K/xb7zt8A="), function(item)
        local cols = {
            [_dkurp("t+O096Tev/K/xb7zt8A=")] = Color3.fromRGB((283 - 37), (184 - 92), (118 - 36)),
            [_dkurp("t921z6TQvsi/zb76t8e1xaXlvso=")] = Color3.fromRGB((206 - 56), (71 - 21), (206 - 6)),
            [_dkurp("t+61wqTVvsa/xb7zt8A=")] = Color3.fromRGB((55 - 5), (294 - 94), (184 - 84)),
            [_dkurp("t9i1z6TTvsu/wQ==")] = Color3.fromRGB((65 - 15), (172 - 72), (393 - 138))
        }
        setV(_dkurp("EBwEBxsAMRAaCxsXCiYGGBgBHA=="), cols[item] or THEME.Accent)
    end)
    
    addToggle(w2, _dkurp("LxgLEwdOLRwDFx0="), _dkurp("JBEEGRMLTgMDGRYdFVkNFhoKHVwIFAAOAgpFFBsCAQE="), false, _dkurp("LxgLEwctAR8ACg=="), function(v)
        if v then Features.HandsColor.on() else Features.HandsColor.off() end
    end)
    addDropdown(w2, _dkurp("LxgLEwdOIxIbHR0RBhU="), {_dkurp("NBQKGAAGPh8OCxsRBA=="), _dkurp("KRwKGQ=="), _dkurp("IBUEBAc="), _dkurp("KhwRFhg="), _dkurp("IRYXFBEoBxYDHA==")}, _dkurp("NBQKGAAGPh8OCxsRBA=="), function(item)
        setV(_dkurp("DxgLEwcxAxIbJxsBFxw="), item)
    end)
    addDropdown(w2, _dkurp("LxgLEwdOLRwDFx1YNA0cGxE="), {_dkurp("t+61wqTVvsa/xb7zt8A="), _dkurp("t+O096Tev/K/xb7zt8A="), _dkurp("t921z6TQvsi/zb76t8e1xaXlvso="), _dkurp("t9i1z6TTvsu/wQ==")}, _dkurp("t+61wqTVvsa/xb7zt8A="), function(item)
        local cols = {
            [_dkurp("t+61wqTVvsa/xb7zt8A=")] = Color3.fromRGB((138 - 48), (272 - 62), (181 - 51)),
            [_dkurp("t+O096Tev/K/xb7zt8A=")] = Color3.fromRGB((348 - 118), (81 - 1), (116 - 36)),
            [_dkurp("t921z6TQvsi/zb76t8e1xaXlvso=")] = Color3.fromRGB((297 - 147), (66 - 16), (260 - 60)),
            [_dkurp("t9i1z6TTvsu/wQ==")] = Color3.fromRGB((53 - 3), (194 - 94), (311 - 56))
        }
        setV(_dkurp("DxgLEwcxDQYcDAAVOBoKGxsc"), cols[item] or THEME.Success)
    end)

    local cam1 = createCard(pages[_dkurp("JBgIEgYP")].Col1, _dkurp("JBgIEgYPTlVPLgYdEFk2EgAaBx0ICw=="), 1)
    addToggle(cam1, _dkurp("MxEMBRBOPhYdCwAWRy8MEgM="), _dkurp("NA4MAxcGTgcAWFwKA1kVEgYdAR1PFQAcAg=="), false, _dkurp("MxEMBRA+CwEcFwE="), function(v)
        if v then Features.ThirdPerson.on() else Features.ThirdPerson.off() end
    end)
    addSlider(cam1, _dkurp("MxEMBRBOPhYdCwAWRz0MBAAPABAK"), (6 - 1), (43 - 13), (23 - 11), _dkurp("Ewk6Ex0dGg=="), function(v)
        setV(_dkurp("Ewk6Ex0dGg=="), v)
        if getT(_dkurp("MxEMBRA+CwEcFwE=")) then Features.ThirdPerson.on() end
    end)
    addToggle(cam1, _dkurp("ITYzVzcGDx0IHR0="), _dkurp("KhYBHhIXThAOFQoKBlkjOCI="), false, _dkurp("IRYTNBwPABQKCg=="), function(v)
        if v then Features.FovChanger.on() else Features.FovChanger.off() end
    end)
    addSlider(cam1, _dkurp("ITYzVyIPAgYK"), (91 - 21), (131 - 11), (127 - 37), _dkurp("ARYTKAIPAg=="), function(v) setV(_dkurp("ARYTKAIPAg=="), v) end)
    addToggle(cam1, _dkurp("JgoVEhcaTiEODAYXR1E2AwYLGhAHUQ=="), _dkurp("NA0XEgANBhYLWB0dFBYJAgAHAR0="), true, _dkurp("JgoVEhcaPBIbEQAnIhcEFRgLCg=="))

    local p1 = createCard(pages[_dkurp("NwsABBEaHQ==")].Col1, _dkurp("JBYLER0JGwEODAYXCQo="), 1)
    local cfgRow = Instance.new(_dkurp("IQsEGhE="), p1); cfgRow.Size = UDim2.new(1, 0, 0, (58 - 28)); cfgRow.BackgroundTransparency = 1; cfgRow.ZIndex = (201 - 95)
    local cfgLbl = Instance.new(_dkurp("MxwdAzgPDBYD"), cfgRow); cfgLbl.Size = UDim2.new(1, -(105 - 25), 1, 0); cfgLbl.BackgroundTransparency = 1; cfgLbl.Text = _dkurp("KxwCHgBOLRwBHgYf"); cfgLbl.Font = Enum.Font.GothamMedium; cfgLbl.TextSize = 10.5; cfgLbl.TextColor3 = THEME.TextPrimary; cfgLbl.TextXAlignment = Enum.TextXAlignment.Left; cfgLbl.ZIndex = (132 - 26)
    
    local loadBtn = Instance.new(_dkurp("MxwdAzYbGgcAFg=="), cfgRow); loadBtn.Size = UDim2.new(0, (150 - 75), 0, (28 - 6)); loadBtn.Position = UDim2.new(1, -(109 - 34), 0.5, -(22 - 11)); loadBtn.BackgroundColor3 = THEME.Accent; loadBtn.Text = _dkurp("KxYEEw=="); loadBtn.Font = Enum.Font.GothamBold; loadBtn.TextSize = 9.5; loadBtn.TextColor3 = Color3.new(1, 1, 1); loadBtn.AutoButtonColor = false; loadBtn.ZIndex = (210 - 103)
    Instance.new(_dkurp("MjAmGAYACwE="), loadBtn).CornerRadius = UDim.new(0, (9 - 1))

    loadBtn.MouseButton1Click:Connect(function()
        setV(_dkurp("BhAIKAQcBxwdERsBOAkEBQA="), _dkurp("LxwEEw=="))
        setV(_dkurp("BhAIKAcLAhYMDAocOAkEBQAd"), {Head = true, Torso = true, Stomach = false, Arms = false, Legs = false})
        aimConfig.aim_walls = true
        aimConfig.aim_team = false
        aimConfig.aim_fov = (91 - 41)

        applyToggle(_dkurp("JhAINRsa"), true)
        applyToggle(_dkurp("MBgJGyQLADoBHAYbBg0KBQ=="), true)
        applyToggle(_dkurp("JRgGHAAcDxAEJyoWBhsJEhA="), true)
        applyToggle(_dkurp("IgERBRUeAR8ODAYXCSYgGRUMAhYL"), true)
        applyToggle(_dkurp("JhAINRsaMTUgLg=="), true)
        applyToggle(_dkurp("MwsMEBMLHDEADDA9CRgHGxEK"), true)
        applyToggle(_dkurp("Iio1KDwHCRsDEQgQEw=="), true)
        applyToggle(_dkurp("Iio1KCIHHTAAFAAK"), true)
        applyToggle(_dkurp("Iio1KDYBFg=="), true)
        applyToggle(_dkurp("Iio1KDoPAxY="), true)
        applyToggle(_dkurp("Iio1KDwLDx8bEA=="), true)
        applyToggle(_dkurp("Iio1KDAHHQcOFgwd"), true)
        applyToggle(_dkurp("JgoVEhcaPBIbEQAnIhcEFRgLCg=="), true)
        applyToggle(_dkurp("JREKBw=="), true)
        setWorldColor(_dkurp("t921z6TQvsi/zb76t8e1xaXlvso="))
    end)
end


local LogoToggleBtn = Instance.new(_dkurp("MxwdAzYbGgcAFg=="), ScreenGui)
LogoToggleBtn.Name = _dkurp("KxYCGCABCRQDHSIdCQwnAgAaAR0=")
LogoToggleBtn.AnchorPoint = Vector2.new(0.5, 0)
LogoToggleBtn.Size = UDim2.new(0, (75 - 27), 0, (66 - 18))
LogoToggleBtn.Position = UDim2.new(0.5, 0, 0, (23 - 11))
LogoToggleBtn.BackgroundColor3 = THEME.CardBg
LogoToggleBtn.BackgroundTransparency = 0.2
LogoToggleBtn.Text = ""
LogoToggleBtn.AutoButtonColor = false
LogoToggleBtn.ZIndex = (1077 - 477)
Instance.new(_dkurp("MjAmGAYACwE="), LogoToggleBtn).CornerRadius = UDim.new(1, 0)
local logoStroke = Instance.new(_dkurp("MjA2AwYBBRY="), LogoToggleBtn)
logoStroke.Color = THEME.BorderActive
logoStroke.Thickness = 1.5

local centerLogoImg = Instance.new(_dkurp("LhQEEBEiDxEKFA=="), LogoToggleBtn)
centerLogoImg.Size = UDim2.new(0, (44 - 14), 0, (54 - 24))
centerLogoImg.Position = UDim2.new(0.5, -(25 - 10), 0.5, -(24 - 9))
centerLogoImg.BackgroundTransparency = 1
centerLogoImg.Image = CUSTOM_LOGO_ID
centerLogoImg.ScaleType = Enum.ScaleType.Fit
centerLogoImg.ZIndex = (892 - 291)


local MobileAimBtn = Instance.new(_dkurp("MxwdAzYbGgcAFg=="), ScreenGui)
MobileAimBtn.Name = _dkurp("KhYHHhgLLxoCOhoMExYL")
MobileAimBtn.AnchorPoint = Vector2.new(0, 0.5)
MobileAimBtn.Size = UDim2.new(0, (89 - 37), 0, (72 - 20))
MobileAimBtn.Position = UDim2.new(0, (27 - 7), 0.5, 0)
MobileAimBtn.BackgroundColor3 = THEME.CardBg
MobileAimBtn.BackgroundTransparency = 0.2
MobileAimBtn.Text = _dkurp("JjAo")
MobileAimBtn.Font = Enum.Font.GothamBold
MobileAimBtn.TextSize = (25 - 12)
MobileAimBtn.TextColor3 = THEME.TextMuted
MobileAimBtn.AutoButtonColor = false
MobileAimBtn.Visible = IS_MOBILE
MobileAimBtn.ZIndex = (1023 - 373)
Instance.new(_dkurp("MjAmGAYACwE="), MobileAimBtn).CornerRadius = UDim.new(1, 0)
local aimStroke = Instance.new(_dkurp("MjA2AwYBBRY="), MobileAimBtn)
aimStroke.Color = THEME.Border
aimStroke.Thickness = 1.5

local function updateMobileAimVisual(state)
    if state then
        TweenService:Create(MobileAimBtn, TweenInfo.new(0.2), {BackgroundColor3 = THEME.Accent, TextColor3 = Color3.new(1, 1, 1)}):Play()
        aimStroke.Color = THEME.AccentSoft
    else
        TweenService:Create(MobileAimBtn, TweenInfo.new(0.2), {BackgroundColor3 = THEME.CardBg, TextColor3 = THEME.TextMuted}):Play()
        aimStroke.Color = THEME.Border
    end
end

MobileAimBtn.MouseButton1Click:Connect(function()
    local newState = not getT(_dkurp("JhAINRsa"))
    applyToggle(_dkurp("JhAINRsa"), newState)
    updateMobileAimVisual(newState)
end)

local draggingAim, dragStart, startPos
MobileAimBtn.InputBegan:Connect(function(input)
    if getT(_dkurp("KxYGHDUHAzEaDBsXCQ==")) then return end
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
        draggingAim = true
        dragStart = input.Position
        startPos = MobileAimBtn.Position
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if getT(_dkurp("KxYGHDUHAzEaDBsXCQ==")) then return end
    if draggingAim and (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement) then
        local delta = input.Position - dragStart
        MobileAimBtn.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
        draggingAim = false
    end
end)

local isOpen = false
local isAnimating = false

MainContainer.Visible = false
MainContainer.GroupTransparency = 1
BlockerFrame.Visible = false

local function toggleMenu(open)
    if isAnimating then return end
    isAnimating = true
    
    if open then
        MainContainer.Visible = true
        BlockerFrame.Visible = true
        setMenuBlur(true)
        Main.Size = UDim2.new(0, MENU_W - (91 - 11), 0, MENU_H - (83 - 33))
        
        local tw1 = TweenService:Create(MainContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {GroupTransparency = 0})
        local tw2 = TweenService:Create(Main, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, MENU_W, 0, MENU_H)})
        tw1:Play()
        tw2:Play()
        tw2.Completed:Wait()
        isOpen = true
        isAnimating = false
    else
        isOpen = false
        setMenuBlur(false)
        
        local tw1 = TweenService:Create(MainContainer, TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {GroupTransparency = 1})
        local tw2 = TweenService:Create(Main, TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {Size = UDim2.new(0, MENU_W - (158 - 78), 0, MENU_H - (84 - 34))})
        tw1:Play()
        tw2:Play()
        tw2.Completed:Wait()
        
        MainContainer.Visible = false
        BlockerFrame.Visible = false
        isAnimating = false
    end
end

LogoToggleBtn.MouseButton1Click:Connect(function()
    toggleMenu(not isOpen)
end)

CloseBtn.MouseButton1Click:Connect(function()
    toggleMenu(false)
end)

UserInputService.InputBegan:Connect(function(input, processed)
    if not processed and (input.KeyCode == Enum.KeyCode.RightShift or input.KeyCode == Enum.KeyCode.Insert) then
        toggleMenu(not isOpen)
    end
end)
