-- Visual | Script (normal) em ServerScriptService | nome: Estilo_Visual
-- Deixa a luz do jogo parecida com a rua em pixel art da foto de referência:
-- fim de tarde, sombras, brilho nas janelas, cores quentes e roxas.
--
-- ANTES (a mão, no Studio): clique em "Lighting" no Explorer e, em Propriedades,
-- ponha Technology = Future. Um script não consegue mudar isso.
local Lighting = game:GetService("Lighting")

local function obter(classe, nome)
	local objeto = Lighting:FindFirstChild(nome)
	if not objeto then
		objeto = Instance.new(classe)
		objeto.Name = nome
		objeto.Parent = Lighting
	end
	return objeto
end

-- Sol e sombras
Lighting.ClockTime = 17.3
Lighting.GeographicLatitude = 20
Lighting.GlobalShadows = true
Lighting.Brightness = 2.4
Lighting.ExposureCompensation = 0.1
Lighting.Ambient = Color3.fromRGB(70, 55, 100)
Lighting.OutdoorAmbient = Color3.fromRGB(110, 90, 140)
Lighting.ColorShift_Top = Color3.fromRGB(255, 190, 120)
Lighting.EnvironmentDiffuseScale = 0.6
Lighting.EnvironmentSpecularScale = 0.3
pcall(function() Lighting.ShadowSoftness = 0.2 end) -- só existe com Future; sombra mais "dura" combina com pixel art

-- Névoa colorida do fim de tarde
local atmosfera = obter("Atmosphere", "Atmosfera")
atmosfera.Density = 0.25
atmosfera.Offset = 0.2
atmosfera.Color = Color3.fromRGB(255, 170, 140)
atmosfera.Decay = Color3.fromRGB(120, 80, 150)
atmosfera.Glare = 0.4
atmosfera.Haze = 1.2

-- Brilho nas luzes e janelas
local brilho = obter("BloomEffect", "Brilho")
brilho.Intensity = 0.5
brilho.Size = 24
brilho.Threshold = 1.6

-- Cor mais viva e contraste
local cor = obter("ColorCorrectionEffect", "Cor")
cor.Saturation = 0.15
cor.Contrast = 0.1
cor.TintColor = Color3.fromRGB(255, 240, 230)

-- Raios de sol leves
local raios = obter("SunRaysEffect", "Raios")
raios.Intensity = 0.12
raios.Spread = 0.6
