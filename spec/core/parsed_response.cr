require "../spec_helper"

describe Amazonite::Core::ParsedResponse do
  class ResponseTest
    include JSON::Serializable

    property name : String
    property surname : String
  end

  it "handles responses that are typed" do
    body = %({"name":"John", "surname": "Doe"})
    mock_response = HTTP::Client::Response.new(HTTP::Status::OK, body)
    response = Amazonite::Core::ParsedResponse(ResponseTest).new(mock_response)

    response.http.status.should eq(HTTP::Status::OK)
    response.result.name.should eq("John")
    response.result.surname.should eq("Doe")
  end
end
