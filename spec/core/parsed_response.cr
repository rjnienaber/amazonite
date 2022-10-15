require "../spec_helper"

describe Amazonite::Core::ParsedResponse do
  class ResponseTest
    include JSON::Serializable

    property name : String
    property surname : String
  end

  described_class = Amazonite::Core::ParsedResponse

  it "handles responses that are typed" do
    body = %({"name":"John", "surname": "Doe"})
    mock_response = HTTP::Client::Response.new(HTTP::Status::OK, body)
    response = described_class(ResponseTest).new(mock_response)

    response.http.status.should eq(HTTP::Status::OK)
    response.result.name.should eq("John")
    response.result.surname.should eq("Doe")
  end
end
