$:.unshift File.join(File.dirname(__FILE__), "../lib") 

begin
  require 'rspec'
rescue LoadError
  require 'rubygems'
  gem 'rspec'
  require 'rspec'
end

RSpec.configure do |config|
  #config.mock_with :mocha

  #config.after(:all) do
    #FileUtils.rm_rf(Dir[  "#{Rails.root}/spec/support/uploads" ])
  #end 
end

