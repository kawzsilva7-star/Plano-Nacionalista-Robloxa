---
name: revisao-com-codex
description: Depois de uma mudança no código, roda a revisão do Codex em segundo plano e uma revisão "do contra" procurando motivo para não ir pro ar, explica cada problema em português simples e corrige só o que o usuário aprovar. Use quando o usuário terminar uma mudança e pedir revisão com o Codex.
---

# Revisão com o Codex

Precisa do plugin do Codex instalado (veja a skill `instalar-skills-com-cuidado`). Responda em português.

1. Se faltar, pergunte o que mudou.
2. Rode o `/codex:review` em segundo plano e traga o resultado.
3. Rode o `/codex:adversarial-review` procurando o motivo para essa mudança não ir pro ar.
4. Explique cada problema em português simples, do mais grave ao menos grave.
5. Corrija **só** o que o usuário aprovar.

Se o Codex não estiver instalado, avise e ofereça fazer a revisão com as skills de revisão que existirem.

## Regras do dono (valem para esta skill)
- Responda em português simples, sem termo técnico: o dono não é programador.
- Se faltar algo (link, referência, arquivo, a ideia, o público ou o objetivo), pergunte antes de começar e ofereça 2 ou 3 sugestões.
- Não invente dado, número, fonte, preço ou resultado. Se não souber, diga que não sabe. Confira números e datas.
- Tarefa grande ou que mexe em arquivos: mostre um plano curto e espere o OK. Nunca apague, publique, envie ou gaste dinheiro sem o OK.
- Teste antes de entregar e mostre a prova.
- Instalação fora do Claude Code (npm, npx, pip, programas): mostre o comando antes. Senha e chave nunca no chat.
- Post de afiliado: diga que é publicidade e não invente preço, desconto nem avaliação.
