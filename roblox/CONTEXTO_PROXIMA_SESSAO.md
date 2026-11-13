# Contexto para a próxima sessão (leia isto primeiro)

## Quem é o dono e como trabalha
- Zero de Blender. Usa Windows e Roblox Studio em português. Tem um programador que cola o código no Studio, testa e devolve "funcionou" ou o erro da janela Saída.
- Cansado (trabalha na DHL): respostas curtas, em português, passo a passo. Não criar coisas sem ele ter dado a ideia; ele manda ideias aos poucos (muitas por áudio) e quer tudo registrado, mesmo incompleto.
- O Claude não roda o Roblox Studio: escreve em arquivos, o programador testa. Uma parte pequena por vez.

## Onde está tudo
Repositório privado `kawzsilva7-star/plano-nacionalista-robloxa`, branch `main`:
- `CLAUDE.md` (regras do projeto e das skills), `roblox/DESIGN.md` (ideia completa, ~300 linhas), `roblox/design_visual.html` (conceito visual), `roblox/referencias/` (prints), `roblox/texturas/` (10 texturas pixel art), `roblox/mapa/` (Brasil em blocos).
- 730 skills em pastas numeradas `01-` a `26-`, por função.

## Scripts escritos (NENHUM testado ainda no Studio)
| Arquivo | Onde vai no Studio | Para quê |
|---|---|---|
| `Parte1_Dados.lua` | Script em ServerScriptService (nome `Dados`) | Poder, Moedas, salva dados e preferência do tutorial |
| `Camera.lua` | LocalScript em StarterPlayerScripts | 1ª pessoa, tecla V alterna para 3ª |
| `MapaDestrutivel.lua` (ModuleScript) + `MapaDestrutivel_Teste.lua` (Script) | ServerScriptService | Muros quebram e voltam quando o jogador morre |
| `Tutorial_Servidor.lua` + `Tutorial.lua` | Script em ServerScriptService / LocalScript em StarterPlayerScripts | Tutorial que pode ser pulado e desativado |
| `Estilo_Visual.lua` | Script em ServerScriptService (e Lighting > Technology = Future na mão) | Luz de fim de tarde |
| `mapa/MapaBrasil_Dados.lua` (ModuleScript) + `mapa/MapaBrasil_Construtor.lua` (Script) | ServerScriptService, com StreamingEnabled ligado | Brasil em blocos, só SP, RJ e DF liberados |
| `Vitrine_Roblox.lua` | Script em ServerScriptService | Testa o cabelo em R6, R15 e Rthro |

## O jogo grande (resumo; detalhes no DESIGN.md)
- Jogo 3D em pixel art com textura boa (referência: rua pixel art em `referencias/estilo_rua_pixel.png`), 1ª pessoa com opção de 3ª.
- Luta entre partidos **fictícios**: Revolução Esquerda Evolution (CalangoTron + modo Feijão Puro), Pátria Pixel, Livre Mercado. 12 personagens, liberados por nível; skins com Robux; moedas para armas/gadgets.
- Mapa: Brasil gigante em blocos (27 estados); só **São Paulo, Rio e Brasília** abertos; o resto "em breve". Jogador escolhe onde nasce. Divisa trancada: mudar de cidade só de ônibus de viagem, metrô, ônibus urbano ou avião. Carro e moto próprios (marcas inventadas). Preço do transporte varia por partido (proposta). Campinas (cidade do dono) = cidade especial extra.
- Modo história (fase 2), missões, títulos, tela de partidos, loja, códigos de 30 dias, caixa de sugestões.
- Muita coisa ainda incompleta: ver a seção "Ideias do dono ainda incompletas" no DESIGN.md.

## Regras que valem sempre
- **Nada de político, partido, número, slogan ou símbolo reais.** Não trocar letras de nome real (PT, PRT, PTT contam como nome real). Já recusado: "PTT/PRT/PR Evolutiion" e "Lulatron".
- Cidades e regiões reais podem; marcas, logos, bandeira/brasão/hino, prédios do governo e Cristo Redentor: genéricos ou inventados.
- Repositório **privado** (skills pagas). Nunca chaves ou senhas.
- Roblox só importa .fbx; scripts são Luau.

## Divulgação (ideia do dono)
Vídeos "sou novo desenvolvedor", pedir seguir e curtir; no perfil saem códigos e lançamentos; Discord com links de jogos, skins e códigos; às vezes sorteio de Robux (conferir regras do Roblox e a lei de sorteios).

## O que o dono vai fazer agora
Abrir **outra sessão** para criar um **jogo mais leve (tipo farm/teste)** para deixar rodando enquanto o jogo grande é feito. Dá para reaproveitar `Parte1_Dados.lua`, `Camera.lua` e o `Tutorial`. Primeiro perguntar a ele: o que o jogador faz em uma frase e como ganha/perde.

## Pendências do jogo grande
Nome do jogo (sugestão "Plano Nacional"), partido do jogador e troca, preços, bairros reais ou inventados, primeira cena de teste (rua de Campinas), tela de partidos, Parte 4 (personagens), combate, loja.
