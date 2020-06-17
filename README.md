# gh-release-automation-testing

```sh
release-automaton \
    --release-tracker=https://github.com/appscodelabs/gh-release-automation-testing/pull/21 \
    --comment-id=645104095 \
    --release=v2020.6.16 \
    --release-file=./v2020.6.16/release.json
```

## Project Version number scheme

`vYYYY.M.B`

- 4 digit year
- Month(1-12) of the year `date +%-m`
- Build of the week starting with 0

For alpha, beta and rc releases, we add `-(alpha|beta|rc).N` suffix.

Our project version scheme does not follow semver but it maintains 2 important properties:

- It can be parsed by any semver library
- Sorting release versions as semver will return them in chronological order. So, you will be easily tell which version was released later.

## Show tag message

- https://stackoverflow.com/questions/5358336/how-to-list-all-tags-along-with-the-full-message-in-git

```
$ git tag -fa v0.1.0 -m v0.1.0 -m "Release-tracker: https://github.com/tamalsaha/gh-release-automation-testing/pull/3"

$ git tag -l --format='%(tag) %(subject) %(body)' v0.1.0

$ git tag -l --format='%(contents)' v0.1.0
```

## URL parsing

- https://gist.github.com/joshisa/297b0bc1ec0dcdda0d1625029711fa24

## How to check if a git branch exists in the local/remote repository?

- https://gist.github.com/tamalsaha/b8b30e8391705595c00be57d736d95ee

## Parsing Semver in Bash

- https://github.com/cloudflare/semver_bas

## Branch checkout Alg

```
major, minor, patch, special := parse_semver_tag $tag

if $tag exists
	return # do nothing


if patch > 0 && special == ""
	# this is a patch release
	if `release-$major.$minor.$patch` or `release-$major.$minor` branch exists
		- git tag -a $tag -m $tag -m "Release-tracker: $url"
		- git push -u origin HEAD --tags
	else
		_PANIC_ "please cherry pick all commits for a patch release"

else if patch == 0
    # this a pre-release or minor or major release
	if `release-$major.$minor` branch exists
		- git checkout release-$major.$minor
		- git merge master
		- git tag -a $tag -m $tag -m "Release-tracker: $url"
		- git push -u origin HEAD --tags
	else
		- git checkout master
		- git checkout -b release-$major.$minor
		- git tag -a $tag -m $tag -m "Release-tracker: $url"
		- git push -u origin HEAD --tags
```

## Multi-module Go repo

Does not support multiple Go modules per repo.

## List commits between 2 commit hashes in git

```
# [commit1, commit2]
git log --oneline --ancestry-path commit1..commit2

git log --oneline --ancestry-path v0.9.0-rc.0..v0.9.0-rc.1

# commit url
# https://github.com/kubernetes/apimachinery/commit/385a554aa7b4f08109ae39b86475fb111d053f69
```

## How to tag an older commit in Git?

```sh
git tag -a v1.2 9fceb02 -m "Message here"
```

- https://stackoverflow.com/questions/4404172/how-to-tag-an-older-commit-in-git

## Git Reset

```sh
git reset --hard cedc856
```

## How To Delete Local and Remote Tags on Git

- https://devconnected.com/how-to-delete-local-and-remote-tags-on-git/

```sh
$ git tag -d <tag_name>

$ git push --delete origin tagname
$ git push origin :refs/tags/<tag>
```