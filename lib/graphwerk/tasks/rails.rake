# typed: false
# frozen_string_literal: true

namespace :graphwerk do
  desc 'Produce an updated packwerk.png architecture diagram using Graphwerk'
  task update: :environment do
    Graphwerk.for_application(png: Rails.root.join('packwerk.png'))
  end
end
