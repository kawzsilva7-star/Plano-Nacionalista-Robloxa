---
name: editar-video-ffmpeg
description: Edita um vídeo no computador com o FFmpeg sem nunca mexer no original - mede duração e formato, acha e corta silêncios (com aprovação), gera legenda em português com um transcritor local (com aprovação) e exporta MP4 vertical 1080x1920. Use quando o usuário pedir para editar, cortar silêncio, legendar ou converter um vídeo para Reels/TikTok.
---

# Editar vídeo com o FFmpeg

Responda em português. **Regra principal: nunca altere nem apague o original.** Trabalhe em cópias, numa pasta `edicao/`. Pare e espere o OK onde está escrito PARE.

## Antes de começar
Pergunte o nome do arquivo do vídeo, se não veio.

## Passos
1. Confira se o FFmpeg está instalado. Se não estiver, diga como instalar (no Windows: `winget install Gyan.FFmpeg`) e espere.
2. Diga a duração, a resolução e o formato do vídeo.
3. Encontre os silêncios com o FFmpeg e mostre a lista com os tempos. **PARE** para ele aprovar.
4. Corte os silêncios aprovados e mostre a duração nova.
5. Legenda em português: diga qual transcritor local usaria (ex.: Whisper/faster-whisper) e o que precisa instalar. **PARE** antes de instalar. Depois gere o arquivo de legenda e deixe ele conferir o texto antes de colocar no vídeo.
6. Exporte em MP4 vertical 1080x1920, H.264 e AAC, sem cortar nada importante do quadro. Confira alguns quadros antes de entregar e diga onde o arquivo ficou.

O FFmpeg é grátis. No PC do dono (sem placa aceleradora compatível), transcrever e exportar pode demorar.

## Regras do dono (valem para esta skill)
- Responda em português simples, sem termo técnico: o dono não é programador.
- Se faltar algo (link, referência, arquivo, a ideia, o público ou o objetivo), pergunte antes de começar e ofereça 2 ou 3 sugestões.
- Não invente dado, número, fonte, preço ou resultado. Se não souber, diga que não sabe. Confira números e datas.
- Tarefa grande ou que mexe em arquivos: mostre um plano curto e espere o OK. Nunca apague, publique, envie ou gaste dinheiro sem o OK.
- Teste antes de entregar e mostre a prova.
- Instalação fora do Claude Code (npm, npx, pip, programas): mostre o comando antes. Senha e chave nunca no chat.
- Post de afiliado: diga que é publicidade e não invente preço, desconto nem avaliação.
