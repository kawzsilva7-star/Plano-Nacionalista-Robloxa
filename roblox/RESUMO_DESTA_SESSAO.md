# Resumo desta sessão (para levar ao outro chat)

Tudo isto está no repositório privado `kawzsilva7-star/plano-nacionalista-robloxa`, branch `main`, pasta `roblox/`.
Detalhes completos: `roblox/DESIGN.md`. Contexto geral: `roblox/CONTEXTO_PROXIMA_SESSAO.md`.
**Nenhum script foi testado no Studio ainda.**

## 1. Ideias do dono registradas nesta sessão

### Jogo e regras
- Jogo 3D em **pixel art com textura muito boa** (referência: rua em pixel art feita no Roblox, `referencias/estilo_rua_pixel.png`).
- Câmera em **primeira pessoa**; tecla **V** troca para terceira.
- Luta entre **partidos fictícios**. Regra fixa: nada de político, partido, número, slogan ou símbolo reais, nem com letra trocada.
- Partido do CalangoTron: **Revolução Esquerda Evolution (PREE)**, esquerda. Outros: **Pátria Pixel** (nacionalismo) e **Livre Mercado** (neoliberal).
- Personagens: CalangoTron (robô-lagarto, com o modo **Feijão Puro**, musculoso), mais 8 personagens dos partidos e 3 neutros. Liberados por **nível**; skins com Robux.
- **Tutorial** no começo do jogo, mostrando lugares e missões. O jogador pode **pular ou desativar**.
- **Mapa destrutível:** o que o jogador quebra volta quando ele morre ou sai.
- **Modo história** (fase 2): o jogador vira presidente de um país fictício e segue um rumo (esquerda, direita, nacionalismo, neoliberalismo...).

### Mapa e viagem
- **Brasil gigante em blocos**, com os 27 estados divididos como no mapa real.
- Só **São Paulo, Rio de Janeiro e Brasília** ficam liberados; os outros 24 estados ficam **"EM BREVE"**.
- O jogador **escolhe** em qual dessas cidades nasce. **Campinas** (cidade do dono) é **especial**, como cidade extra. Cada cidade terá algo diferente.
- Divisa entre estados **trancada**: para mudar de cidade, só de transporte.
- Transportes: **ônibus urbano** (anda pelo bairro), **metrô**, **ônibus de viagem** (entre SP e Rio) e **avião** (para Brasília).
- **Carro e moto próprios**, com marcas inventadas.
- **Preço do transporte por partido** (proposta):
  - PREE: ônibus e metrô grátis.
  - Pátria Pixel: ônibus de viagem grátis.
  - Livre Mercado: desconto em carro, moto e avião.
- Cidades e regiões reais podem. Marcas, bandeira, brasão, hino, prédios do governo e Cristo Redentor ficam genéricos ou inventados.

### Controles e Configurações
- **Correr** segurando Shift, com **barra de estamina**.
- **Travar a câmera no boneco** (shift lock próprio do jogo) com Ctrl.
- Nas **Configurações** (botão CONFIG ou tecla P) o jogador escolhe:
  - **Teclas:** "SHIFT CORRE / CTRL TRAVA" ou "SHIFT TRAVA / CTRL CORRE".
  - **Correr:** ligado ou desligado.
  - **Tutorial:** ligado ou desligado.
- As escolhas ficam salvas.

## 2. Arquivos de código desta sessão (pasta `roblox/`)
| Arquivo | Onde vai | Para quê |
|---|---|---|
| `Parte1_Dados.lua` | Script em ServerScriptService | Salva Poder, Moedas, tutorial e configurações |
| `Camera.lua` | LocalScript em StarterPlayerScripts | 1ª/3ª pessoa (tecla V) |
| `Tutorial_Servidor.lua` + `Tutorial.lua` | Script / LocalScript | Tutorial que pode ser pulado e desativado |
| `Configuracoes_Servidor.lua` + `Movimento.lua` | Script / LocalScript | Correr, estamina, travar câmera, Configurações |
| `MapaDestrutivel.lua` + `MapaDestrutivel_Teste.lua` | ModuleScript / Script | Muros que quebram e voltam |
| `Estilo_Visual.lua` | Script (e Lighting > Technology = Future) | Luz de fim de tarde |
| `mapa/MapaBrasil_Dados.lua` + `mapa/MapaBrasil_Construtor.lua` | ModuleScript / Script | Brasil em blocos, só SP, RJ e DF liberados |
| `texturas/` | enviar pelo Creator Hub | 10 texturas pixel art 256x256 |

## 3. O que falta o dono decidir
- Nome do jogo (sugestão: "Plano Nacional").
- Preços do transporte e se o jogador pode trocar de partido.
- Bairros com nomes reais ou inventados; primeira cena de teste.

## Observação
As ideias de **armas, tokens, classe exclusiva (Espada Trovão, Braço do Alquimista, Marca da Maldição, Poção) e a ponte de empurrar** foram faladas aqui por engano: são de **outro jogo** do dono. Foram **tiradas** deste projeto e entregues numa pasta separada (`Jogo_Armas_Ideias`).
