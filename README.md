# Documents

Repository for Latex-based documentation.

## How to release

Once the latex is written and you want to compile and release it, a `tag` needs
to be created with the format `vx.x.x`.

```bash
# Example tagging
git tag -a v1.0.0 -m "Release version 1.0.0" # Marks the latest commit with the tag
git push --tags
```

Additionally if a new folder was added, its necessary to add it to `files.yaml`:

```yaml
# Example
proposal:
  name: proposal
  description: Build the proposal document using LaTeX
  entrypoint: ./proposal
```

On this push, the *build-release pipeline* will start running and contents will
be found at `https://github.com/FeedTheRealm-org/Documents/releases/tag/v1.0.0`.

