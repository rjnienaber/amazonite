module Amazonite::SsmV1
  class StartAccessRequestResponse
    include JSON::Serializable

    # The ID of the access request.
    @[JSON::Field(key: "AccessRequestId")]
    property access_request_id : String | Nil

    def initialize(
      @access_request_id : String | Nil = nil,
    )
    end
  end
end
