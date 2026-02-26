# typed: strict
# frozen_string_literal: true

module Graphwerk
  module Builders
    class Graph
      OptionsShape = T.type_alias {
        {
          layout: Graphwerk::Layout,
          deprecated_references_color: String,
          package_todo_color: String,
          hide_todo: T::Boolean,
          application: T::Hash[Symbol, Object],
          graph: T::Hash[Symbol, Object],
          node: T::Hash[Symbol, Object],
          edge: T::Hash[Symbol, Object]
        }
      }

      DEFAULT_OPTIONS = {
        layout: Graphwerk::Layout::Dot,
        deprecated_references_color: 'red',
        package_todo_color: 'red',
        hide_todo: false,
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
      } #: OptionsShape

      #: (Packwerk::PackageSet package_set, ?options: Hash[Symbol, Object], ?root_path: Pathname) -> void
      def initialize(package_set, options: {}, root_path: Pathname.new(Dir.pwd))
        @package_set = package_set
        @options = DEFAULT_OPTIONS.deep_merge(options) #: OptionsShape
        @root_path = root_path
        @graph = build_empty_graph #: GraphViz
        @nodes = build_empty_nodes #: Hash[String, GraphViz::Node]
      end

      #: -> GraphViz
      def build
        setup_graph
        add_packages_to_graph
        add_package_dependencies_to_graph
        @graph
      end

      private

      #: -> GraphViz
      def build_empty_graph
        GraphViz.new(:strict, type: :digraph, use: @options[:layout].serialize)
      end

      #: -> Hash[String, GraphViz::Node]
      def build_empty_nodes
        {
          application: @graph.add_nodes(
            Constants::ROOT_PACKAGE_NAME,
            **@options[:application]
          )
        }
      end

      #: -> void
      def setup_graph
        @graph = build_empty_graph
        @nodes = build_empty_nodes
        @options[:graph].each_pair { |k,v| @graph.graph[k] =v }
        @options[:node].each_pair { |k,v| @graph.node[k] =v }
        @options[:edge].each_pair { |k,v| @graph.edge[k] =v }
      end

      #: -> void
      def add_package_dependencies_to_graph
        packages.each do |package|
          draw_dependencies(package)
          next if @options[:hide_todo]

          draw_deprecated_references(package)
          draw_package_todos(package)
        end
      end

      #: -> void
      def add_packages_to_graph
        packages.each do |package|
          @nodes[package.name] = @graph.add_nodes(package.name, color: package.color)
        end
      end

      #: (Presenters::Package package) -> void
      def draw_dependencies(package)
        package.dependencies.each do |dependency|
          unless @nodes[dependency]
            abort "Unable to add edge `#{package.name}`->`#{dependency}`"
          end
          @graph.add_edges(@nodes[package.name], @nodes[dependency], color: package.color)
        end
      end

      #: (Presenters::Package package) -> void
      def draw_deprecated_references(package)
        package.deprecated_references.each do |reference|
          next unless @nodes[reference]

          @graph.add_edges(
            @nodes[package.name],
            @nodes[reference],
            color: @options[:deprecated_references_color]
          )
        end
      end

      #: (Presenters::Package package) -> void
      def draw_package_todos(package)
        package.package_todos.each do |todo|
          next unless @nodes[todo]

          @graph.add_edges(
            @nodes[package.name],
            @nodes[todo],
            color: @options[:package_todo_color]
          )
        end
      end

      #: -> Array[Presenters::Package]
      def packages
        @packages = @packages #: Array[Presenters::Package]?
        @packages ||= @package_set.map { |package| Presenters::Package.new(package, @root_path) }
      end
    end
  end
end
