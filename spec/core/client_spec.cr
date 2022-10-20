require "../spec_helper"

class CustomResponseException < Amazonite::Core::ResponseException
end

class CustomExceptionFactory
  include Amazonite::Core::ResponseExceptionFactory

  def create_exception(error_type, http, message) : Amazonite::Core::ResponseException | Nil
    case error_type
    when "CustomResponseException" then CustomResponseException.new(http, message)
    end
  end
end

def create_mock_config(base_url = nil, user_agent = nil)
  Amazonite::Core::Config.new("AKIAIOSFODNN7EXAMPLE", "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY", "us-east-1", base_url, user_agent)
end

describe Amazonite::Core::Client do
  described_class = Amazonite::Core::Client

  it "handles post requests" do
    local_config = create_mock_config("http://www.example.com")

    json = %({"name":"John", "surname": "Doe"})
    response_json = %({"response":#{json}})
    headers = {
      "X-Amz-Target" => "HelloWorld_20221002.Greet",
      "Content-Type" => "application/x-amz-json-1.0",
      "User-Agent"   => local_config.user_agent { |u| "#{u} command/helloworld.greet" },
    }
    WebMock.stub(:post, "http://www.example.com/foo")
      .with(body: json, headers: headers)
      .to_return(body: response_json)

    client = described_class.new("HelloWorld_20221002", "helloworld", config: local_config)
    response = client.post("Greet", "/foo", json)

    response.status.should eq(HTTP::Status::OK)
    response.body.should eq(response_json)
  end

  it "allows setting the user agent" do
    headers = {
      "X-Amz-Target" => "HelloWorld_20221002.Salutation",
      "Content-Type" => "application/x-amz-json-1.0",
      "User-Agent"   => "custom/user-agent",
    }
    WebMock.stub(:post, "http://localhost/")
      .with(body: "", headers: headers)

    local_config = create_mock_config("http://localhost", "custom/user-agent")
    client = described_class.new("HelloWorld_20221002", "helloworld", config: local_config)
    response = client.post("Salutation", "/", "")
  end

  it "uses url from config object" do
    WebMock.stub(:post, "http://localhost:4566/welcome")

    client = described_class.new("HelloWorld_20221002", "helloworld", config: create_mock_config("http://localhost:4566"))
    response = client.post("Welcome", "/welcome", "")
  end

  it "throws errors if status is not in the 200..299 range" do
    response_body = %({"__type": "ResourceInUseException", "message": "Table already exists: Music"})
    WebMock.stub(:post, "http://localhost:4566/shalom").to_return(status: 400, body: response_body)

    client = described_class.new("HelloWorld_20221002", "helloworld", config: create_mock_config("http://localhost:4566"))

    e = expect_raises(Amazonite::Core::ResponseException, "Table already exists: Music") do
      client.post("Shalom", "/shalom", "")
    end

    e.http.status_code.should eq(400)
  end

  it "throws errors for non-json responses" do
    response_body = "Table already exists: Music"
    WebMock.stub(:post, "http://localhost:4566/toast").to_return(status: 400, body: response_body)

    client = described_class.new("HelloWorld_20221002", "helloworld", config: create_mock_config("http://localhost:4566"))

    e = expect_raises(Amazonite::Core::ResponseException, "Table already exists: Music") do
      client.post("Toast", "/toast", "")
    end

    e.http.status_code.should eq(400)
  end

  it "throws custom exceptions for a method" do
    response_body = %({"__type": "CustomResponseException", "message": "Database connection is unavailable"})
    WebMock.stub(:post, "http://localhost:4566/hail").to_return(status: 500, body: response_body)

    client = described_class.new("HelloWorld_20221002", "helloworld", CustomExceptionFactory.new, create_mock_config("http://localhost:4566"))

    e = expect_raises(CustomResponseException, "Database connection is unavailable") do
      client.post("Hail", "/hail", "")
    end

    e.http.status_code.should eq(500)
  end
end
