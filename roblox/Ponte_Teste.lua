-- Ponte (teste) | Script (normal) em ServerScriptService | nome: Ponte_Teste
-- Só para testar o empurrão e a poção. Apagar quando o combate de verdade existir.
-- Cria: uma ponte de 20 quadrados, um boneco de treino no quadrado 10 e 3 ferramentas
-- para cada jogador (Soco, Martelo, Poção de Cura, Espada Trovão), com os números da tabela Itens.
-- Quem cai da ponte volta para o quadrado 1.
local Players = game:GetService("Players")
local ServerScriptService = game:GetService("ServerScriptService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Ponte = require(ServerScriptService:WaitForChild("Ponte"))
local Itens = require(ReplicatedStorage:WaitForChild("Itens"))

local QUADRADOS = 20
local ALTURA = 40
local ALCANCE = 8

-- Onde fica a ponte: ao lado de São Paulo se o mapa do Brasil existir; senão, no meio do mundo
local function origemDaPonte()
	local dadosMapa = ServerScriptService:FindFirstChild("MapaBrasil_Dados")
	if dadosMapa then
		local d = require(dadosMapa)
		local sp = d.cidades.SaoPaulo
		local col = (sp.lon - d.lon0) / d.passo
		local lin = (d.lat0 - sp.lat) / d.passo
		local x = (col - d.colunas / 2) * d.celula
		local z = (lin - d.linhas / 2) * d.celula
		return CFrame.new(x + 60, ALTURA, z) * CFrame.Angles(0, math.rad(-90), 0)
	end
	return CFrame.new(0, ALTURA, -60)
end

local ponte = Ponte.criar(origemDaPonte(), QUADRADOS, "PonteTeste")

-- Mostra o custo do equipamento de teste
local equipamento = { "Soco", "Martelo", "PocaoCura", "EspadaTrovao" }
print(("Equipamento de teste: %d tokens (limite no nível 1: %d)"):format(
	Itens.custo(equipamento), Itens.limiteDoNivel(1)))

-- Boneco de treino ------------------------------------------------------------------
local function criarBoneco()
	local ok, boneco = pcall(function()
		return Players:CreateHumanoidModelFromDescription(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R15)
	end)
	if not ok then
		warn("Não consegui criar o boneco de treino:", boneco)
		return nil
	end
	boneco.Name = "BonecoTreino"
	boneco:PivotTo(CFrame.new(ponte:posicaoDoQuadrado(10)))
	boneco.Parent = workspace
	return boneco
end
local boneco = criarBoneco()

-- Alvo mais perto, na frente de quem bate
local function acharAlvo(atacante)
	local raizA = atacante:FindFirstChild("HumanoidRootPart")
	if not raizA then return nil end
	local melhor, melhorDist = nil, ALCANCE
	for _, modelo in ipairs(workspace:GetChildren()) do
		local hum = modelo:FindFirstChildOfClass("Humanoid")
		local raiz = modelo:FindFirstChild("HumanoidRootPart")
		if modelo ~= atacante and hum and raiz and hum.Health > 0 then
			local dif = raiz.Position - raizA.Position
			local dist = dif.Magnitude
			if dist < melhorDist and dif:Dot(raizA.CFrame.LookVector) > 0 then
				melhor, melhorDist = modelo, dist
			end
		end
	end
	return melhor
end

-- Ferramentas -----------------------------------------------------------------------
local function criarFerramenta(chave)
	local item = Itens.lista[chave]
	local ferramenta = Instance.new("Tool")
	ferramenta.Name = item.nome
	ferramenta.RequiresHandle = false
	ferramenta.CanBeDropped = false
	ferramenta.ToolTip = item.nome .. " (" .. item.tokens .. " tokens)"

	local ultimoUso = -math.huge
	ferramenta.Activated:Connect(function()
		local personagem = ferramenta.Parent
		local hum = personagem and personagem:FindFirstChildOfClass("Humanoid")
		if not hum or hum.Health <= 0 then return end
		if os.clock() - ultimoUso < item.recarga then return end
		ultimoUso = os.clock()

		if item.cura then
			task.wait(item.tempoDeBeber or 0)
			if hum.Health > 0 then
				hum.Health = math.min(hum.MaxHealth, hum.Health + item.cura)
			end
			return
		end

		if item.preparo then task.wait(item.preparo) end
		local alvo = acharAlvo(personagem)
		if alvo then
			alvo:FindFirstChildOfClass("Humanoid"):TakeDamage(item.dano or 0)
			local q = ponte:empurrar(alvo, item.empurrao or 0, nil, personagem)
			print(("%s: empurrão %d = %.1f quadrado(s)"):format(item.nome, item.empurrao, q or 0))
		end
	end)
	return ferramenta
end

local function darFerramentas(jogador)
	local mochila = jogador:WaitForChild("Backpack")
	for _, chave in ipairs(equipamento) do
		if not mochila:FindFirstChild(Itens.lista[chave].nome) then
			criarFerramenta(chave).Parent = mochila
		end
	end
end

local function aoNascer(jogador, personagem)
	darFerramentas(jogador)
	task.wait(0.5)
	if personagem.Parent then
		personagem:PivotTo(CFrame.new(ponte:posicaoDoQuadrado(1)) * CFrame.Angles(0, math.rad(-90), 0))
	end
end

local function aoEntrar(jogador)
	jogador.CharacterAdded:Connect(function(personagem)
		aoNascer(jogador, personagem)
	end)
	if jogador.Character then
		task.spawn(aoNascer, jogador, jogador.Character)
	end
end

Players.PlayerAdded:Connect(aoEntrar)
for _, jogador in ipairs(Players:GetPlayers()) do
	aoEntrar(jogador)
end

-- Quem cai da ponte volta para o quadrado 1 (o boneco volta para o 10) -------------
task.spawn(function()
	while true do
		task.wait(0.3)
		-- boneco morreu ou sumiu: cria outro
		local humBoneco = boneco and boneco.Parent and boneco:FindFirstChildOfClass("Humanoid")
		if not humBoneco or humBoneco.Health <= 0 then
			if boneco then boneco:Destroy() end
			task.wait(2)
			boneco = criarBoneco()
		end
		for _, modelo in ipairs(workspace:GetChildren()) do
			local raiz = modelo:FindFirstChild("HumanoidRootPart")
			if raiz and modelo:FindFirstChildOfClass("Humanoid") then
				local perto = (raiz.Position - ponte.origem.Position).Magnitude < QUADRADOS * 8 + 60
				if perto and raiz.Position.Y < ALTURA - 15 then
					local destino = (modelo == boneco) and 10 or 1
					modelo:PivotTo(CFrame.new(ponte:posicaoDoQuadrado(destino)))
					raiz.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
					print(modelo.Name .. " caiu da ponte!")
				end
			end
		end
	end
end)
