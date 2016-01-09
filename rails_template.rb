#
# Reads config file from this repo
#
def read_local_dotfile(filename)
  File.read(File.expand_path("../#{filename}", __FILE__))
end

# Template engine
gem "haml-rails"

# Test framework
gem "rspec-rails"

# Linters
gem "rubocop"
gem "haml-lint"
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

  git :init
  git add: "."
end
