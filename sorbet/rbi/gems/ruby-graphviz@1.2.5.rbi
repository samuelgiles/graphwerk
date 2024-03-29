# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `ruby-graphviz` gem.
# Please instead update this file by running `bin/tapioca gem ruby-graphviz`.

::RUBY19 = T.let(T.unsafe(nil), TrueClass)
class AttributeException < ::RuntimeError; end
class BoolException < ::RuntimeError; end
class ColorException < ::RuntimeError; end

class Dot2Ruby
  include ::GraphViz::Utils

  def initialize(xGVPath, xOutFile, xOutFormat = T.unsafe(nil)); end

  def eval(xFile); end
  def eval_string(data); end
  def run(xFile); end
end

class DoubleException < ::RuntimeError; end

class GraphViz
  include ::GraphViz::Constants
  include ::GraphViz::Utils

  def initialize(xGraphName, hOpts = T.unsafe(nil), &block); end

  def -(oNode); end
  def <<(oNode); end
  def >(oNode); end
  def >>(oNode); end
  def [](xAttrName); end
  def []=(xAttrName, xValue); end
  def add(h); end
  def add_edge(oNodeOne, oNodeTwo, hOpts = T.unsafe(nil)); end
  def add_edges(node_one, node_two, options = T.unsafe(nil)); end
  def add_graph(xGraphName = T.unsafe(nil), hOpts = T.unsafe(nil), &block); end
  def add_node(xNodeName, hOpts = T.unsafe(nil)); end
  def add_nodes(node_name, options = T.unsafe(nil)); end
  def append_attributes_and_types(script); end
  def complete; end
  def complete!; end
  def directed?; end
  def each_attribut(&b); end
  def each_attribute(&b); end
  def each_edge(&block); end
  def each_graph(&block); end
  def each_node(&block); end
  def edge; end
  def edge=(_arg0); end
  def edge_attrs; end
  def edge_count; end
  def enumerate_nodes; end
  def find_node(name); end
  def get_edge_at_index(index); end
  def get_graph(xGraphName, &block); end
  def get_node(xNodeName, &block); end
  def get_node_at_index(index); end
  def graph; end
  def graph=(_arg0); end
  def graph_attrs; end
  def graph_count; end
  def has_parent_graph?; end
  def id; end
  def method_missing(idName, *args, &block); end
  def name; end
  def node; end
  def node=(_arg0); end
  def node_attrs; end
  def node_count; end
  def output(hOpts = T.unsafe(nil)); end
  def pg; end
  def pg=(x); end
  def root_graph; end
  def save(hOpts = T.unsafe(nil)); end
  def search_node(name); end
  def set_position(xType, xKey, xValue); end
  def subgraph(xGraphName = T.unsafe(nil), hOpts = T.unsafe(nil), &block); end
  def to_graph; end
  def to_s; end
  def type; end
  def type=(x); end

  private

  def add_hash_edge(node, hash); end

  class << self
    def commonGraph(o1, o2); end
    def default(hOpts); end
    def digraph(xGraphName, hOpts = T.unsafe(nil), &block); end
    def escape(str, opts = T.unsafe(nil)); end
    def generate(num_nodes, num_edges, directed = T.unsafe(nil), weight_range = T.unsafe(nil)); end
    def graph(xGraphName, hOpts = T.unsafe(nil), &block); end
    def options(hOpts); end
    def parse(xFile, hOpts = T.unsafe(nil), &block); end
    def parse_string(str, hOpts = T.unsafe(nil), &block); end
    def strict_digraph(xGraphName, hOpts = T.unsafe(nil), &block); end
  end
end

class GraphViz::Attrs
  def initialize(gviz, name, attributes); end

  def [](key); end
  def []=(key, value); end
  def data; end
  def data=(_arg0); end
  def each; end
  def to_h; end
end

module GraphViz::Constants
  class << self
    def getAttrsFor(x); end
  end
end

GraphViz::Constants::EDGESATTRS = T.let(T.unsafe(nil), Hash)
GraphViz::Constants::FORMATS = T.let(T.unsafe(nil), Array)
GraphViz::Constants::GENCS_ATTRS = T.let(T.unsafe(nil), Hash)
GraphViz::Constants::GRAPHSATTRS = T.let(T.unsafe(nil), Hash)
GraphViz::Constants::GRAPHTYPE = T.let(T.unsafe(nil), Array)
GraphViz::Constants::NODESATTRS = T.let(T.unsafe(nil), Hash)
GraphViz::Constants::PROGRAMS = T.let(T.unsafe(nil), Array)
GraphViz::Constants::RGV_VERSION = T.let(T.unsafe(nil), String)

