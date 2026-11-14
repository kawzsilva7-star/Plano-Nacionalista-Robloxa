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

### Meta de qualidade visual (pedido do dono: pixel art com textura muito boa, jogo lindo)
Referência: `roblox/referencias/estilo_rua_pixel.png` (feita dentro do Roblox, mostra que é possível). O que faz ficar assim:
1. **Textura**: ladrilhos 32x32 que se repetem sem emenda, ampliados para 256x256 **sem suavizar** (o Roblox borra textura pequena). Primeira amostra: `roblox/texturas/` (tijolo, paralelepípedo, calçada, asfalto, reboco, telha, grama, madeira, janela acesa). Gerador: `gerar_texturas.py`.
2. **Tamanho do pixel igual em tudo**: 1 pixel da textura = sempre o mesmo tamanho no mundo (ex.: 0,25 stud). Senão o tijolo de uma parede fica maior que o de outra e estraga o visual.
3. **Luz**: Lighting em **Future**, sol baixo (fim de tarde), sombras, névoa colorida, brilho (Bloom) e correção de cor. Script: `Estilo_Visual.lua`.
4. **Janelas e letreiros acesos** (material Neon ou luz de ponto) para a noite e o fim de tarde ficarem vivos.
5. **Objetos pequenos** (carros, placas, máquinas, árvores, cartazes no chão) modelados em voxel (MagicaVoxel/Blockbench). São eles que dão vida à cena.
6. **Fios, canos, grades e papéis no chão**: detalhes pequenos repetidos em todo canto.
- Atenção: o Roblox tem limite de memória e de peças. Cena bonita não pode ter milhares de peças soltas; usar texturas repetidas e poucos modelos.
- Esta meta vale para todas as cidades. A primeira cena de teste deve ser **uma rua de Campinas** (decisão do dono pendente).

### Cidades e viagem (decisões do dono)
- Lançamento: **São Paulo, Brasília e Rio de Janeiro** (decisão posterior do dono; Campinas fica como cidade especial extra). Cidades reais são permitidas (são lugares); marcas, logos, políticos e prédios do governo reais continuam inventados ou genéricos.
- O jogador **nasce no Rio de Janeiro ou em São Paulo** (as mais famosas). Campinas é a cidade do dono e abre depois, viajando.
- Para mudar de cidade ou região, o jogador **pega transporte**:

| Transporte | Para quê | Estado |
|---|---|---|
| **Ônibus urbano** | Andar pelo bairro (decisão do dono); rota fixa com pontos de parada | DECIDIDO (rota e preço: proposta) |
| **Metrô** | Andar rápido dentro de São Paulo e do Rio | DECIDIDO |
| **Ônibus de viagem** | Entre cidades da mesma região (SP, Rio e Campinas) | DECIDIDO |
| **Avião** | Entre regiões: já no lançamento (Brasília ↔ SP/Rio); outras regiões depois | DECIDIDO |

- **Veículo próprio (decisão do dono):** o jogador pode ter **carro ou moto** dele. Só marcas e modelos **inventados** (sem marca real). Proposta: compra com Moedas (comuns) e Robux (skins e modelos especiais); chamado por botão, aparece ao lado do jogador; some ao morrer, trocar de cidade ou sair. A moto abre junto com o primeiro carro? Fica para decidir.
- **Preço do transporte (ideia do dono: depende do partido, com isenção de ônibus).** Base: transporte custa Moedas. Cada partido fictício ganha uma isenção ou desconto e paga o preço em outro lugar (equilíbrio, sem dizer qual é "o certo"). PROPOSTA:
  - **Revolução Esquerda Evolution:** ônibus urbano e metrô **grátis**; carro/moto e avião mais caros.
  - **Pátria Pixel:** ônibus de viagem **grátis**; metrô e avião no preço normal.
  - **Livre Mercado:** carro/moto e avião com **desconto**; ônibus e metrô mais caros.
  - Sem partido (neutros): preço normal.
