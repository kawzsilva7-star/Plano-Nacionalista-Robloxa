-- Movimento e Configurações | LocalScript em StarterPlayer > StarterPlayerScripts | nome: Movimento
-- * CORRER: segurar a tecla de correr. Gasta estamina (barra amarela embaixo); cansou, espera recuperar.
-- * TRAVAR CÂMERA (shift lock): apertar a tecla de travar. O boneco vira junto com a câmera e o
--   mouse fica preso no centro. Só faz diferença em terceira pessoa (tecla V); em primeira já é assim.
-- * CONFIGURAÇÕES: botão "CONFIG" no canto ou tecla P.
--     Teclas: "SHIFT CORRE / CTRL TRAVA" (padrão) ou "SHIFT TRAVA / CTRL CORRE"
--     Correr: ligado / desligado
--     Tutorial: ligado / desligado (se o Tutorial existir)
-- Precisa de: Configuracoes_Servidor (canal SalvarConfig) e Parte1_Dados (salva as escolhas).
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local CAS = game:GetService("ContextActionService")

local jogador = Players.LocalPlayer
local gui = jogador:WaitForChild("PlayerGui")
local salvarConfig = ReplicatedStorage:WaitForChild("SalvarConfig")
local camera = workspace.CurrentCamera

-- Ajustes -------------------------------------------------------------------------
local VEL_ANDAR = 16
local VEL_CORRER = 26
local ESTAMINA_MAX = 100
local GASTO_POR_SEGUNDO = 22     -- ~4,5 s correndo com a barra cheia
local RECUPERA_POR_SEGUNDO = 16
local ESPERA_PARA_RECUPERAR = 1  -- segundos sem correr antes de começar a recuperar
local VOLTA_A_CORRER = 25        -- depois de cansar, só corre de novo com esta estamina
local DESLOCAMENTO_TRAVA = Vector3.new(1.75, 0, 0) -- câmera um pouco para o lado (como o shift lock)

local COR_FUNDO = Color3.fromRGB(38, 32, 56)
local COR_BOTAO = Color3.fromRGB(59, 49, 87)
local COR_BORDA = Color3.fromRGB(13, 10, 20)
local COR_OURO = Color3.fromRGB(247, 195, 92)
local COR_TEXTO = Color3.fromRGB(242, 233, 220)
local COR_CANSADO = Color3.fromRGB(232, 96, 122)
local FONTE = Enum.Font.Arcade

-- Estado ----------------------------------------------------------------------------
local querCorrer = false
local travado = false
local estamina = ESTAMINA_MAX
local cansado = false
local semCorrer = 0
local painelAberto = false

local function humanoide()
	local personagem = jogador.Character
	return personagem and personagem:FindFirstChildOfClass("Humanoid")
end

local function primeiraPessoa()
	return jogador.CameraMode == Enum.CameraMode.LockFirstPerson
end

local function teclas()
	-- devolve (tecla de correr, tecla de travar)
	if jogador:GetAttribute("CfgTeclas") == "ShiftTrava" then
		return Enum.KeyCode.LeftControl, Enum.KeyCode.LeftShift
	end
	return Enum.KeyCode.LeftShift, Enum.KeyCode.LeftControl
end

-- Interface -------------------------------------------------------------------------
local function borda(objeto)
	local b = Instance.new("UIStroke")
	b.Color = COR_BORDA
	b.Thickness = 4
	b.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	b.Parent = objeto
end

local function criarTexto(pai, texto, tamanho, posicao, tamFonte, cor)
	local t = Instance.new("TextLabel")
	t.BackgroundTransparency = 1
	t.Size = tamanho
	t.Position = posicao
	t.Font = FONTE
	t.TextSize = tamFonte
	t.TextColor3 = cor or COR_TEXTO
	t.TextXAlignment = Enum.TextXAlignment.Left
	t.Text = texto
	t.Parent = pai
	return t
end

local function criarBotao(pai, texto, tamanho, posicao)
	local b = Instance.new("TextButton")
	b.Size = tamanho
	b.Position = posicao
	b.BackgroundColor3 = COR_BOTAO
	b.BorderSizePixel = 0
	b.Font = FONTE
	b.TextSize = 18
	b.TextColor3 = COR_OURO
	b.Text = texto
	borda(b)
	b.Parent = pai
	return b
end

local tela = Instance.new("ScreenGui")
tela.Name = "Movimento"
tela.ResetOnSpawn = false
tela.DisplayOrder = 9
tela.Parent = gui

