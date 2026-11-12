-- Parte 2 (teste) | Script (normal) em ServerScriptService | nome: MapaDestrutivel_Teste
-- Só para testar. Apagar quando o combate de verdade existir.
-- Cria uma parede de blocos. Clique 2 vezes num bloco para quebrar.
-- Reinicie o personagem (Esc > Reiniciar personagem): os blocos devem voltar.
local Mapa = require(script.Parent:WaitForChild("MapaDestrutivel"))

local pasta = workspace:FindFirstChild("MapaDestrutivel")
if not pasta then
	pasta = Instance.new("Folder")
	pasta.Name = "MapaDestrutivel"
	pasta.Parent = workspace

	for x = 0, 5 do
		for y = 0, 3 do
			local bloco = Instance.new("Part")
			bloco.Size = Vector3.new(4, 4, 4)
			bloco.Position = Vector3.new(x * 4 - 10, y * 4 + 2, -20)
			bloco.Anchored = true
			bloco.Material = Enum.Material.Brick
			bloco.Color = Color3.fromRGB(150, 80, 70)
			bloco.Parent = pasta
		end
	end
end

for _, peca in ipairs(pasta:GetDescendants()) do
	if peca:IsA("BasePart") then
		local clique = Instance.new("ClickDetector")
		clique.MaxActivationDistance = 64
		clique.Parent = peca
		clique.MouseClick:Connect(function(jogador)
			Mapa.danificar(peca, 50, jogador)
		end)
	end
end
