local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Fish It - Auto Clicker", "DarkTheme")

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

-- Loop Auto Clicker (Jalan Terus di Background)
spawn(function()
    while true do
        if _G.AutoClick then
            game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, true, game, 0)
            game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, false, game, 0)
            task.wait(0.02) -- Kecepatan 20ms
        else
            task.wait(0.1) -- Kalau OFF, tunggu sebentar aja
        end
    end
end)

-- Menu Utama
local Tab = Window:NewTab("Main Menu")
local Section = Tab:NewSection("Clicker Settings")

-- Hotkey untuk ON/OFF Auto Clicker
Section:NewKeybind("Toggle Auto Clicker", "Tekan untuk ON/OFF auto clicker", Enum.KeyCode.F, function()
    _G.AutoClick = not _G.AutoClick
    
    if _G.AutoClick then
        warn("Auto Clicker: AKTIF")
        Library:Notify("Auto Clicker", "Status: AKTIF", 2)
    else
        warn("Auto Clicker: NONAKTIF")
        Library:Notify("Auto Clicker", "Status: NONAKTIF", 2)
    end
end)

Section:NewToggle("Anti-AFK Status", "Mencegah idle kick (ON/OFF)", function(state)
    _G.AntiAFK = state
    if state then
        warn("Anti-AFK: AKTIF")
    else
        warn("Anti-AFK: NONAKTIF")
    end
end)

Section:NewKeybind("Sembunyikan Menu", "Tekan tombol untuk tutup/buka GUI", Enum.KeyCode.RightControl, function()
	Library:ToggleUI()
end)

Library:Notify("Script Berhasil Dimuat!", "Tekan F untuk ON/OFF Auto Clicker | RightCtrl untuk sembunyikan menu.", 5)
