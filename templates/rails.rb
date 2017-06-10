# frozen_string_literal: true

#
# Reads config file from this repo
#
def source_paths
  [File.expand_path(File.dirname(__FILE__))]
end

copy_file "rails/Gemfile", "Gemfile"
copy_file "rails/Gemfile.lock", "Gemfile.lock"
copy_file "rails/Rakefile", "Rakefile"
copy_file "rails/README.md", "README.md"

environment <<-RUBY
  #
  # Configure lighter generators
  #
  config.generators do |g|
    g.test_framework :rspec, view_specs: false,
                             helper_specs: false,
                             routing_specs: false,
                             request_specs: false,
                             controller_specs: false
    g.javascripts false
    g.jbuilder false
    g.helper false
  end
RUBY

directory "rails/app", "app"
directory "rails/config", "config"
directory "rails/spec", "spec"

after_bundle do
  # Configure RuboCop
  copy_file "rails/.rubocop.yml", ".rubocop.yml"

  # Configure codeclimate
  copy_file "rails/.codeclimate.yml", ".codeclimate.yml"

  # Copy spring binstub
  copy_file "rails/bin/spring", "bin/spring"

  # Remove unused files
  run "rm db/seeds.rb"
  run "rm app/helpers/application_helper.rb"

  # Cleanup RuboCop offenses
  run "bundle exec rubocop -a"

  # Initialize source control
  git :init

  # Initial commit
  baseuri = "https://raw.githubusercontent.com/deivid-rodriguez/dotfiles/master"

  commit_msg = <<~TEXT
    Initial Skeleton

    rails new #{app_name} \\
      -m #{baseuri}/templates/rails.rb \\
      --skip-action-cable \\
      --skip-turbolinks \\
      --skip-test \\
      --force
  TEXT

  git add: ".", commit: "-m '#{commit_msg}'"
end
