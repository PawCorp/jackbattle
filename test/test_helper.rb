ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

require "clearance/test_unit"

class ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods
  include Clearance::Testing::ControllerHelpers

  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def with_request_url_and_clearance(path)
    with_request_url path do
      @request.env[:clearance] = Clearance::Session.new(@request.env)
      yield
    end
  end

  def with_user(as: nil, path: '/')
    with_request_url_and_clearance path do
      sign_in_as as if as
      yield
    end
  end
end
