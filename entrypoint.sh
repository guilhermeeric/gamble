#!/bin/bash

rm -rf tmp/cache/assets
rm -f /app/tmp/pids/server.pid
rm -f config/credentials.yml.enc

echo "Preparing database..."
bundle exec rake db:prepare

echo "Starting application..."
bundle exec rails s -b '0.0.0.0' -p 3000
