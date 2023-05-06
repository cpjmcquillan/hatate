# frozen_string_literal: true

require_relative "lib/hatate/version"

Gem::Specification.new do |spec|
  spec.name = "hatate"
  spec.version = Hatate::VERSION
  spec.authors = ["Connor McQuillan"]
  spec.email = ["me@cpjmcquillan.com"]

  spec.summary = "Generate a Rails application just how I like it."

  spec.description = <<~HERE
    Hatate is an opinionated Ruby on Rails application generator. It makes a
    whole bunch of choices that I like, and I hope you like them too.
  HERE

  spec.homepage = "https://github.com/cpjmcquillan/hatate"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage + "/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", Hatate::RAILS_VERSION
end
