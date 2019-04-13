RSpec.describe Line::Social::Request::Oauth do
  describe "#issue" do
    describe "when arguments are invalid" do
      include_context "stub line api error for creating access token"

      it "raises Line::Social::Error exception" do
        client = Line::Social::Request::Oauth.new(client_id: "client_id", client_secret: "client_secret")

        expect { client.issue(code: "code", redirect_uri: "redirect_uri") }.to raise_error(Line::Social::Error)
      end
    end

    describe "when arguments are valid" do
      include_context "stub line api for creating access token"

      it "creates an access token" do
        client = Line::Social::Request::Oauth.new(client_id: "client_id", client_secret: "client_secret")

        response = client.issue(code: "code", redirect_uri: "redirect_uri")

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
        client = Line::Social::Request::Oauth.new(client_id: "client_id", client_secret: "client_secret")

        expect { client.verify("access_token") }.to raise_error(Line::Social::Error)
      end
    end

    describe "when access token is valid" do
      include_context "stub line api for verifying access token"

      it "returns a access token" do
        client = Line::Social::Request::Oauth.new(client_id: "client_id", client_secret: "client_secret")
        response = client.verify("access_token")

        expect(response["scope"]).to eq "profile"
        expect(response["client_id"]).to eq "client_id"
        expect(response["expires_in"]).to eq 2591659
      end
    end
  end

  describe "#refresh" do
    describe "when arguments are invalid" do
      include_context "stub line api error for refreshing access token"

      it "raises Line::Social::Error exception" do
        client = Line::Social::Request::Oauth.new(client_id: "client_id", client_secret: "client_secret")

        expect {
          client.refresh(refresh_token: "refresh_token")
        }.to raise_error(Line::Social::Error)
      end
    end

    describe "when arguments are valid" do
      include_context "stub line api for refreshing access token"

      it "creates an access token" do
        client = Line::Social::Request::Oauth.new(client_id: "client_id", client_secret: "client_secret")

        response = client.refresh(refresh_token: "refresh_token")

        expect(response["access_token"]).to eq "bNl4YEFPI/hjFWhTqexp4MuEw5YPs"
        expect(response["expires_in"]).to eq 2592000
        expect(response["refresh_token"]).to eq "Aa1FdeggRhTnPNNpxr8p"
        expect(response["scope"]).to eq "profile"
        expect(response["token_type"]).to eq "Bearer"
      end
    end
  end

  describe "#revoke" do
    include_context "stub line api for revoking access token"

    it "revokes an access token" do
      client = Line::Social::Request::Oauth.new(client_id: "client_id", client_secret: "client_secret")

      response = client.revoke("access_token")

      expect(response).to eq true
    end
  end
end
