# typed: strict
# frozen_string_literal: true

module Graphwerk
  class Loader
    #: (Packwerk::Package package, Pathname root_path, String filename) -> void
    def initialize(package, root_path, filename)
      @package = package
      @root_path = root_path
      @filename = filename
    end

    #: -> Array[String]
    def load
      return [] unless file.exist?

      (YAML.safe_load_file(file) || {}).keys
    end

    private

    #: -> Pathname
    def file
      @file = @file #: Pathname?
      @file ||= @root_path.join(@package.name, @filename)
    end
  end
end
