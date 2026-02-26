# typed: strict
# frozen_string_literal: true

module Graphwerk
  module Presenters
    class Package
      #: (Packwerk::Package package, Pathname root_path) -> void
      def initialize(package, root_path)
        @package = package
        @root_path = root_path
      end

      #: -> String
      def name
        package_name.node_name
      end

      #: -> Array[String]
      def dependencies
        @package.dependencies.map { |dependency| Name.new(dependency).node_name }
      end

      #: -> Array[String]
      def deprecated_references
        Loader.new(@package, @root_path, 'deprecated_references.yml').load.map do |reference|
          Name.new(reference).node_name
        end
      end

      #: -> Array[String]
      def package_todos
        Loader.new(@package, @root_path, 'package_todo.yml').load.map do |todo|
          Name.new(todo).node_name
        end
      end

      ROOT_COLOR = 'black'
      COMPONENT_COLOR = 'azure4'

      #: -> String
      def color
        return ROOT_COLOR if package_name.root?

        COMPONENT_COLOR
      end

      private

      #: -> Name
      def package_name
        @package_name = @package_name #: Name?
        @package_name ||= Name.new(@package.name)
      end

      class Name
        #: (String package_name) -> void
        def initialize(package_name)
          @package_name = package_name
        end

        #: -> String
        def node_name
          return without_root_package unless root?

          Constants::ROOT_PACKAGE_NAME
        end

        #: -> bool
        def root?
          @package_name == Packwerk::Package::ROOT_PACKAGE_NAME
        end

        private

        #: -> String
        def without_root_package
          T.must(@package_name.split('/', 2).last)
        end
      end

      private_constant :ROOT_COLOR,
                       :COMPONENT_COLOR,
                       :Name
    end
  end
end
