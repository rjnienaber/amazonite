module Amazonite::EventBridgeV1
  class DeauthorizeConnectionRequest
    include JSON::Serializable

    # The name of the connection to remove authorization from.
    @[JSON::Field(key: "Name")]
    property name : String

    def initialize(
      @name : String,
    )
    end

    def_equals_and_hash(@name)
  end
end
