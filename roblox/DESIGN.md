# Jogo de Eleição em Pixel Art 3D — Design (rascunho 3)

Fonte: 5 áudios do dono (12/11/2026) + 2 imagens de referência.
Nome provisório: **Eleição Pixel** (a decidir).

---

## 1. A ideia, como o dono falou

**Plano geral**
- Criar vários jogos no Roblox. Primeiro alguns de teste/farm (que viciam), depois o jogo principal.
- Divulgar com vídeos: "sou novo desenvolvedor, quero fazer jogos para Roblox, me deem uma força".
- Pedir para seguir o perfil e curtir. No perfil saem os códigos dos jogos e os lançamentos.
- Discord com: links dos jogos, links das skins, códigos, e às vezes sorteio de Robux.

**Jogo principal: eleição**
- Personagens: políticos (presidentes principais e outros nomes). Cada um com ataques próprios, baseados no jeito e nas falas dele.
- "Escolha seu partido": cada partido tem sua área no mapa.
- Luta entre partidos.
- Gadgets no lugar de espadas: armas diferentes e engraçadas (cajado etc.).
- Palanque com chat de voz para discutir ideias.
- Liberar personagens: jogando (todos liberáveis com o tempo) ou com Robux (atalho). Alguns bem difíceis.
- Skins para os personagens (principal fonte de renda).
- Ao derrotar um inimigo: animação/meme de derrota do personagem.
- Mapa com várias áreas do Brasil.
- Códigos que liberam personagens, válidos por 30 dias.
- Aba de sugestões: jogadores mandam ideias de personagens e poderes.
- Visual: pixel art 3D.

---

## 2. PROBLEMA: regras do Roblox sobre política

As Regras da Comunidade do Roblox proíbem, em resumo:
- políticos reais em função oficial (governantes atuais ou recentes);
- candidatos que concorrem ou concorreram há pouco, seus slogans e material de campanha;
- partidos políticos reais;
- disputas eleitorais reais específicas.

Ou seja: **presidentes reais + partidos reais + eleição = jogo removido e conta em risco.**
Pessoas reais apanhando e com "meme de morte" piora o risco.
Não consegui abrir a página oficial nesta sessão (site bloqueado); isto veio de busca. Conferir o texto atual antes de publicar.

Fontes:
- https://en.help.roblox.com/hc/en-us/articles/203313410-Roblox-Rules-of-Conduct
- https://ag.ny.gov/sites/default/files/social-media-policy-report/2025-q4-roblox-corporation-policy.pdf
- https://www.axios.com/roblox-romance-politics-standards-bc55bc7c-6d18-4a6d-8cf7-dcaede9ac9c6.html
- https://devforum.roblox.com/t/fictional-political-parties-allowed/3188788

### Saída recomendada: tudo fictício
Mesmo jogo, mesma graça, com **políticos e partidos inventados**:
- Personagens originais por "tipo" de político: o Coronel do Interior, a Prefeita Influencer, o Deputado das Promessas, o Candidato do Meme, o Doutor Burocrata...
- Partidos inventados e engraçados: Partido do Pastel, Partido da Soneca, Partido do Churrasco...
- País fictício com cara de Brasil (praia, sertão, floresta, cidade grande, capital).
- **Sem** nome, rosto, bordão ou slogan de político real. Não vale nome real com letra trocada (regra já combinada).

**Personagem do dono: CalangoTron** (robô-lagarto, verde, com crista e cauda).
- Decisão: nome sem o "13" e sem o rosto/estrela da imagem de referência. A imagem é um meme de um político atual com símbolo de partido real; reproduzir isso (ou o número do partido) viola a regra do Roblox e a regra de não disfarçar. Personagem 100% original.
- **Skins** (Robux): 3 para começar (ex.: Calango Dourado, Calango Neon, Calango Sertanejo).
- **Modo Feijão Puro:** transformação temporária, o personagem fica musculoso e gigante, com Soco Sísmico que quebra muro. Dura poucos segundos e precisa de barra de carga (enche ao bater/apanhar) para não ficar forte demais.
- Código: entra na parte 4 (Personagens) e na parte 5 (Combate).
- **Linha política: esquerda** (decisão do dono). No jogo vira o **Partido Revolução Esquerda Evolution** (PREE), fictício, que combina com o Feijão Puro. Cores sem relação com partido real: verde-lagarto e amarelo. **Sem** estrela, bandeira vermelha, foice, número de partido real ou slogan real.
- Regra para todos os rumos (esquerda, direita, nacionalismo, neoliberalismo...): cada um é um partido inventado, com personagens inventados e com vantagens e problemas. O jogo não diz qual é o "certo" e não faz propaganda de nenhum.

