RSpec.describe Line::Social::Request::Oauth do
  describe "#issue" do
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

  describe "#verify" do
    include_context "stub line api for verifying access token"

    it "returns a access token" do
      client = Line::Social::Request::Oauth.new(client_id: "client_id", client_secret: "client_secret")
      response = client.verify("access_token")

      expect(response["scope"]).to eq "profile"
      expect(response["client_id"]).to eq "client_id"
      expect(response["expires_in"]).to eq 2591659
    end
  end

  describe "#refresh" do
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

  describe "#revoke" do
    include_context "stub line api for revoking access token"

    it "revokes an access token" do
      client = Line::Social::Request::Oauth.new(client_id: "client_id", client_secret: "client_secret")

      response = client.revoke("access_token")

      expect(response).to eq true
    end
  end
end
