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
gem "rubocop"
gem "slim_lint"
gem "scss-lint"
gem "overcommit"

after_bundle do
  # Rspec initial setup
  generate("rspec:install")

  # Configure RuboCop
  file ".rubocop.yml", read_local_dotfile(".rubocop.yml")

  # Configure overcommit
  file ".overcommit.yml", read_local_dotfile(".overcommit.yml")

  # Install & sign git hooks
  run "overcommit --install"
  run "overcommit --sign"

  # Initial commit
  git :init
  git add: ".", commit: "-m 'Initial skeleton'"
end
