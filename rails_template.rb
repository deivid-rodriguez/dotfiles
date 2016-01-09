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

  git :init
  git add: "."
end
