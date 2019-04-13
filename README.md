# Line::Social

[![Build Status](https://travis-ci.org/camelmasa/line-social.png)](https://travis-ci.org/camelmasa/line-social)
[![Maintainability](https://api.codeclimate.com/v1/badges/c74659829afe420dd9e0/maintainability)](https://codeclimate.com/github/camelmasa/line-social/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/c74659829afe420dd9e0/test_coverage)](https://codeclimate.com/github/camelmasa/line-social/test_coverage)

Ruby client for [LINE Social API](https://developers.line.biz/en/reference/social-api/).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'line-social'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install line-social

## Usage

```ruby
require "line/social"
client = Line::Social::Client.new


# Oauth

## issue
oauth_client = client.oauth(client_id: "YOUR_CLIENT_ID", client_secret: "YOUR_CLIENT_SECRET")
oauth = oauth_client.issue(code: "YOUR_CODE", redirect_uri: "YOUR_REDIRECT_URI")

## verify
oauth_client.verify(oauth.access_token) # or oauth.verify!

## refresh
oauth_client.refresh(oauth.refresh_token) # or oauth.refresh!

## revoke
oauth_client.revoke(oauth.access_token) # or oauth.revoke!


# Friendship

## get
client.friendship.get(oauth.access_token)


# Profile

## get
client.profile.get(oauth.access_token)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/camelmasa/line-social.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
