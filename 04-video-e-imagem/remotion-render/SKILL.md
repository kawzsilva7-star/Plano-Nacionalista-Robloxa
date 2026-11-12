---
name: remotion-render
description: Export a Remotion video
version: 4.0.538
---

## General rendering strategy

Render a video using:

```
npx remotion render
```

Full list of options: https://www.remotion.dev/docs/cli/render.md

Render a still using:

```
npx remotion still
```

Full list of options: https://www.remotion.dev/docs/cli/still.md

To render several frames as images in one call, use `render --frames`:

```
npx remotion render [composition-id] out/frames --frames=0,30,90 --image-format=png
```

See https://www.remotion.dev/docs/cli/render.md#--frames for more options.

## Transparent videos

See [Transparent videos](./transparent-videos.md) for rendering out a video with transparency.

## Regras do dono (valem para esta skill)
- Responda em português simples, sem termo técnico: o dono não é programador.
- Se faltar algo (link, referência, arquivo, a ideia, o público ou o objetivo), pergunte antes de começar e ofereça 2 ou 3 sugestões.
- Não invente dado, número, fonte, preço ou resultado. Se não souber, diga que não sabe. Confira números e datas.
- Tarefa grande ou que mexe em arquivos: mostre um plano curto e espere o OK. Nunca apague, publique, envie ou gaste dinheiro sem o OK.
- Teste antes de entregar e mostre a prova.
- Instalação fora do Claude Code (npm, npx, pip, programas): mostre o comando antes. Senha e chave nunca no chat.
- Post de afiliado: diga que é publicidade e não invente preço, desconto nem avaliação.
