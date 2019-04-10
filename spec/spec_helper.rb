require "bundler/setup"
require "line/social"
require "webmock/rspec"

shared_context "stub line api for verifying access token" do
  before do
    body = {
      "scope" => "profile",
      "client_id" => "1440057261",
      "expires_in" => 2591659,
    }

    stub_request(:get, /\Ahttps:\/\/api.line.me\/oauth2\/v2.1\/verify/).to_return(body: body)
  end
end

shared_context "stub line api error for verifying access token" do
  before do
    body = {
      "error" => "invalid_request",
      "error_description" => "access token expired"
    }

    stub_request(:get, /\Ahttps:\/\/api.line.me\/oauth2\/v2.1\/verify/).to_return(body: body)
  end
end

shared_context "stub line api for profile" do
  before do
    body = {
      "userId" => "U4af4980629",
      "displayName" => "Brown",
      "pictureUrl" => "https://example.com/abcdefghijklmn",
      "statusMessage" => "Hello, LINE!",
    }

    stub_request(:get, /\Ahttps:\/\/api.line.me\/v2\/profile/).to_return(body: body)
  end
end

shared_context "stub line api error for profile" do
  before do
    body = {
      "error" => "invalid_request",
      "error_description" => "access token expired"
    }

    stub_request(:get, /\Ahttps:\/\/api.line.me\/v2\/profile/).to_return(body: body)
  end
end

shared_context "stub line api for friendship" do
  before do
    body = {
      "friendFlag" => true,
    }

    stub_request(:get, /\Ahttps:\/\/api.line.me\/friendship\/v1\/status/).to_return(body: body)
  end
end

shared_context "stub line api error for friendship" do
  before do
    body = {
      "error" => "invalid_request",
      "error_description" => "access token expired"
    }

    stub_request(:get, /\Ahttps:\/\/api.line.me\/friendship\/v1\/status/).to_return(body: body)
  end
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
