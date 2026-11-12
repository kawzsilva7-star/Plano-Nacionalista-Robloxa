---
name: instalar-skills-com-cuidado
description: Receitas para instalar skills e plugins no Claude Code (estantes de skills, Instagram Agent, plugin do Codex, web-quality, Superpowers, Matt Pocock e outras), mostrando antes qualquer comando que instale algo fora do Claude Code. Use quando o usuário pedir para instalar skills, plugins ou uma "estante".
---

# Instalar skills com cuidado

Responda em português.

## Regras
- Antes de instalar, confira se a skill já existe (na lista de skills disponíveis, nos plugins e no repositório de skills do usuário). Se já existe, avise e não instale de novo.
- Tudo que instala fora do Claude Code (npm, pip, brew, curl, programas) só roda depois de mostrar o comando e o usuário aprovar.
- Login (ChatGPT, Google etc.) é sempre o usuário quem faz.
- Ao terminar, avise o que ficou pronto e teste se o comando ou a skill aparece.
- Skills pagas nunca vão para repositório público.

## Estantes (instalar só a que o usuário escolher; pergunte o número se faltar)
1. **LIMITE (gastar menos)**: Caveman (github.com/JuliusBrussee/caveman), Claude-Mem (github.com/thedotmack/claude-mem), Headroom (github.com/headroomlabs-ai/headroom)
2. **PÁGINA (design que não parece feito por IA)**: Taste (github.com/Leonxlnx/taste-skill), Impeccable (github.com/pbakaus/impeccable), Hallmark (github.com/Nutlope/hallmark)
3. **TEXTO E VÍDEO**: Humanizer (github.com/blader/humanizer), HyperFrames (github.com/heygen-com/hyperframes), Marketing Skills (github.com/coreyhaines31/marketingskills)
4. **PROGRAMAR COMO SÊNIOR**: Superpowers (github.com/obra/superpowers), Matt Pocock Skills (github.com/mattpocock/skills), Karpathy Skills (github.com/multica-ai/andrej-karpathy-skills)
5. **PESQUISA**: Last 30 Days (github.com/mvanhorn/last30days-skill), Agent Reach (github.com/Panniantong/Agent-Reach), Graphify (github.com/Graphify-Labs/graphify)

## Receitas avulsas
- **5 skills do Clube**: hyperframes (heygen-com/hyperframes), find-skills (vercel-labs/skills), agent-browser (vercel-labs/agent-browser; pede `npm i -g agent-browser`), só a grilling (mattpocock/skills), design-taste-frontend (leonxlnx/taste-skill).
- **Programar**: prototype, diagnosing-bugs, code-review e tdd (mattpocock/skills) e a Superpowers (obra/superpowers; também está no catálogo oficial: `superpowers@claude-plugins-official`).
- **Velocidade de página**: core-web-vitals e performance (addyosmani/web-quality-skills) e web-perf (cloudflare/skills).
- **Instagram Agent**: as 13 skills ig-* de github.com/Jakeschincariol/instagram-agent-skill. Confirme que o `/ig-reel` funciona. Depois copie `templates/voice.md` para `~/.claude/instagram/voice.md` e faça as perguntas para preencher com o jeito de falar do usuário.
- **founder-skill** (11 skills, github.com/Jakeschincariol/founder-skill), seguindo o README: como plugin (`/plugin marketplace add Jakeschincariol/founder-skill` e depois `/plugin install founder-skill@founder-skill`) ou copiando as pastas `skills/founder-*` para `~/.claude/skills/`. As ferramentas precisam do Python 3.8 ou mais novo. No fim, mostre os 11 comandos instalados.
- **VoiceStudio** (programa de voz: clonar voz, dublar vídeo, transcrever; github.com/debpalash/VoiceStudio, licença AGPL-3.0): no Windows, baixe o instalador `VoiceStudio-<versão>-win-x64.exe` da página Releases, confira o SHA256 em `SHA256SUMS.txt` e só rode com o OK do usuário. No PC do dono (AMD RX 580, 8 GB) roda pelo processador, mais devagar. Clonar voz só com permissão do dono da voz.
- **Pelo skills.sh** (precisa do Node.js 22.20 ou mais novo; no Windows: `winget install OpenJS.NodeJS.LTS`, mostrar antes). `-g -a claude-code -y` instala sem perguntas e vale em todos os projetos:
  - `npx skills add https://github.com/mattpocock/skills --skill research --skill codebase-design -g -a claude-code -y`
  - `npx skills add https://github.com/heygen-com/hyperframes --skill slideshow --skill hyperframes-registry --skill media-use --skill hyperframes -g -a claude-code -y` (a hyperframes vai junto: é a base das outras 3)
  - `npx skills add https://github.com/cloudflare/security-audit-skill --skill security-audit -g -a claude-code -y`
  - `npx skills add https://github.com/anthropics/skills --skill canvas-design --skill theme-factory -g -a claude-code -y`
  - `npx skills add https://github.com/heygen-com/hyperframes --skill hyperframes -g -a claude-code -y` (a HyperFrames também precisa do FFmpeg; no Windows: `winget install Gyan.FFmpeg`, mostrar antes)
  - `npx skills add https://github.com/vercel-labs/skills --skill find-skills -g -a claude-code -y`
  - **Atalho sem Node:** se a skill já estiver no repositório de skills do dono, é mais simples pôr no plugin certo (`skills/25-plugins-prontos/planos.json`) e rodar a faxina, sem `npx`.
