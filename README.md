# gh-release-automation-testing

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

## Branch checkout Alg

```
# https://github.com/cloudflare/semver_bash

major, minor, patch, special := parse_semver_tag $tag

if $tag exists
	return # do nothing


if patch > 0 && special == ""
	# this is a patch release
	if `release-$major.$minor.$patch` or `release-$major.$minor` branch exists
		- git tag -fa $tag -m $tag -m "Release-tracker: $url"
		- git push -u origin HEAD --tags
	else
		_PANIC_ "please cherry pick all commits for a patch release"

else if patch == 0
    # this a pre-release or minor or major release
	if `release-$major.$minor` branch exists
		- git checkout release-$major.$minor
		- git merge master
		- git tag -fa $tag -m $tag -m "Release-tracker: $url"
		- git push -u origin HEAD --tags
	else
		- git checkout master
		- git checkout release-$major.$minor
		- git tag -fa $tag -m $tag -m "Release-tracker: $url"
		- git push -u origin HEAD --tags
```
