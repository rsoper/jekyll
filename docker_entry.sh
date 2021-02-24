#!/bin/bash
set -e

if [ ! -f Gemfile ]; then
  echo "NOTE: hmm, I don't see a Gemfile so I don't think there's a jekyll site here"
  echo "Either you didn't mount a volume, or you mounted it incorrectly."
  echo "Mount your jekyll root directory to /usr/src/app inside the container."
  echo ""
  exit 1
fi

bundle add webrick
bundle install --retry 5 --jobs 20

exec "$@"