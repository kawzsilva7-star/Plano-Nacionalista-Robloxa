-- Parte 3 | LocalScript em StarterPlayer > StarterPlayerScripts | nome: Camera
-- Começa em primeira pessoa. Tecla V alterna entre primeira e terceira pessoa (câmera atrás).
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local jogador = Players.LocalPlayer
local TECLA = Enum.KeyCode.V

local primeira = true

local function aplicar()
	if primeira then
		jogador.CameraMinZoomDistance = 0.5
		jogador.CameraMaxZoomDistance = 0.5
		jogador.CameraMode = Enum.CameraMode.LockFirstPerson
	else
		jogador.CameraMode = Enum.CameraMode.Classic
		jogador.CameraMinZoomDistance = 8
		jogador.CameraMaxZoomDistance = 20
	end
end

aplicar()

UIS.InputBegan:Connect(function(input, processadoPelaInterface)
	if processadoPelaInterface then return end -- ignora se está digitando no chat
	if input.KeyCode == TECLA then
		primeira = not primeira
		aplicar()
	end
end)
