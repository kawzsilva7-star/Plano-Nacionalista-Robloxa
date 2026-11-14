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

### Tokens, itens e classes
- Cada arma ou habilidade **custa tokens**. Limite: **25 no começo, +1 a cada 5 níveis, até 30**.
- **Classe exclusiva única, código "SSE":**
  - É a **mais cara do jogo**.
  - Aparece **"EXCLUSIVO" em cima do item, colorido (arco-íris)**.
  - **Tudo inspirado em anime entra nela**, sempre com nome e visual originais.

| Item | Classe | Tokens | Números |
|---|---|---|---|
| Soco | — | 2 | empurrão 10, dano 8, recarga 0,6 s |
| Cajado | — | 4 | empurrão 20, dano 12, recarga 1,2 s |
| Martelo | — | 8 | empurrão 40 (2 quadrados; dono pensou em 60), dano 20, recarga 8 s |
| **Poção de Cura** | — | 4 | cura 30, recarga 15 s (dono: 10 ou 15) |
| **Marca da Maldição** | — | **10** (muito forte) | efeito a definir |
| **Espada Trovão** | **EXCLUSIVO** | **10** | empurrão **150**, dano **45**, 1 golpe/s; **25.000 Moedas ou 50 Robux** |
| **Braço do Alquimista** | **EXCLUSIVO** | 10 (provisório) | números e preço a definir (classe mais cara) |

- **Recarga** = tempo entre um uso e outro (na arma, intervalo entre golpes).
- **Habilidade da arma** = golpe especial numa tecla (E/R) com recarga própria. Propostas para a Espada Trovão: **Investida Trovão** (avança) e **Corte Lateral**.
- **Alerta:** a Espada Trovão, do jeito pedido, é muito forte para um item vendido por Robux ("pague para ganhar"). Sugestão:
  - golpe normal com empurrão 30 e dano 25;
  - o empurrão de 150 só na habilidade.

### Ponte (modo de empurrar)
- Ponte de **quadrados numerados** (o dono falou de 15 a 25; teste com **20**).
- **20 pontos de empurrão = 1 quadrado.** Quem sai da ponte cai.
- Falta o dono decidir:
  - como se ganha (empurrar o outro para fora ou atravessar?);
  - se a ponte é um modo separado ou um lugar do mapa.

### Braço do Alquimista (inspiração e ideias)
- **Inspiração:** o anime de dois irmãos alquimistas. Ao tentar trazer a mãe de volta com alquimia, um perde o braço e a perna e passa a usar um **braço de metal**. A regra da alquimia é a **troca equivalente**: para ganhar algo, é preciso dar algo de mesmo valor. Ele bate as mãos e transforma o chão em paredes, pontas e armas, e transforma o próprio braço em lâmina.
- **Habilidades propostas** (nomes originais):
  - **Lâmina de Metal:** o braço vira lâmina.
  - **Muralha de Pedra:** parede que bloqueia empurrões.
  - **Lanças do Chão:** pontas que empurram.
  - **Troca Equivalente:** perde vida para ganhar força.
  - **Reconstruir:** conserta muros e a ponte.
- **Cuidado:** não usar o nome do personagem, o símbolo do casaco, o círculo de transmutação igual ao do anime nem o visual copiado. O dono do anime pode pedir a remoção do item no Roblox.

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
| `Itens.lua` | ModuleScript em **ReplicatedStorage** | Tabela de itens, tokens e classes |
| `Ponte.lua` + `Ponte_Teste.lua` | ModuleScript / Script | Ponte em quadrados, empurrão, boneco de treino |
| `texturas/` | enviar pelo Creator Hub | 10 texturas pixel art 256x256 |

## 3. O que falta o dono decidir
- Efeito da Marca da Maldição.
- Números e preço do Braço do Alquimista.
- Habilidades da Espada Trovão e equilíbrio dela.
- Regra de vitória da ponte.
- Nome do jogo (sugestão: "Plano Nacional").
- Preços do transporte e se o jogador pode trocar de partido.
