#!/bin/bash

# Database restore script
set -e

if [ -z "$1" ]; then
  echo "Usage: ./restore.sh <backup_file>"
  exit 1
fi

BACKUP_FILE="$1"

if [ ! -f "$BACKUP_FILE" ]; then
  echo "Backup file not found: $BACKUP_FILE"
  exit 1
fi

echo "Restoring database from $BACKUP_FILE..."
docker-compose -f docker-compose.prod.yml exec -T postgres psql -U postgres oauth_learn < "$BACKUP_FILE"

echo "Restore completed"
