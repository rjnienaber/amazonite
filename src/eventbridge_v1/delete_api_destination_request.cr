module Amazonite::EventBridgeV1
  class DeleteApiDestinationRequest
    include JSON::Serializable

    # The name of the destination to delete.
    @[JSON::Field(key: "Name")]
    property name : String

    def initialize(
      @name : String,
    )
    end
  end
end
