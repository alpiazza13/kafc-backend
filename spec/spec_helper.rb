require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'

ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!
  config.backtrace_exclusion_patterns = []
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
end
