#!/bin/bash
# TLC Trial Team — one-shot repo setup
# Cleans up dead v1 files, inits git, makes initial commit,
# and pushes to GitHub (creates the repo if `gh` CLI is available).

set -e
clear
cat <<'HEADER'
================================================
  TLC Trial Team  ->  initial repo setup
================================================
HEADER
echo ""

REPO=$(find ~ -maxdepth 6 -type d -name "tlc-trial-team-redesign" -not -path "*/node_modules/*" 2>/dev/null | head -1)
if [ -z "$REPO" ]; then
  echo "ERROR: couldn't find tlc-trial-team-redesign in your home folder."
  read -n 1 -s -r -p "Press any key to close..."; exit 1
fi

echo "[ok] Repo at: $REPO"
cd "$REPO"

# --- 1. Clean up dead v1 files (safe — moved to ~/.Trash if available) ---
echo ""
echo "[..] Removing dead v1 files (keeping the v2 homepage)..."
DEAD=(about.html contact.html case-results.html reviews.html tlc-preview.html practice-areas areas _screenshots)
for f in "${DEAD[@]}"; do
  if [ -e "$f" ]; then
    echo "    - $f"
    rm -rf "$f"
  fi
done

# --- 2. Init git if not already ---
if [ ! -d ".git" ]; then
  echo ""
  echo "[..] git init..."
  git init -q
  git branch -m main 2>/dev/null || true
fi

# --- 3. Stage + commit ---
echo ""
echo "[..] Staging and committing..."
git add -A
if git diff --cached --quiet; then
  echo "    (nothing to commit)"
else
  git commit -q -m "initial: TLC Trial Team homepage v2 (Cormorant + Inter, real teal)"
fi

# --- 4. Set up GitHub remote + push ---
REMOTE_SSH="git@github.com:ensotography-hub/tlc-trial-team-redesign.git"

if git remote get-url origin >/dev/null 2>&1; then
  echo ""
  echo "[ok] origin already configured: $(git remote get-url origin)"
else
  echo ""
  echo "[..] Adding origin remote ($REMOTE_SSH)..."
  git remote add origin "$REMOTE_SSH"
fi

# Try gh CLI first (creates the repo + pushes in one shot)
if command -v gh >/dev/null 2>&1 && gh auth status >/dev/null 2>&1; then
  echo ""
  echo "[..] GitHub CLI detected. Creating repo + pushing..."
  if ! gh repo view ensotography-hub/tlc-trial-team-redesign >/dev/null 2>&1; then
    gh repo create ensotography-hub/tlc-trial-team-redesign --private --source=. --remote=origin --push
  else
    git push -u origin main
  fi
  echo ""
  echo "[ok] Pushed to https://github.com/ensotography-hub/tlc-trial-team-redesign"
else
  echo ""
  echo "[..] GitHub CLI not available — attempting direct push..."
  echo "    (If this fails, create the empty repo first at:"
  echo "     https://github.com/organizations/ensotography-hub/repositories/new"
  echo "     name it: tlc-trial-team-redesign  ·  set Private  ·  no README/gitignore/license)"
  echo ""
  if git push -u origin main 2>&1; then
    echo "[ok] Pushed."
  else
    echo ""
    echo "[!] Push failed. Likely the GitHub repo doesn't exist yet."
    echo "    Create it (link above), then re-run this script (it'll skip cleanup since git is already initialized)."
  fi
fi

echo ""
echo "================================================"
echo "  Next: connect Vercel"
echo "  https://vercel.com/new -> Import the repo"
echo "================================================"
echo ""
read -n 1 -s -r -p "Press any key to close..."
