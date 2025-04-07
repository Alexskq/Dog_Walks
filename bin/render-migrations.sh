#!/bin/bash
set -e

# Exécuter les migrations normales
echo "=== Exécution des migrations principales ==="
bundle exec rails db:migrate

# Exécuter les migrations pour SolidQueue (production_queue)
echo "=== Exécution des migrations pour SolidQueue ==="
bundle exec rails db:migrate:with_sql \
  "SET search_path TO production_queue; $(cat db/queue_migrate/*.rb | ruby -r erb -e "puts ERB.new(ARGF.read).result")"

# Exécuter les migrations pour SolidCache (production_cache)
echo "=== Exécution des migrations pour SolidCache ==="
bundle exec rails db:migrate:with_sql \
  "SET search_path TO production_cache; $(cat db/cache_migrate/*.rb | ruby -r erb -e "puts ERB.new(ARGF.read).result")"

# Exécuter les migrations pour SolidCable (production_cable)
echo "=== Exécution des migrations pour SolidCable ==="
bundle exec rails db:migrate:with_sql \
  "SET search_path TO production_cable; $(cat db/cable_migrate/*.rb | ruby -r erb -e "puts ERB.new(ARGF.read).result")"

echo "=== Migrations terminées avec succès ===" 