require "minitest"
require "minitest/spec"
require "minitest/autorun"
require "minitest/reporters"
require "uddf"

Minitest::Reporters.use!

MiniTest::Reporters.use! MiniTest::Reporters::DefaultReporter.new(color: true)

# if ENV['RUBYMINE_TESTUNIT_REPORTER']
# MiniTest::Reporters.use! MiniTest::Reporters::RubyMineReporter
# else
# MiniTest::Reporters.use! MiniTest::Reporters::DefaultReporter.new(color: true)
# MiniTest::Reporters.use! MiniTest::Reporters::ProgressReporter.new
# MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new
# end
