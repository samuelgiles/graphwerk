![graphwerk-logo](https://user-images.githubusercontent.com/2643026/95463568-cfaada80-0970-11eb-8305-aea01a0d77a9.png)

# Graphwerk [![Gem Version](https://badge.fury.io/rb/graphwerk.svg)](https://badge.fury.io/rb/graphwerk) [![Continuous Integration](https://github.com/bellroy/graphwerk/actions/workflows/ci.yml/badge.svg)](https://github.com/bellroy/graphwerk/actions/workflows/ci.yml)

Graphwerk is a small Ruby gem that can generate a diagram of dependencies between packages within an application that's using Packwerk to enforce boundaries.

The gem builds on top of [Packwerk](https://github.com/Shopify/packwerk) and [Graphviz](https://github.com/glejeune/Ruby-Graphviz).

Here's an example application package dependency diagram:

![example](https://user-images.githubusercontent.com/2643026/97689408-6ca1f480-1a93-11eb-9999-22e79791b300.png)

## Install

Add this line to your application's Gemfile and run `bundle install`:

`gem 'graphwerk', group: %i[development test]`

## Usage

For Rails applications a Railtie automatically loads a rake task that makes it easy to generate a diagram for your root package and its dependencies. The diagram will be placed at the root of your application as `packwerk.png`.

```bash
bundle exec rake graphwerk:update
```

More advance usage is possible by passing a [`Packwerk::PackageSet`](https://github.com/Shopify/packwerk/blob/main/lib/packwerk/package_set.rb) directly to `Graphwerk::Builders::Graph` and calling `#build` returning a `Graphviz` instance:

```ruby
graph = Graphwerk::Builders::Graph.new(
   Packwerk::PackageSet.load_all_from(".")
).build
graph.output(svg: 'packwerk.svg')
```

All [Graphviz layouts](https://graphviz.org/documentation/#layout-manual-pages) are supported and options for the graph, nodes and edges can be set via an optional `options` argument:

```ruby
graph = Graphwerk::Builders::Graph.new(
   Packwerk::PackageSet.load_all_from("."),
   options: {
     layout: Graphwerk::Layout::Twopi,
     todos_color: 'yellow',
     graph: { overlap: true },
     node: { fillcolor: '#000000' },
     edges: { len: '3.0' }
    }
).build
graph.output(svg: 'packwerk.svg')
```
