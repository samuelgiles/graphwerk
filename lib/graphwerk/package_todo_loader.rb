# typed: strict
# frozen_string_literal: true

module Graphwerk
  class PackageTodoLoader
    extend T::Sig

    sig { params(package: Packwerk::Package, root_path: Pathname).void }
    def initialize(package, root_path)
      @package = package
      @root_path = root_path
    end

    sig { returns(T::Array[String]) }
    def load
      return [] if !package_todo_file.exist?

      (YAML.load_file(package_todo_file) || {}).keys
    end

    private

    PACKAGE_TODO_FILENAME = 'package_todo.yml'

    sig { returns(Pathname) }
    def package_todo_file
      @package_todo_file = T.let(@package_todo_file, T.nilable(Pathname))
      @package_todo_file ||= @root_path.join(@package.name, PACKAGE_TODO_FILENAME)
    end
  end
end
