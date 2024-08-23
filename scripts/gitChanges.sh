#!/bin/bash
# Usage example: ./gitScript.sh "2 weeks ago" "github" > changes.txt

function repo_diff {
	if [ -z "$1" ]; then time_range="2 weeks ago"; else time_range="$1"; fi
	if [ -z "$2" ]; then remote="origin"; else remote="$2"; fi

	remote_exists=$(git remote | grep "$remote")
	echo "$remote_exists"
	if [ -z "$remote_exists" ]; then echo "Remote $remote doesn't exist.  Please specify using the 2nd parameter" && exit -1; fi

	for branch in $(git branch -r | grep -v '\->'); do
		echo "Branch: $branch"
		for commit in $(git log --pretty=format:"%H" -n 5 "$branch"); do
			echo "Commit: $commit"
			git log --since="$time_range" -p ':(exclude)**/package-lock.json' ':(exclude)**/node_modules/**' ':(exclude)**/*.svg' ':(exclude)**/*.png' ':(exclude)**/*.jpg' ':(exclude)**/*.jpeg' ':(exclude)**/*.gif' ':(exclude)**/*.bmp' ':(exclude)**/*.tiff' ':(exclude)**/*.ico' ':(exclude)**/*.webp'
			echo
		done
		echo
	done
}

git fetch --prune
repo_diff "$@"
