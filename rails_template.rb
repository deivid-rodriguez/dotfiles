# Template engine
gem 'haml-rails'

# Test framework
gem 'rspec-rails'

# Linters
gem 'rubocop'
gem 'haml-lint'
gem 'scss-lint'

# Haml application layout
generate('haml:application_layout', 'convert')
run('rm app/views/layouts/application.html.erb')

# Rspec initial setup
generate('rspec:install')

after_bundle do
  git :init
  git add: '.'
end
