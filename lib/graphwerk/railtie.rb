# typed: ignore
# frozen_string_literal: true

module Graphwerk
  class Railtie < Rails::Railtie
    rake_tasks do
      load 'graphwerk/tasks/rails.rake'
    end
  end
end
