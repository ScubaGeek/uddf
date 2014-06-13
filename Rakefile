require 'bundler/gem_tasks'
require 'rubygems'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = FileList['test/tests/test_*.rb']
  # t.verbose = true
end

task :default => :test
