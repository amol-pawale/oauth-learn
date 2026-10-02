#!/bin/bash

# Database backup script
set -e

BACKUP_DIR="./backups"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.sql"

mkdir -p "$BACKUP_DIR"

echo "Backing up database..."
docker-compose -f docker-compose.prod.yml exec -T postgres pg_dump -U postgres oauth_learn > "$BACKUP_FILE"

echo "Backup completed: $BACKUP_FILE"
