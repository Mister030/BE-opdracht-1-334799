#!/usr/bin/env bash
set -euo pipefail

echo "== Stap 1/3: caches legen =="
php artisan route:clear
php artisan config:clear
php artisan view:clear

echo "== Stap 2/3: caches opnieuw opbouwen =="
php artisan config:cache
php artisan route:cache
php artisan view:cache

echo "== Stap 3/3: front-end opnieuw builden =="
npm run build

echo ""
echo "Klaar. Start de server met: composer run dev"
echo ""
echo "Zie je nog steeds 'slangetjes' (foutmeldingen) onder routenamen in VS Code,"
echo "of loopt er iets vast met 'auth'/'verified'? Run dan (opdracht 3.2, stap 9.1.5.1):"
echo "  composer install --optimize-autoloader --no-dev"
echo "en herhaal daarna dit script. Let op: dit verwijdert dev-only composer-packages"
echo "(zoals phpunit), dus alleen doen als je echt vastloopt."
