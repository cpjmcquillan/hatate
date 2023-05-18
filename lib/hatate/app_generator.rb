module Hatate
  class AppGenerator < Rails::Generators::AppGenerator
    def initialize(*args)
      super

      self.options = options.merge(
        database: "postgresql",
        css: "tailwind",
        asset_pipeline: "propshaft",
        skip_test: true,
        skip_jbuilder: true,
        skip_bundle: true
      ).freeze
    end

    def finish_template
      build :ruby_version
      build :dependencies
      build :database_config
      build :test_helpers
      build :github_actions

      super
    end

    private

    def get_builder_class
      Hatate::AppBuilder
    end
  end
end
