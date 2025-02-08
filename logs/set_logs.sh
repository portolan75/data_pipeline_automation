#!/usr/bin/env bash
BRANCH="main"

# Save the current datetime into a log file (./logs/log.txt).
date >> ./logs/log.txt

# If a repository is owned by a different user (e.g., inside a Docker container, CI/CD pipeline, or GitHub Actions), Git blocks access to prevent security risks.
# This command whitelists the current directory (at global level, not only at repo level), preventing Git from refusing to operate inside it.
# So we're giving permissions to the machine we're running the workflow to write back to the repository.
p=$(pwd)
git config --global --add safe.directory $p

# If there are any changes in the repo then ...
if [["$(git status --porcelain)" != ""]]; then
    git config --global user.name $USER_NAME
    git config --global user.email $USER_EMAIL
    git add logs/log.txt
    git commit -m "update the log"
    git push origin $BRANCH
else
echo "No logs to update/commit"
fi