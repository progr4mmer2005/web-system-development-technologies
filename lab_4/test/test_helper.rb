ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
require "minitest/reporters"

Minitest::Reporters.use!(
  Minitest::Reporters::DefaultReporter.new(color: true),
  ENV,
  Minitest.backtrace_filter
)

module ActiveSupport
  class TestCase
    parallelize(workers: :number_of_processors, with: :threads)

    fixtures :all

  end
end
