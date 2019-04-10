RSpec.describe Line::Social::Request::Friendship do
  describe "#get" do
    describe "when access token is invalid" do
      include_context "stub line api error for friendship"

      it "raises Line::Social::Error exception" do
        client = Line::Social::Request::Friendship.new("access_token")

        expect { client.get }.to raise_error(Line::Social::Error)
      end
    end

    describe "when access token is valid" do
      include_context "stub line api for friendship"

      it "raises Line::Social::Error exception" do
        client = Line::Social::Request::Friendship.new("access_token")
        response = client.get

        expect(response["friendFlag"]).to eq true
      end
    end
  end
end
