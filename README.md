# SmtpLw

This is the ruby client for SMTP Locaweb product.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'smtp_lw'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install smtp_lw

## Usage

### Authentication and Configuration
```ruby
client = SmtpLw::Client.new(api_token: 'your api token from the panel')
```

or

```ruby
SmtpLw.configure do |c|
  c.api_token = 'your api token'
  c.per_page = 50
end

# instanciate the client
client = SmtpLw::Client.new
```

Alternatively you can authenticate setting an ENV: 

```
SMTP_LW_API_TOKEN='your api token'
```
and then:
```ruby
client = SmtpLw::Client.new
```

### Get the list of messages

```ruby
client.list_messages('all', '2015-07-01', '2015-07-30')
```
You can pass options as specified in the API documentation:
```ruby
client.list_messages('all', '2015-07-01', '2015-07-30' {page: 1, per: 50})
```

### Send a message
```ruby
client.send_message("meeting tomorrow at 11", "this is the body of my msg", 'me@domain.com',
'you@domain.com')
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/smtp_lw/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
