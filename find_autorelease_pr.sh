#!/bin/bash

# set -x

pr=$(hub api --paginate graphql -f query='
{
  repository(name: "gh-release-automation-testing", owner: "tamalsaha") {
    pullRequests(labels: "release", first: 1, states: OPEN) {
      edges {
        node {
          milestone {
            title
          }
          number
        }
      }
    }
  }
}
')

echo $pr

# --join-output / -j:
# Like -r but jq won't print a newline after each output

pr_number=$(echo $pr | jq -j '.data.repository.pullRequests.edges[0].node.number')
tag=$(echo $pr | jq -j '.data.repository.pullRequests.edges[0].node.milestone.title')

echo $pr_number
echo $tag