- PROPOSTA (a confirmar com o dono): viagem custa Moedas e tem nível mínimo; ao embarcar, tela curta de viagem (3 a 5 s) e o jogador aparece na estação de destino; sem luta dentro do veículo e nas estações; no lançamento existem urbano, metrô, ônibus de viagem e avião (Brasília ↔ SP/Rio).
- Técnica: as cidades ficam longe uma da outra no mesmo jogo, com **StreamingEnabled** ligado (só carrega o que está perto). Viagem = mover o personagem para a estação de destino, com tela escurecendo. Mais simples que um jogo por cidade.
- O tutorial deve mostrar uma estação e explicar como viajar (novo passo em `Tutorial.lua`).

- **CIDADES DO LANÇAMENTO (decisão do dono): São Paulo, Brasília e Rio de Janeiro.** O jogador escolhe em qual começa. Campinas (cidade do dono, especial) entra como cidade extra, ainda sem data.
  - São Paulo e Rio ficam no Sudeste (**ônibus de viagem** entre elas). Brasília fica no Centro-Oeste, então Brasília ↔ SP/Rio precisa de **avião já no lançamento**. O avião sai da lista "futuro".
  - Brasília: prédios do governo e símbolos nacionais genéricos ou inventados (risco de moderação e Lei 5.700/1971).
- **Cidades famosas para escolher onde nascer (ideia nova do dono, atualiza as 3 do lançamento):** de 3 a 5 das cidades mais famosas do Brasil; o jogador **escolhe** em qual começa. PROPOSTA:
  - **Versão com 3:** Rio de Janeiro, São Paulo e Salvador.
  - **Versão com 5 (uma por região):** Rio de Janeiro e São Paulo (Sudeste), Salvador (Nordeste), Manaus (Norte) e Brasília (Centro-Oeste). Sul (Curitiba ou Porto Alegre) entra depois.
  - Campinas (cidade do dono) continua prevista, como cidade extra ou bônus.
  - Com cidades em regiões diferentes o **avião é necessário já no lançamento**, e o jogo fica maior (mais trabalho e mais peso). Com 3 cidades no mesmo Sudeste bastam os ônibus.
  - Brasília: cuidado com prédios do governo (usar versões genéricas).
- **Cada cidade é diferente (decisão do dono); Campinas é ESPECIAL (é a cidade do dono).** Falta definir o quê. IDEIAS (propostas, sem fechar):
  - **Campinas:** bairro tranquilo e acolhedor, com os segredos do jogo: itens e skins exclusivos "de Campinas", um NPC que representa o criador do jogo, códigos secretos e missões especiais. Dá identidade ao projeto e conteúdo para divulgar.
  - **São Paulo:** metrô, prédios altos, missões de trabalho e muito movimento.
  - **Rio de Janeiro:** praia, morro, calçadão e desafios ao ar livre.
  - **Salvador:** ladeiras, festa de rua e música.
  - **Manaus:** floresta, rio e barco como transporte.
  - **Brasília:** cidade planejada, centro do palanque e dos debates (prédios genéricos).
  - Cada cidade com sua missão, inimigo e item próprios.

### Ideias do dono ainda incompletas (a completar quando ele mandar mais)
O dono pediu para ir adicionando as ideias, mesmo incompletas. Nada abaixo está fechado.
- **Mapa:** cidades do lançamento definidas (SP, Brasília, Rio; Campinas extra); falta o formato das regiões. O jogador **escolhe** onde nasce (decisão do dono).
- **Transporte:** ônibus urbano, metrô, ônibus de viagem, avião, carro e moto próprios. Falta: preços, se o veículo próprio vai pela estrada entre cidades, se dá para lutar com ele, se a moto é item separado do carro.
- **Preço por partido:** isenção de ônibus conforme o partido (proposta acima, sem fechar). Falta: se o jogador pode trocar de partido e com que espera.
- **Bairros e pontos:** nomes reais ou inventados (sem decidir).
- **Primeira cena de teste:** sugestão de uma rua de Campinas, sem decidir.
- **Nome do jogo:** sem decidir (provisório "Eleição Pixel"; sugestão "Plano Nacional").
- **Cada cidade com algo diferente e Campinas especial:** falta o dono dizer o quê (ver ideias acima).
- **Qualidade visual:** pixel art 3D com textura boa (ver "Meta de qualidade visual").

