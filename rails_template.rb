# Template engine
gem "haml-rails"

# Test framework
gem "rspec-rails"

# Linters
gem "rubocop"
gem "haml-lint"
gem "scss-lint"

# Rspec initial setup
generate("rspec:install")

after_bundle do
  git :init
  git add: "."
end
