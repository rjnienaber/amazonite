module Amazonite::DynamoDBv2
  class TimeToLiveSpecification
    include JSON::Serializable

    @[JSON::Field(key: "Enabled")]
    property enabled : Bool

    @[JSON::Field(key: "AttributeName")]
    property attribute_name : String

    def initialize(
      @enabled : Bool,
      @attribute_name : String
    )
    end
  end
end