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
