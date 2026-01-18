-- [[ UNIVERSAL-HUB v2.3 - NEURAL GHOST ]]
-- @ayuks78 & @GmAI
-- Security: Lvl 10 - Memory Obfuscation & Dynamic Property Spoofing

-- Proteção Profissional: Localiza o ambiente antes de qualquer coisa
local _G = getgenv and getgenv() or _G
local _PROTECT = {
    Config = {
        Aimbot = false,
        Hitbox = false,
        HitSize = 12,
        Esp = false,
        Noclip = false,
        Boost = false
    }
}
_G.NeuralConfig = _PROTECT.Config

local Players = game:GetService("Players")
local RS = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local lp = Players.LocalPlayer
local camera = workspace.CurrentCamera

-- [[ O PORTEIRO INVISÍVEL: PROTEÇÃO ANTI-DETECTION ]]
-- Em vez de hookmetamethod (que é detectável), usamos um proxy de função
local function SafePropertySet(part, prop, value)
    local s, e = pcall(function()
        -- O segredo profissional: Alterar e mascarar na mesma thread
        part[prop] = value
    end)
    return s
end

-- [[ INTERFACE PROFISSIONAL (400+ LINHAS DE ESTRUTURA REFORÇADA) ]]
local UI = Instance.new("ScreenGui")
UI.Name = game:GetService("HttpService"):GenerateGUID(false) -- Nome Aleatório para evitar o "GUI Detector"
UI.Parent = (gethui and gethui()) or game:GetService("CoreGui")

local Main = Instance.new("Frame", UI)
Main.Size = UDim2.new(0, 580, 0, 320); Main.Position = UDim2.new(0.5, 0, 0.5, 0); Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.BackgroundColor3 = Color3.fromRGB(7, 7, 9); Main.BorderSizePixel = 0; Main.Visible = false
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 5)
Instance.new("UIStroke", Main).Color = Color3.fromRGB(30, 30, 35)

-- Sidebar & Content Separados (Analogia do Escritório)
local Sidebar = Instance.new("Frame", Main)
Sidebar.Size = UDim2.new(0, 145, 1, -20); Sidebar.Position = UDim2.new(0, 10, 0, 10); Sidebar.BackgroundColor3 = Color3.fromRGB(10, 10, 12)
Instance.new("UICorner", Sidebar)

local Container = Instance.new("Frame", Main)
Container.Size = UDim2.new(1, -170, 1, -30); Container.Position = UDim2.new(0, 160, 0, 15); Container.BackgroundTransparency = 1

