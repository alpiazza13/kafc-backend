ENV["RAILS_ENV"] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

include TestUtils

ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Devise::Test::ControllerHelpers, type: :helper
  config.include Warden::Test::Helpers

  config.infer_spec_type_from_file_location!
  config.backtrace_exclusion_patterns = []
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
end
