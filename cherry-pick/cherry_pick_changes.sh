#!/bin/bash

# Check if at least one commit SHA is provided as an argument
if [ "$#" -eq 0 ]; then
  echo "Usage: $0 <commit_sha_to_cherry-pick> [commit_sha2_to_cherry-pick] ..."
  exit 1
fi

# Generate a branch name with the format release/user_name_date_time
branch_name="release_$(whoami)_$(date +"%Y%m%d_%H%M%S")"
echo "Release branch name: $branch_name"

# Create a new branch 'changes' from 'main'
git checkout develop
git fetch
git pull origin develop
git checkout main
git pull origin main
git checkout -b "$branch_name"

# Merge each specified commit from the 'develop' branch
for commit_to_merge in "$@"; do
  git cherry-pick "$commit_to_merge"
done

# push the release to the remote repository
git push origin "$branch_name"
