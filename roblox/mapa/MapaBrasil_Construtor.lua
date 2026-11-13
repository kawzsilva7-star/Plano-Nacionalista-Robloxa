-- Mapa | Script (normal) em ServerScriptService | nome: MapaBrasil_Construtor
-- Precisa de um ModuleScript irmão chamado MapaBrasil_Dados (conteúdo de MapaBrasil_Dados.lua).
-- Constrói o Brasil em blocos (27 estados) e trava os estados que ainda não foram liberados.
--  * Estado liberado: cor viva, jogador pode andar.
--  * Estado "em breve": cor apagada + placa, e o jogador é devolvido se tentar entrar.
--  * Mar: também bloqueado (por enquanto não há barco).
-- Para liberar um estado depois: em MapaBrasil_Dados troque disponivel = false por true,
-- ou, durante o jogo, ponha o atributo Liberado_UF = true no Workspace (ex.: Liberado_BA).
-- Para o avião (quando existir): ponha o atributo EmViagem = true no jogador durante o voo.
local Players = game:GetService("Players")
local dados = require(script.Parent:WaitForChild("MapaBrasil_Dados"))

local CELULA = dados.celula
local COLS, LINHAS = dados.colunas, dados.linhas
local GROSSURA = 4
local MAX_CELULAS = math.floor(2048 / CELULA) -- uma Part não passa de 2048 studs

local COR_REGIAO = {
	Norte = Color3.fromRGB(46, 125, 70),
	Nordeste = Color3.fromRGB(214, 178, 96),
	["Centro-Oeste"] = Color3.fromRGB(196, 138, 70),
	Sudeste = Color3.fromRGB(94, 170, 84),
	Sul = Color3.fromRGB(70, 150, 130),
}
local COR_APAGADA = Color3.fromRGB(74, 68, 98)
local COR_OURO = Color3.fromRGB(247, 195, 92)
local COR_TEXTO = Color3.fromRGB(242, 233, 220)

local siglaPorChar = {}
for sigla, estado in pairs(dados.estados) do
	siglaPorChar[estado.c] = sigla
end

local function liberado(sigla)
	local estado = dados.estados[sigla]
	if not estado then return false end
	return estado.disponivel == true or workspace:GetAttribute("Liberado_" .. sigla) == true
end

local function charEm(col, linha) -- base 0
	if linha < 0 or linha >= LINHAS or col < 0 or col >= COLS then return "." end
	return string.sub(dados.grade[linha + 1], col + 1, col + 1)
end

local function mundoDaCelula(col, linha) -- canto da célula, em studs
	return (col - COLS / 2) * CELULA, (linha - LINHAS / 2) * CELULA
end

local function mundoDaCoordenada(lat, lon)
	local col = (lon - dados.lon0) / dados.passo
	local linha = (dados.lat0 - lat) / dados.passo
	return (col - COLS / 2) * CELULA, (linha - LINHAS / 2) * CELULA
end

local function etiqueta(pasta, posicao, texto, cor, altura)
	local ancora = Instance.new("Part")
	ancora.Name = "Etiqueta"
	ancora.Anchored = true
	ancora.CanCollide = false
	ancora.CanQuery = false
	ancora.Transparency = 1
	ancora.Size = Vector3.new(1, 1, 1)
	ancora.Position = posicao + Vector3.new(0, altura, 0)
	ancora.Parent = pasta

	local gui = Instance.new("BillboardGui")
	gui.Size = UDim2.fromOffset(280, 44)
	gui.MaxDistance = 1800
	gui.Adornee = ancora
	gui.Parent = ancora

	local t = Instance.new("TextLabel")
	t.Size = UDim2.fromScale(1, 1)
	t.BackgroundColor3 = Color3.fromRGB(26, 22, 38)
	t.BackgroundTransparency = 0.25
	t.Font = Enum.Font.Arcade
	t.TextSize = 20
	t.TextColor3 = cor
	t.Text = texto
	t.Parent = gui
end