### Mapa do Brasil gigante (estrutura criada; pedido do dono)
Pedido: montar a estrutura do Brasil no Roblox, gigante, com a maioria dos lugares indisponível ("em breve"). Feito **por arquivos**, sem mexer no Studio.
- Arquivos em `roblox/mapa/`: `gerar_mapa_brasil.py` (gerador), `MapaBrasil_Dados.lua` (dados), `MapaBrasil_Construtor.lua` (constrói no jogo) e `mapa_brasil_preview.png` (prévia).
- O contorno vem dos limites oficiais dos 27 estados (IBGE, via arquivo público no GitHub). O mapa do Brasil Escola que o dono mandou foi só referência; não foi copiado.
- Brasil em **blocos** (combina com pixel art): 91 x 79 células, 1 célula = 200 studs, cerca de **18.200 x 15.800 studs**. São 337 peças no total.
- **Liberados no lançamento:** São Paulo, Rio de Janeiro e Distrito Federal (Brasília). Os outros **24 estados ficam "em breve"**: cor apagada, placa "EM BREVE" e o jogador é devolvido se tentar entrar. O mar também é bloqueado (ainda não há barco).
- Marcadores das cidades: São Paulo, Rio, Brasília e Campinas (especial, "em breve").
- Para liberar um estado depois: trocar `disponivel = false` por `true` no `MapaBrasil_Dados.lua`, ou, com o jogo rodando, pôr o atributo `Liberado_UF` (ex.: `Liberado_BA`) no Workspace.
- Para o avião (futuro): marcar o jogador com o atributo `EmViagem = true` durante o voo, para a trava não devolvê-lo.
- Como testar no Studio: ModuleScript `MapaBrasil_Dados` + Script `MapaBrasil_Construtor` em ServerScriptService; Workspace > StreamingEnabled ligado. Ao dar Play, o jogador nasce perto de São Paulo; ao andar até Minas Gerais (ao norte) ele deve ser devolvido.
- Atenção: atravessar o mapa a pé leva uns 20 minutos; por isso existem os transportes. As cidades (SP, Rio, Brasília) serão construídas em detalhe por cima da posição delas no mapa.
- **Decidido (dono):** a divisa entre os estados liberados fica **trancada**; para mudar de cidade o jogador é obrigado a usar o transporte (ônibus de viagem entre SP e Rio, avião para Brasília). A trava será escrita junto com o sistema de transporte.
- Próximos passos do mapa (a decidir pelo dono): relevo e bioma por região, texturas pixel art nas peças, a cidade de São Paulo em detalhe, aeroportos.

### Controles e Configurações (pedido do dono)
- **Correr** segurando a tecla de correr, com **barra de estamina** (amarela; fica vermelha quando cansa). Correr: velocidade 26 (andar: 16). Estamina dura ~4,5 s; recupera depois de 1 s sem correr; cansou, só volta a correr com 25%.
- **Travar a câmera no boneco** (shift lock próprio do jogo): o boneco vira junto com a câmera e o mouse fica preso no centro. Só muda algo em terceira pessoa. O shift lock padrão do Roblox fica desligado para não brigar com a tecla de correr.
- **Configurações** (botão CONFIG no canto ou tecla **P**): o jogador escolhe
  - Teclas: **SHIFT CORRE / CTRL TRAVA** (padrão) ou **SHIFT TRAVA / CTRL CORRE**;
  - Correr: ligado/desligado;
  - Tutorial: ligado/desligado.
- As escolhas são salvas (Parte1_Dados). No celular aparece um botão **CORRER** na tela.
- Em primeira pessoa o mouse fica preso; os painéis (tutorial e configurações) soltam o mouse enquanto estão abertos.
- Código: `Configuracoes_Servidor.lua` (Script) + `Movimento.lua` (LocalScript). Ajustes de velocidade e estamina ficam no começo de `Movimento.lua`.
- Outros sistemas podem mudar a velocidade base pondo o atributo `VelocidadeBase` no Humanoid (ex.: lentidão de um ataque).

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
2d. [escrita, falta testar] Correr com estamina + travar câmera + Configurações: `Configuracoes_Servidor.lua` + `Movimento.lua`
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
