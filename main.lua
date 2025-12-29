local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer

-- Temizlik
if CoreGui:FindFirstChild("UltraClicker") then CoreGui.UltraClicker:Destroy() end

-- PANEL
local sg = Instance.new("ScreenGui", CoreGui)
sg.Name = "UltraClicker"

local btn = Instance.new("TextButton", sg)
btn.Size = UDim2.new(0, 160, 0, 50)
btn.Position = UDim2.new(0.5, -80, 0.1, 0)
btn.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Ultra mod olduğu için kırmızı
btn.Text = "ULTRA TIKLA: KAPALI"
btn.TextColor3 = Color3.new(1,1,1)
btn.Font = Enum.Font.GothamBold
btn.Draggable = true
Instance.new("UICorner", btn)

local active = false

btn.MouseButton1Click:Connect(function()
    active = not active
    btn.Text = active and "ULTRA TIKLA: AÇIK" or "ULTRA TIKLA: KAPALI"
    btn.BackgroundColor3 = active and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
end)

-- ⚡ ULTRA HIZLI DÖNGÜ (MULTI-THREADING)
task.spawn(function()
    while true do
        task.wait() -- En küçük bekleme süresi
        if active then
            -- Bir döngü içinde 5 kez ateşleme yaparak hızı katlar
            for i = 1, 5 do 
                pcall(function()
                    -- Yöntem 1: Tool Kullanımı
                    local tool = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Tool")
                    if tool then tool:Activate() end
                    
                    -- Yöntem 2: Sanal Kullanıcı Tıklaması
                    game:GetService("VirtualUser"):Button1Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                    
                    -- Yöntem 3: Remote Eventleri Zorla (Spam)
                    local events = {"Click", "ClickEvent", "Tap", "Swing", "Attack", "Mine"}
                    for _, name in pairs(events) do
                        local ev = game.ReplicatedStorage:FindFirstChild(name, true)
                        if ev and ev:IsA("RemoteEvent") then
                            ev:FireServer()
                        end
                    end
                end)
            end
        end
    end
end)
