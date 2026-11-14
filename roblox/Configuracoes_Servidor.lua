-- Configurações (servidor) | Script (normal) em ServerScriptService | nome: Configuracoes_Servidor
-- 1) Cria o canal "SalvarConfig" para a tela de Configurações guardar as escolhas do jogador.
--    As escolhas viram atributos do jogador e são salvas pelo Parte1_Dados.
-- 2) Desliga o shift lock padrão do Roblox, porque o nosso usa a tecla que o jogador escolher.
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local evento = Instance.new("RemoteEvent")
evento.Name = "SalvarConfig"
evento.Parent = ReplicatedStorage

-- Só aceita estas chaves e estes valores (o resto é ignorado)
local PERMITIDO = {
	CfgTeclas = function(valor)
		return valor == "ShiftCorre" or valor == "ShiftTrava"
	end,
	CfgCorrer = function(valor)
		return typeof(valor) == "boolean"
	end,
}

evento.OnServerEvent:Connect(function(jogador, chave, valor)
	if typeof(chave) ~= "string" then return end
	local valida = PERMITIDO[chave]
	if valida and valida(valor) then
		jogador:SetAttribute(chave, valor)
	end
end)

local function aoEntrar(jogador)
	jogador.DevEnableMouseLock = false
end

Players.PlayerAdded:Connect(aoEntrar)
for _, jogador in ipairs(Players:GetPlayers()) do
	aoEntrar(jogador)
end