Conceito visual: `design_visual.html`.

Isso também protege o dono fora do Roblox (uso de imagem de pessoa real em produto pago).

---

## 3. Estilo visual (referência: 2ª foto, a cidade)

Voxel/blocos com **textura em pixel art e sombras fortes**, luz de fim de tarde, janelas acesas, placas pixeladas. Não é o estilo liso e sem textura da 1ª foto.

### Como fazer no Roblox
- `Lighting.Technology = Future`, `GlobalShadows = true` (sombras reais).
- Hora do dia perto do pôr do sol (`ClockTime` ~17.5), `Atmosphere` + `ColorCorrection` com tom quente/roxo.
- Luzes (`PointLight`/`SurfaceLight`) nas janelas e letreiros.
- Texturas: desenhar em 16x16 ou 32x32 e **ampliar para 256x256 sem suavização** antes de enviar (senão o Roblox borra). Aplicar com objeto `Texture` (repete como azulejo).
- Poucas texturas repetidas: tijolo, calçada, asfalto, parede, telhado, grama.
- Interface: `ImageLabel.ResampleMode = Pixelated`, fonte pixelada.
- Ferramentas grátis: Piskel (texturas/ícones), MagicaVoxel ou Blockbench (modelos em bloco).

Personagens: a última imagem enviada (boneco de blocos, low-poly) fica como possível referência. **Confirmar com o dono.**

---

## 4. Como o jogo funciona (versão adaptada)

1. Entra → escolhe um partido (fictício) → nasce na base do partido.
2. Escolhe um personagem liberado. Cada um tem 2 ou 3 ataques próprios.
3. Luta em arenas pelas áreas do mapa. Derrotar inimigo dá **Votos** (pontos) e **Moedas**.
4. Votos sobem o nível e liberam personagens novos. Robux é atalho, nunca a única forma.
5. Loja: skins e gadgets.
6. Praça do Palanque: área sem luta para conversar.
7. Códigos promocionais com validade.
8. Derrota: animação engraçada (personagem cai, vira confete, "perdeu a eleição"). Sem sangue.

**Ganhar / perder:** rodada de alguns minutos; ganha o partido com mais Votos. Quem é derrotado volta para a base em poucos segundos.

### Tutorial do começo (pedido do dono)
- Abre sozinho **só na primeira vez**: mostra os lugares (Base, Missões, Arena, Loja, Palanque), um por vez, com seta em cima do lugar e texto curto.
- O jogador pode **pular** a qualquer momento ou marcar **"NÃO MOSTRAR MAIS"** (desativa de vez). O botão **"?"** no canto reabre quando quiser.
- A escolha (ativo / já feito) é salva junto com os dados do jogador (`Parte1_Dados.lua`).
- Código: `Tutorial_Servidor.lua` (Script) + `Tutorial.lua` (LocalScript). Os lugares são peças dentro de `Workspace > TutorialAlvos` com os nomes `Base`, `Missoes`, `Arena`, `Loja`, `Palanque`. Se a pasta não existir, o servidor cria 5 blocos de teste.
- Quando existirem as missões, o passo "Missões" passa a levar ao quadro de verdade. Para trocar textos ou lugares, é só editar a lista `PASSOS` no começo de `Tutorial.lua`.

### Missões (a fazer)
- Quadro de missões na base. Exemplos: "entre em um partido", "quebre 10 blocos", "derrote 3 inimigos", "use um gadget".
- Dão Votos e Moedas. Missões iniciais viram o "tutorial de verdade": o jogador aprende fazendo.
- Progresso salvo por jogador.

### Tela de partidos (referência: print que o dono mandou)
Referência: `roblox/referencias/tela_partidos.jpg` (print de outro jogo do Roblox). O que aproveitar, com partidos **fictícios**:
- Lista "em destaque": sigla, nome, ícone, **membros**, **online aqui**, botão **FILIAR-SE** e **LOTADO** quando enche.
- Abas: **Explorar**, **Meu partido**, **Meu pedido** (pedido de entrada), **+ Criar partido**. Busca por sigla ou nome.
- Cuidados:
  - O print mostra siglas e nomes parecidos com partidos reais e "extrema direita"; **não copiar nomes**. Os nossos são inventados.
  - "Membros" (ex.: 250) vale para o jogo todo e precisa ser salvo (DataStore). "Online aqui" é só o servidor atual.
  - **Criar partido** deixa o jogador digitar nome e sigla: passa obrigatoriamente pelo filtro de texto do Roblox, mais uma lista de nomes proibidos (partidos e políticos reais). Se der muito trabalho, a primeira versão fica sem "Criar partido".

