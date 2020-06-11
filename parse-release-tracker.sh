#!/bin/bash

# msg=$(git tag -l --format='%(body)' v0.1.0)
# msg=$(echo $msg)
# echo "|" $msg "|"

parse_url() {
    proto="$(echo $1 | grep :// | sed -e's,^\(.*://\).*,\1,g')"
    # remove the protocol
    url="$(echo ${1/$proto/})"
    # # extract the user (if any)
    # userpass="$(echo $url | grep @ | cut -d@ -f1)"
    # pass="$(echo $userpass | grep : | cut -d: -f2)"
    # if [ -n "$pass" ]; then
    #     user="$(echo $userpass | grep : | cut -d: -f1)"
    # else
    #     user=$userpass
    # fi

    # # extract the host
    # host="$(echo ${url/$user@/} | cut -d/ -f1)"
    # # by request - try to extract the port
    # port="$(echo $host | sed -e 's,^.*:,:,g' -e 's,.*:\([0-9]*\).*,\1,g' -e 's,[^0-9],,g')"
    # # extract the path (if any)
    # path="$(echo $url | grep / | cut -d/ -f2-)"

    # echo "url" $url
    # echo "proto" $proto
    # echo "host" $host
    # echo "path" $path

    IFS='/'                 # / is set as delimiter
    read -ra PATH <<<"$url" # str is read into an array as tokens separated by IFS
	if [ ${PATH[0]} != 'github.com' ] || [ ${#PATH[@]} -ne 5 ]; then
		echo "failed to parse relase-tracker: $url"
		exit 1
	fi
    echo "REPOSITORY_OWNER" ${PATH[1]}
    echo "REPOSITORY_NAME" ${PATH[2]}
    echo "PR_NUMBER" ${PATH[4]}
}

while IFS=$': \t' read -r marker x; do
    if [ "$marker" = "Release-tracker" ]; then
        echo $x
        parse_url "$x"
    fi
done < <(git tag -l --format='%(body)' v0.1.0)
