require 'rspec'
require 'mocha'
require 'builder'
require 'lib/git-pivotal'

require File.join(File.dirname(__FILE__), 'factories')

RSpec.configure do |config|
  config.mock_with :mocha
end

def stub_connection_to_pivotal
  RestClient::Resource.any_instance.stubs(:get).returns("")
end