private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class GetAccessTokenResponse
    include JSON::Serializable

    # The temporary security credentials which can be used to start just-in-time node access sessions.
    @[JSON::Field(key: "Credentials")]
    property credentials : Credentials | Nil

    # The status of the access request.
    @[JSON::Field(key: "AccessRequestStatus", converter: AS::AccessRequestStatus)]
    property access_request_status : AccessRequestStatus | Nil

    def initialize(
      @credentials : Credentials | Nil = nil,
      @access_request_status : AccessRequestStatus | Nil = nil,
    )
    end
  end
end
