module Amazonite::EventBridgeV1
  class DeleteEventBusRequest
    include JSON::Serializable

    # The name of the event bus to delete.
    @[JSON::Field(key: "Name")]
    property name : String

    def initialize(
      @name : String,
    )
    end
  end
end
