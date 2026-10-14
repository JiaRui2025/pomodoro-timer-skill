#!/bin/bash
# Push pomodoro-timer skill to GitHub
# Prerequisites: git installed, GitHub account, and either gh CLI or a created empty repo

set -e

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_NAME="pomodoro-timer"
REMOTE_URL=""

echo "🍅 Pomodoro Timer — GitHub Push Script"
echo "======================================"
echo ""

# Check git
if ! command -v git &>/dev/null; then
  echo "❌ git not found. Install Xcode Command Line Tools first:"
  echo "   xcode-select --install"
  exit 1
fi

# Configure git if needed
if [ -z "$(git config --global user.name)" ]; then
  read -p "Enter your GitHub name: " GIT_NAME
  git config --global user.name "$GIT_NAME"
fi
if [ -z "$(git config --global user.email)" ]; then
  read -p "Enter your GitHub email: " GIT_EMAIL
  git config --global user.email "$GIT_EMAIL"
fi

cd "$REPO_DIR"

# Init git repo
if [ ! -d ".git" ]; then
  echo "📦 Initializing git repository..."
  git init
  git branch -M main
fi

# Add and commit
git add -A
git commit -m "Initial commit: Pomodoro timer WorkBuddy skill" 2>/dev/null || echo "Nothing to commit, already up to date."

# Try gh CLI first, fall back to manual
if command -v gh &>/dev/null; then
  echo "🚀 Creating GitHub repo with gh CLI..."
  gh repo create "$REPO_NAME" --public --source=. --remote=origin --push
  echo ""
  echo "✅ Done! Your repo is live."
  gh repo view --web
else
  echo ""
  echo "📋 Manual steps:"
  echo "1. Go to https://github.com/new"
  echo "2. Repository name: $REPO_NAME"
  echo "3. Set to Public, do NOT add README/.gitignore/license (already included)"
  echo "4. Click 'Create repository'"
  echo ""
  read -p "5. Paste your repo URL (e.g. https://github.com/user/$REPO_NAME.git): " REMOTE_URL

  git remote add origin "$REMOTE_URL" 2>/dev/null || git remote set-url origin "$REMOTE_URL"
  git push -u origin main

  echo ""
  echo "✅ Done! Your repo is live at: $REMOTE_URL"
fi
