module Amazonite::EventBridgeV1
  class DescribePartnerEventSourceResponse
    include JSON::Serializable

    # The ARN of the event source.
    @[JSON::Field(key: "Arn")]
    property arn : String | Nil

    # The name of the event source.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    def initialize(
      @arn : String | Nil = nil,
      @name : String | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@arn, @name)
  end
end
