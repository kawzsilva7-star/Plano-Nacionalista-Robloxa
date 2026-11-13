-- Parte 3 (tela) | LocalScript em StarterPlayer > StarterPlayerScripts | nome: Tutorial
-- Tutorial do começo do jogo: mostra os lugares e as missões, passo a passo, com uma seta no lugar.
-- O jogador pode PULAR, marcar "NÃO MOSTRAR MAIS" (desativa) e reabrir pelo botão "?".
-- Precisa de: Tutorial_Servidor (canal TutorialConfig), Parte1_Dados (salva a escolha).
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local jogador = Players.LocalPlayer
local gui = jogador:WaitForChild("PlayerGui")
local config = ReplicatedStorage:WaitForChild("TutorialConfig")

-- alvo = nome da peça dentro de Workspace > TutorialAlvos (nil = sem seta)
local PASSOS = {
	{ alvo = nil,        titulo = "BEM-VINDO!", texto = "Aqui você escolhe um partido, luta, quebra o mapa e sobe de nível. Vou te mostrar os lugares principais." },
	{ alvo = "Base",     titulo = "SUA BASE",   texto = "Você nasce aqui e volta para cá quando é derrotado. É a casa do seu partido." },
	{ alvo = "Missoes",  titulo = "MISSÕES",    texto = "No quadro de missões você pega tarefas e ganha Votos e Moedas." },
	{ alvo = "Arena",    titulo = "ARENA",      texto = "Aqui você luta contra outros partidos. Quebrar muros também vale!" },
	{ alvo = "Loja",     titulo = "LOJA",       texto = "Compre gadgets com Moedas e skins com Robux." },
	{ alvo = "Palanque", titulo = "PALANQUE",   texto = "Praça sem luta para conversar com outros jogadores." },
}

local COR_FUNDO = Color3.fromRGB(38, 32, 56)
local COR_BOTAO = Color3.fromRGB(59, 49, 87)
local COR_BORDA = Color3.fromRGB(13, 10, 20)
local COR_OURO = Color3.fromRGB(247, 195, 92)
local COR_TEXTO = Color3.fromRGB(242, 233, 220)
local FONTE = Enum.Font.Arcade

local function borda(objeto)
	local b = Instance.new("UIStroke")
	b.Color = COR_BORDA
	b.Thickness = 4
	b.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	b.Parent = objeto
end

local function criarTexto(pai, str, tamanho, posicao, tamFonte, cor)
	local t = Instance.new("TextLabel")
	t.BackgroundTransparency = 1
	t.Size = tamanho
	t.Position = posicao
	t.Font = FONTE
	t.TextSize = tamFonte
	t.TextColor3 = cor or COR_TEXTO
	t.TextWrapped = true
	t.TextXAlignment = Enum.TextXAlignment.Left
	t.TextYAlignment = Enum.TextYAlignment.Top
	t.Text = str
	t.Parent = pai
	return t
end

local function criarBotao(pai, str, tamanho, posicao)
	local b = Instance.new("TextButton")
	b.Size = tamanho
	b.Position = posicao
	b.BackgroundColor3 = COR_BOTAO
	b.BorderSizePixel = 0
	b.Font = FONTE
	b.TextSize = 18
	b.TextColor3 = COR_OURO
	b.Text = str
	borda(b)
	b.Parent = pai
	return b
end

-- Tela e painel ---------------------------------------------------------------
local tela = Instance.new("ScreenGui")
tela.Name = "Tutorial"
tela.ResetOnSpawn = false
tela.DisplayOrder = 10
tela.Parent = gui

local painel = Instance.new("Frame")
painel.Size = UDim2.fromOffset(420, 200)
painel.Position = UDim2.new(0.5, -210, 1, -230)
painel.BackgroundColor3 = COR_FUNDO
painel.BorderSizePixel = 0
painel.Visible = false
borda(painel)
painel.Parent = tela

local titulo = criarTexto(painel, "", UDim2.new(1, -24, 0, 28), UDim2.fromOffset(12, 10), 24, COR_OURO)
local corpo = criarTexto(painel, "", UDim2.new(1, -24, 0, 70), UDim2.fromOffset(12, 44), 18)

