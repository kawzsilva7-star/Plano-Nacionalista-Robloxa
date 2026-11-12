-- Parte 2 | ModuleScript em ServerScriptService | nome: MapaDestrutivel
-- Tudo que estiver dentro da pasta Workspace > MapaDestrutivel pode ser quebrado.
-- O que um jogador quebrou volta quando ele morre ou sai. repararTudo() conserta o mapa inteiro.
-- Opcional: atributo "VidaMax" (número) na peça muda a resistência dela (padrão 100).
local Players = game:GetService("Players")
local Debris = game:GetService("Debris")

local NOME_PASTA = "MapaDestrutivel"
local VIDA_PADRAO = 100
local ESTILHACOS = 4

local Mapa = {}
local quebrados = {} -- [peça] = { pai = Instance, dono = UserId ou nil }

function Mapa.ehDestrutivel(peca)
	local pasta = workspace:FindFirstChild(NOME_PASTA)
	return pasta ~= nil
		and typeof(peca) == "Instance"
		and peca:IsA("BasePart")
		and peca:IsDescendantOf(pasta)
end

local function soltarEstilhacos(peca)
	local lado = math.clamp(math.min(peca.Size.X, peca.Size.Y, peca.Size.Z) / 3, 0.4, 1.5)
	for _ = 1, ESTILHACOS do
		local e = Instance.new("Part")
		e.Size = Vector3.new(lado, lado, lado)
		e.Color = peca.Color
		e.Material = peca.Material
		e.CanCollide = false
		e.CFrame = peca.CFrame * CFrame.new(math.random(-1, 1), math.random(0, 1), math.random(-1, 1))
		e.Parent = workspace
		e.AssemblyLinearVelocity = Vector3.new(math.random(-12, 12), math.random(10, 22), math.random(-12, 12))
		Debris:AddItem(e, 1.5)
	end
end

-- Tira vida da peça. Devolve true se ela quebrou.
function Mapa.danificar(peca, dano, jogador)
	if quebrados[peca] or not Mapa.ehDestrutivel(peca) then return false end

	local vida = peca:GetAttribute("Vida") or peca:GetAttribute("VidaMax") or VIDA_PADRAO
	vida -= dano
	if vida > 0 then
		peca:SetAttribute("Vida", vida)
		return false
	end

	quebrados[peca] = { pai = peca.Parent, dono = jogador and jogador.UserId or nil }
	soltarEstilhacos(peca)
	peca.Parent = nil -- some do mapa, mas fica guardada para voltar depois
	return true
end

local function restaurar(lista)
	for _, peca in ipairs(lista) do
		local info = quebrados[peca]
		if info then
			quebrados[peca] = nil
			peca:SetAttribute("Vida", nil)
			if info.pai and info.pai:IsDescendantOf(workspace) then
				peca.Parent = info.pai
			end
			task.wait(0.02) -- volta uma por uma (efeito de reconstrução)
		end
	end
end

function Mapa.repararDoJogador(jogador)
	local lista = {}
	for peca, info in pairs(quebrados) do
		if info.dono == jogador.UserId then table.insert(lista, peca) end
	end
	restaurar(lista)
end

function Mapa.repararTudo()
	local lista = {}
	for peca in pairs(quebrados) do table.insert(lista, peca) end
	restaurar(lista)
end

-- Conserta o que o jogador quebrou quando ele morre ou sai do jogo
local function aoEntrar(jogador)
	local function aoNascer(personagem)
		local hum = personagem:WaitForChild("Humanoid")
		hum.Died:Connect(function()
			Mapa.repararDoJogador(jogador)
		end)
	end
	jogador.CharacterAdded:Connect(aoNascer)
	if jogador.Character then task.spawn(aoNascer, jogador.Character) end
end

Players.PlayerAdded:Connect(aoEntrar)
for _, j in ipairs(Players:GetPlayers()) do task.spawn(aoEntrar, j) end
Players.PlayerRemoving:Connect(Mapa.repararDoJogador)

return Mapa