- **Criativo**: canvas-design e theme-factory (oficiais da Anthropic), HyperFrames (HeyGen) e o **conector do Canva**, que o próprio usuário liga em Personalização > Conectores > Canva: lembre ele no fim.
- **Lista com `--copy`** (copia as skills para a pasta em vez de ligar; precisa do Node.js): `npx -y skills add <repo> -s <skill> -a claude-code -y --copy` para hyperframes (heygen-com/hyperframes), brainstorming, writing-plans, executing-plans e test-driven-development (obra/superpowers), caveman (JuliusBrussee/caveman) e ponytail (dietrichgebert/ponytail: faz o Claude escolher a solução mais simples que funciona). Rodar um de cada vez e dizer quais instalaram e quais falharam.
- **OpenMontage** (github.com/calesthio/OpenMontage, vídeo com Remotion e narração grátis): precisa de Python e Node.js. Comandos (mostrar antes): `git clone https://github.com/calesthio/OpenMontage.git`, `cd OpenMontage`, `py -3 -m venv .venv; .\.venv\Scripts\Activate.ps1; python -m pip install -r requirements.txt; cd remotion-composer; npm install; cd ..; python -m pip install piper-tts; Copy-Item .env.example .env` e o teste `python render_demo.py world-in-numbers`. Instalar fora da pasta do bot.
- **Agentes de marketing** (pesquisador, copywriter, designer, gestor-de-trafego, social-media, analista, diretor): os arquivos ficam em `.claude/agents/` do projeto; cópia guardada em `26-agentes-de-marketing/` do repositório de skills. Depois de criar, fechar e abrir o Claude Code de novo.
- **context-mode** (plugin, github.com/mksglu/context-mode): `/plugin marketplace add mksglu/context-mode`, depois `/plugin install context-mode@context-mode` e `/reload-plugins`. Diga quais comandos o usuário precisa digitar. No fim, rode `/context-mode:ctx-doctor` e confirme que todos os itens passaram.
- **Plugin do Codex** (github.com/openai/codex-plugin-cc): `/plugin marketplace add openai/codex-plugin-cc`, depois `/plugin install codex@openai-codex`, depois `/reload-plugins` e `/codex:setup`. Se faltar o Codex, mostre o comando antes (`npm install -g @openai/codex`). No fim, confirme que o `/codex:review` aparece.

## Regras do dono (valem para esta skill)
- Responda em português simples, sem termo técnico: o dono não é programador.
- Se faltar algo (link, referência, arquivo, a ideia, o público ou o objetivo), pergunte antes de começar e ofereça 2 ou 3 sugestões.
- Não invente dado, número, fonte, preço ou resultado. Se não souber, diga que não sabe. Confira números e datas.
- Tarefa grande ou que mexe em arquivos: mostre um plano curto e espere o OK. Nunca apague, publique, envie ou gaste dinheiro sem o OK.
- Teste antes de entregar e mostre a prova.
- Instalação fora do Claude Code (npm, npx, pip, programas): mostre o comando antes. Senha e chave nunca no chat.
- Post de afiliado: diga que é publicidade e não invente preço, desconto nem avaliação.
