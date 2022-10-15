require "../spec_helper"

describe Amazonite::Core::Response do
  described_class = Amazonite::Core::Response

  it "handles responses without an output" do
    mock_response = HTTP::Client::Response.new(HTTP::Status::OK)
    response = described_class.new(mock_response)

    response.http.status.should eq(HTTP::Status::OK)
  end
end