class GraphViz::DOTScript
  extend ::Forwardable

  def initialize; end

  def <<(line); end
  def add_type(type, data); end
  def append(line); end
  def end_with?(*args, &block); end
  def make_subgraph(name); end
  def prepend(line); end
  def to_s; end
  def to_str; end

  private

  def append_statement(statement); end
  def assure_ends_with(str, ending = T.unsafe(nil)); end
end

class GraphViz::DOTScriptData
  def initialize(type = T.unsafe(nil)); end

  def <<(data); end
  def add_attribute(name, value); end
  def append(data); end
  def empty?; end
  def to_s; end
  def to_str; end
  def type; end
  def type=(_arg0); end

  private

  def determine_separator; end
end

class GraphViz::Edge
  include ::GraphViz::Constants

  def initialize(vNodeOne, vNodeTwo, parent_graph); end

  def -(node); end
  def <<(node); end
  def >(node); end
  def >>(node); end
  def [](attribute_name); end
  def []=(attribute_name, attribute_value); end
  def each_attribut(global = T.unsafe(nil), &b); end
  def each_attribute(global = T.unsafe(nil), &b); end
  def head_node(with_port = T.unsafe(nil), escaped = T.unsafe(nil)); end
  def index; end
  def index=(i); end
  def method_missing(idName, *args, &block); end
  def node_one(with_port = T.unsafe(nil), escaped = T.unsafe(nil)); end
  def node_two(with_port = T.unsafe(nil), escaped = T.unsafe(nil)); end
  def output(oGraphType); end
  def pg; end
  def root_graph; end
  def set(&b); end
  def tail_node(with_port = T.unsafe(nil), escaped = T.unsafe(nil)); end

  private

  def getNodeNameAndPort(node); end
end

class GraphViz::Elements
  def initialize; end

  def [](index, type = T.unsafe(nil)); end
  def each(&b); end
  def push(obj); end
  def size_of(type); end
end

class GraphViz::Ext
  class << self
    def find(ext = T.unsafe(nil)); end
  end
end

class GraphViz::Node
  include ::GraphViz::Constants

  def initialize(node_id, parent_graph); end

  def -(node); end
  def <<(node); end
  def >(node); end
  def >>(node); end
  def [](attribute_name); end
  def []=(attribute_name, attribute_value); end
  def each_attribut(global = T.unsafe(nil), &b); end
  def each_attribute(global = T.unsafe(nil), &b); end
  def id; end
  def incidents; end
  def index; end
  def index=(i); end
  def method_missing(idName, *args, &block); end
  def neighbors; end
  def output; end
  def pg; end
  def root_graph; end
  def set(&b); end
end

class GraphViz::Types; end

class GraphViz::Types::ArrowType < ::GraphViz::Types::Common
  def check(data); end
  def output; end
  def to_gv; end
  def to_ruby; end
  def to_s; end
end

class GraphViz::Types::Color < ::GraphViz::Types::Common
  def check(data); end
  def output; end
  def to_gv; end
  def to_ruby; end
  def to_s; end
end

GraphViz::Types::Color::HEX_FOR_COLOR = T.let(T.unsafe(nil), Regexp)
GraphViz::Types::Color::RGBA = T.let(T.unsafe(nil), Regexp)

class GraphViz::Types::ColorList < ::GraphViz::Types::Common
  def check(data); end
  def output; end
  def to_gv; end
  def to_ruby; end
  def to_s; end
end

class GraphViz::Types::Common
  def initialize(data); end

  def output; end
  def source; end
end

class GraphViz::Types::EscString < ::GraphViz::Types::Common
  def check(data); end
  def output; end
  def to_gv; end
  def to_ruby; end
  def to_s; end
end

class GraphViz::Types::GvBool < ::GraphViz::Types::Common
  def check(data); end
  def output; end
  def to_gv; end
  def to_ruby; end
  def to_s; end
end

GraphViz::Types::GvBool::BOOL_FALSE = T.let(T.unsafe(nil), Array)
GraphViz::Types::GvBool::BOOL_TRUE = T.let(T.unsafe(nil), Array)

class GraphViz::Types::GvDouble < ::GraphViz::Types::Common
  def check(data); end
  def output; end
  def to_f; end
  def to_gv; end
  def to_ruby; end
  def to_s; end
end

