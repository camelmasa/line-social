RSpec.describe Line::Social::Request::Friendship do
  describe "#get" do
    it "raises Line::Social::NotImplementedError exception" do
      client = Line::Social::Request::Friendship.new("access_token")

      expect { client.get }.to raise_error(Line::Social::NotImplementedError)
    end
  end
end
