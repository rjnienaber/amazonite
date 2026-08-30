module Amazonite::EventBridgeV1
  class DescribePartnerEventSourceRequest
    include JSON::Serializable

    # The name of the event source to display.
    @[JSON::Field(key: "Name")]
    property name : String

    def initialize(
      @name : String,
    )
    end

    def_equals_and_hash(@name)
  end
end