### HUD e mapa (referência: 3 prints de outro jogo de espada)
Referências: `roblox/referencias/hud_mapa_1.jpg`, `_2.jpg`, `_3.jpg`. Terceira pessoa, mundo aberto com ilha, grama, mar e árvores em bloco.
O que aproveitar no nosso HUD (em pixel art):
- **Habilidades em botões de losango no canto inferior esquerdo**, com a tecla escrita (Q, E, R) e o nome embaixo. No nosso jogo: Q, E, R = as 3 habilidades do personagem escolhido, mais o gadget.
- **Fileira de botões de menu embaixo:** Inventário, Configurações, Títulos. Nós: Inventário, Configurações (inclui ligar/desligar o tutorial), Títulos e Partidos.
- **Barra de vida vermelha** na esquerda.
- No topo: **ping/servidor** e **Emotes (B)**.
- **Títulos** = rótulo de conquista que o jogador equipa (ex.: "Derrubou 100 muros", "Eleito da rodada"). Ideia nova: dá motivo para jogar e é fácil de ligar às missões.
- Ideia de mapa: ilhas/áreas separadas, uma por região do Brasil fictício, com caixotes e ruínas como cenário.
Diferença: esse jogo usa textura lisa e realista. O nosso é **pixel art** (texturas 16x16 / 32x32 sem suavização).

### Elenco inicial: 3 partidos, 9 personagens + 3 neutros (aprovado pelo dono)
Todos inventados. Cada partido tem vantagens e problemas; o jogo não diz qual é o "certo". Visual em `design_visual.html`.

| Partido (fictício) | Linha | Personagens |
|---|---|---|
| **Revolução Esquerda Evolution** (PREE) | esquerda, verde e amarelo | CalangoTron (+ modo Feijão Puro), Sindicalista Marreteira (tanque), Camponesa do Chapéu de Palha (veloz) |
| **Pátria Pixel** | nacionalismo, azul e verde | Capitão da Bandeira (tanque), General Cornetão (suporte), Marechal de Latão (robô antigo) |
| **Livre Mercado** | neoliberal, dourado | Empresário Tubarão (ataque), Dona Bolsa (suporte), Robô-Contador (veloz) |
| **Neutros / chefes das áreas** | sem partido | Coronel do Interior, Prefeita Influencer, Deputado das Promessas |

- Cada personagem tem 2 ou 3 ataques (lista em `design_visual.html`) e skins vendidas com Robux.
- Liberação: o primeiro de cada partido já vem pronto; os outros abrem por **nível**. Os mais fortes ficam nos níveis altos.
- Os neutros podem ser chefes de cada área do mapa e liberar depois de derrotados.
- Sem símbolo, número, slogan ou nome de partido real. Sem foice, estrela ou bandeira de partido.
- Mais personagens e partidos depois (o dono quer receber sugestões dos jogadores).

### Mapa (EM DEFINIÇÃO, decisões do dono)
- Mapa inspirado no Brasil, dividido nas **5 regiões**: Norte, Nordeste, Centro-Oeste, Sudeste e Sul.
- Nomes de regiões (geografia) podem ser usados. **Cidades, prédios, monumentos, marcas, bandeira, brasão e hino: inventados** (ver regras legais e de moderação abaixo).
- Proposta de cenário: **Centro-Oeste = área central** (capital planejada fictícia, praça do palanque, sem luta); **Norte** = floresta e rios; **Nordeste** = praia e sertão; **Sudeste** = cidade grande e serra; **Sul** = campos, neblina e pinheiros.
- Em aberto: ilhas separadas por portais, ou um mapa só com a silhueta do Brasil; quantas regiões no lançamento; luta liberada onde.
- Legal (confirmar com advogado se for usar algo real de propósito): lugares e paisagens como inspiração são livres; evitar marcas e logos reais, fotos e mapas copiados, bandeira/brasão/hino reais (Lei 5.700/1971) e prédios do governo reconhecíveis (risco de moderação do Roblox).

### Câmera (pedido do dono)
- Jogo 3D em **primeira pessoa** por padrão, com opção de **terceira pessoa** (câmera atrás do personagem). Tecla **V** alterna.
- Código: `Camera.lua` (LocalScript). Na terceira pessoa o jogador vê o próprio personagem e as skins; na primeira, só braços e gadget.
- Visual: **pixel art** em tudo (texturas, modelos em bloco, interface). O que está em `design_visual.html` é desenho de conceito 2D; no jogo tudo é 3D.
- Primeira pessoa exige cuidado: mira no centro da tela, gadget visível na mão e menos poeira/partículas na frente da câmera.

