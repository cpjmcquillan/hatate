# frozen_string_literal: true

module Hatate
  VERSION = "0.2.1"
  RAILS_VERSION = "~> 7.0.4"
  RUBY_VERSION = IO
    .read("#{File.dirname(__FILE__)}/../../.ruby-version")
    .strip
    .freeze
end
