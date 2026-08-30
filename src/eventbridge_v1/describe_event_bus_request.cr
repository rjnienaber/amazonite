module Amazonite::EventBridgeV1
  class DescribeEventBusRequest
    include JSON::Serializable

    # The name or ARN of the event bus to show details for. If you omit this, the default event bus is
    # displayed.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    def initialize(
      @name : String | Nil = nil,
    )
    end
  end
end
