# SmtpLw

This is the ruby client for SMTP Locaweb product.

## Installation

```shell
gem install smtp_lw
```
or add this line to Gemfile:

```ruby
gem 'smtp_lw'
```
and run `bundle install` from your shell.

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

# instantiate the client
client = SmtpLw::Client.new
```

You can also authenticate setting an environment variable

```shell
SMTP_LW_API_TOKEN='your api token'
```
and then use the client
```ruby
client = SmtpLw::Client.new
```

### Retrieving messages for a given period

```ruby
client.list_messages('all', '2015-07-01', '2015-07-30')
```

You can pass options as specified in the [API documentation](http://developer.locaweb.com.br/documentacoes/smtp/):
```ruby
client.list_messages('all', '2015-07-01', '2015-07-30', {page: 1, per: 50})
```

### Sending a message

```ruby
client.send_message('meeting tomorrow at 11', 'this is the body of my msg', 'me@domain.com',
'you@domain.com')
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/smtp_lw/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
