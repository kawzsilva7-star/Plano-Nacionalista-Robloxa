#!/usr/bin/env bash
# Gera um .zip por skill em dist/, no formato aceito pelo claude.ai
# (Configurações → Capacidades → Skills → Enviar skill).
# Uso: scripts/empacotar.sh            (todas)
#      scripts/empacotar.sh copywriting cro   (só as escolhidas)
set -euo pipefail
cd "$(dirname "$0")/.."
mkdir -p dist
skills=("$@")
[ ${#skills[@]} -eq 0 ] && skills=($(ls .claude/skills))
for s in "${skills[@]}"; do
  [ -f ".claude/skills/$s/SKILL.md" ] || { echo "skill não encontrada: $s" >&2; continue; }
  rm -f "dist/$s.zip"
  (cd .claude/skills && zip -qr "../../dist/$s.zip" "$s" -x "*/__MACOSX/*" "*.DS_Store")
  echo "dist/$s.zip"
done
