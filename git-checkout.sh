#!/usr/bin/env bash

branch_name=$(git branch | fzf | tr -d "\n" | tr -d " ")

git checkout "$branch_name" >/dev/null || exit

if git ls-remote origin "$branch_name" >/dev/null | grep -E '.*' ; then
    git pull --ff-only 
fi

read -p "Install dependencies (y/n)?" choice
case "$choice" in 
  y|Y ) yarn;;
  n|N ) exit 0;;
  * ) yarn;;
esac
 
