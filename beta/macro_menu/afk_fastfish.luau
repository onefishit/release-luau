local _G = {
    AutoClick = false,
    AntiAFK = true
}

local VirtualUser = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    if _G.AntiAFK then
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
        warn("Anti-AFK: Mencegah diskoneksi!")
    end
end)

spawn(function()
    while true do
        if _G.AutoClick then
            game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, true, game, 0)
            game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, false, game, 0)
            task.wait(0.02) -- Kecepatan 20ms
        else
            task.wait(0.1)
        end
    end
end)


local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TopBar = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local CloseButton = Instance.new("TextButton")
local MinimizeButton = Instance.new("TextButton")
local ContentFrame = Instance.new("Frame")

ScreenGui.Name = "FishItAutoClicker"
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.35, 0, 0.3, 0)
MainFrame.Size = UDim2.new(0, 450, 0, 280)
MainFrame.Active = true
MainFrame.Draggable = true

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 8)
MainCorner.Parent = MainFrame

TopBar.Name = "TopBar"
TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = Color3.fromRGB(40, 45, 55)
TopBar.BorderSizePixel = 0
TopBar.Size = UDim2.new(1, 0, 0, 35)

local TopCorner = Instance.new("UICorner")
TopCorner.CornerRadius = UDim.new(0, 8)
TopCorner.Parent = TopBar

Title.Name = "Title"
Title.Parent = TopBar
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 15, 0, 0)
Title.Size = UDim2.new(0, 300, 1, 0)
Title.Font = Enum.Font.GothamBold
Title.Text = "🎣 Fish It - Auto Clicker"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 14
Title.TextXAlignment = Enum.TextXAlignment.Left


CloseButton.Name = "CloseButton"
CloseButton.Parent = TopBar
CloseButton.BackgroundColor3 = Color3.fromRGB(220, 53, 69)
CloseButton.BorderSizePixel = 0
CloseButton.Position = UDim2.new(1, -30, 0, 7)
CloseButton.Size = UDim2.new(0, 20, 0, 20)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 12

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 4)
CloseCorner.Parent = CloseButton

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Parent = TopBar
MinimizeButton.BackgroundColor3 = Color3.fromRGB(255, 193, 7)
MinimizeButton.BorderSizePixel = 0
MinimizeButton.Position = UDim2.new(1, -55, 0, 7)
MinimizeButton.Size = UDim2.new(0, 20, 0, 20)
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.Text = "-"
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.TextSize = 14

local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(0, 4)
MinCorner.Parent = MinimizeButton

MinimizeButton.MouseButton1Click:Connect(function()
    ContentFrame.Visible = not ContentFrame.Visible
    if ContentFrame.Visible then
        MainFrame.Size = UDim2.new(0, 450, 0, 280)
    else
        MainFrame.Size = UDim2.new(0, 450, 0, 35)
    end
end)

ContentFrame.Name = "ContentFrame"
ContentFrame.Parent = MainFrame
ContentFrame.BackgroundTransparency = 1
ContentFrame.Position = UDim2.new(0, 0, 0, 35)
ContentFrame.Size = UDim2.new(1, 0, 1, -35)

local SectionHeader = Instance.new("TextLabel")
SectionHeader.Name = "SectionHeader"
SectionHeader.Parent = ContentFrame
SectionHeader.BackgroundTransparency = 1
SectionHeader.Position = UDim2.new(0, 20, 0, 15)
SectionHeader.Size = UDim2.new(1, -40, 0, 25)
SectionHeader.Font = Enum.Font.GothamBold
SectionHeader.Text = "Clicker Settings"
SectionHeader.TextColor3 = Color3.fromRGB(100, 200, 255)
SectionHeader.TextSize = 13
SectionHeader.TextXAlignment = Enum.TextXAlignment.Left


