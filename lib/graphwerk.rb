# typed: true
# frozen_string_literal: true

require 'sorbet-runtime'
require 'packwerk'
require 'ruby-graphviz'
require 'active_support/core_ext/hash/deep_merge'
require 'graphwerk/version'
require 'graphwerk/constants'
require 'graphwerk/layout'
require 'graphwerk/package_todo_loader'
require 'graphwerk/presenters/package'
require 'graphwerk/builders/graph'
require 'graphwerk/railtie' if defined?(Rails)

module Graphwerk
  def self.for_application(**args)
    Graphwerk::Builders::Graph.new(
      Packwerk::PackageSet.load_all_from(".")
    ).build.output(args)
  end
end
