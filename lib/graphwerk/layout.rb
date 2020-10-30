# typed: strict
# frozen_string_literal: true

module Graphwerk
  # https://graphviz.org/documentation/#layout-manual-pages
  class Layout < T::Enum
    enums do
      Dot = new
      Neato = new
      Fdp = new
      Sfdp = new
      Twopi = new
      Circo = new
    end
  end
end
