# frozen_string_literal: true

ENV["RAILS_ENV"] ||= "test"

require "spec_helper"
require File.expand_path("../../config/environment", __FILE__)

require "rspec/rails"
require "capybara/rails"

require "support/database_cleaner"

ActiveRecord::Migration.maintain_test_schema!
