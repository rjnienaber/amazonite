module Amazonite::EventBridgeV1
  class ActivateEventSourceRequest
    include JSON::Serializable

    # The name of the partner event source to activate.
    @[JSON::Field(key: "Name")]
    property name : String

    def initialize(
      @name : String,
    )
    end
  end
end
