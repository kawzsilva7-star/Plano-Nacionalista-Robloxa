# 72 Skills

As skills da **Bíblia das Skills** (`docs/Biblia-das-Skills.pdf`), baixadas dos repositórios originais e organizadas para Claude Code e claude.ai.

## O que tem aqui
- `.claude/skills/`: 68 skills + `guia-das-skills` (índice por tarefa, feito a partir do PDF).
  Cada pasta tem `ORIGEM.md` com o repositório e o commit de onde veio, e a licença original.
- `scripts/empacotar.sh`: gera um `.zip` por skill em `dist/` para enviar ao claude.ai.

## Por que 68 e não 72
Cinco skills do PDF foram aposentadas pelos autores e o conteúdo foi incorporado a outras:

| Do PDF | Está agora em |
|---|---|
| redesign-existing-projects | design-taste-frontend |
| hyperframes-creative, hyperframes-animation, product-launch-video | hyperframes |
| hyperframes-audio | media-use (adicionada) |

`stitch-design-taste` e `imagegen-frontend-web` mudaram de repositório (Leonxlnx/taste-skill-classics e Leonxlnx/imagegen-skills) e foram baixadas de lá.

## Como usar

### Claude Code no seu computador (todas as pastas e projetos)
Uma vez só, no Claude Code:

```
/plugin marketplace add kawzsilva7-star/72-skills-
/plugin install guia@72-skills
```

Depois instale os grupos que você usa (cada grupo é um plugin):

| Plugin | Skills |
|---|---|
| `guia` | guia-das-skills |
| `planejamento` | grilling, brainstorming, prototype, handoff, writing-plans, executing-plans |
| `pagina-de-venda` | copywriting, marketing-psychology, cro, copy-editing, landing-page-conversion-audit, offers |
| `design` | frontend-design, design-taste-frontend, shadcn, stitch-design-taste |
| `velocidade` | web-perf, performance, core-web-vitals, vercel-react-best-practices, playwright-cli |
| `trafego-pago` | ads, analytics, ad-creative, server-side-conversion-tracking, influencer-marketing |
| `seo` | seo-audit, schema, ai-seo, programmatic-seo |
| `backend` | supabase-postgres-best-practices, supabase, stripe-best-practices, resend, wizard, firebase-basics, firebase-security-rules-auditor, prisma-client-api |
| `deploy` | cloudflare, wrangler, deploy-to-vercel, prisma-compute |
| `agentes` | find-skills, writing-for-agents, dispatching-parallel-agents, agent-browser, teach |
| `imagem-e-video` | image, hyperframes, media-use, remotion-best-practices, imagegen-frontend-web |
| `qualidade` | diagnosing-bugs, tdd, code-review, domain-modeling, codebase-design |
| `shopify` | shopify |
| `documentos` | xlsx, docx, pptx, pdf, writing-shape |
| `economia-de-tokens` | caveman, caveman-review, caveman-learn, caveman-explore, caveman-commit |

Exemplo: `/plugin install pagina-de-venda@72-skills`

O repositório é privado: o computador precisa estar logado no GitHub (`gh auth login`).
Para puxar as atualizações: `/plugin marketplace update 72-skills`.

### claude.ai (chat normal, app e site)
O chat não lê repositórios do GitHub como skills. Gere os `.zip` com `scripts/empacotar.sh` e envie um por vez em Configurações → Capacidades → Skills.

Instale só o que você usa: cada skill instalada adiciona a descrição dela a toda conversa.

## Atualizar
As cópias são fixas na data em `ORIGEM.md`. Para atualizar, baixe de novo do repositório de origem.
