RSpec.describe Line::Social::Request::Oauth do
  describe "#issue" do
    it "raises Line::Social::NotImplementedError exception" do
      client = Line::Social::Request::Oauth.new("access_token")

      expect { client.issue }.to raise_error(Line::Social::NotImplementedError)
    end
  end

  describe "#verify" do
    describe "when access token is invalid" do
      include_context "stub line api error for verifying access token"

      it "raises Line::Social::Error exception" do
        client = Line::Social::Request::Oauth.new("access_token")

        expect { client.verify }.to raise_error(Line::Social::Error)
      end
    end

    describe "when access token is valid" do
      include_context "stub line api for verifying access token"

      it "raises Line::Social::Error exception" do
        client = Line::Social::Request::Oauth.new("access_token")
        response = client.verify

        expect(response["scope"]).to eq "profile"
        expect(response["client_id"]).to eq "1440057261"
        expect(response["expires_in"]).to eq "2591659"
      end
    end
  end

  describe "#refresh" do
    it "raises Line::Social::NotImplementedError exception" do
      client = Line::Social::Request::Oauth.new("access_token")

      expect { client.refresh }.to raise_error(Line::Social::NotImplementedError)
    end
  end

  describe "#revoke" do
    it "raises Line::Social::NotImplementedError exception" do
      client = Line::Social::Request::Oauth.new("access_token")

      expect { client.revoke }.to raise_error(Line::Social::NotImplementedError)
    end
  end
end
