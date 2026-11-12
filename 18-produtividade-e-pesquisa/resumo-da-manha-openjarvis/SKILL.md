---
name: resumo-da-manha-openjarvis
description: Instala o OpenJarvis (github.com/open-jarvis/OpenJarvis) e configura um resumo da manhã em português (notícias por RSS, agenda opcional, persona em português e voz opcional), em etapas que param para aprovação. Use quando o usuário pedir o OpenJarvis, um resumo da manhã ou um "digest" diário.
---

# Resumo da manhã com o OpenJarvis

Responda em português.

**Regra principal:** trabalhe em etapas e **PARE para o usuário aprovar antes de instalar qualquer coisa.** Nunca peça para colar senha ou chave no chat. Não crie serviço nem tarefa agendada sem perguntar.

## O que saber antes (segundo o Clube das Skills; confira na documentação oficial)
- No Windows, pede Python 3.10 a 3.13, Git e MSVC Build Tools, e uns 5 GB livres.
- O resumo falado precisa de uma chave da OpenAI ou da Cartesia, paga por uso (na OpenAI, cerca de US$ 0,015 por minuto de áudio). O resto roda no computador, sem assinatura.
- Modelo de nuvem é opcional e pago à parte.
- Agenda: conectar exige criar uma credencial no Google, e essa conexão também cobre Gmail, Tarefas, Contatos e Drive. Só conecte se o usuário estiver de acordo. Sem ela, o resumo funciona só com as notícias.
- Os feeds RSS não pedem chave.

## Os 3 passos para o usuário
1. Colar o pedido no Claude Code: o Claude confere o que falta no computador e instala depois do OK.
2. Escolher o que acompanhar: conectar a agenda (opcional) e indicar os feeds RSS.
3. Ligar o resumo falado (opcional, a parte paga): colocar a chave da OpenAI ou da Cartesia, fora do chat.

## Antes de começar
Pergunte os endereços RSS dos assuntos que ele acompanha (ou ofereça 2 ou 3 sugestões de feeds do nicho dele).

## Etapas
1. **Sistema**: confira o sistema operacional, se tem 5 GB livres e, no Windows, se tem Python 3.10 a 3.13, Git e MSVC Build Tools. Diga o que falta e como instalar.
2. **Instalar**: leia a documentação oficial (open-jarvis.github.io/OpenJarvis) e instale pelo instalador oficial do sistema dele.
3. **Resumo da manhã**: configure com o preset `morning-digest` certo para o sistema.
4. **Notícias**: crie `~/.openjarvis/connectors/news_rss.json` com os feeds dele e `https://github.com/anthropics/claude-code/releases.atom`.
5. **Agenda (opcional)**: antes de conectar, avise o que esse acesso libera. Depois explique, passo a passo, como criar a credencial do Google e rodar `jarvis connect gdrive`. Ele mesmo cola a credencial no terminal. Se ele preferir, pule.
6. **Português**: o resumo vem em inglês por padrão. Crie uma persona em português em `~/.openjarvis/prompts/personas/resumo.md` e use ela na configuração, sem chamar ele de "sir".
7. **Teste**: rode `jarvis digest --fresh --text-only` e mostre o texto.
8. **Voz (só se ele pedir)**: use `tts_backend = "openai"`, diga onde guardar a chave `OPENAI_API_KEY` fora do chat (variável de ambiente ou `.env`) e quanto custa antes de gerar o áudio.
9. **No fim**: explique em linguagem simples como pedir o resumo e como desinstalar tudo.

Não invente comando: se a documentação não mostrar, diga que não achou.

## Regras do dono (valem para esta skill)
- Responda em português simples, sem termo técnico: o dono não é programador.
- Se faltar algo (link, referência, arquivo, a ideia, o público ou o objetivo), pergunte antes de começar e ofereça 2 ou 3 sugestões.
- Não invente dado, número, fonte, preço ou resultado. Se não souber, diga que não sabe. Confira números e datas.
- Tarefa grande ou que mexe em arquivos: mostre um plano curto e espere o OK. Nunca apague, publique, envie ou gaste dinheiro sem o OK.
- Teste antes de entregar e mostre a prova.
- Instalação fora do Claude Code (npm, npx, pip, programas): mostre o comando antes. Senha e chave nunca no chat.
- Post de afiliado: diga que é publicidade e não invente preço, desconto nem avaliação.
