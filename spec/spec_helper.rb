if ENV['COVERAGE']
  require 'simplecov'
  SimpleCov.start do
    add_filter "/spec"
  end
end

require "rspec"
require "accio"

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = "random"
end
