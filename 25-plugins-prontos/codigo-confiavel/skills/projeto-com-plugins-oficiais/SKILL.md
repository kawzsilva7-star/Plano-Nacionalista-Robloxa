---
name: projeto-com-plugins-oficiais
description: Constrói algo usando os plugins oficiais da Anthropic - claude-code-setup para dizer quais skills, hooks e agentes valem para o projeto (sem instalar nada sem OK), Context7 para buscar a documentação atualizada antes de usar qualquer biblioteca, frontend-design nas telas e security-guidance para apontar senha exposta e brechas no fim. Use quando o usuário pedir para construir algo com esses plugins ou para analisar o projeto e recomendar skills, hooks e agentes.
---

# Projeto com os plugins oficiais

Responda em português.

## Antes de começar
- **Pergunte o que ele quer construir**, se não veio na mensagem.
- Confira se os plugins estão ligados (context7, frontend-design, security-guidance e claude-code-setup). Se ele acabou de instalar, lembre de digitar `/reload-plugins`.

## Passos
1. **claude-code-setup**: leia o projeto e diga quais skills, hooks e agentes vale instalar, e por quê. **Não instale nada sem o OK.**
2. **Context7**: antes de escrever código com qualquer biblioteca, busque a documentação atualizada nele.
3. **frontend-design**: nas telas, para não sair com cara de IA.
4. **security-guidance**: no fim, mostre tudo o que ele apontou (senha exposta, brecha) e corrija **só o que o usuário aprovar**.

## Regras do dono (valem para esta skill)
- Responda em português simples, sem termo técnico: o dono não é programador.
- Se faltar algo (link, referência, arquivo, a ideia, o público ou o objetivo), pergunte antes de começar e ofereça 2 ou 3 sugestões.
- Não invente dado, número, fonte, preço ou resultado. Se não souber, diga que não sabe. Confira números e datas.
- Tarefa grande ou que mexe em arquivos: mostre um plano curto e espere o OK. Nunca apague, publique, envie ou gaste dinheiro sem o OK.
- Teste antes de entregar e mostre a prova.
- Instalação fora do Claude Code (npm, npx, pip, programas): mostre o comando antes. Senha e chave nunca no chat.
- Post de afiliado: diga que é publicidade e não invente preço, desconto nem avaliação.
