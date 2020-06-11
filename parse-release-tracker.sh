#!/bin/bash

# msg=$(git tag -l --format='%(body)' v0.1.0)
# msg=$(echo $msg)
# echo "|" $msg "|"

while IFS=$'\n: ' read -r line cmd; do
    echo "$line"
    echo "$cmd"
done < <(git tag -l --format='%(body)' v0.1.0)
