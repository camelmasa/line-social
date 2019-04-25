# frozen_string_literal: true

RSpec.describe Line::Social::Request::Profile do
  describe '#get' do
    include_context 'stub line api for profile'

    it 'returns a profile' do
      client = Line::Social::Request::Profile.new
      response = client.get('access_token')

      expect(response['userId']).to eq 'U4af4980629'
      expect(response['displayName']).to eq 'Brown'
      expect(response['pictureUrl']).to eq 'https://example.com/abcdefghijklmn'
      expect(response['statusMessage']).to eq 'Hello, LINE!'
    end
  end
end
