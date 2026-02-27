# Graphwerk

Graphwerk visualises dependencies between a Rails application's [Packwerk](https://github.com/Shopify/packwerk) packages using Graphviz. It generates directed graphs showing package dependencies, deprecated references, and package TODOs.

## Project structure

- `lib/graphwerk/` - Main library code
  - `builders/graph.rb` - Core graph builder using ruby-graphviz
  - `presenters/package.rb` - Package presentation logic (naming, color, dependencies)
  - `deprecated_references_loader.rb` - Loads deprecated_references.yml files
  - `package_todo_loader.rb` - Loads package_todo.yml files
  - `layout.rb` - Sorbet enum for Graphviz layout engines
  - `constants.rb` - Shared constants
  - `railtie.rb` - Rails integration (rake tasks)
- `spec/` - RSpec test suite
- `sorbet/` - Sorbet type checking configuration

## Setup

Ruby 3.3.6 (see `.ruby-version`).

### Bundler compatibility

The system may have bundler 4.x installed, which is **incompatible with Ruby 3.3** (`uninitialized class variable @@accept_charset in CGI`). The gemspec constrains bundler to `~> 2.0`, but this only affects dependency resolution — not which `bundle` executable runs.

If `bundle install` crashes with the `@@accept_charset` error, install and use bundler 2.x explicitly:

```sh
gem install bundler -v '~> 2.0'
bundle _2.7.2_ install
bundle _2.7.2_ exec rspec spec
```

Replace `2.7.2` with whatever 2.x version was installed.

## Running tests

```sh
bundle exec rspec spec
```

Or if you need the bundler 2.x workaround:

```sh
bundle _2.7.2_ exec ruby -e "gem 'rspec-core'; load Gem.bin_path('rspec-core', 'rspec')" -- spec/
```

The `rspec` binstub may not be installed. If `bundle exec rspec` fails with `command not found: rspec`, use the ruby invocation above.

## Type checking

This project uses [Sorbet](https://sorbet.org/) for static type checking:

```sh
bundle exec srb tc
```

## CI

CI runs on GitHub Actions (`.github/workflows/ci.yml`): Sorbet type checking followed by RSpec. It targets Ruby 3.3 with `ruby/setup-ruby` which installs bundler 2.x, so the bundler 4.x issue does not apply in CI.

## Code conventions

- All files use `# typed: strict` or `# typed: false` Sorbet sigils and `# frozen_string_literal: true`.
- Method signatures use Sorbet `sig` blocks.
- Specs live under `spec/lib/` mirroring `lib/` structure.
- The root Packwerk package (`.`) is presented as `"Application"` in graphs.
