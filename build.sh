#!/bin/bash
#
# AUTOMATED BUILD & COMMIT
#
# Change to reflect your environment before use!
# Best used with git user cache.
#
# Currently assumes main branch at ~/tilai-19 and gh-pages branch at ~/gh-pages/tilai-19/
#

# change into source root
cd ~/tilai-19/

# build website
bundle exec middleman build

# move the build website on top of the website branch of repo
cp -r ~/tilai-19/build/* ~/gh-pages/tilai-19/
rm -R ./build

# Website branch commit & push
git -C ~/gh-pages/tilai-19/ commit -a -m "$(curl -s whatthecommit.com/index.txt)"
git -C ~/gh-pages/tilai-19/ push

# Main branch commit & push
git commit -a -m "$(curl -s whatthecommit.com/index.txt)"
git push

