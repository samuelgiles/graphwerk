---
applyTo: '{lib/graphwerk/version.rb,CHANGELOG.md}'
---

# Gem Release Process

1. Update the version number in `lib/graphwerk/version.rb`.
2. Update the changelog file (`CHANGELOG.md`) with a summary of changes.
3. Commit your changes with a message that follows the format `Release vX.Y.Z`.
4. Use `bundle exec rake release` to push the changes to RubyGems.
5. Push the `Release vX.Y.Z` commit to `main` along with tags.

## Additional information

- Look at the commit log to find changes merged since the last release.
- Remove any "Unreleased" sections from the changelog.