-- Barra de estamina (só aparece quando não está cheia)
local barraFundo = Instance.new("Frame")
barraFundo.AnchorPoint = Vector2.new(0.5, 1)
barraFundo.Size = UDim2.fromOffset(220, 14)
barraFundo.Position = UDim2.new(0.5, 0, 1, -96)
barraFundo.BackgroundColor3 = COR_FUNDO
barraFundo.BorderSizePixel = 0
barraFundo.Visible = false
borda(barraFundo)
barraFundo.Parent = tela

local barra = Instance.new("Frame")
barra.Size = UDim2.fromScale(1, 1)
barra.BackgroundColor3 = COR_OURO
barra.BorderSizePixel = 0
barra.Parent = barraFundo

-- Botão CONFIG (ao lado do "?" do tutorial)
local botaoConfig = criarBotao(tela, "CONFIG", UDim2.fromOffset(96, 40), UDim2.new(0, 60, 1, -52))

-- Painel de configurações
local painel = Instance.new("Frame")
painel.AnchorPoint = Vector2.new(0.5, 0.5)
painel.Size = UDim2.fromOffset(500, 250)
painel.Position = UDim2.fromScale(0.5, 0.5)
painel.BackgroundColor3 = COR_FUNDO
painel.BorderSizePixel = 0
painel.Visible = false
borda(painel)
painel.Parent = tela

criarTexto(painel, "CONFIGURAÇÕES", UDim2.new(1, -24, 0, 30), UDim2.fromOffset(12, 10), 26, COR_OURO)

criarTexto(painel, "TECLAS", UDim2.fromOffset(140, 36), UDim2.fromOffset(12, 56), 20)
local botaoTeclas = criarBotao(painel, "", UDim2.fromOffset(320, 36), UDim2.fromOffset(166, 56))

criarTexto(painel, "CORRER", UDim2.fromOffset(140, 36), UDim2.fromOffset(12, 102), 20)
local botaoCorrer = criarBotao(painel, "", UDim2.fromOffset(160, 36), UDim2.fromOffset(166, 102))

criarTexto(painel, "TUTORIAL", UDim2.fromOffset(140, 36), UDim2.fromOffset(12, 148), 20)
local botaoTutorial = criarBotao(painel, "", UDim2.fromOffset(160, 36), UDim2.fromOffset(166, 148))

local botaoFechar = criarBotao(painel, "FECHAR", UDim2.fromOffset(140, 36), UDim2.new(1, -152, 1, -48))
botaoFechar.Modal = true -- solta o mouse em primeira pessoa enquanto o painel está aberto

local function atualizarPainel()
	if jogador:GetAttribute("CfgTeclas") == "ShiftTrava" then
		botaoTeclas.Text = "SHIFT TRAVA / CTRL CORRE"
	else
		botaoTeclas.Text = "SHIFT CORRE / CTRL TRAVA"
	end
	botaoCorrer.Text = (jogador:GetAttribute("CfgCorrer") == false) and "DESLIGADO" or "LIGADO"

	local tutorialExiste = ReplicatedStorage:FindFirstChild("TutorialConfig") ~= nil
	botaoTutorial.Visible = tutorialExiste
	botaoTutorial.Text = (jogador:GetAttribute("TutorialAtivo") == false) and "DESLIGADO" or "LIGADO"
end

local function abrirPainel(abrir)
	painelAberto = abrir
	painel.Visible = abrir
	if abrir then
		atualizarPainel()
	end
end

botaoConfig.MouseButton1Click:Connect(function()
	abrirPainel(not painelAberto)
end)
botaoFechar.MouseButton1Click:Connect(function()
	abrirPainel(false)
end)

botaoTeclas.MouseButton1Click:Connect(function()
	local novo = (jogador:GetAttribute("CfgTeclas") == "ShiftTrava") and "ShiftCorre" or "ShiftTrava"
	salvarConfig:FireServer("CfgTeclas", novo)
end)
botaoCorrer.MouseButton1Click:Connect(function()
	salvarConfig:FireServer("CfgCorrer", jogador:GetAttribute("CfgCorrer") == false)
end)
botaoTutorial.MouseButton1Click:Connect(function()
	local tutorialConfig = ReplicatedStorage:FindFirstChild("TutorialConfig")
	if tutorialConfig then
		-- se está desligado, liga; senão, desliga
		tutorialConfig:FireServer(jogador:GetAttribute("TutorialAtivo") == false, nil)
	end
end)