local caixaMarcar = criarBotao(painel, "", UDim2.fromOffset(26, 26), UDim2.fromOffset(12, 122))
caixaMarcar.TextSize = 22
criarTexto(painel, "NÃO MOSTRAR MAIS", UDim2.fromOffset(300, 26), UDim2.fromOffset(46, 126), 16)

local pular = criarBotao(painel, "PULAR", UDim2.fromOffset(120, 34), UDim2.fromOffset(12, 156))
local proximo = criarBotao(painel, "PRÓXIMO", UDim2.fromOffset(160, 34), UDim2.new(1, -172, 0, 156))

-- Botão "?" (reabre o tutorial quando quiser)
local ajuda = criarBotao(tela, "?", UDim2.fromOffset(40, 40), UDim2.new(0, 12, 1, -52))
ajuda.TextSize = 24

-- Seta no lugar ----------------------------------------------------------------
local marcador = nil

local function limparMarcador()
	if marcador then
		marcador:Destroy()
		marcador = nil
	end
end

local function acharAlvo(nome)
	local pasta = workspace:FindFirstChild("TutorialAlvos")
	return pasta and pasta:FindFirstChild(nome)
end

local function mostrarMarcador(alvo, rotulo)
	limparMarcador()
	if not alvo then return end

	local b = Instance.new("BillboardGui")
	b.Adornee = alvo
	b.Size = UDim2.fromOffset(180, 70)
	b.StudsOffset = Vector3.new(0, 6, 0)
	b.AlwaysOnTop = true
	b.ResetOnSpawn = false

	local nome = Instance.new("TextLabel")
	nome.BackgroundTransparency = 1
	nome.Size = UDim2.new(1, 0, 0, 30)
	nome.Font = FONTE
	nome.TextSize = 24
	nome.TextColor3 = COR_OURO
	nome.TextStrokeTransparency = 0
	nome.Text = rotulo
	nome.Parent = b

	local seta = Instance.new("Frame") -- losango apontando para o lugar
	seta.AnchorPoint = Vector2.new(0.5, 0)
	seta.Size = UDim2.fromOffset(20, 20)
	seta.Position = UDim2.new(0.5, 0, 0, 40)
	seta.Rotation = 45
	seta.BackgroundColor3 = COR_OURO
	seta.BorderSizePixel = 0
	borda(seta)
	seta.Parent = b

	b.Parent = gui
	marcador = b
end

-- Fluxo -----------------------------------------------------------------------
local passoAtual = 0
local rodando = false

local function atualizarCaixa()
	-- marcada = tutorial desativado
	caixaMarcar.Text = (jogador:GetAttribute("TutorialAtivo") == false) and "X" or ""
end

local function mostrarPasso(i)
	passoAtual = i
	local p = PASSOS[i]
	titulo.Text = i .. "/" .. #PASSOS .. "  " .. p.titulo
	corpo.Text = p.texto
	proximo.Text = (i == #PASSOS) and "COMEÇAR!" or "PRÓXIMO"
	mostrarMarcador(p.alvo and acharAlvo(p.alvo), p.titulo)
end

local function encerrar()
	rodando = false
	painel.Visible = false
	limparMarcador()
	config:FireServer(nil, true) -- marca como feito (não abre sozinho de novo)
end

local function iniciar()
	if rodando then return end
	rodando = true
	atualizarCaixa()
	painel.Visible = true
	mostrarPasso(1)
end

proximo.MouseButton1Click:Connect(function()
	if passoAtual >= #PASSOS then
		encerrar()
	else
		mostrarPasso(passoAtual + 1)
	end
end)

pular.MouseButton1Click:Connect(encerrar)

caixaMarcar.MouseButton1Click:Connect(function()
	-- se está desativado agora, liga; senão, desativa
	config:FireServer(jogador:GetAttribute("TutorialAtivo") == false, nil)
end)

ajuda.MouseButton1Click:Connect(iniciar)

jogador:GetAttributeChangedSignal("TutorialAtivo"):Connect(atualizarCaixa)
atualizarCaixa()

-- Abre sozinho só na primeira vez (e só se não estiver desativado)
task.spawn(function()
	while not jogador:GetAttribute("DadosCarregados") do
		jogador:GetAttributeChangedSignal("DadosCarregados"):Wait()
	end
	if jogador:GetAttribute("TutorialAtivo") ~= false and not jogador:GetAttribute("TutorialFeito") then
		task.wait(2)
		iniciar()
	end
end)
