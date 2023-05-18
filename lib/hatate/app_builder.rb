module Hatate
  class AppBuilder < Rails::AppBuilder
    def readme
      template "README.md.erb", "README.md"
    end

    def gemfile
      template "Gemfile.erb", "Gemfile"
    end

    def leftovers
      bundle_command "exec standardrb --fix-unsafely"
      initial_commit
    end

    def database_config
      inject_into_file(
        "config/database.yml",
        postgres_test_config,
        after: "database: #{app_name}_test"
      )
    end

    def dependencies
      bundle_command "install"
      bundle_command "lock --add-platform x86_64-linux"
      rails_command "tailwindcss:install"
    end

    def github_actions
      template "lint.yml", ".github/workflows/lint.yml"
      template "test.yml", ".github/workflows/test.yml"
    end

    def test_helpers
      template "spec/.rspec", ".rspec"
      template "spec/spec_helper.rb", "spec/spec_helper.rb"
      template "spec/rails_helper.rb", "spec/rails_helper.rb"
      template "spec/support/cuprite.rb", "spec/support/cuprite.rb"
      template "spec/support/system.rb", "spec/support/system.rb"
      template "spec/support/factory_bot.rb", "spec/support/factory_bot.rb"
      template "spec/support/freeze_time.rb", "spec/support/freeze_time.rb"
      template "spec/support/i18n.rb", "spec/support/i18n.rb"
    end

    def ruby_version
      create_file ".ruby-version", "#{Hatate::RUBY_VERSION}\n"
    end

    private

    def postgres_test_config
      "
  host: <%= ENV.fetch(\"POSTGRES_HOST\", \"localhost\") %>
  username: <%= ENV.fetch(\"POSTGRES_USER\", \"\") %>
  password: <%= ENV.fetch(\"POSTGRES_PASSWORD\", \"\") %>
      "
    end

    def initial_commit
      git add: "."
      git commit: "-m 'Initial commit' -m '#{commit_message}'"
    end

    def commit_message
      "This app was generated with [hatate](https://github.com/cpjmcquillan/hatate)"
    end
  end
end