-- Teclas (ContextActionService: no celular cria o botão CORRER na tela) -----------------
local function acaoCorrer(_, estado)
	if estado == Enum.UserInputState.Begin then
		querCorrer = true
	elseif estado == Enum.UserInputState.End or estado == Enum.UserInputState.Cancel then
		querCorrer = false
	end
	return Enum.ContextActionResult.Sink
end

local function acaoTravar(_, estado)
	if estado == Enum.UserInputState.Begin then
		travado = not travado
		if not travado then
			UIS.MouseBehavior = Enum.MouseBehavior.Default
			local hum = humanoide()
			if hum then
				hum.CameraOffset = Vector3.new(0, 0, 0)
				hum.AutoRotate = true
			end
		end
	end
	return Enum.ContextActionResult.Sink
end

local function ligarTeclas()
	CAS:UnbindAction("Correr")
	CAS:UnbindAction("TravarCamera")
	local teclaCorrer, teclaTravar = teclas()
	CAS:BindAction("Correr", acaoCorrer, true, teclaCorrer)
	CAS:SetTitle("Correr", "CORRER")
	CAS:BindAction("TravarCamera", acaoTravar, false, teclaTravar)
	querCorrer = false
end

ligarTeclas()
jogador:GetAttributeChangedSignal("CfgTeclas"):Connect(function()
	ligarTeclas()
	atualizarPainel()
end)
jogador:GetAttributeChangedSignal("CfgCorrer"):Connect(atualizarPainel)
jogador:GetAttributeChangedSignal("TutorialAtivo"):Connect(atualizarPainel)

UIS.InputBegan:Connect(function(input, processado)
	if processado then return end
	if input.KeyCode == Enum.KeyCode.P then
		abrirPainel(not painelAberto)
	end
end)

-- Trava da câmera: roda depois da câmera do Roblox, a cada quadro ---------------------
RunService:BindToRenderStep("TravarCamera", Enum.RenderPriority.Camera.Value + 1, function()
	local hum = humanoide()
	if not hum then return end
	local ativo = travado and not primeiraPessoa() and not painelAberto

	hum.AutoRotate = not ativo
	hum.CameraOffset = ativo and DESLOCAMENTO_TRAVA or Vector3.new(0, 0, 0)
	if not ativo then return end

	UIS.MouseBehavior = Enum.MouseBehavior.LockCenter
	local raiz = hum.RootPart
	if raiz then
		local olhar = camera.CFrame.LookVector
		local plano = Vector3.new(olhar.X, 0, olhar.Z)
		if plano.Magnitude > 0.01 then
			raiz.CFrame = CFrame.lookAt(raiz.Position, raiz.Position + plano.Unit)
		end
	end
end)

-- Corrida e estamina ----------------------------------------------------------------
RunService.Heartbeat:Connect(function(dt)
	local hum = humanoide()
	if not hum then return end

	local velBase = hum:GetAttribute("VelocidadeBase") or VEL_ANDAR
	local movendo = hum.MoveDirection.Magnitude > 0.1
	local corridaLigada = jogador:GetAttribute("CfgCorrer") ~= false
	local correndo = querCorrer and corridaLigada and movendo and not cansado and estamina > 0

	if correndo then
		estamina = math.max(0, estamina - GASTO_POR_SEGUNDO * dt)
		semCorrer = 0
		if estamina <= 0 then
			cansado = true
		end
	else
		semCorrer = semCorrer + dt
		if semCorrer >= ESPERA_PARA_RECUPERAR then
			estamina = math.min(ESTAMINA_MAX, estamina + RECUPERA_POR_SEGUNDO * dt)
		end
		if cansado and estamina >= VOLTA_A_CORRER then
			cansado = false
		end
	end

	hum.WalkSpeed = correndo and (velBase + (VEL_CORRER - VEL_ANDAR)) or velBase

	barraFundo.Visible = estamina < ESTAMINA_MAX
	barra.Size = UDim2.fromScale(estamina / ESTAMINA_MAX, 1)
	barra.BackgroundColor3 = cansado and COR_CANSADO or COR_OURO
end)

-- Ao renascer, começa descansado
jogador.CharacterAdded:Connect(function()
	estamina = ESTAMINA_MAX
	cansado = false
	querCorrer = false
end)

atualizarPainel()
