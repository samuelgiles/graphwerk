# typed: strict
# frozen_string_literal: true

module Graphwerk
  module Presenters
    class Package
      extend T::Sig

      sig { params(package: Packwerk::Package, root_path: Pathname).void }
      def initialize(package, root_path)
        @package = package
        @root_path = root_path
      end

      sig { returns(String) }
      def name
        package_name.node_name
      end

      sig { returns(T::Array[String]) }
      def dependencies
        @package.dependencies.map { |dependency| Name.new(dependency).node_name }
      end

      sig { returns(T::Array[String]) }
      def todos
        PackageTodoLoader.new(@package, @root_path).load.map do |reference|
          Name.new(reference).node_name
        end
      end

      ROOT_COLOR = 'black'
      COMPONENT_COLOR = 'azure4'

      sig { returns(String) }
      def color
        return ROOT_COLOR if package_name.root?

        COMPONENT_COLOR
      end

      private

      sig { returns(Name) }
      def package_name
        @package_name = T.let(@package_name, T.nilable(Name))
        @package_name ||= Name.new(@package.name)
      end

      class Name
        extend T::Sig

        sig { params(package_name: String).void }
        def initialize(package_name)
          @package_name = package_name
        end

        sig { returns(String) }
        def node_name
          return without_root_package unless root?

          Constants::ROOT_PACKAGE_NAME
        end

        sig { returns(T::Boolean) }
        def root?
          @package_name == Packwerk::Package::ROOT_PACKAGE_NAME
        end

        private

        sig { returns(String) }
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
