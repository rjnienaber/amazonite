module Amazonite::EventBridgeV1
  class DescribeConnectionRequest
    include JSON::Serializable

    # The name of the connection to retrieve.
    @[JSON::Field(key: "Name")]
    property name : String

    def initialize(
      @name : String,
    )
    end
  end
end
