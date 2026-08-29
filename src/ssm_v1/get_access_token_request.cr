module Amazonite::SsmV1
  class GetAccessTokenRequest
    include JSON::Serializable

    @[JSON::Field(key: "AccessRequestId")]
    property access_request_id : String

    def initialize(
      @access_request_id : String,
    )
    end
  end
end
