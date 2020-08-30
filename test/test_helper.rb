require 'simplecov'
SimpleCov.start 'rails' do
  add_filter "lib/tasks/"
  add_filter "app/channels/application_cable/"
  add_filter "app/jobs/"
  add_filter "app/mailers/"
end
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require "minitest"
require 'minitest/rails'
require 'minitest/reporters'
require 'minitest_extensions'
require 'active_storage_validations/matchers'
require 'contexts'

class ActiveSupport::TestCase extend ActiveStorageValidations::Matchers
  # Run tests in parallel with specified workers
  # Commented out b/c screwing with reporter
  # parallelize(workers: :number_of_processors)

  # Add more helper methods to be used by all tests here...
  include Contexts

  def login_admin
    @top_team_active = FactoryBot.create(:team, name: "Top Team", description: "we are number 1", active: true)
    @user = FactoryBot.create(:user, first_name: "David", last_name: "Yuan", team: @top_team_active, username: "dyuan", admin_password: "password", email: "dyuan@gmail.com")
    get login_path
    post sessions_path, params: { username: "dyuan", password: "secret" }
  end

  def login_regular
    @top_team_active = FactoryBot.create(:team, name: "Top Team", description: "we are number 1", active: true)
    @user = FactoryBot.create(:user, first_name: "David", last_name: "Yuan", team: @top_team_active, username: "dyuan", email: "dyuan@gmail.com")
    get login_path
    post sessions_path, params: { username: "dyuan", password: "secret" }
  end

  # Add the infamous deny method...
  def deny(condition, msg="")
    # a simple transformation to increase readability IMO
    assert !condition, msg
  end

  # Spruce up minitest results...
  Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new]

end
