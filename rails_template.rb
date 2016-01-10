#
# Reads config file from this repo
#
def read_local_dotfile(filename)
  File.read(File.expand_path("../#{filename}", __FILE__))
end

# Template engine
gem "slim-rails"

# Test framework
gem "rspec-rails"

# Linters
gem "rubocop", github: "bbatsov/rubocop"
gem "slim_lint"
gem "scss-lint"
gem "overcommit"

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
