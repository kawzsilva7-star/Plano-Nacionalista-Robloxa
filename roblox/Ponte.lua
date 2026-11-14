-- Ponte | ModuleScript em ServerScriptService | nome: Ponte
-- Cria uma ponte dividida em QUADRADOS numerados e empurra personagens por quadrados.
-- Regra: cada Itens.PONTOS_POR_QUADRADO pontos de empurrão = 1 quadrado.
--   Ex.: com 20 pontos por quadrado, um empurrão de 40 leva 2 quadrados para trás.
-- Quem sai da ponte cai.
local Itens = require(game:GetService("ReplicatedStorage"):WaitForChild("Itens"))

local Ponte = {}
Ponte.__index = Ponte

local TAMANHO = 8          -- comprimento de cada quadrado (studs)
local LARGURA = 12         -- largura da ponte
local ARREDONDAR = false   -- true = empurrão sempre em quadrados inteiros

local COR_A = Color3.fromRGB(168, 116, 60)
local COR_B = Color3.fromRGB(122, 82, 40)

-- origem = CFrame do começo da ponte (a ponte cresce para a frente desse CFrame)
function Ponte.criar(origem, quantidade, nome)
	local self = setmetatable({}, Ponte)
	self.quantidade = quantidade
	self.origem = origem
	self.eixo = origem.LookVector
	self.pasta = Instance.new("Folder")
	self.pasta.Name = nome or "Ponte"
	self.pasta.Parent = workspace

	for i = 1, quantidade do
		local q = Instance.new("Part")
		q.Name = "Quadrado" .. i
		q.Anchored = true
		q.Size = Vector3.new(LARGURA, 2, TAMANHO)
		q.CFrame = origem * CFrame.new(0, -1, -(i - 0.5) * TAMANHO)
		q.Color = (i % 2 == 0) and COR_A or COR_B
		q.Material = Enum.Material.WoodPlanks
		q.Parent = self.pasta

		local placa = Instance.new("SurfaceGui")
		placa.Face = Enum.NormalId.Top
		placa.Parent = q
		local numero = Instance.new("TextLabel")
		numero.BackgroundTransparency = 1
		numero.Size = UDim2.fromScale(1, 1)
		numero.Font = Enum.Font.Arcade
		numero.TextScaled = true
		numero.TextColor3 = Color3.fromRGB(255, 241, 192)
		numero.TextTransparency = 0.4
		numero.Text = tostring(i)
		numero.Parent = placa
	end
	return self
end

-- Centro do quadrado i (1 = começo da ponte), na altura de quem está em pé
function Ponte:posicaoDoQuadrado(i)
	return (self.origem * CFrame.new(0, 3, -(i - 0.5) * TAMANHO)).Position
end

-- Em qual quadrado está uma posição (pode dar 0 ou maior que a quantidade = fora da ponte)
function Ponte:quadradoDe(posicao)
	local distancia = (posicao - self.origem.Position):Dot(self.eixo)
	return math.floor(distancia / TAMANHO) + 1
end

-- Empurra o personagem. sentido = 1 (para o fim da ponte) ou -1 (para o começo).
-- Se não passar o sentido, empurra para longe de quem bateu (atacante).
function Ponte:empurrar(personagem, pontos, sentido, atacante)
	local raiz = personagem and personagem:FindFirstChild("HumanoidRootPart")
	if not raiz then return end

	if not sentido then
		sentido = 1
		local raizAtacante = atacante and atacante:FindFirstChild("HumanoidRootPart")
		if raizAtacante and (raiz.Position - raizAtacante.Position):Dot(self.eixo) < 0 then
			sentido = -1
		end
	end

	local quadrados = pontos / Itens.PONTOS_POR_QUADRADO
	if ARREDONDAR then quadrados = math.floor(quadrados + 0.5) end
	local deslocamento = self.eixo * (quadrados * TAMANHO * sentido)

	task.spawn(function()
		local inicio = personagem:GetPivot()
		local passos = 8
		for p = 1, passos do
			if not personagem.Parent then return end
			personagem:PivotTo(inicio + deslocamento * (p / passos))
			task.wait(0.02)
		end
	end)
	return quadrados
end

return Ponte
