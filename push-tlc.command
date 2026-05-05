#!/bin/bash
# TLC Trial Team — push script
# Double-click to push the current branch to GitHub. Vercel auto-deploys.

set -e
clear
cat <<'HEADER'
================================================
  TLC Trial Team  ->  push to GitHub
================================================
HEADER
echo ""

REPO=$(find ~ -maxdepth 6 -type d -name "tlc-trial-team-redesign" -not -path "*/node_modules/*" 2>/dev/null | head -1)

if [ -z "$REPO" ]; then
  echo "ERROR: couldn't find tlc-trial-team-redesign folder in your home directory."
  read -n 1 -s -r -p "Press any key to close..."
  exit 1
fi

echo "[ok] Found repo at: $REPO"
cd "$REPO"

echo ""
echo "[..] Status:"
git status --short
echo ""

# Auto-stage all changes if there are any
if [ -n "$(git status --porcelain)" ]; then
  echo "[..] Staging all changes..."
  git add -A
  echo ""
  echo "Enter a short commit message (or press Return for default):"
  read -r MSG
  if [ -z "$MSG" ]; then
    MSG="update: $(date '+%Y-%m-%d %H:%M')"
  fi
  git commit -m "$MSG"
  echo ""
fi

echo "[..] Pushing to origin/main..."
echo ""
echo "    If it prompts for a password, paste a Personal Access Token."
echo "    (github.com -> Settings -> Developer settings -> PAT classic, 'repo' scope.)"
echo ""

git push origin main

echo ""
echo "================================================"
echo "  DONE. Vercel will auto-deploy."
echo "  https://github.com/ensotography-hub/tlc-trial-team-redesign"
echo "================================================"
echo ""
read -n 1 -s -r -p "Press any key to close..."
