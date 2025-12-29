local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- TEMİZLİK
if CoreGui:FindFirstChild("FluxusKeySystem") then CoreGui.FluxusKeySystem:Destroy() end
if CoreGui:FindFirstChild("FluxusZHub_V10") then CoreGui.FluxusZHub_V10:Destroy() end

-- AYARLAR
local DogruKey = "FluxusV8" 
local KeyLink = "https://share.google/4EWjX4WN2En2FVgKt"

-- KEY SİSTEMİ GUI
local KeyGui = Instance.new("ScreenGui", CoreGui)
KeyGui.Name = "FluxusKeySystem"

local KeyFrame = Instance.new("Frame", KeyGui)
KeyFrame.Size = UDim2.new(0, 280, 0, 180)
KeyFrame.Position = UDim2.new(0.5, -140, 0.5, -90)
KeyFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
KeyFrame.Active = true
KeyFrame.Draggable = true
Instance.new("UICorner", KeyFrame).CornerRadius = UDim.new(0, 15)

local KeyTitle = Instance.new("TextLabel", KeyFrame)
KeyTitle.Size = UDim2.new(1, 0, 0, 45)
KeyTitle.BackgroundColor3 = Color3.fromRGB(120, 0, 255)
KeyTitle.Text = "FluxusZHub | GİRİŞ"
KeyTitle.TextColor3 = Color3.new(1,1,1)
KeyTitle.Font = Enum.Font.GothamBold
KeyTitle.TextSize = 16
Instance.new("UICorner", KeyTitle).CornerRadius = UDim.new(0, 15)

local KeyInput = Instance.new("TextBox", KeyFrame)
KeyInput.Size = UDim2.new(0, 240, 0, 40)
KeyInput.Position = UDim2.new(0.5, -120, 0.4, 0)
KeyInput.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
KeyInput.Text = ""
KeyInput.PlaceholderText = "Anahtarı Giriniz..."
KeyInput.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", KeyInput)

local CheckBtn = Instance.new("TextButton", KeyFrame)
CheckBtn.Size = UDim2.new(0, 115, 0, 35)
CheckBtn.Position = UDim2.new(0.08, 0, 0.7, 0)
CheckBtn.BackgroundColor3 = Color3.fromRGB(120, 0, 255)
CheckBtn.Text = "DOĞRULA"
CheckBtn.TextColor3 = Color3.new(1,1,1)
CheckBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", CheckBtn)

local GetKeyBtn = Instance.new("TextButton", KeyFrame)
GetKeyBtn.Size = UDim2.new(0, 115, 0, 35)
GetKeyBtn.Position = UDim2.new(0.52, 0, 0.7, 0)
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
GetKeyBtn.Text = "KEY AL"
GetKeyBtn.TextColor3 = Color3.new(1,1,1)
GetKeyBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", GetKeyBtn)

