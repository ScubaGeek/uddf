# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard :minitest do
  # with Minitest::Unit
  watch(%r{^test/tests/(.*)/?test_(.*)\.rb$})
  # watch(%r{^lib/(.*/)?([^/]+)\.rb$})     { |m| "test/tests/#{m[1]}test_#{m[2]}.rb" }
  watch(%r{^lib/(.*/)?([^/]+)\.rb$})     { |m| "test/tests/test_#{m[2]}.rb" }
  watch(%r{^test/test_helper\.rb$})      { "test" }
end
