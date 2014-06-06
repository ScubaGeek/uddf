# Run all tests in the tests directory (and any subdirectories)
require_relative 'test_helper.rb'
Dir.glob('./test/tests/**/*.rb').each { |file| require file}

