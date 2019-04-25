RSpec.describe Line::Social::Request::Friendship do
  describe '#get' do
    include_context 'stub line api for friendship'

    it 'returns a friendship' do
      client = Line::Social::Request::Friendship.new
      response = client.get('access_token')

      expect(response['friendFlag']).to eq true
    end
  end
end
