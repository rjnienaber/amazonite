module Amazonite::SsmV1
  class GetAccessTokenRequest
    include JSON::Serializable

    # The ID of a just-in-time node access request.
    @[JSON::Field(key: "AccessRequestId")]
    property access_request_id : String

    def initialize(
      @access_request_id : String,
    )
    end

    def_equals_and_hash(@access_request_id)
  end
end
