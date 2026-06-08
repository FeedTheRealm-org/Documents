# Feed the Realm — Documents

LaTeX-based academic and technical documentation for the Feed the Realm project. PDFs are automatically compiled and published as GitHub Releases on every version tag.

## Releasing a Document

Once the LaTeX source is ready, create a version tag to trigger the build-and-release pipeline:

```bash
git tag -a v1.0.0 -m "Release version 1.0.0"
git push --tags
```

The compiled PDFs will be available at:

```
https://github.com/FeedTheRealm-org/Documents/releases/tag/v1.0.0
```

## Adding a New Document

1. Create a new folder with the LaTeX source (a `main.tex` as entrypoint).
2. Register it in `files.yaml`:

```yaml
# Example
proposal:
  name: your_document_name
  description: Build the proposal document using LaTeX
  entrypoint: ./your-folder
```

3. Tag and push to trigger the release pipeline.

## Makefile Commands

Compilation runs inside Docker to avoid requiring a local LaTeX installation.

```bash
make image       # Build the Docker image with the LaTeX environment
make run         # Compile all documents defined in files.yaml
make run-<name>  # Compile only the specified document (replace <name> with document key)
make clean       # Remove all generated PDF files from the root directory
```
