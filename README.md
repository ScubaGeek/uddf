# To_UDDF

The Universal Dive Data Format (UDDF) is the successor of the Universal Dive Computer Format (UDCF) and is designed to
manage all dive data — planning, logging, analysing of scuba dives (apnoe, rebreathers, open systems, all possible
breathing gases), logbook, calculation of dive tables, archiving etc. — regardless of manufacturer, and independent of
the operating system respectively, and to provide its interchangeabilty.

The purpose of this gem is to provide an open-sourced universal UDDF conversion library for Ruby.

Please see http://www.streit.cc/extern/uddf_v321/en/index.html for more information regarding the UDDF standard.

## Installation

Add this line to your application's Gemfile:

    gem 'to_uddf'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install to_uddf

## Usage

This gem provides a Hash#to_uddf method which will return a UDDF encoded XML data object.

The origin must be a Hash with the proper data structure to populate UDDF, but the code will do it's best to match keys
with the appropriate elements when possible.

to use, one must only require 'to_uddf'


## Contributing

1. Fork it ( http://github.com/ScubaGeek/to_uddf/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
