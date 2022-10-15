require "../spec_helper"

describe Amazonite::Core::Client do
  described_class = Amazonite::Core::Client

  it "handles post requests" do
    json = %({"name":"John", "surname": "Doe"})
    response_json = %({"response":#{json}})
    headers = {
      "X-Amz-Target" => "HelloWorld_20221002.Greet",
      "Content-Type" => "application/x-amz-json-1.0",
      "User-Agent"   => "amazonite/0.1.1 Crystal/1.6.0 command/helloworld.greet",
    }
    WebMock.stub(:post, "http://www.example.com/foo")
      .with(body: json, headers: headers)
      .to_return(body: response_json)

    client = described_class.new("HelloWorld_20221002", "helloworld", "http://www.example.com")
    response = client.post("Greet", "/foo", json)

    response.status.should eq(HTTP::Status::OK)
    response.body.should eq(response_json)
  end

  it "allows setting the user agent" do
    json = %({"name":"John", "surname": "Doe"})
    response_json = %({"response":#{json}})
    headers = {
      "X-Amz-Target" => "HelloWorld_20221002.Salutation",
      "Content-Type" => "application/x-amz-json-1.0",
      "User-Agent"   => "custom/user-agent",
    }
    WebMock.stub(:post, "http://localhost/")
      .with(body: "", headers: headers)

    client = described_class.new("HelloWorld_20221002", "helloworld", "http://localhost", "custom/user-agent")
    response = client.post("Salutation", "/", "")
  end
end
