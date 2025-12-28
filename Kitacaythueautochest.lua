-- 👑 KITA AUTO CHEST - PHIÊN BẢN CHUẨN (FIXED BY GEMINI)
repeat task.wait() until game:IsLoaded()

-- XÓA UI CŨ ĐỂ KHÔNG BỊ CHỒNG LÊN NHAU
if game.Players.LocalPlayer.PlayerGui:FindFirstChild("KitaAutoChestUI") then
    game.Players.LocalPlayer.PlayerGui.KitaAutoChestUI:Destroy()
end

local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local lp = Players.LocalPlayer

-- --- CẤU HÌNH ĐÚNG Ý BỆ HẠ ---
local target = 120            -- Chỉ tiêu 120 rương
local hopTimeLimit = 180      -- ĐÃ VỀ: 180 giây (3 phút)
local stuckLimit = 30         -- ĐÃ VỀ: 30 giây (Cảm biến kẹt)
local collected = 0
local isTP = false
local lastValue = nil
local timeElapsed = 0
local stuckTimer = 0          
local gameStarted = false     

-- --- GIAO DIỆN HOÀNG GIA ---
local sg = Instance.new("ScreenGui", lp.PlayerGui)
sg.Name = "KitaAutoChestUI"
sg.ResetOnSpawn = false

local mainFrame = Instance.new("ImageLabel", sg)
mainFrame.Size = UDim2.new(0, 260, 0, 260)
mainFrame.Position = UDim2.new(0, 20, 0, 70) 
mainFrame.BackgroundTransparency = 1
mainFrame.ImageTransparency = 0.3 

task.spawn(function()
    local url = "https://cdn.discordapp.com/attachments/1449752507130843167/1452496425488486440/46125f78d9efe0fe7f96fc71c6f70670.jpg"
    local filename = "KitaPortrait.png"
    if not isfile(filename) then
        pcall(function() writefile(filename, game:HttpGet(url)) end)
    end
    mainFrame.Image = getcustomasset(filename)
end)

Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 15)
local overlay = Instance.new("Frame", mainFrame)
overlay.Size = UDim2.new(1, 0, 1, 0)
overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
overlay.BackgroundTransparency = 0.5 
Instance.new("UICorner", overlay).CornerRadius = UDim.new(0, 15)

local function NewL(pos, txt, col)
    local l = Instance.new("TextLabel", mainFrame)
    l.Size = UDim2.new(1, -30, 0, 25)
    l.Position = pos
    l.BackgroundTransparency = 1
    l.TextColor3 = col
    l.TextSize = 16
    l.Font = Enum.Font.GothamBold
    l.Text = txt
    l.ZIndex = 5
    return l
end

local titleL = NewL(UDim2.new(0,15,0,10), "👑 KITA AUTO CHEST", Color3.fromRGB(0, 255, 170))
task.spawn(function()
    while task.wait() do
        local hue = tick() % 5 / 5
        titleL.TextColor3 = Color3.fromHSV(hue, 1, 1)
    end
end)

local stL = NewL(UDim2.new(0,15,0,55), "TRẠNG THÁI: ĐANG CHỜ TEAM...", Color3.fromRGB(255, 255, 255))
local pgL = NewL(UDim2.new(0,15,0,90), "RƯƠNG: 0 / 120", Color3.fromRGB(255, 255, 0))
local stuckL = NewL(UDim2.new(0,15,0,125), "CẢM BIẾN KẸT: ĐANG CHỜ", Color3.fromRGB(255, 100, 100))
local totalL = NewL(UDim2.new(0,15,0,160), "TỔNG GIỜ: 180s", Color3.fromRGB(200, 200, 200))

function ForceHop(reason)
    if isTP then return end
    isTP = true
    stL.Text = "⚠️ " .. reason
    while true do
        pcall(function() TeleportService:Teleport(game.PlaceId, lp) end)
        task.wait(1.5)
    end
end

-- --- LOGIC CŨ ỔN ĐỊNH: VÀO TEAM LÀ CHẠY ---
task.spawn(function()
    local moneySource = nil
    while not moneySource do
        local stats = lp:FindFirstChild("leaderstats")
        if stats and (stats:FindFirstChild("Beli") or stats:FindFirstChild("Money")) then
            moneySource = stats:FindFirstChild("Beli") or stats:FindFirstChild("Money")
            lastValue = moneySource.Value
            break
        end
        -- Quét cả UI tiền nếu leaderstats chưa load
        for _, v in pairs(lp.PlayerGui:GetDescendants()) do
            if v:IsA("TextLabel") and v.Visible and v.Text:find("%$") and v.Parent.Name ~= sg.Name then
                moneySource = v
                lastValue = v.Text
                break
            end
        end
        task.wait(1)
    end

    gameStarted = true
    stL.Text = "TRẠNG THÁI: ĐANG CÀN QUÉT"
    
    while task.wait(0.1) do
        if isTP then break end
        local current = (moneySource:IsA("ValueObject")) and moneySource.Value or moneySource.Text
        if current ~= lastValue then
            collected = collected + 1
            pgL.Text = "RƯƠNG: " .. collected .. " / 120"
            lastValue = current
            stuckTimer = 0
            if collected >= 120 then ForceHop("ĐỦ 120 RƯƠNG!") break end
        end
    end
end)

task.spawn(function()
    while task.wait(1) do
        if isTP then break end
        if gameStarted then
            timeElapsed = timeElapsed + 1
            stuckTimer = stuckTimer + 1
            totalL.Text = "TỔNG GIỜ: " .. math.max(0, hopTimeLimit - timeElapsed) .. "s"
            stuckL.Text = "KẸT SAU: " .. math.max(0, stuckLimit - stuckTimer) .. "s"
            if stuckTimer >= stuckLimit then 
                ForceHop("KẸT 30S - ĐỔI SV")
                break 
            elseif timeElapsed >= hopTimeLimit then
                ForceHop("HẾT 180S - ĐỔI SV")
                break
            end
        end
    end
end)

game:GetService("GuiService").ErrorMessageChanged:Connect(function() ForceHop("LỖI KẾT NỐI") end)

task.delay(1, function()
    pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/duy260414-lang/Hello/refs/heads/main/Auto%20chest"))() end)
end)