GraphViz::Types::GvDouble::FLOAT_MASK = T.let(T.unsafe(nil), Regexp)

class GraphViz::Types::HtmlString < ::GraphViz::Types::Common
  def check(data); end
  def output; end
  def to_gv; end
  def to_ruby; end
  def to_s; end
end

class GraphViz::Types::LblString < ::GraphViz::Types::Common
  def check(data); end
  def output; end
  def to_gv; end
  def to_ruby; end
  def to_s; end
end

class GraphViz::Types::Rect < ::GraphViz::Types::Common
  def check(data); end
  def output; end
  def to_gv; end
  def to_ruby; end
  def to_s; end
end

GraphViz::Types::Rect::FLOAT_MASK = T.let(T.unsafe(nil), Regexp)
GraphViz::Types::Rect::RECT_FINAL_MASK = T.let(T.unsafe(nil), Regexp)

class GraphViz::Types::SplineType < ::GraphViz::Types::Common
  def check(data); end
  def endp; end
  def output; end
  def point; end
  def startp; end
  def to_gv; end
  def to_s; end
  def triples; end

  private

  def point?; end
  def splite_type?; end
end

GraphViz::Types::SplineType::ENDP_MASK = T.let(T.unsafe(nil), Regexp)
GraphViz::Types::SplineType::FINAL_POINT_MASK = T.let(T.unsafe(nil), Regexp)
GraphViz::Types::SplineType::FINAL_SPLINE_MASK = T.let(T.unsafe(nil), Regexp)
GraphViz::Types::SplineType::FLOAT_MASK = T.let(T.unsafe(nil), Regexp)
GraphViz::Types::SplineType::POINT_MASK = T.let(T.unsafe(nil), Regexp)
GraphViz::Types::SplineType::SPLINE_MASK = T.let(T.unsafe(nil), Regexp)
GraphViz::Types::SplineType::STARTP_MASK = T.let(T.unsafe(nil), Regexp)
GraphViz::Types::SplineType::TRIPLE_MASK = T.let(T.unsafe(nil), Regexp)

module GraphViz::Utils
  def find_executable(bin, custom_paths); end
  def output_and_errors_from_command(cmd); end
  def output_from_command(cmd); end
end

class GraphViz::Utils::Colors
  def initialize; end

  def a; end
  def b; end
  def g; end
  def h; end
  def hsv(h, s, v); end
  def hsv_string(s = T.unsafe(nil)); end
  def hsv_to_rgb(h, s, v); end
  def name(c = T.unsafe(nil)); end
  def r; end
  def rgb(r, g, b, a = T.unsafe(nil)); end
  def rgb_to_hsv(r, g, b); end
  def rgba_string(c = T.unsafe(nil)); end
  def s; end
  def v; end

  class << self
    def hsv(h, s, v); end
    def hsv_to_rgb(h, s, v); end
    def name(c); end
    def rgb(r, g, b, a = T.unsafe(nil)); end
    def rgb_to_hsv(r, g, b); end
  end
end

GraphViz::Utils::Colors::COLORS = T.let(T.unsafe(nil), Hash)
GraphViz::Utils::Colors::HEX_FOR_COLOR = T.let(T.unsafe(nil), Regexp)
GraphViz::Utils::Colors::RGBA = T.let(T.unsafe(nil), Regexp)

class Hash
  include ::Enumerable
  include ::JSON::Ext::Generator::GeneratorMethods::Hash

  def each_except(e, &b); end
  def symbolize_keys; end
end

class Object < ::BasicObject
  include ::ActiveSupport::ToJsonWithActiveSupportEncoder
  include ::ActiveSupport::Dependencies::RequireDependency
  include ::ActiveSupport::ForkTracker::CoreExt
  include ::ActiveSupport::ForkTracker::CoreExtPrivate
  include ::Kernel
  include ::JSON::Ext::Generator::GeneratorMethods::Object
  include ::ActiveSupport::Tryable
  include ::PP::ObjectMixin

  def to_ruby; end
end

class RectException < ::RuntimeError; end
class SplineTypeException < ::RuntimeError; end

class String
  include ::Comparable
  include ::JSON::Ext::Generator::GeneratorMethods::String
  extend ::JSON::Ext::Generator::GeneratorMethods::String::Extend

  def convert_base(from, to); end

  class << self
    def random(size); end
  end
end

String::BLANK_RE = T.let(T.unsafe(nil), Regexp)
String::ENCODED_BLANKS = T.let(T.unsafe(nil), Concurrent::Map)