-- ----------------------------------------------------------------
-- ANA MENÜ FONKSİYONU (DOĞRU KEY GİRİLİNCE ÇALIŞIR)
-- ----------------------------------------------------------------
function AnaMenuyuAc()
    local MainGui = Instance.new("ScreenGui", CoreGui)
    MainGui.Name = "FluxusZHub_V10"

    -- AÇ/KAPAT BUTONU
    local OpenBtn = Instance.new("TextButton", MainGui)
    OpenBtn.Size = UDim2.new(0, 50, 0, 50)
    OpenBtn.Position = UDim2.new(0, 10, 0.5, -25)
    OpenBtn.BackgroundColor3 = Color3.fromRGB(120, 0, 255)
    OpenBtn.Text = "F"
    OpenBtn.TextColor3 = Color3.new(1,1,1)
    OpenBtn.Font = Enum.Font.GothamBold
    OpenBtn.TextSize = 22
    OpenBtn.Active = true
    OpenBtn.Draggable = true
    Instance.new("UICorner", OpenBtn).CornerRadius = UDim.new(1, 0)

    -- ANA ÇERÇEVE
    local MainFrame = Instance.new("Frame", MainGui)
    MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    MainFrame.Position = UDim2.new(0.3, 0, 0.2, 0)
    MainFrame.Size = UDim2.new(0, 180, 0, 300)
    MainFrame.Visible = true
    MainFrame.Active = true
    MainFrame.Draggable = true
    Instance.new("UICorner", MainFrame)

    OpenBtn.MouseButton1Click:Connect(function() MainFrame.Visible = not MainFrame.Visible end)

    local Title = Instance.new("TextLabel", MainFrame)
    Title.Size = UDim2.new(1, 0, 0, 35)
    Title.BackgroundColor3 = Color3.fromRGB(120, 0, 255)
    Title.Text = "FluxusZHub V10"
    Title.TextColor3 = Color3.new(1,1,1)
    Title.Font = Enum.Font.GothamBold
    Instance.new("UICorner", Title)

    local Container = Instance.new("ScrollingFrame", MainFrame)
    Container.Position = UDim2.new(0, 5, 0, 40)
    Container.Size = UDim2.new(1, -10, 1, -45)
    Container.BackgroundTransparency = 1
    Container.ScrollBarThickness = 2
    Instance.new("UIListLayout", Container).Padding = UDim.new(0, 6)

    local function CreateBtn(txt)
        local btn = Instance.new("TextButton", Container)
        btn.Size = UDim2.new(0, 150, 0, 35)
        btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        btn.Text = txt
        btn.TextColor3 = Color3.new(1,1,1)
        btn.Font = Enum.Font.Gotham
        Instance.new("UICorner", btn)
        return btn
    end

    local ESPBtn = CreateBtn("ESP: KAPALI")
    local SpeedBtn = CreateBtn("HIZ: KAPALI")
    local FlyBtn = CreateBtn("UÇMA: KAPALI")
    local NoclipBtn = CreateBtn("NOCLIP: KAPALI")
    local InfJumpBtn = CreateBtn("S. ZIPLAMA: KAPALI")

    local espOn, speedOn, flyOn, noclipOn, infJumpOn = false, false, false, false, false
    local bV, bG

    -- ÖZELLİKLER (V8 Mantığı)
    FlyBtn.MouseButton1Click:Connect(function()
        flyOn = not flyOn
        FlyBtn.Text = "UÇMA: " .. (flyOn and "AÇIK" or "KAPALI")
        FlyBtn.BackgroundColor3 = flyOn and Color3.fromRGB(0, 170, 0) or Color3.fromRGB(40, 40, 40)
        local char = LocalPlayer.Character
        if flyOn and char then
            bV = Instance.new("BodyVelocity", char.HumanoidRootPart)
            bV.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            bG = Instance.new("BodyGyro", char.HumanoidRootPart)
            bG.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
            task.spawn(function()
                while flyOn and char:FindFirstChild("HumanoidRootPart") do
                    bV.Velocity = (char.Humanoid.MoveDirection.Magnitude > 0) and (Camera.CFrame.LookVector * 80) or Vector3.new(0, 0.1, 0)
                    bG.CFrame = Camera.CFrame
                    task.wait()
                end
                if bV then bV:Destroy() end
                if bG then bG:Destroy() end
            end)
        end
    end)

    InfJumpBtn.MouseButton1Click:Connect(function()
        infJumpOn = not infJumpOn
        InfJumpBtn.Text = "S. ZIPLAMA: " .. (infJumpOn and "AÇIK" or "KAPALI")
        InfJumpBtn.BackgroundColor3 = infJumpOn and Color3.fromRGB(0, 170, 0) or Color3.fromRGB(40, 40, 40)
    end)

    UserInputService.JumpRequest:Connect(function()
        if infJumpOn and LocalPlayer.Character then LocalPlayer.Character.Humanoid:ChangeState("Jumping") end
    end)

    RunService.RenderStepped:Connect(function()
        local char = LocalPlayer.Character
        if not char then return end
        if speedOn then char.Humanoid.WalkSpeed = 100 end
        if noclipOn then
            for _, v in pairs(char:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide = false end end
        end
        if espOn then
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Head") then
                    if not p.Character.Head:FindFirstChild("V10_ESP") then
                        local bg = Instance.new("BillboardGui", p.Character.Head)
                        bg.Name = "V10_ESP"
                        bg.AlwaysOnTop = true
                        bg.Size = UDim2.new(0, 80, 0, 40)
                        local tl = Instance.new("TextLabel", bg)
                        tl.Size = UDim2.new(1, 0, 1, 0)
                        tl.BackgroundTransparency = 1
                        tl.Text = p.Name
                        tl.TextColor3 = Color3.new(1,1,1)
                        tl.TextStrokeTransparency = 0
                    end
                end
            end
        end
    end)

    ESPBtn.MouseButton1Click:Connect(function()
        espOn = not espOn
        ESPBtn.Text = "ESP: " .. (espOn and "AÇIK" or "KAPALI")
        ESPBtn.BackgroundColor3 = espOn and Color3.fromRGB(0, 170, 0) or Color3.fromRGB(40, 40, 40)
    end)

    SpeedBtn.MouseButton1Click:Connect(function()
        speedOn = not speedOn
        SpeedBtn.Text = "HIZ: " .. (speedOn and "AÇIK" or "KAPALI")
        SpeedBtn.BackgroundColor3 = speedOn and Color3.fromRGB(0, 170, 0) or Color3.fromRGB(40, 40, 40)
    end)

    NoclipBtn.MouseButton1Click:Connect(function()
        noclipOn = not noclipOn
        NoclipBtn.Text = "NOCLIP: " .. (noclipOn and "AÇIK" or "KAPALI")
        NoclipBtn.BackgroundColor3 = noclipOn and Color3.fromRGB(0, 170, 0) or Color3.fromRGB(40, 40, 40)
    end)
end

-- 📋 KOPYALAMA VE DOĞRULAMA
GetKeyBtn.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard(KeyLink)
        GetKeyBtn.Text = "KOPYALANDI!"
        task.wait(1.5)
        GetKeyBtn.Text = "KEY AL"
    end
end)

CheckBtn.MouseButton1Click:Connect(function()
    if KeyInput.Text == DogruKey then
        KeyTitle.Text = "ERİŞİM ONAYLANDI!"
        KeyTitle.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
        task.wait(0.5)
        KeyGui:Destroy()
        AnaMenuyuAc()
    else
        KeyInput.Text = ""
        KeyInput.PlaceholderText = "HATALI KEY!"
        KeyTitle.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
        task.wait(1)
        KeyTitle.BackgroundColor3 = Color3.fromRGB(120, 0, 255)
    end
end)