### Mapa destrutível (pedido do dono)
- Paredes, muros, placas e objetos quebram com ataques e gadgets. Chão e estrutura principal não quebram (senão o jogador cai do mapa).
- O que um jogador quebrou **volta quando ele morre ou sai**. No fim da rodada, o mapa inteiro é consertado.
- Blocos voltam um por um (efeito de reconstrução).
- Código: `MapaDestrutivel.lua` + `MapaDestrutivel_Teste.lua`. Tudo dentro da pasta `Workspace > MapaDestrutivel` é quebrável.
- Cuidado de desempenho: blocos de 4 studs ou maiores; evitar milhares de peças pequenas.

### Dinheiro do jogo (pedido do dono)
- Personagens: liberados por **nível**, jogando.
- Skins: compradas com **Robux**.
- Moedas: ganhas jogando ou compradas com Robux; servem para armas/gadgets.
- Regra de equilíbrio: arma comprada não pode ser mais forte que a ganha jogando (senão vira "pague para ganhar" e os jogadores largam o jogo).

### Modo história (fase 2, depois do modo de luta funcionar)
- O jogador vira presidente de um **país fictício** e escreve a própria história.
- Escolhe um rumo: esquerda, direita, nacionalismo, neoliberalismo e outros. Cada rumo tem sua campanha, com personagens e eventos próprios.
- Em cada capítulo o jogador toma decisões. Elas mexem em 4 medidores: Economia, Popularidade, Segurança e Meio ambiente.
- Vários finais por rumo, bons e ruins. Todo rumo tem vantagens e problemas: o jogo não diz qual é "o certo".
- Decisões por **botões de escolha**, não texto livre (texto digitado por jogador precisa passar pelo filtro do Roblox e dá muito trabalho de moderação).
- Mesmo cuidado da seção 2: sem presidente, partido ou eleição reais. "Como seria o Brasil com o presidente X" com nome real não passa.

---

## 5. Pontos do áudio que precisam de ajuste

| Ideia | Situação | O que fazer |
|---|---|---|
| Políticos e partidos reais | Proibido pelo Roblox | Personagens e partidos fictícios |
| Voz no palanque | Voz só para contas verificadas (idade); debate político é risco | Palanque como praça social, sem tema político real |
| Aba que abre arquivo/PDF/e-mail | Roblox não envia arquivo nem e-mail de dentro do jogo | Caixa de texto no jogo (salva para o dono ler) + canal de sugestões no Discord |
| Link do Discord | Só pelos "Links sociais" da página do jogo; regras de idade | Conferir no Creator Hub |
| Sorteio de Robux | Há regras do Roblox e lei brasileira de sorteios | Conferir antes de prometer |
| "Meme de morte" | Com pessoa real é risco; com fictício, ok | Animação leve, sem sangue |
| Personagem só com Robux | Dono já decidiu: todos liberáveis jogando | Mantido |

---

## 6. Partes de código (uma por vez)

1. [escrita, falta testar] Dados do jogador e salvamento: `Parte1_Dados.lua` (trocar "Poder" por "Votos" depois)
2. [escrita, falta testar] Mapa destrutível: `MapaDestrutivel.lua` + `MapaDestrutivel_Teste.lua`
2b. [escrita, falta testar] Câmera 1ª/3ª pessoa: `Camera.lua`
2c. [escrita, falta testar] Tutorial com opção de desativar: `Tutorial_Servidor.lua` + `Tutorial.lua` (e `Parte1_Dados.lua` atualizado para salvar a escolha)
3. Partidos: tela de partidos (lista, filiar-se, lotado), escolher time e nascer na base
3b. Missões: quadro, progresso e recompensas
4. Personagens: elenco inicial (12), escolher e trocar, liberar por nível; lista de liberados salva
5. Combate: ataque básico + 1 habilidade, vida, derrota e retorno (ataques quebram o mapa)
6. Recompensas: Votos, Moedas, nível, liberar personagens
7. Loja: skins (Robux), gadgets (Moedas), compra de Moedas
8. Códigos com validade
9. Caixa de sugestões
10. Rodadas, placar de partidos e conserto do mapa no fim da rodada
11. Interface em pixel art
12. Modo história (fase 2)

Arte (em paralelo): texturas base, 1 área do mapa, 3 personagens, 3 gadgets.

Primeiro jogo de teste (farm): pode reutilizar as partes 1, 6 e 7.

---

## 7. Perguntas para o dono

1. Aceita trocar para políticos e partidos **fictícios**? (Sem isso o jogo não passa no Roblox.)
2. Nos áudios apareceram dois nomes que não entendi bem (soou como "Superchandão" e "Enes"). Quem são?
3. A última imagem (boneco de blocos) é a referência dos personagens?
4. Quantos partidos no começo? Sugestão: 3.
5. Nome do jogo.
