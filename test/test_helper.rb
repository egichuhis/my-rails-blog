# test/test_helper.rb

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'factory_bot'

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Include FactoryBot methods
    include FactoryBot::Syntax::Methods

    # Configure FactoryBot to load factories from the correct directory
    FactoryBot.definition_file_paths << File.expand_path('../factories', __dir__)
    FactoryBot.reload

    # Add more helper methods to be used by all tests here...
  end
end
