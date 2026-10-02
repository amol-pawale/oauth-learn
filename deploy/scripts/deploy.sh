#!/bin/bash

# Deployment script
set -e

echo "Starting deployment..."

# Load environment variables
if [ -f ".env" ]; then
  export $(cat .env | grep -v '#' | xargs)
fi

echo "Building and starting services..."
docker-compose -f docker-compose.prod.yml up -d

echo "Deployment completed"
