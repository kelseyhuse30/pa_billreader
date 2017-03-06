# PaBillreader

This gem is an interactive cli program to view and list current bills for the 2017-2018 Regular Session in Pennsylvania.
The data is scraped from http://www.legis.state.pa.us/ to display current information.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pa_billreader'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pa_billreader

## Usage

Open running the program, it will automatically scrape the data from the PA Legislation website and create bill objects.
Type 'list' to view the list of bill numbers and summaries (warning: it will be >1000 items)
Type 'view' to view information on a specific bill. You will be prompted for the number and then the branch of congress.
When viewing a bill, you can type 'view memo' or 'view full' and the url will open in your browser.  Not all bills will have these available.
Type 'exit' to exit the application.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kelseyhuse30/pa_billreader. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