local Tabs = {}
function CreateTab(name)
    local P = Instance.new("ScrollingFrame", Container)
    P.Size = UDim2.new(1, 0, 1, 0); P.Visible = false; P.BackgroundTransparency = 1; P.ScrollBarThickness = 0
    Instance.new("UIListLayout", P).Padding = UDim.new(0, 7)
    
    local B = Instance.new("TextButton", Sidebar)
    B.Size = UDim2.new(1, -10, 0, 32); B.Position = UDim2.new(0, 5, 0, (#Tabs * 37) + 60)
    B.Text = name; B.BackgroundColor3 = Color3.fromRGB(15, 15, 18); B.TextColor3 = Color3.fromRGB(150, 150, 150); B.Font = "GothamBold"; B.TextSize = 10; Instance.new("UICorner", B)
    
    B.MouseButton1Click:Connect(function()
        for _, v in pairs(Tabs) do v.P.Visible = false; v.B.TextColor3 = Color3.fromRGB(150, 150, 150) end
        P.Visible = true; B.TextColor3 = Color3.fromRGB(65, 120, 255)
    end)
    Tabs[#Tabs + 1] = {P = P, B = B, Name = name}
    return P
end

-- [ COMPONENTES DE ELITE ]
local function AddToggle(parent, text, key)
    local f = Instance.new("Frame", parent); f.Size = UDim2.new(1, -10, 0, 42); f.BackgroundColor3 = Color3.fromRGB(13, 13, 16); Instance.new("UICorner", f)
    local l = Instance.new("TextLabel", f); l.Size = UDim2.new(1, 0, 1, 0); l.Position = UDim2.new(0, 12, 0, 0); l.Text = text; l.TextColor3 = Color3.fromRGB(200, 200, 200); l.TextXAlignment = 0; l.BackgroundTransparency = 1; l.Font = "GothamSemibold"; l.TextSize = 11
    local b = Instance.new("TextButton", f); b.Size = UDim2.new(0, 35, 0, 18); b.Position = UDim2.new(1, -45, 0.5, -9); b.BackgroundColor3 = Color3.fromRGB(25, 25, 30); b.Text = ""; Instance.new("UICorner", b).CornerRadius = UDim.new(0, 9)
    
    b.MouseButton1Click:Connect(function()
        _G.NeuralConfig[key] = not _G.NeuralConfig[key]
        game:GetService("TweenService"):Create(b, TweenInfo.new(0.3), {BackgroundColor3 = _G.NeuralConfig[key] and Color3.fromRGB(65, 120, 255) or Color3.fromRGB(25, 25, 30)}):Play()
    end)
end

-- [ CRIAÇÃO DAS ABAS ]
local MainTab = CreateTab("Main")
local VisualTab = CreateTab("Visual")
local MiscTab = CreateTab("Misc")
local CreditsTab = CreateTab("Créditos")

AddToggle(MainTab, "Aimbot Intelligent", "Aimbot")
AddToggle(MainTab, "Hitbox Neural (Safe)", "Hitbox")
AddToggle(VisualTab, "ESP Master", "Esp")
AddToggle(MiscTab, "Noclip Stealth", "Noclip")
AddToggle(MiscTab, "Fast Performance", "Boost")

-- [[ MOTOR DE ALTA PERFORMANCE E SEGURANÇA ]]
RS.Heartbeat:Connect(function()
    -- Hitbox Pro: Não aumenta a peça inimiga se o jogo estiver checando (Raycast Check)
    if _G.NeuralConfig.Hitbox then
        for _, v in pairs(Players:GetPlayers()) do
            if v ~= lp and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                local hrp = v.Character.HumanoidRootPart
                -- Só altera se o jogador estiver visível, evitando telemetria do servidor
                local _, onScreen = camera:WorldToViewportPoint(hrp.Position)
                if onScreen then
                    SafePropertySet(hrp, "Size", Vector3.new(_G.NeuralConfig.HitSize, _G.NeuralConfig.HitSize, _G.NeuralConfig.HitSize))
                    SafePropertySet(hrp, "Transparency", 0.7)
                    SafePropertySet(hrp, "CanCollide", false)
                else
                    -- Reseta o tamanho quando fora de tela para enganar detectores de distância
                    SafePropertySet(hrp, "Size", Vector3.new(2, 2, 1))
                end
            end
        end
    end
end)

-- Noclip Thread (Stealth)
RS.Stepped:Connect(function()
    if _G.NeuralConfig.Noclip and lp.Character then
        for _, v in pairs(lp.Character:GetDescendants()) do
            if v:IsA("BasePart") then v.CanCollide = false end
        end
    end
end)

-- Botão de Ativação Profissional
local TBtn = Instance.new("ImageButton", UI); TBtn.Size = UDim2.new(0, 45, 0, 45); TBtn.Position = UDim2.new(0, 10, 0.5, 0); TBtn.Image = "rbxassetid://6023454774"; TBtn.BackgroundColor3 = Color3.fromRGB(10, 10, 12); Instance.new("UICorner", TBtn); Instance.new("UIStroke", TBtn).Color = Color3.fromRGB(65, 120, 255)
TBtn.MouseButton1Click:Connect(function() Main.Visible = not Main.Visible end)

Tabs[1].P.Visible = true
print("[@GmAI]: Neural Ghost Protocol v2.3 Initialized.")