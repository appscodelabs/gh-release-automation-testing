#!/bin/bash

# GITHUB_REF=refs/heads/master
# GITHUB_REF=refs/tags/v0.1.5

GITHUB_REPOSITORY=tamalsaha/gh-release-automation-testing
GITHUB_REPOSITORY_OWNER=tamalsaha
GITHUB_REPOSITORY_NAME=${GITHUB_REPOSITORY#$GITHUB_REPOSITORY_OWNER"/"}
echo $GITHUB_REPOSITORY_NAME

$ hub api --paginate graphql -f query='
  query($endCursor: String) {
    repositoryOwner(login: "USER") {
      repositories(first: 100, after: $endCursor) {
        nodes {
          nameWithOwner
        }
        pageInfo {
          hasNextPage
          endCursor
        }
      }
    }
  }
'

--obey-ratelimit --flat

$ hub api --paginate graphql -f query='
  query($endCursor: String) {
    repositoryOwner(login: "USER") {
      repositories(first: 100, after: $endCursor) {
        nodes {
          nameWithOwner
        }
        pageInfo {
          hasNextPage
          endCursor
        }
      }
    }
  }
'


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
