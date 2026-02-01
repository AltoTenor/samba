#!/bin/sh
set -e

cd /mount
git config --global user.name "AltoTenor"
git config --global user.email "aritro10@gmail.com"

# Install cron job
(
  crontab -l 2>/dev/null
  echo "*/1 * * * * /bin/bash /github_sync.sh >> /var/log/github_sync.log 2>&1"
) | crontab -

crond

echo "Starting Samba..."
exec /usr/bin/samba.sh "$@"
