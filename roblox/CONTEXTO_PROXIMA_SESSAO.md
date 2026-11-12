# Contexto para a próxima sessão (cole isto no início do chat)

## Quem sou e como trabalho
- Conhecimento de Blender: zero. Preciso de passo a passo simples, em português.
- Uso Windows, Blender 5.2.3 (em português) e Roblox Studio (em português).
- Tenho um programador à disposição para o jogo. Divisão combinada: a IA escreve uma parte pequena por vez, ele cola no Studio, testa e devolve o resultado/erro.
- Estou cansado (trabalho na DHL): prefiro respostas curtas e diretas.

## O que já existe (arquivos no meu PC, pasta Downloads)
**Cabelo estilo anime prata + bandana (design original, sem marcas de personagem):**
- `CabeloAnime_v5.py` (Blender) gera: Cabelo_ComBandana, Cabelo_SemBandana, Bandana_Separada, Cabeca_Rosto, Cabeca_Completa (.fbx).
- Cabelo com bandana: 3.704 triângulos, sem bandana: 2.772 (limite 4.000 de acessório rígido).
- Cabeca_Completa passa de 4.000 (4.920): serve como arte 3D, não como acessório único.
- Cabeça é estática (sem rig facial, não pisca).
**Roupas simples (Roupa_v1.py):** Capa curta, Cinto, Colar, Munhequeira, Pochete (.fbx), textura única `Roupa_cores.png`.

## Estado no Roblox Studio
- Importei as 5 peças da cabeça/cabelo no Studio (todas com cor, textura veio embutida no FBX).
- AINDA FALTA: transformar em Accessory (MeshPart `Handle` + `HairAttachment`), testar em R6/R15/Rthro, enviar (upload/moderação).
- Nada foi testado em R6/R15/Rthro ainda. Limites de ombro/cintura/pulso NÃO foram conferidos.

## Regras que combinamos
- Nada de nome/emblema de personagem de anime (Black Clover etc.) nos itens, descrições ou tags: design original. Não trocar letras do nome para escapar da moderação.
- Roblox só importa objetos 3D (.fbx); o .py serve só no Blender; scripts de jogo são .lua (Luau).
- Rodar o Blender com GERAR_RENDERS = False (senão trava vários minutos).
- Não consegui ler create.roblox.com nesta sessão (domínio bloqueado): limites oficiais vieram de busca e precisam de confirmação no Studio/Creator Hub.

## Pendências / ideias
- Preço (ideia: ~50 Robux por peça, talvez pacote) — decidir depois de ver regras atuais do Creator Hub.
- Montar o JOGO (a decidir: tipo, ideia central).
- Pasta "Black Clover" no Creator Hub é só minha para organizar; vou renomear.

## Para o jogo, me diga na próxima sessão
1. Tipo de jogo (ex.: luta, RPG, obby, tycoon, sobrevivência).
2. O que o jogador faz em 1 frase e como ganha/perde.
3. Se o programador já tem experiência com Luau/DataStore.
Peça: "divida em partes pequenas e escreva a primeira em Luau".
