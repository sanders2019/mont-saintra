#!/bin/bash

# Post-deployment script for Laravel on Railway

set -e

echo "Post-deployment started..."

# Check if vendor/autoload.php exists
if [ ! -f "vendor/autoload.php" ]; then
    echo "ERROR: vendor/autoload.php not found. Build may have failed."
    exit 1
fi

echo "Running Laravel migrations..."
php artisan migrate --force || true

echo "Clearing caches..."
php artisan cache:clear || true
php artisan config:clear || true
php artisan view:clear || true

echo "Dumping autoload..."
composer dump-autoload --no-scripts || true

echo "Post-deployment complete!"
