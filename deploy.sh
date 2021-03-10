# Temporarily store uncommited changes
git stash

# Verify correct branch
git checkout develop

# Build new files
cabal run site clean
cabal run site build

# Get previous files
git fetch --all
git checkout -b main --track origin/main

# Overwrite existing files with new files
cp -a _site/. .

# Commit
git add -A
git commit -m "Publish."

# Push
git push origin main:main

# Restoration
git checkout develop
git branch -D main
git stash pop