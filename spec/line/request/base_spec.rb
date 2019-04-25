RSpec.describe Line::Social::Request::Base do
  describe "#http_client" do
    it "returns a Faraday::Response" do
      stub_request(:post, /\Ahttps:\/\/api.line.me\/oauth2\/v2.1\/token/)

      response = Line::Social::Request::Base.new.http_client(:post) do |connection|
        connection.url "https://api.line.me/oauth2/v2.1/token"
      end

      expect(response).to be_a(Faraday::Response)
    end

    it "raises Line::Social::BadRequestError" do
      response = { status: 400, body: { message: "message" }.to_json }
      error = Faraday::Error::ClientError.new(nil, response)
      allow_any_instance_of(Faraday::Connection).to receive(:run_request).and_raise(error)

      expect { Line::Social::Request::Base.new.http_client(:post) }.to raise_error(Line::Social::BadRequestError)
    end

    it "raises Line::Social::UnauthorizedError" do
      response = { status: 401, body: { message: "message" }.to_json }
      error = Faraday::Error::ClientError.new(nil, response)
      allow_any_instance_of(Faraday::Connection).to receive(:run_request).and_raise(error)

      expect { Line::Social::Request::Base.new.http_client(:post) }.to raise_error(Line::Social::UnauthorizedError)
    end

    it "raises Line::Social::ForbiddenError" do
      response = { status: 403, body: { message: "message" }.to_json }
      error = Faraday::Error::ClientError.new(nil, response)
      allow_any_instance_of(Faraday::Connection).to receive(:run_request).and_raise(error)

      expect { Line::Social::Request::Base.new.http_client(:post) }.to raise_error(Line::Social::ForbiddenError)
    end

    it "raises Line::Social::TooManyRequestsError" do
      response = { status: 429, body: { message: "message" }.to_json }
      error = Faraday::Error::ClientError.new(nil, response)
      allow_any_instance_of(Faraday::Connection).to receive(:run_request).and_raise(error)

      expect { Line::Social::Request::Base.new.http_client(:post) }.to raise_error(Line::Social::TooManyRequestsError)
    end

    it "raises Line::Social::InternalServerError" do
      response = { status: 500, body: { message: "message" }.to_json }
      error = Faraday::Error::ClientError.new(nil, response)
      allow_any_instance_of(Faraday::Connection).to receive(:run_request).and_raise(error)

      expect { Line::Social::Request::Base.new.http_client(:post) }.to raise_error(Line::Social::InternalServerError)
    end
  end
end
