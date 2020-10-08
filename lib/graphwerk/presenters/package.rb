# typed: strict
# frozen_string_literal: true

module Graphwerk
  module Presenters
    class Package
      extend T::Sig

      sig { params(package: Packwerk::Package).void }
      def initialize(package)
        @package = package
      end

      WITHOUT_ROOT_FOLDER = T.let(
        ->(package_name) { package_name.split('/', 2).last },
        T.proc.params(package_name: String).returns(String)
      )

      sig { returns(String) }
      def name
        return WITHOUT_ROOT_FOLDER.call(@package.name) unless root?

        Constants::ROOT_PACKAGE_NAME
      end

      sig { returns(T::Array[String]) }
      def dependencies
        @package.dependencies.map { |dependency| WITHOUT_ROOT_FOLDER.call(dependency) }
      end

      ROOT_COLOR = 'black'
      COMPONENT_COLOR = 'azure4'

      sig { returns(String) }
      def color
        return ROOT_COLOR if root?

        COMPONENT_COLOR
      end

      private

      ROOT_PACKAGE = '.'

      sig { returns(T::Boolean) }
      def root?
        @package.name == ROOT_PACKAGE
      end

      private_constant :ROOT_PACKAGE,
                       :ROOT_COLOR,
                       :COMPONENT_COLOR,
                       :WITHOUT_ROOT_FOLDER
    end
  end
end
