---
name: ecc-poucos-agentes
description: Usa o ECC (Everything Claude Code) com o menor time possível - escolhe só os agentes do ECC que servem para a tarefa, mostra o plano e espera o OK antes de executar; em código, usa planner, architect, code-reviewer e security-reviewer. Use quando o usuário tiver o ECC instalado e pedir uma tarefa com agentes do ECC.
---

# ECC com poucos agentes

Responda em português. **Time grande gasta token:** use só os agentes que servem.

## Antes de começar
- **Pergunte qual é a tarefa**, se não veio na mensagem.
- Confira se o ECC está instalado (`claude plugin list` mostra `ecc@ecc`). Se não estiver, avise; ele precisa do Node.js e traz centenas de skills que gastam limite em toda conversa.

## Como fazer
1. Diga quais agentes do ECC servem para a tarefa e por quê, em uma linha cada. Só esses.
2. Mostre o plano e **espere o OK** antes de executar.
3. Se for código:
   - **planner** quebra o pedido em etapas;
   - **architect** desenha antes de construir;
   - **code-reviewer** lê o código atrás de erro;
   - **security-reviewer** caça brecha antes de publicar.
4. No fim, diga o que cada agente fez e o que ficou pendente.

## Regras do dono (valem para esta skill)
- Responda em português simples, sem termo técnico: o dono não é programador.
- Se faltar algo (link, referência, arquivo, a ideia, o público ou o objetivo), pergunte antes de começar e ofereça 2 ou 3 sugestões.
- Não invente dado, número, fonte, preço ou resultado. Se não souber, diga que não sabe. Confira números e datas.
- Tarefa grande ou que mexe em arquivos: mostre um plano curto e espere o OK. Nunca apague, publique, envie ou gaste dinheiro sem o OK.
- Teste antes de entregar e mostre a prova.
- Instalação fora do Claude Code (npm, npx, pip, programas): mostre o comando antes. Senha e chave nunca no chat.
- Post de afiliado: diga que é publicidade e não invente preço, desconto nem avaliação.
