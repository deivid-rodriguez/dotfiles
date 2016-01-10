#
# Reads config file from this repo
#
def read_local_dotfile(filename)
  File.read(File.expand_path("../#{filename}", __FILE__))
end

# Template engine
gem "slim-rails"

# Test framework
gem_group :development, :test do
  gem "rspec-rails"
end

# Linters
gem_group :lint do
  gem "rubocop", github: "bbatsov/rubocop"
  gem "slim_lint"
  gem "scss-lint"
  gem "overcommit"
end

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

after_bundle do
  # Rspec initial setup
  generate("rspec:install")

  # Configure RuboCop
  file ".rubocop.yml", read_local_dotfile(".rubocop.yml")

  # Correct what we can correct
  run "bundle exec rubocop -a"

  # Allow the rest
  run "bundle exec rubocop --auto-gen-config"
  prepend_to_file ".rubocop.yml", "inherit_from: .rubocop_todo.yml\n"

  # Configure overcommit
  file ".overcommit.yml", read_local_dotfile(".overcommit.yml")

  # Initialize source control
  git :init

  # Install & sign git hooks
  run "overcommit --install"
  run "overcommit --sign"

  # Initial commit
  git add: ".", commit: "-m 'Initial skeleton'"
end
