# typed: strict
# frozen_string_literal: true

module Graphwerk
  class Loader
    extend T::Sig

    sig { params(package: Packwerk::Package, root_path: Pathname, filename: String).void }
    def initialize(package, root_path, filename)
      @package = package
      @root_path = root_path
      @filename = filename
    end

    sig { returns(T::Array[String]) }
    def load
      return [] if !file.exist?

      (YAML.safe_load_file(file) || {}).keys
    end

    private

    sig { returns(Pathname) }
    def file
      @file = T.let(@file, T.nilable(Pathname))
      @file ||= @root_path.join(@package.name, @filename)
    end
  end
end
