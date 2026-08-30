private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @access_request_id
        raise Core::ValidationError.new("AccessRequestId does not match the required pattern") unless value.matches?(Regex.new("^(oi)-[0-9a-f]{12}$"))
      end
    end

    def_equals_and_hash(@access_request_id)
  end
end