local AutoClickerFrame = Instance.new("Frame")
AutoClickerFrame.Name = "AutoClickerFrame"
AutoClickerFrame.Parent = ContentFrame
AutoClickerFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
AutoClickerFrame.BorderSizePixel = 0
AutoClickerFrame.Position = UDim2.new(0, 20, 0, 50)
AutoClickerFrame.Size = UDim2.new(1, -40, 0, 50)

local ACCorner = Instance.new("UICorner")
ACCorner.CornerRadius = UDim.new(0, 6)
ACCorner.Parent = AutoClickerFrame

local AutoClickerLabel = Instance.new("TextLabel")
AutoClickerLabel.Name = "Label"
AutoClickerLabel.Parent = AutoClickerFrame
AutoClickerLabel.BackgroundTransparency = 1
AutoClickerLabel.Position = UDim2.new(0, 15, 0, 5)
AutoClickerLabel.Size = UDim2.new(1, -30, 0, 20)
AutoClickerLabel.Font = Enum.Font.GothamBold
AutoClickerLabel.Text = "Toggle Auto Clicker"
AutoClickerLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoClickerLabel.TextSize = 12
AutoClickerLabel.TextXAlignment = Enum.TextXAlignment.Left

local AutoClickerDesc = Instance.new("TextLabel")
AutoClickerDesc.Name = "Desc"
AutoClickerDesc.Parent = AutoClickerFrame
AutoClickerDesc.BackgroundTransparency = 1
AutoClickerDesc.Position = UDim2.new(0, 15, 0, 25)
AutoClickerDesc.Size = UDim2.new(0.6, 0, 0, 20)
AutoClickerDesc.Font = Enum.Font.Gotham
AutoClickerDesc.Text = "Tekan F untuk ON/OFF"
AutoClickerDesc.TextColor3 = Color3.fromRGB(150, 150, 150)
AutoClickerDesc.TextSize = 10
AutoClickerDesc.TextXAlignment = Enum.TextXAlignment.Left

local AutoClickerStatus = Instance.new("TextLabel")
AutoClickerStatus.Name = "Status"
AutoClickerStatus.Parent = AutoClickerFrame
AutoClickerStatus.BackgroundTransparency = 1
AutoClickerStatus.Position = UDim2.new(1, -80, 0, 0)
AutoClickerStatus.Size = UDim2.new(0, 70, 1, 0)
AutoClickerStatus.Font = Enum.Font.GothamBold
AutoClickerStatus.Text = "NONAKTIF"
AutoClickerStatus.TextColor3 = Color3.fromRGB(255, 100, 100)
AutoClickerStatus.TextSize = 11


local AntiAFKFrame = Instance.new("Frame")
AntiAFKFrame.Name = "AntiAFKFrame"
AntiAFKFrame.Parent = ContentFrame
AntiAFKFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
AntiAFKFrame.BorderSizePixel = 0
AntiAFKFrame.Position = UDim2.new(0, 20, 0, 110)
AntiAFKFrame.Size = UDim2.new(1, -40, 0, 50)

local AFKCorner = Instance.new("UICorner")
AFKCorner.CornerRadius = UDim.new(0, 6)
AFKCorner.Parent = AntiAFKFrame

local AntiAFKLabel = Instance.new("TextLabel")
AntiAFKLabel.Name = "Label"
AntiAFKLabel.Parent = AntiAFKFrame
AntiAFKLabel.BackgroundTransparency = 1
AntiAFKLabel.Position = UDim2.new(0, 15, 0, 5)
AntiAFKLabel.Size = UDim2.new(1, -30, 0, 20)
AntiAFKLabel.Font = Enum.Font.GothamBold
AntiAFKLabel.Text = "Anti-AFK Status"
AntiAFKLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
AntiAFKLabel.TextSize = 12
AntiAFKLabel.TextXAlignment = Enum.TextXAlignment.Left

