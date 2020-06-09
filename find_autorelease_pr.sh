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

pr_number=$(echo $pr | jq -r '.data.repository.pullRequests.edges[0].node.number')
tag=$(echo $pr | jq -r '.data.repository.pullRequests.edges[0].node.milestone.title')

echo $pr_number
echo $tag
