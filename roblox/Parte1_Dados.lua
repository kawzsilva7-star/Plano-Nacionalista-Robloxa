-- Parte 1 | Script (normal) em ServerScriptService | nome: Dados
-- Cria Poder e Moedas para cada jogador (aparecem na lista no canto da tela) e salva.
local Players = game:GetService("Players")
local DataStoreService = game:GetService("DataStoreService")

local store = DataStoreService:GetDataStore("DadosJogador_v1")

local PADRAO = { Poder = 0, Moedas = 0 }
local carregou = {} -- [player] = true se o carregamento deu certo

local function tentar(funcao)
	for _ = 1, 3 do
		local ok, resultado = pcall(funcao)
		if ok then return true, resultado end
		task.wait(1)
	end
	return false
end

local function aoEntrar(player)
	local pasta = Instance.new("Folder")
	pasta.Name = "leaderstats"

	local poder = Instance.new("IntValue")
	poder.Name = "Poder"
	poder.Value = PADRAO.Poder
	poder.Parent = pasta

	local moedas = Instance.new("IntValue")
	moedas.Name = "Moedas"
	moedas.Value = PADRAO.Moedas
	moedas.Parent = pasta

	pasta.Parent = player

	local ok, dados = tentar(function()
		return store:GetAsync("J_" .. player.UserId)
	end)

	-- Preferências do tutorial (a tela lê estes atributos)
	player:SetAttribute("TutorialAtivo", true)
	player:SetAttribute("TutorialFeito", false)

	if ok then
		if dados then
			poder.Value = dados.Poder or PADRAO.Poder
			moedas.Value = dados.Moedas or PADRAO.Moedas
			if typeof(dados.TutorialAtivo) == "boolean" then
				player:SetAttribute("TutorialAtivo", dados.TutorialAtivo)
			end
			if typeof(dados.TutorialFeito) == "boolean" then
				player:SetAttribute("TutorialFeito", dados.TutorialFeito)
			end
		end
		carregou[player] = true
	else
		warn("Falha ao carregar dados de", player.Name, "- não vou salvar para não apagar o progresso.")
	end

	player:SetAttribute("DadosCarregados", true)
end

local function salvar(player)
	if not carregou[player] then return end
	local pasta = player:FindFirstChild("leaderstats")
	if not pasta then return end

	local dados = {
		Poder = pasta.Poder.Value,
		Moedas = pasta.Moedas.Value,
		TutorialAtivo = player:GetAttribute("TutorialAtivo") ~= false,
		TutorialFeito = player:GetAttribute("TutorialFeito") == true,
	}
	local ok = tentar(function()
		store:SetAsync("J_" .. player.UserId, dados)
	end)
	if not ok then warn("Falha ao salvar", player.Name) end
end

Players.PlayerAdded:Connect(aoEntrar)
for _, p in ipairs(Players:GetPlayers()) do
	task.spawn(aoEntrar, p)
end

Players.PlayerRemoving:Connect(function(player)
	salvar(player)
	carregou[player] = nil
end)

game:BindToClose(function()
	for _, p in ipairs(Players:GetPlayers()) do
		task.spawn(salvar, p)
	end
	task.wait(3)
end)