local function construir()
	local velho = workspace:FindFirstChild("MapaBrasil")
	if velho then velho:Destroy() end

	local raiz = Instance.new("Folder")
	raiz.Name = "MapaBrasil"
	raiz.Parent = workspace
	local terra = Instance.new("Folder")
	terra.Name = "Terra"
	terra.Parent = raiz
	local placas = Instance.new("Folder")
	placas.Name = "Placas"
	placas.Parent = raiz

	-- Mar (uma laje azul abaixo da terra)
	local mar = Instance.new("Part")
	mar.Name = "Mar"
	mar.Anchored = true
	mar.Size = Vector3.new(COLS * CELULA + 4000, 2, LINHAS * CELULA + 4000)
	mar.Position = Vector3.new(0, -6, 0)
	mar.Color = Color3.fromRGB(38, 52, 96)
	mar.Material = Enum.Material.SmoothPlastic
	mar.Parent = raiz

	-- Terra: junta células vizinhas do mesmo estado em retângulos grandes (poucas peças)
	local somaCol, somaLin, total = {}, {}, {}
	for sigla, estado in pairs(dados.estados) do
		local c = estado.c
		local usado = {}
		somaCol[sigla], somaLin[sigla], total[sigla] = 0, 0, 0
		local cor = COR_REGIAO[estado.regiao]
		if not liberado(sigla) then
			cor = cor:Lerp(COR_APAGADA, 0.5)
		end

		for linha = 0, LINHAS - 1 do
			for col = 0, COLS - 1 do
				if charEm(col, linha) == c then
					somaCol[sigla] = somaCol[sigla] + col + 0.5
					somaLin[sigla] = somaLin[sigla] + linha + 0.5
					total[sigla] = total[sigla] + 1
				end
				if charEm(col, linha) == c and not usado[linha * COLS + col] then
					local larg = 1
					while larg < MAX_CELULAS and col + larg < COLS
						and charEm(col + larg, linha) == c and not usado[linha * COLS + col + larg] do
						larg = larg + 1
					end
					local alt = 1
					local segue = true
					while segue and alt < MAX_CELULAS and linha + alt < LINHAS do
						for k = 0, larg - 1 do
							if charEm(col + k, linha + alt) ~= c or usado[(linha + alt) * COLS + col + k] then
								segue = false
								break
							end
						end
						if segue then alt = alt + 1 end
					end
					for dy = 0, alt - 1 do
						for dx = 0, larg - 1 do
							usado[(linha + dy) * COLS + col + dx] = true
						end
					end

					local x0, z0 = mundoDaCelula(col, linha)
					local p = Instance.new("Part")
					p.Name = sigla
					p.Anchored = true
					p.Size = Vector3.new(larg * CELULA, GROSSURA, alt * CELULA)
					p.Position = Vector3.new(x0 + larg * CELULA / 2, -GROSSURA / 2, z0 + alt * CELULA / 2)
					p.Color = cor
					p.Material = Enum.Material.Plastic
					p.TopSurface = Enum.SurfaceType.Smooth
					p.BottomSurface = Enum.SurfaceType.Smooth
					p.Parent = terra
				end
			end
		end
	end

	-- Placas dos estados
	for sigla, estado in pairs(dados.estados) do
		if total[sigla] > 0 then
			local x, z = mundoDaCelula(somaCol[sigla] / total[sigla], somaLin[sigla] / total[sigla])
			local texto = estado.nome
			local cor = COR_OURO
			if not liberado(sigla) then
				texto = estado.nome .. " - EM BREVE"
				cor = COR_TEXTO
			end
			etiqueta(placas, Vector3.new(x, 0, z), texto, cor, 60)
		end
	end

	-- Cidades (marcadores) e ponto de nascimento de teste
	local cidades = Instance.new("Folder")
	cidades.Name = "Cidades"
	cidades.Parent = raiz
	for chave, cidade in pairs(dados.cidades) do
		local x, z = mundoDaCoordenada(cidade.lat, cidade.lon)
		local poste = Instance.new("Part")
		poste.Name = chave
		poste.Anchored = true
		poste.CanCollide = false
		poste.Size = Vector3.new(6, 60, 6)
		poste.Position = Vector3.new(x, 30, z)
		poste.Material = Enum.Material.Neon
		poste.Color = cidade.disponivel and COR_OURO or Color3.fromRGB(255, 140, 200)
		poste.Parent = cidades
		local texto = cidade.nome
		if cidade.especial then texto = texto .. " (especial)" end
		if not cidade.disponivel then texto = texto .. " - EM BREVE" end
		etiqueta(cidades, Vector3.new(x, 0, z), texto, poste.Color, 80)
	end

	if not workspace:FindFirstChildWhichIsA("SpawnLocation") and dados.cidades.SaoPaulo then
		local x, z = mundoDaCoordenada(dados.cidades.SaoPaulo.lat, dados.cidades.SaoPaulo.lon)
		local spawn = Instance.new("SpawnLocation")
		spawn.Name = "Spawn_SaoPaulo"
		spawn.Anchored = true
		spawn.Neutral = true
		spawn.Duration = 0
		spawn.Size = Vector3.new(16, 1, 16)
		spawn.Position = Vector3.new(x + 40, 0.5, z)
		spawn.Parent = workspace
	end
end

construir()

-- Trava: devolve o jogador se ele entrar em estado bloqueado ou no mar -------------------
local ultimaSegura = {}

local function estadoNa(posicao)
	local col = math.floor(posicao.X / CELULA + COLS / 2)
	local linha = math.floor(posicao.Z / CELULA + LINHAS / 2)
	return siglaPorChar[charEm(col, linha)] -- nil = mar
end

task.spawn(function()
	while true do
		task.wait(0.5)
		for _, jogador in ipairs(Players:GetPlayers()) do
			local personagem = jogador.Character
			local raiz = personagem and personagem:FindFirstChild("HumanoidRootPart")
			if raiz and not jogador:GetAttribute("EmViagem") then
				local posicao = raiz.Position
				local sigla = estadoNa(posicao)
				if sigla and liberado(sigla) and posicao.Y > -50 then
					ultimaSegura[jogador] = posicao
				elseif ultimaSegura[jogador] then
					personagem:PivotTo(CFrame.new(ultimaSegura[jogador] + Vector3.new(0, 4, 0)))
					if sigla then
						jogador:SetAttribute("AvisoMapa", dados.estados[sigla].nome .. " ainda não está liberado (em breve)")
					else
						jogador:SetAttribute("AvisoMapa", "Só mar por aqui")
					end
				end
			end
		end
	end
end)

Players.PlayerRemoving:Connect(function(jogador)
	ultimaSegura[jogador] = nil
end)
