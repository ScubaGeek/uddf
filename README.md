[![Build Status](https://travis-ci.org/ScubaGeek/uddf.svg?branch=master)](https://travis-ci.org/ScubaGeek/uddf)

# UDDF

The Universal Dive Data Format (UDDF) is the successor of the Universal Dive Computer Format (UDCF) and is designed to
manage all dive data — planning, logging, analysing of scuba dives (apnoe, rebreathers, open systems, all possible
breathing gases), logbook, calculation of dive tables, archiving etc. — regardless of manufacturer, and independent of
the operating system respectively, and to provide its interchangeabilty.

The intent of this gem is to provide an open-sourced universal ruby library to read/write UDDF files.

Please see http://www.streit.cc/extern/uddf_v321/en/index.html for more information regarding the UDDF standard.

## Installation

Add this line to your application's Gemfile:

    gem 'uddf'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install uddf

## Usage

```ruby
require 'uddf'

my_uddf = UDDF.new
my_uddf.diver.name = 'Donovan Young'

if my_uddf.valid?
  my_uddf.write
else
  puts "couldn't build UDDF file: #{my_uddf.errors}"
end
```

## Contributing

1. Fork it ( http://github.com/ScubaGeek/uddf/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
