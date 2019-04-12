RSpec.describe Line::Social::Request::Oauth do
  describe "#issue" do
    describe "when arguments are invalid" do
      include_context "stub line api error for creating access token"

      it "raises Line::Social::Error exception" do
        client = Line::Social::Request::Oauth.new

        expect {
          client.issue(
            code: "code",
            redirect_uri: "redirect_uri",
            client_id: "client_id",
            client_secret: "client_secret"
          )
        }.to raise_error(Line::Social::Error)
      end
    end

    describe "when arguments are valid" do
      include_context "stub line api for creating access token"

      it "creates an access token" do
        client = Line::Social::Request::Oauth.new

        response = client.issue(
          code: "code",
          redirect_uri: "redirect_uri",
          client_id: "client_id",
          client_secret: "client_secret"
        )

        expect(response["access_token"]).to eq "bNl4YEFPI/hjFWhTqexp4MuEw5YPs"
        expect(response["expires_in"]).to eq 2592000
        expect(response["id_token"]).to eq "eyJhbGciOiJIUzI1NiJ9"
        expect(response["refresh_token"]).to eq "Aa1FdeggRhTnPNNpxr8p"
        expect(response["scope"]).to eq "profile"
        expect(response["token_type"]).to eq "Bearer"
      end
    end
  end

  describe "#verify" do
    describe "when access token is invalid" do
      include_context "stub line api error for verifying access token"

      it "raises Line::Social::Error exception" do
        client = Line::Social::Request::Oauth.new

        expect { client.verify("access_token") }.to raise_error(Line::Social::Error)
      end
    end

    describe "when access token is valid" do
      include_context "stub line api for verifying access token"

      it "returns a access token" do
        client = Line::Social::Request::Oauth.new
        response = client.verify("access_token")

        expect(response["scope"]).to eq "profile"
        expect(response["client_id"]).to eq "1440057261"
        expect(response["expires_in"]).to eq 2591659
      end
    end
  end

  describe "#refresh" do
    it "raises Line::Social::NotImplementedError exception" do
      client = Line::Social::Request::Oauth.new

      expect { client.refresh }.to raise_error(Line::Social::NotImplementedError)
    end
  end

  describe "#revoke" do
    it "raises Line::Social::NotImplementedError exception" do
      client = Line::Social::Request::Oauth.new

      expect { client.revoke }.to raise_error(Line::Social::NotImplementedError)
    end
  end
end
