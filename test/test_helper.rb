ENV["RAILS_ENV"] ||= "test"
require "simplecov"

SimpleCov.start "rails" do
  minimum_coverage 80
  add_filter "/config/"
  add_filter "/test/"
end

require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Add more helper methods to be used by all tests here...
  end
end
