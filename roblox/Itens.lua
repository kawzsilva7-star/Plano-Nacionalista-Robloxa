-- Itens | ModuleScript em ReplicatedStorage | nome: Itens
-- Tabela única de armas, habilidades e consumíveis, com o CUSTO EM TOKENS de cada um.
-- O jogador só equipa o que couber no limite de tokens dele (como um "deck").
-- Para equilibrar o jogo, mude só os números daqui.
local Itens = {}

-- Limite de tokens: começa em 25 e sobe 1 a cada 5 níveis, até 30
Itens.TOKENS_INICIAIS = 25
Itens.TOKENS_MAXIMOS = 30
Itens.NIVEIS_POR_TOKEN = 5

-- Ponte: quantos pontos de empurrão valem 1 quadrado
Itens.PONTOS_POR_QUADRADO = 20

Itens.lista = {
	Soco = {
		nome = "Soco", tipo = "arma", tokens = 2,
		empurrao = 10, dano = 8, recarga = 0.6,
	},
	Cajado = {
		nome = "Cajado", tipo = "arma", tokens = 4,
		empurrao = 20, dano = 12, recarga = 1.2,
	},
	Martelo = {
		-- 40 pontos = 2 quadrados. O dono propôs 60 (3 quadrados): testar os dois.
		nome = "Martelo", tipo = "arma", tokens = 8,
		empurrao = 40, dano = 20, recarga = 8, preparo = 0.5,
	},
	PocaoCura = {
		nome = "Poção de Cura", tipo = "consumivel", tokens = 4,
		cura = 30, recarga = 15, tempoDeBeber = 1,
	},
	MarcaMaldicao = {
		-- Muito forte, por isso custa 10. Efeito ainda a definir pelo dono.
		nome = "Marca da Maldição", tipo = "habilidade", tokens = 10,
	},
}

-- Limite de tokens para um nível
function Itens.limiteDoNivel(nivel)
	local extra = math.floor(math.max(0, (nivel or 1) - 1) / Itens.NIVEIS_POR_TOKEN)
	return math.min(Itens.TOKENS_MAXIMOS, Itens.TOKENS_INICIAIS + extra)
end

-- Soma os tokens de uma lista de nomes, ex.: {"Martelo", "PocaoCura"}
function Itens.custo(nomes)
	local total = 0
	for _, nome in ipairs(nomes) do
		local item = Itens.lista[nome]
		if item then total = total + item.tokens end
	end
	return total
end

-- Diz se a lista cabe no limite do nível
function Itens.podeEquipar(nomes, nivel)
	return Itens.custo(nomes) <= Itens.limiteDoNivel(nivel)
end

return Itens
