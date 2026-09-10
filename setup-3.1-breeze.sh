#!/usr/bin/env bash
# setup-3.1-breeze.sh
# Voert opdracht 3.1 "Opzetten inlog- registratiesysteem met laravel Breeze" uit
# in dit project (Backend Leerjaar 2). Draai dit vanuit deze mapzelf:
#   bash setup-3.1-breeze.sh
#
# De migratie (rolename-kolom) en app/Models/User.php zijn al aangepast.
# Dit script: installeert Breeze, ververst de database, bouwt de front-end,
# en voegt daarna het Rolename-veld toe aan het registratieformulier + de controller.

set -euo pipefail

echo "== Stap 1/5: Laravel Breeze installeren =="
composer require laravel/breeze --dev

echo
echo "== Stap 2/5: Breeze blade-stack (geen dark mode, phpunit zoals al in je project) =="
php artisan breeze:install blade --no-interaction

echo
echo "== Stap 3/5: database verversen (voegt de rolename-kolom toe) =="
php artisan migrate:fresh

echo
echo "== Stap 4/5: front-end installeren en bouwen =="
npm install
npm run build

echo
echo "== Stap 5/5: Rolename-veld toevoegen aan formulier + controller =="
php patch-3.1.php

echo
echo "Klaar. Start nu de server met:"
echo "  composer run dev"
echo "Ga daarna naar http://127.0.0.1:8000/register en registreer de 5 gebruikers"
echo "uit setup-3.1-gebruikers.txt (in deze map)."
