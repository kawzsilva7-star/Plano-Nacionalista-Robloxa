-- Luau | Script em ServerScriptService | rode com Play
-- Coloque o acessório (Accessory) em ServerStorage com o nome CabeloAsta.
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local SS = game:GetService("ServerStorage")

local ACESSORIOS = { "CabeloAsta" }

-- tipo de rig, escala de corpo (0 = clássico, 1 = proporção Rthro)
local TESTES = {
	{ nome = "R6",           rig = Enum.HumanoidRigType.R6,  corpo = 0 },
	{ nome = "R15 classico", rig = Enum.HumanoidRigType.R15, corpo = 0 },
	{ nome = "R15 Rthro",    rig = Enum.HumanoidRigType.R15, corpo = 1 },
}

local pescocos = {}

for i, t in ipairs(TESTES) do
	local desc = Instance.new("HumanoidDescription")
	desc.BodyTypeScale = t.corpo
	local ok, boneco = pcall(function()
		return Players:CreateHumanoidModelFromDescription(desc, t.rig)
	end)
	if not ok then warn(t.nome, "falhou:", boneco) continue end

	boneco.Name = "Teste_" .. t.nome
	boneco:PivotTo(CFrame.new(i * 6, 5, 0))
	boneco.Parent = workspace
	boneco.PrimaryPart.Anchored = true

	local hum = boneco:FindFirstChildOfClass("Humanoid")
	for _, nome in ipairs(ACESSORIOS) do
		local modelo = SS:FindFirstChild(nome)
		if modelo then
			hum:AddAccessory(modelo:Clone())
		else
			warn("Acessório não encontrado em ServerStorage:", nome)
		end
	end

	local pescoco = boneco:FindFirstChild("Neck", true)
	if pescoco then table.insert(pescocos, { m = pescoco, base = pescoco.C0 }) end
end

-- inclina a cabeça para frente e para trás, para testar o encaixe em movimento
RunService.Heartbeat:Connect(function()
	local a = math.sin(os.clock() * 2) * 0.5
	for _, p in ipairs(pescocos) do
		p.m.C0 = p.base * CFrame.Angles(a, 0, 0)
	end
end)
