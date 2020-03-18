# Power Client

A Crawler wrapper with the ability to keep record of each crawl. It also gives allows to save a screenshot whenever the cralwer fails.

## Installation

Add to your Gemfile:

```ruby
gem "power_client"
```

```bash
bundle install
```

Then, run the installer:

```bash
rails generate power_client:install
```

## Usage

### Creating new clients
Use the create command to create a new Client:

```bash
rails generate power_client:client Login
```

This will generate the following files:

```ruby
# app/clients/login_client.rb
class LoginClient < PowerClient::ChromeClient
  URL = 'www.platan.us'

  def crawl
    # crawler logic goes in here
  end
end
```

The corresponding parser:

```ruby
# app/parsers/login_parser.rb
class LoginParser
  PARSERS_MATCHERS = {
    # complete with the necessary regex matchers
  }

  def parse_data(data)
    # parser logic goes in here
  end
end
```

And its corresponding rspec file:

```ruby
# spec/parsers/login_parser_spec.rb
require 'rails_helper'

RSpec.describe LoginParser, type: :parser do
  pending 'describe what perform does here'
end
```

The corresponding PowerTypes::Command:

```ruby
# app/commands/clients/login.rb
class Clients::Login < PowerTypes::Command.new(:formatted_data)
  def perform
    # Command code goes here
  end
end
```

And its corresponding rspec file:

```ruby
# spec/commands/clients/login_spec.rb
require 'rails_helper'

describe Clients::Login do
  def perform(*_args)
    described_class.for(*_args)
  end

  pending "describe what perform does here"
end
```


The corresponding Job:

```ruby
# app/jobs/clients/login_job.rb
class Clients::LoginJob < PowerClient::ChromeClientJob
  def perform
    raw_data = client.crawl
    formatted_data = parser.parse_data(raw_data)
    Clients::Login.for(formatted_data: formatted_data)
  end

  private

  def client
    @client ||= LoginClient.new
  end

  def parser
    @parser ||= LoginParser.new
  end
end
```

And its corresponding rspec file:

```ruby
# spec/jobs/clients/login_job_spec.rb
require 'rails_helper'

describe Clients::LoginJob do
  def perform(*_args)
    described_class.for(*_args)
  end

  pending "describe what perform does here"
end
```

You can add the following flags to the generate command:

- `--specs false`: creates no RSpec files
- `--parser false`: creates no Parser file
- `--job false`: creates no Job file
- `--command false`: creates no Command files

### Basic Structure

Each client should inherit from ChromeClient and run each action inside an `ensuring_browser_closure` block:

```ruby
class BankMovementsClient
  def get_movements
    ensuring_browser_closure do
      login
      goto_bank_movements_page
      results = []
      for_each_transaction_table do |table|
        results.append(
          table.search('tbody').map { |row| transaction_row_to_hash row }
        )
      end
      results.flatten
    end
  end
end
```

### Jobs Registers

To register each crawled, this engine uses [`active_job_log`](https://github.com/platanus/active_job_log) engine.

### Configurations

By default, `Selenium::WebDriver` will be initialized with the `headless` argument. To change this behaviour, you'll need to set the `headless_webdriver?` enviroment variable to false.


## Testing

To run the specs you need to execute, **in the root path of the gem**, the following command:

```bash
bundle exec guard
```

You need to put **all your tests** in the `/power_client/spec/dummy/spec/` directory.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Credits

Thank you [contributors](https://github.com/platanus/power_client/graphs/contributors)!

<img src="http://platan.us/gravatar_with_text.png" alt="Platanus" width="250"/>

Power Client is maintained by [platanus](http://platan.us).

## License

Power Client is © 2020 platanus, spa. It is free software and may be redistributed under the terms specified in the LICENSE file.
