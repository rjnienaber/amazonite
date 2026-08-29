module Amazonite::DynamoDBV2
  class ThrottlingReason
    include JSON::Serializable

    @[JSON::Field(key: "reason")]
    property reason : String | Nil

    @[JSON::Field(key: "resource")]
    property resource : String | Nil

    def initialize(
      @reason : String | Nil = nil,
      @resource : String | Nil = nil,
    )
    end
  end
end
