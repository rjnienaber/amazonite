private alias Core = Amazonite::Core

module Amazonite::Ssm
  class GetAccessTokenRequest
    include JSON::Serializable

    # The ID of a just-in-time node access request.
    @[JSON::Field(key: "AccessRequestId")]
    property access_request_id : String

    def initialize(
      @access_request_id : String,
    )
    end

    def validate! : Nil
      if value = @access_request_id
        raise Core::ValidationError.new("AccessRequestId does not match the required pattern") unless value.matches?(Regex.new("^(oi)-[0-9a-f]{12}$"))
      end
    end

    def_equals_and_hash(@access_request_id)
  end
end
