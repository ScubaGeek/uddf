require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'
require 'to_uddf'

if ENV['RUBYMINE_TESTUNIT_REPORTER']
  MiniTest::Reporters.use! MiniTest::Reporters::RubyMineReporter
else
  #MiniTest::Reporters.use! MiniTest::Reporters::DefaultReporter.new
  #MiniTest::Reporters.use! MiniTest::Reporters::ProgressReporter.new
  MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new
end

module TestSetup
  def setup
  end

  def teardown
  end
end

