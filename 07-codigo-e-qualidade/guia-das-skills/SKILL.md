---
name: guia-das-skills
description: Índice da "Bíblia das Skills" (72 skills organizadas por tarefa). Use quando o usuário perguntar qual skill usar para uma tarefa, pedir para escolher/indicar skills, ou começar um projeto (página de venda, loja, tráfego pago, SEO, backend, deploy, vídeo, documentos) sem dizer qual skill quer.
---

# Guia das Skills

Escolha pela tarefa. Use as **essenciais** primeiro; as *complementares* só quando o caso pedir. Ative poucas por vez: cada skill carregada consome tokens.

## 01 Planejamento e estrutura
- **grilling**: entrevista o usuário sobre o projeto antes de construir (início de qualquer projeto).
- **brainstorming**: ideia solta → 2-3 caminhos com prós e contras → plano aprovado.
- **prototype**: rascunho descartável para decidir entre 2-3 visuais/fluxos.
- **handoff**: resumo de passagem quando a conversa fica longa.
- *writing-plans*: divide uma construção grande em tarefas com testes.
- *executing-plans*: executa um plano do writing-plans etapa por etapa.

## 02 Página de venda
- **copywriting**: escreve a página inteira (título, promessa, oferta, FAQ, botões). Texto antes do visual.
- **marketing-psychology**: fortalece oferta, preço e garantia (ancoragem, prova social), sem escassez falsa.
- **cro**: acha o que trava a compra e prioriza correções.
- **copy-editing**: revisa copy existente mantendo o tom.
- *landing-page-conversion-audit*: auditoria com semanas de dados de tráfego/vendas.
- *offers*: define o que vender e em quais condições (bônus, garantia, parcelamento).

## 03 Design e front-end
- **frontend-design**: fontes, cores e layout a partir do produto e da marca.
- **design-taste-frontend**: execução detalhada do visual e revisão no navegador. Também faz **redesign de páginas existentes** (antiga skill redesign-existing-projects).
- *shadcn*: projetos que já usam shadcn/ui.
- *stitch-design-taste*: guia de estilo para o Google Stitch.

## 04 Velocidade da página
- **web-perf**: diagnóstico do carregamento, ordenado por impacto.
- **performance**: reduz peso de imagens, fontes e scripts.
- **core-web-vitals**: LCP, INP e CLS quando ainda há lentidão.
- *vercel-react-best-practices*: só para React/Next.js.
- *playwright-cli*: testa compra, cadastro e carrinho no navegador.

## 05 Tráfego pago
- **ads**: Meta x Google, estrutura de campanha, público, orçamento, leitura de relatórios.
- **analytics**: eventos, GA4/Tag Manager, pixel da Meta, sem contagem duplicada.
- **ad-creative**: textos, ideias de imagem e roteiros de anúncio.
- *server-side-conversion-tracking*: conversões pelo servidor quando o pixel perde compras.
- *influencer-marketing*: parcerias com criadores.

## 06 SEO e Google
- **seo-audit**: o que impede de aparecer no Google, com provas e ordem de correção.
- **schema**: dados estruturados (produto, empresa, artigo).
- **ai-seo**: ser lido e citado por buscadores com IA.
- *programmatic-seo*: muitas páginas a partir de modelo + dados próprios.

## 07 Backend e banco de dados
- **supabase-postgres-best-practices**: modelagem, RLS e consultas no Postgres.
- **supabase**: login, permissões, storage e chaves no Supabase.
- **stripe-best-practices**: pagamentos e assinaturas; liberar só após webhook.
- **resend**: e-mails transacionais (recibo, boas-vindas).
- *wizard*: guia passo a passo para ações manuais em painéis.
- *firebase-basics* / *firebase-security-rules-auditor*: só para projetos Firebase.
- *prisma-client-api*: só se o projeto já usa Prisma.

## 08 Publicar o site
- **cloudflare**: escolher recursos da Cloudflare.
- **wrangler**: publicar na Cloudflare pelo Wrangler.
- **deploy-to-vercel**: publicar na Vercel (versão de teste por padrão).
- *prisma-compute*: hospedagem no Prisma Compute.
Escolha UMA hospedagem. Confira o link de teste antes de ligar o domínio.

## 09 Agentes e automação
- **find-skills**: procura skills que faltam.
- **writing-for-agents**: escreve/revisa instruções e skills.
- **dispatching-parallel-agents**: divide tarefas independentes entre subagentes.
- *agent-browser*: automação de navegador.
- *teach*: aulas curtas com exercícios.

## 10 Imagem e vídeo
- **image**: briefing de imagens de marketing (banners, posts, capas).
- **hyperframes**: criar/editar vídeo no HyperFrames. Já inclui direção criativa, animação e vídeo de lançamento (antigas hyperframes-creative, hyperframes-animation, product-launch-video).
- **media-use**: mídia e áudio no HyperFrames, incluindo mixagem de voz e música (antiga hyperframes-audio).
- **remotion-best-practices**: vídeo com Remotion (alternativa ao HyperFrames).
- *imagegen-frontend-web*: imagem de referência por seção da página.
Escolha HyperFrames OU Remotion. Aprove uma prévia curta antes do final.

## 11 Qualidade e erros
- **diagnosing-bugs**: reproduzir, testar hipóteses uma por vez, confirmar a correção.
- **tdd**: teste que falha antes da mudança.
- **code-review**: confere se a mudança faz o que foi pedido e segue as regras.
- *domain-modeling*: glossário do negócio (ex.: PIX gerado x pago).
- *codebase-design*: organizar código repetido em partes testáveis.

## 12 Loja Shopify
- **shopify**: tema em Liquid, Shopify CLI, produtos e pedidos. Trabalhe num tema duplicado.
- Combine com copywriting, cro, frontend-design, web-perf, seo-audit e image.

## 13 Documentos e planilhas
- **xlsx**, **docx**, **pptx**, **pdf**: um formato por vez; revise o arquivo final.
- *writing-shape*: transformar notas/transcrições em texto, com o usuário.

## 14 Economia de tokens
- **caveman**: respostas sem enrolação (só a conversa, não a entrega).
- **caveman-review**: revisão de código curta.
- **caveman-learn**: analisa consumo (exige o programa Caveman).
- *caveman-explore*: subagente para localizar código.
- *caveman-commit*: mensagens de commit curtas.

## Como aplicar
1. Identifique a tarefa e o capítulo.
2. Diga ao usuário quais skills vai usar e por quê (uma linha).
3. Carregue só as necessárias. Respeite os pré-requisitos (Node.js, contas, chaves) e avise quando faltarem.
4. Nunca coloque chaves secretas no código da página nem na conversa.

O PDF original está em `docs/Biblia-das-Skills.pdf` na raiz do repositório.

## Regras do dono (valem para esta skill)
- Responda em português simples, sem termo técnico: o dono não é programador.
- Se faltar algo (link, referência, arquivo, a ideia, o público ou o objetivo), pergunte antes de começar e ofereça 2 ou 3 sugestões.
- Não invente dado, número, fonte, preço ou resultado. Se não souber, diga que não sabe. Confira números e datas.
- Tarefa grande ou que mexe em arquivos: mostre um plano curto e espere o OK. Nunca apague, publique, envie ou gaste dinheiro sem o OK.
- Teste antes de entregar e mostre a prova.
- Instalação fora do Claude Code (npm, npx, pip, programas): mostre o comando antes. Senha e chave nunca no chat.
- Post de afiliado: diga que é publicidade e não invente preço, desconto nem avaliação.
