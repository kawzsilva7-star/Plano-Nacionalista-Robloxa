-- Parte 3 (servidor) | Script (normal) em ServerScriptService | nome: Tutorial_Servidor
-- 1) Cria o canal "TutorialConfig" para o jogador ligar/desligar o tutorial.
-- 2) Se não existir a pasta Workspace > TutorialAlvos, cria alvos de TESTE (5 blocos em fila).
--    Depois mova cada bloco para o lugar certo do mapa (Base, Missoes, Arena, Loja, Palanque).
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local evento = Instance.new("RemoteEvent")
evento.Name = "TutorialConfig"
evento.Parent = ReplicatedStorage

-- O cliente pode mandar (ativo, feito). Só aceitamos true/false; qualquer outra coisa é ignorada.
evento.OnServerEvent:Connect(function(jogador, ativo, feito)
	if typeof(ativo) == "boolean" then
		jogador:SetAttribute("TutorialAtivo", ativo)
	end
	if typeof(feito) == "boolean" then
		jogador:SetAttribute("TutorialFeito", feito)
	end
end)

if not workspace:FindFirstChild("TutorialAlvos") then
	warn("TutorialAlvos não existe: criando alvos de teste. Mova-os para os lugares reais do mapa.")
	local pasta = Instance.new("Folder")
	pasta.Name = "TutorialAlvos"
	pasta.Parent = workspace

	local nomes = { "Base", "Missoes", "Arena", "Loja", "Palanque" }
	for i, nome in ipairs(nomes) do
		local p = Instance.new("Part")
		p.Name = nome
		p.Size = Vector3.new(4, 4, 4)
		p.Position = Vector3.new(i * 16 - 48, 3, -40)
		p.Anchored = true
		p.CanCollide = false
		p.Material = Enum.Material.Neon
		p.Color = Color3.fromRGB(247, 195, 92)
		p.Transparency = 0.5
		p.Parent = pasta
	end
end
