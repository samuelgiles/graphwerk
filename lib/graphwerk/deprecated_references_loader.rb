# typed: strict
# frozen_string_literal: true

module Graphwerk
  class DeprecatedReferencesLoader
    extend T::Sig

    sig { params(package: Packwerk::Package, root_path: Pathname).void }
    def initialize(package, root_path)
      @package = package
      @root_path = root_path
    end

    sig { returns(T::Array[String]) }
    def load
      return [] if !deprecated_references_file.exist?

      (YAML.load_file(deprecated_references_file) || {}).keys
    end

    private

    DEPRECATED_REFERENCES_FILENAME = 'deprecated_references.yml'

    sig { returns(Pathname) }
    def deprecated_references_file
      @deprecated_references_file = T.let(@deprecated_references_file, T.nilable(Pathname))
      @deprecated_references_file ||= @root_path.join(@package.name, DEPRECATED_REFERENCES_FILENAME)
    end
  end
end
