shared_context 'stub line api for creating access token' do
  before do
    body = {
      'access_token' => 'bNl4YEFPI/hjFWhTqexp4MuEw5YPs',
      'expires_in' => 2_592_000,
      'id_token' => 'eyJhbGciOiJIUzI1NiJ9',
      'refresh_token' => 'Aa1FdeggRhTnPNNpxr8p',
      'scope' => 'profile',
      'token_type' => 'Bearer'
    }

    stub_request(:post, %r{\Ahttps:\/\/api.line.me\/oauth2\/v2.1\/token})
      .to_return(body: body)
  end
end

shared_context 'stub line api for verifying access token' do
  before do
    body = {
      'scope' => 'profile',
      'client_id' => '1440057261',
      'expires_in' => 2_591_659
    }

    stub_request(:get, %r{\Ahttps:\/\/api.line.me\/oauth2\/v2.1\/verify})
      .to_return(body: body)
  end
end

shared_context 'stub line api for profile' do
  before do
    body = {
      'userId' => 'U4af4980629',
      'displayName' => 'Brown',
      'pictureUrl' => 'https://example.com/abcdefghijklmn',
      'statusMessage' => 'Hello, LINE!'
    }

    stub_request(:get, %r{\Ahttps:\/\/api.line.me\/v2\/profile}).to_return(
      body: body
    )
  end
end

shared_context 'stub line api for refreshing access token' do
  before do
    body = {
      'access_token' => 'bNl4YEFPI/hjFWhTqexp4MuEw5YPs',
      'expires_in' => 2_592_000,
      'refresh_token' => 'Aa1FdeggRhTnPNNpxr8p',
      'scope' => 'profile',
      'token_type' => 'Bearer'
    }

    stub_request(:post, %r{\Ahttps:\/\/api.line.me\/oauth2\/v2.1\/token})
      .to_return(body: body)
  end
end

shared_context 'stub line api for friendship' do
  before do
    body = { 'friendFlag' => true }

    stub_request(:get, %r{\Ahttps:\/\/api.line.me\/friendship\/v1\/status})
      .to_return(body: body)
  end
end

shared_context 'stub line api for revoking access token' do
  before do
    stub_request(:post, %r{\Ahttps:\/\/api.line.me\/oauth2\/v2.1\/revoke})
  end
end