local AntiAFKDesc = Instance.new("TextLabel")
AntiAFKDesc.Name = "Desc"
AntiAFKDesc.Parent = AntiAFKFrame
AntiAFKDesc.BackgroundTransparency = 1
AntiAFKDesc.Position = UDim2.new(0, 15, 0, 25)
AntiAFKDesc.Size = UDim2.new(0.6, 0, 0, 20)
AntiAFKDesc.Font = Enum.Font.Gotham
AntiAFKDesc.Text = "Mencegah idle kick (ON/OFF)"
AntiAFKDesc.TextColor3 = Color3.fromRGB(150, 150, 150)
AntiAFKDesc.TextSize = 10
AntiAFKDesc.TextXAlignment = Enum.TextXAlignment.Left

local AntiAFKToggleButton = Instance.new("TextButton")
AntiAFKToggleButton.Name = "ToggleButton"
AntiAFKToggleButton.Parent = AntiAFKFrame
AntiAFKToggleButton.BackgroundColor3 = Color3.fromRGB(100, 255, 100)
AntiAFKToggleButton.BorderSizePixel = 0
AntiAFKToggleButton.Position = UDim2.new(1, -70, 0.5, -10)
AntiAFKToggleButton.Size = UDim2.new(0, 50, 0, 20)
AntiAFKToggleButton.Font = Enum.Font.GothamBold
AntiAFKToggleButton.Text = "ON"
AntiAFKToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
AntiAFKToggleButton.TextSize = 10

local AFKToggleCorner = Instance.new("UICorner")
AFKToggleCorner.CornerRadius = UDim.new(0, 4)
AFKToggleCorner.Parent = AntiAFKToggleButton

AntiAFKToggleButton.MouseButton1Click:Connect(function()
    _G.AntiAFK = not _G.AntiAFK
    
    if _G.AntiAFK then
        AntiAFKToggleButton.Text = "ON"
        AntiAFKToggleButton.BackgroundColor3 = Color3.fromRGB(100, 255, 100)
        warn("Anti-AFK: AKTIF")
    else
        AntiAFKToggleButton.Text = "OFF"
        AntiAFKToggleButton.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
        warn("Anti-AFK: NONAKTIF")
    end
end)


local HideMenuFrame = Instance.new("Frame")
HideMenuFrame.Name = "HideMenuFrame"
HideMenuFrame.Parent = ContentFrame
HideMenuFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
HideMenuFrame.BorderSizePixel = 0
HideMenuFrame.Position = UDim2.new(0, 20, 0, 170)
HideMenuFrame.Size = UDim2.new(1, -40, 0, 50)

local HideCorner = Instance.new("UICorner")
HideCorner.CornerRadius = UDim.new(0, 6)
HideCorner.Parent = HideMenuFrame

local HideMenuLabel = Instance.new("TextLabel")
HideMenuLabel.Name = "Label"
HideMenuLabel.Parent = HideMenuFrame
HideMenuLabel.BackgroundTransparency = 1
HideMenuLabel.Position = UDim2.new(0, 15, 0, 5)
HideMenuLabel.Size = UDim2.new(1, -30, 0, 20)
HideMenuLabel.Font = Enum.Font.GothamBold
HideMenuLabel.Text = "Sembunyikan Menu"
HideMenuLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
HideMenuLabel.TextSize = 12
HideMenuLabel.TextXAlignment = Enum.TextXAlignment.Left

local HideMenuDesc = Instance.new("TextLabel")
HideMenuDesc.Name = "Desc"
HideMenuDesc.Parent = HideMenuFrame
HideMenuDesc.BackgroundTransparency = 1
HideMenuDesc.Position = UDim2.new(0, 15, 0, 25)
HideMenuDesc.Size = UDim2.new(1, -30, 0, 20)
HideMenuDesc.Font = Enum.Font.Gotham
HideMenuDesc.Text = "Tekan RightCtrl untuk tutup/buka GUI"
HideMenuDesc.TextColor3 = Color3.fromRGB(150, 150, 150)
HideMenuDesc.TextSize = 10
HideMenuDesc.TextXAlignment = Enum.TextXAlignment.Left


