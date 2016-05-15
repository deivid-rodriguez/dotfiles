# frozen_string_literal: true

require "database_cleaner"

RSpec.configure do |config|
  config.use_transactional_fixtures = false

  config.before(:suite) { DatabaseCleaner.clean_with(:truncation) }

  config.before(:each) { DatabaseCleaner.strategy = :transaction }

  config.before(:each, type: :feature) do
    DatabaseCleaner.strategy = :truncation if separate_db_connection_for_specs
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning { example.run }
  end

  def separate_db_connection_for_specs
    Capybara.current_driver != :rack_test
  end
end
