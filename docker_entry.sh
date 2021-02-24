#!/bin/bash
set -e

# Check for a Gemfile in the working directory
if [ ! -f Gemfile ]; then
  echo "NOTE: hmm, I don't see a Gemfile so I don't think there's a jekyll site here"
  echo "Either you didn't mount a volume, or you mounted it incorrectly."
  echo "Mount your jekyll root directory to /usr/src/app inside the container."
  echo ""
  exit 1
fi

# Check for webrick. This is required to run jekyll in ruby 3.0
if grep -q "webrick" Gemfile; then
  echo "Webrick is present"
else
  echo "Adding webrick to avoid errors with ruby 3.0"
  bundle add webrick
fi

bundle install --retry 5 --jobs 20

exec "$@"