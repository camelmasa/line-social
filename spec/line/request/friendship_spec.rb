RSpec.describe Line::Social::Request::Friendship do
  describe "#get" do
    describe "when access token is invalid" do
      include_context "stub line api error for friendship"

      it "raises Line::Social::Error exception" do
        client = Line::Social::Request::Friendship.new

        expect { client.get("access_token") }.to raise_error(Line::Social::Error)
      end
    end

    describe "when access token is valid" do
      include_context "stub line api for friendship"

      it "returns a friendship" do
        client = Line::Social::Request::Friendship.new
        response = client.get("access_token")

        expect(response["friendFlag"]).to eq true
      end
    end
  end
end