local UserInputService = game:GetService("UserInputService")

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    

    if input.KeyCode == Enum.KeyCode.F then
        _G.AutoClick = not _G.AutoClick
        
        if _G.AutoClick then
            AutoClickerStatus.Text = "AKTIF"
            AutoClickerStatus.TextColor3 = Color3.fromRGB(100, 255, 100)
            warn("Auto Clicker: AKTIF")

            ShowNotification("Auto Clicker", "Status: AKTIF")
        else
            AutoClickerStatus.Text = "NONAKTIF"
            AutoClickerStatus.TextColor3 = Color3.fromRGB(255, 100, 100)
            warn("Auto Clicker: NONAKTIF")

            ShowNotification("Auto Clicker", "Status: NONAKTIF")
        end
    end
    

    if input.KeyCode == Enum.KeyCode.RightControl then
        ScreenGui.Enabled = not ScreenGui.Enabled
    end
end)


function ShowNotification(title, text, duration)
    duration = duration or 2
    
    local NotifGui = Instance.new("ScreenGui")
    NotifGui.Name = "Notification"
    NotifGui.Parent = game.CoreGui
    NotifGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    local NotifFrame = Instance.new("Frame")
    NotifFrame.Parent = NotifGui
    NotifFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
    NotifFrame.BorderSizePixel = 0
    NotifFrame.Position = UDim2.new(1, 10, 0, 50)
    NotifFrame.Size = UDim2.new(0, 300, 0, 70)
    
    local NotifCorner = Instance.new("UICorner")
    NotifCorner.CornerRadius = UDim.new(0, 8)
    NotifCorner.Parent = NotifFrame
    
    local NotifTitle = Instance.new("TextLabel")
    NotifTitle.Parent = NotifFrame
    NotifTitle.BackgroundTransparency = 1
    NotifTitle.Position = UDim2.new(0, 15, 0, 10)
    NotifTitle.Size = UDim2.new(1, -30, 0, 20)
    NotifTitle.Font = Enum.Font.GothamBold
    NotifTitle.Text = title
    NotifTitle.TextColor3 = Color3.fromRGB(100, 200, 255)
    NotifTitle.TextSize = 13
    NotifTitle.TextXAlignment = Enum.TextXAlignment.Left
    
    local NotifText = Instance.new("TextLabel")
    NotifText.Parent = NotifFrame
    NotifText.BackgroundTransparency = 1
    NotifText.Position = UDim2.new(0, 15, 0, 35)
    NotifText.Size = UDim2.new(1, -30, 0, 25)
    NotifText.Font = Enum.Font.Gotham
    NotifText.Text = text
    NotifText.TextColor3 = Color3.fromRGB(200, 200, 200)
    NotifText.TextSize = 11
    NotifText.TextXAlignment = Enum.TextXAlignment.Left
    

    NotifFrame:TweenPosition(
        UDim2.new(1, -310, 0, 50),
        Enum.EasingDirection.Out,
        Enum.EasingStyle.Quad,
        0.3,
        true
    )
    

    task.wait(duration)
    NotifFrame:TweenPosition(
        UDim2.new(1, 10, 0, 50),
        Enum.EasingDirection.In,
        Enum.EasingStyle.Quad,
        0.3,
        true
    )
    task.wait(0.3)
    NotifGui:Destroy()
end



ShowNotification(
    "Script Berhasil Dimuat!",
    "Tekan F untuk ON/OFF Auto Clicker | RightCtrl untuk sembunyikan menu.",
    5
)

warn("═══════════════════════════════════════════════")
warn("Fish It - Auto Clicker | Script Loaded!")
warn("Hotkeys:")
warn("• F - Toggle Auto Clicker")
warn("• RightCtrl - Hide/Show Menu")
warn("═══════════════════════════════════════════════")
