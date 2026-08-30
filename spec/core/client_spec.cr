require "../spec_helper"

class CustomResponseException < Amazonite::Core::ResponseException
end

class TimeoutInspectingClient < Amazonite::Core::Client
  def http_client_for(command, url, body)
    create_client("id", command, url, body)
  end
end

class CustomClientExceptionFactory < Amazonite::Core::ResponseExceptionFactory
  def create(exception_type, http, message, code) : Amazonite::Core::ResponseException?
    case exception_type
    when "CustomResponseException" then CustomResponseException.new(http, message, code)
    end
  end
end

def create_mock_config(base_url = nil, user_agent = nil)
  Amazonite::Core::Config.new("AKIAIOSFODNN7EXAMPLE", "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY", "us-east-1", nil, base_url, user_agent)
end

describe Amazonite::Core::Client do
  described_class = Amazonite::Core::Client
  exception_factory = CustomClientExceptionFactory.new

  it "handles post requests" do
    local_config = create_mock_config("http://www.example.com")

    json = %({"name":"John", "surname": "Doe"})
    response_json = %({"response":#{json}})
    headers = {
      "X-Amz-Target" => "HelloWorld_20221002.Greet",
      "Content-Type" => "application/x-amz-json-1.0",
      "User-Agent"   => local_config.user_agent { |agent| "#{agent} command/helloworld.greet" },
    }
    WebMock.stub(:post, "http://www.example.com/foo")
      .with(body: json, headers: headers)
      .to_return(body: response_json)

    client = described_class.new("HelloWorld_20221002", "helloworld", "1.0", exception_factory, local_config)
    response = client.post("Greet", "/foo", json)

    response.status.should eq(HTTP::Status::OK)
    response.body.should eq(response_json)
  end

  it "signs requests with a session token when the config has one" do
    local_config = Amazonite::Core::Config.new(
      "AKIAIOSFODNN7EXAMPLE", "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY", "us-east-1",
      base_url: "http://www.example.com", session_token: "a-session-token")

    WebMock.stub(:post, "http://www.example.com/foo")
      .with(headers: {"X-Amz-Security-Token" => "a-session-token"})

    client = described_class.new("HelloWorld_20221002", "helloworld", "1.0", exception_factory, local_config)
    client.post("Greet", "/foo", "")
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
    client = described_class.new("HelloWorld_20221002", "helloworld", "1.0", exception_factory, local_config)
    client.post("Salutation", "/", "")
  end

  it "uses url from config object" do
    WebMock.stub(:post, "http://localhost:4566/welcome")

    client = described_class.new("HelloWorld_20221002", "helloworld", "1.0", exception_factory, create_mock_config("http://localhost:4566"))
    client.post("Welcome", "/welcome", "")
  end

  it "throws errors if status is not in the 200..299 range" do
    response_body = %({"__type": "ResourceInUseException", "message": "Table already exists: Music"})
    WebMock.stub(:post, "http://localhost:4566/shalom").to_return(status: 400, body: response_body)

    client = described_class.new("HelloWorld_20221002", "helloworld", "1.0", exception_factory, create_mock_config("http://localhost:4566"))

    e = expect_raises(Amazonite::Core::ResponseException, "Table already exists: Music") do
      client.post("Shalom", "/shalom", "")
    end

    e.http.status_code.should eq(400)
  end

  it "throws errors for non-json responses" do
    response_body = "Table already exists: Music"
    WebMock.stub(:post, "http://localhost:4566/toast").to_return(status: 400, body: response_body)

    client = described_class.new("HelloWorld_20221002", "helloworld", "1.0", exception_factory, create_mock_config("http://localhost:4566"))

    e = expect_raises(Amazonite::Core::ResponseException, "Table already exists: Music") do
      client.post("Toast", "/toast", "")
    end

    e.http.status_code.should eq(400)
  end

  it "applies configured timeouts to the underlying HTTP client" do
    local_config = Amazonite::Core::Config.new(
      "AKIAIOSFODNN7EXAMPLE", "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY", "us-east-1",
      base_url: "http://www.example.com", dns_timeout: 1.seconds, connect_timeout: 2,
      read_timeout: 3.seconds, write_timeout: 4)

    client = TimeoutInspectingClient.new("HelloWorld_20221002", "helloworld", "1.0", exception_factory, local_config)
    http_client = client.http_client_for("Greet", "/foo", "")

    http_client.@dns_timeout.should eq(1.seconds)
    http_client.@connect_timeout.should eq(2.seconds)
    http_client.@read_timeout.should eq(3.seconds)
    http_client.@write_timeout.should eq(4.seconds)
  end

  it "leaves the underlying HTTP client's timeouts unset by default" do
    client = TimeoutInspectingClient.new("HelloWorld_20221002", "helloworld", "1.0", exception_factory, create_mock_config("http://www.example.com"))
    http_client = client.http_client_for("Greet", "/foo", "")

    http_client.@dns_timeout.should be_nil
    http_client.@connect_timeout.should be_nil
    http_client.@read_timeout.should be_nil
    http_client.@write_timeout.should be_nil
  end

  it "throws custom exceptions for a method" do
    response_body = %({"__type": "CustomResponseException", "message": "Database connection is unavailable"})
    WebMock.stub(:post, "http://localhost:4566/hail").to_return(status: 500, body: response_body)

    client = described_class.new("HelloWorld_20221002", "helloworld", "1.0", exception_factory, create_mock_config("http://localhost:4566"))

    e = expect_raises(CustomResponseException, "Database connection is unavailable") do
      client.post("Hail", "/hail", "")
    end

    e.http.status_code.should eq(500)
  end
end
