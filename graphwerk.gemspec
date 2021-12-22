lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'graphwerk/version'

Gem::Specification.new do |spec|
  spec.name          = 'graphwerk'
  spec.version       = Graphwerk::VERSION
  spec.authors       = ['Samuel Giles']
  spec.email         = ['samuel.giles@bellroy.com']

  spec.summary       = "Visualise dependencies between your application and it's Packwerk packages using Graphviz."
  spec.homepage      = 'https://github.com/tricycle/graphwerk'
  spec.license       = 'MIT'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(spec|sorbet)/}) && !f.match(%r{^spec/support/factories/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'activesupport'
  spec.add_dependency 'packwerk'
  spec.add_dependency 'ruby-graphviz'
  spec.add_dependency 'sorbet-runtime'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake', '>= 12.3.3'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'sorbet'
  spec.add_development_dependency 'rspec-sorbet'
  spec.add_development_dependency 'tapioca'
end
