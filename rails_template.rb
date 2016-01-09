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

after_bundle do
  # Rspec initial setup
  generate("rspec:install")

  # Configure RuboCop
  file ".rubocop.yml", read_local_dotfile(".rubocop.yml")

  git :init
  git add: "."
end
