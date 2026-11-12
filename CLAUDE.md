# Plano Nacionalista Roblox — regras para o Claude

Projeto: jogo 3D em pixel art no Roblox (primeira pessoa, com opção de terceira). Tudo do jogo está em `roblox/` (`DESIGN.md` = ideia completa e lista das partes). As skills ficam nas pastas numeradas, separadas por função.

## Como usar as skills (economizar token)
1. **Só use skill quando a tarefa for de decisão, criação de código, texto ou raciocínio** que ela cobre. Ação simples (ler arquivo, rodar comando, resposta curta): nenhuma skill.
2. **Escolha pela função**: ache a pasta na tabela abaixo, procure a skill em `INDICE.md` (só a seção daquela pasta) e abra **apenas** o `SKILL.md` escolhida. Arquivos de `references/` só se a tarefa pedir. Nunca carregue o grupo inteiro.
3. Se nenhuma skill serve, faça direto. Não force.
4. Diga ao dono, em uma linha, qual skill usou e por quê.
5. Skill nova entra na pasta da sua função. Se já existir, não copie de novo; versão diferente vai para `22-versoes-alternativas/`.
6. Nunca colocar chave, token, senha ou dado pessoal neste repositório.

## Qual pasta para qual função
| Preciso de... | Pasta |
|---|---|
| Anúncios, tráfego pago, métricas | `01-marketing-e-anuncios`, `14-marketing-completo`, `26-agentes-de-marketing` |
| Textos, página de vendas, oferta | `02-textos-e-vendas` |
| SEO e velocidade de site | `03-seo-e-velocidade` |
| Vídeo, voz, imagem, pixel art, texturas | `04-video-e-imagem`, `24-motion-e-animacao` |
| Design, interface, sites | `05-design-e-sites` |
| Planejar, decidir, testar ideia, brainstorm | `06-planejar-e-decidir`, `15-conselheiros-executivos` |
| Escrever e revisar código (Luau/Lua incluso) | `07-codigo-e-qualidade`, `12-engenharia-avancada`, `13-time-de-engenharia` |
| Servidor, banco de dados, pagamentos | `08-servidor-banco-e-pagamentos` |
| Navegador e automação | `09-navegador-e-automacao` |
| Documentos (Word, PDF, planilha, slides) | `10-documentos` |
| Gastar menos token | `11-economia-de-tokens` |
| Leis, regras, compliance | `16-regulacao-e-compliance` |
| Produto, roadmap | `17-produto` |
| Pesquisa e produtividade | `18-produtividade-e-pesquisa` |
| Gestão de projeto, tarefas, prazos | `19-gestao-de-projetos` |
| Negócio, vendas, finanças | `20-negocios-vendas-e-financas` |
| Agentes e automações | `21-agentes-e-automacao` |
| Plugins prontos | `25-plugins-prontos` |
| Notas e guias de origem | `23-notas-e-guias-dos-repositorios` (consulta, não é skill) |

## Qual skill em cada momento do jogo (exemplos)
| Momento | Pasta onde procurar |
|---|---|
| Decidir mecânica, modo história, preço dos itens | `06-planejar-e-decidir` |
| Escrever e revisar script Luau | `07-codigo-e-qualidade` |
| Achar bug difícil que o programador reportou | `07-codigo-e-qualidade` / `12-engenharia-avancada` |
| Arte pixel art, ícones, texturas | `04-video-e-imagem` |
| Interface (menus, loja, HUD) | `05-design-e-sites` |
| Vídeos de divulgação (Reels/TikTok) | `04-video-e-imagem`, `24-motion-e-animacao`, `02-textos-e-vendas` |
| Texto da página do jogo e da loja | `02-textos-e-vendas` |

## Regras do jogo (valem sempre, acima de qualquer skill)
- **Nada de político, partido, número de partido, slogan ou símbolo reais.** Personagens e partidos são inventados (ex.: Partido Revolução Esquerda Evolution, CalangoTron).
- **Não trocar letras de nome real para escapar da moderação** (PT, PRT, PTT etc. contam como nome real).
- Todo rumo político do jogo é fictício, com vantagens e problemas; o jogo não faz propaganda de nenhum.
- Visual: pixel art em tudo. Câmera: primeira pessoa, tecla V alterna para terceira.
- Roblox só importa objetos 3D (.fbx); scripts são Luau (.lua).
- O Claude não roda o Roblox Studio: escreve o código, o programador cola, testa e devolve o resultado/erro da janela Saída. Escrever uma parte pequena por vez.
- Dono prefere resposta curta, em português, passo a passo simples.

## Aviso de licença
Parte das skills foi **paga** (Clube das Skills, licença individual). **Este repositório deve ser PRIVADO.** Nunca torná-lo público nem copiar essas skills para repositório público. Origens e licenças: `ORIGENS.md` e os arquivos `LICENSE.source` de cada skill.
