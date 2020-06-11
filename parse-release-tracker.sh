#!/bin/bash

# msg=$(git tag -l --format='%(body)' v0.1.0)
# msg=$(echo $msg)
# echo "|" $msg "|"

while IFS=$': \t' read -r line cmd; do
    if [ "$line" = "Release-tracker" ]; then
        echo "$line"
        echo "$cmd"
    fi
done < <(git tag -l --format='%(body)' v0.1.0)
