#!/bin/bash

# Post-deployment script for Laravel on Railway

echo "Running Laravel migrations..."
php artisan migrate --force

echo "Clearing caches..."
php artisan cache:clear
php artisan config:clear
php artisan view:clear

echo "Running composer dump-autoload..."
composer dump-autoload

echo "Post-deployment complete!"
