RSpec.describe Line::Social::Request::Profile do
  describe "#get" do
    describe "when access token is invalid" do
      include_context "stub line api error for profile"

      it "raises Line::Social::Error exception" do
        client = Line::Social::Request::Profile.new("access_token")

        expect { client.get }.to raise_error(Line::Social::Error)
      end
    end

    describe "when access token is valid" do
      include_context "stub line api for profile"

      it "raises Line::Social::Error exception" do
        client = Line::Social::Request::Profile.new("access_token")
        response = client.get

        expect(response["userId"]).to eq "U4af4980629"
        expect(response["displayName"]).to eq "Brown"
        expect(response["pictureUrl"]).to eq "https://example.com/abcdefghijklmn"
        expect(response["statusMessage"]).to eq "Hello, LINE!"
      end
    end
  end
end
