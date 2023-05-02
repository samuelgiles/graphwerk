# typed: strict
# frozen_string_literal: true

module Graphwerk
  module Builders
    class Graph
      extend T::Sig

      OptionsShape = T.type_alias {
        {
          layout: Graphwerk::Layout,
          todos_color: String,
          application: T::Hash[Symbol, Object],
          graph: T::Hash[Symbol, Object],
          node: T::Hash[Symbol, Object],
          edge: T::Hash[Symbol, Object]
        }
      }

      DEFAULT_OPTIONS = T.let({
        layout: Graphwerk::Layout::Dot,
        todos_color: 'red',
        application: {
          style: 'filled',
          fillcolor: '#333333',
          fontcolor: 'white'
        },
        graph: {
          root: Constants::ROOT_PACKAGE_NAME,
          overlap: false,
          splines: true
        },
        node: {
          shape: 'box',
          style: 'rounded, filled',
          fontcolor: 'white',
          fillcolor: '#EF673E',
          color: '#EF673E',
          fontname: 'Lato'
        },
        edge: {
          len: '0.4'
        }
      }, OptionsShape)

      sig { params(package_set: Packwerk::PackageSet, options: T::Hash[Symbol, Object], root_path: Pathname).void }
      def initialize(package_set, options: {}, root_path: Pathname.new(ENV['PWD']))
        @package_set = package_set
        @options = T.let(DEFAULT_OPTIONS.deep_merge(options), OptionsShape)
        @root_path = root_path
        @graph = T.let(build_empty_graph, GraphViz)
        @nodes = T.let(build_empty_nodes, T::Hash[String, GraphViz::Node])
      end

      sig { returns(GraphViz) }
      def build
        setup_graph
        add_packages_to_graph
        add_package_dependencies_to_graph
        @graph
      end

      private

      sig { returns(GraphViz) }
      def build_empty_graph
        GraphViz.new(:strict, type: :digraph, use: @options[:layout].serialize)
      end

      sig { returns(T::Hash[String, GraphViz::Node]) }
      def build_empty_nodes
        {
          application: @graph.add_nodes(
            Constants::ROOT_PACKAGE_NAME,
            **@options[:application]
          )
        }
      end

      sig { void }
      def setup_graph
        @graph = build_empty_graph
        @nodes = build_empty_nodes
        @options[:graph].each_pair { |k,v| @graph.graph[k] =v }
        @options[:node].each_pair { |k,v| @graph.node[k] =v }
        @options[:edge].each_pair { |k,v| @graph.edge[k] =v }
      end

      sig { void }
      def add_package_dependencies_to_graph
        packages.each do |package|
          draw_dependencies(package)
          draw_todos(package)
        end
      end

      sig { void }
      def add_packages_to_graph
        packages.each do |package|
          @nodes[package.name] = @graph.add_nodes(package.name, color: package.color)
        end
      end

      sig { params(package: Presenters::Package).void }
      def draw_dependencies(package)
        package.dependencies.each do |dependency|
          unless @nodes[dependency]
            abort "Unable to add edge `#{package.name}`->`#{dependency}`"
          end
          @graph.add_edges(@nodes[package.name], @nodes[dependency], color: package.color)
        end
      end

      sig { params(package: Presenters::Package).void }
      def draw_todos(package)
        package.todos.each do |reference|
          @graph.add_edges(
            @nodes[package.name],
            @nodes[reference],
            color: @options[:todos_color]
          )
        end
      end

      sig { returns(T::Array[Presenters::Package]) }
      def packages
        @packages = T.let(@packages, T.nilable(T::Array[Presenters::Package]))
        @packages ||= @package_set.map { |package| Presenters::Package.new(package, @root_path) }
      end
    end
  end
end
