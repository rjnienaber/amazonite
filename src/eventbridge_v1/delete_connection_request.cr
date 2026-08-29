module Amazonite::EventBridgeV1
  class DeleteConnectionRequest
    include JSON::Serializable

    # The name of the connection to delete.
    @[JSON::Field(key: "Name")]
    property name : String

    def initialize(
      @name : String,
    )
    end
  end
end
