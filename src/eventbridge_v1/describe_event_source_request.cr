module Amazonite::EventBridgeV1
  class DescribeEventSourceRequest
    include JSON::Serializable

    # The name of the partner event source to display the details of.
    @[JSON::Field(key: "Name")]
    property name : String

    def initialize(
      @name : String,
    )
    end

    def_equals_and_hash(@name)
  end
end
