module Amazonite::EventBridgeV1
  class DescribeApiDestinationRequest
    include JSON::Serializable

    # The name of the API destination to retrieve.
    @[JSON::Field(key: "Name")]
    property name : String

    def initialize(
      @name : String,
    )
    end
  end
end
