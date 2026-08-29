module Amazonite::EventBridgeV1
  class DeactivateEventSourceRequest
    include JSON::Serializable

    # The name of the partner event source to deactivate.
    @[JSON::Field(key: "Name")]
    property name : String

    def initialize(
      @name : String,
    )
    end
  end
end
