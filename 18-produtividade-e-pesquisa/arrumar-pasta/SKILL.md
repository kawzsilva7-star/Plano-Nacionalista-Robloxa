---
name: arrumar-pasta
description: Arruma uma pasta do computador em 4 papéis (leitor, organizador, renomeador e caçador de duplicados) sem apagar nem sobrescrever nada - separa por tipo e mês, dá nomes que dá para achar, move cópias exatas para _revisar e anota cada movimento para poder desfazer. Use quando o usuário pedir para arrumar, organizar ou limpar uma pasta (Downloads, Documentos etc.).
---

# Arrumar pasta (sem apagar nada)

Responda em português. **Tome cuidado.**

## Antes de começar
- **Pergunte qual pasta arrumar** (caminho completo, ex.: `C:\Users\SeuNome\Downloads`).
- **Sempre teste antes de aplicar:** faça primeiro numa **cópia** da pasta (ou mostre a lista de movimentos "de → para" sem mover nada) e só aplique na pasta de verdade depois que ele aprovar o resultado.
- Nunca arrume a pasta do bot, o repositório do bot, o histórico ou a planilha.

## REGRA DE OURO
**NUNCA apague nada e nunca sobrescreva arquivo.** Só crie pastas, mova e renomeie. Se o nome de destino já existir, acrescente um número em vez de sobrescrever. Anote cada movimento "de → para" num arquivo de registro, para ele poder desfazer.

## 1. LEITOR
Liste todos os arquivos, com nome, tipo, data e tamanho. Marque os que têm conteúdo idêntico (compare o hash, não só o nome). Arquivos com "senha", "password" ou parecidos no nome: **NÃO abra nem mexa.**

## 2. ORGANIZADOR
Separe por tipo (Fotos, PDFs, Planilhas, Documentos, Vídeos, Áudios, Outros) e, dentro de cada tipo, por mês (AAAA-MM). Use a data que estiver no nome do arquivo; se não tiver, use a data de modificação.

## 3. RENOMEADOR
Dê a cada arquivo um nome que dê para achar depois: `AAAA-MM-DD o-que-é detalhe.ext`. Tire lixo como "FINAL_FINAL", "(1)" e "Documento", mas mantenha o que diferencia um arquivo do outro.

## 4. CAÇADOR DE DUPLICADOS
Mova as cópias EXATAS (hash igual) para uma pasta `_revisar` e deixe o original no lugar. Arquivos só parecidos no nome, com conteúdo diferente, ficam onde estão. Crie um LEIA-ME na `_revisar` dizendo que nada foi apagado.

## No fim
Mostre a árvore final, quantos arquivos havia antes e depois (tem que ser o mesmo número) e a lista do que está na `_revisar`. Diga onde ficou o registro "de → para".

## Regras do dono (valem para esta skill)
- Responda em português simples, sem termo técnico: o dono não é programador.
- Se faltar algo (link, referência, arquivo, a ideia, o público ou o objetivo), pergunte antes de começar e ofereça 2 ou 3 sugestões.
- Não invente dado, número, fonte, preço ou resultado. Se não souber, diga que não sabe. Confira números e datas.
- Tarefa grande ou que mexe em arquivos: mostre um plano curto e espere o OK. Nunca apague, publique, envie ou gaste dinheiro sem o OK.
- Teste antes de entregar e mostre a prova.
- Instalação fora do Claude Code (npm, npx, pip, programas): mostre o comando antes. Senha e chave nunca no chat.
- Post de afiliado: diga que é publicidade e não invente preço, desconto nem avaliação.
