#!/usr/bin/env bash
set -e

# ===== CONFIG =====
BRANCH="main"
COMMIT_PREFIX="auto-sync"
LOCKFILE="/tmp/github_sync.lock"
LOGFILE="/var/log/github_sync.log"

# ==================

# Prevent overlapping runs
exec 9>"$LOCKFILE" || exit 1
flock -n 9 || exit 0

{
  echo "---- $(date) ----"

  # Ensure repo exists
  cd /mount

  if [ ! -d ".git" ]; then
    echo "Not a git repository, skipping"
    exit 0
  fi

  # Pull latest changes (rebase to avoid merge commits)
   git pull --rebase origin "$BRANCH" || {
    echo "Git pull failed"
    exit 1
  }

  # Check for changes
  if git status --porcelain | grep -q .; then
    git add -A
    git commit -m "${COMMIT_PREFIX}: $(date '+%Y-%m-%d %H:%M:%S')"
    git push origin "$BRANCH"
    echo "Changes pushed"
  else
    echo "No changes to sync"
  fi

} >> "$LOGFILE" 2>&1

