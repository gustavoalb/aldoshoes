#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /myapp/tmp/pids/server.pid

# Check and install pending gems if they exist
bundle check || bundle

# Create the DB if it doesn't exist, and execute migrations
while ! mysql -h db --user=$DB_USER --password=$DB_PASS -e "SELECT 1" >/dev/null 2>&1; do
  sleep 2
done
rake db:create
rake db:migrate

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
