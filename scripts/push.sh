#!/bin/bash
set -e
cd "$(cd "$(dirname "$0")/.." && pwd)"

clear
cat <<'HEADER'
================================================
  TLC Trial Team  ->  push to GitHub
================================================
HEADER
echo ""
echo "[..] Status:"
git status --short
echo ""

# If nothing to commit, just push (in case last push failed)
if [ -z "$(git status --porcelain)" ]; then
  echo "(no changes — pushing existing commits if any)"
  MSG=""
else
  # Native macOS dialog for commit message — no Terminal typing needed
  MSG=$(osascript -e 'text returned of (display dialog "Commit message:" default answer "update" with title "TLC Trial Team — push" buttons {"Cancel", "Push"} default button "Push")' 2>/dev/null) || { echo "Cancelled."; exit 0; }
  [ -z "$MSG" ] && MSG="update: $(date '+%Y-%m-%d %H:%M')"
  git add -A
  git commit -m "$MSG"
fi

echo ""
echo "[..] Pushing to origin/main..."
git push origin main

echo ""
echo "================================================"
echo "  DONE. Vercel auto-deploys in ~30s."
echo "  Repo:    https://github.com/ensotography-hub/tlc-trial-team-redesign"
echo "  Preview: https://tlc-trial-team-redesign.vercel.app"
echo "================================================"
echo ""

osascript -e 'display notification "Live URL updates in ~30s" with title "TLC pushed"' 2>/dev/null

read -n 1 -s -r -p "Press any key to close..."
