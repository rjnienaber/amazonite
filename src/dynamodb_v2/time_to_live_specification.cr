module Amazonite::DynamoDBV2
  # Represents the settings used to enable or disable Time to Live (TTL) for the specified table.
  class TimeToLiveSpecification
    include JSON::Serializable

    # Indicates whether TTL is to be enabled (true) or disabled (false) on the table.
    @[JSON::Field(key: "Enabled")]
    property enabled : Bool

    # The name of the TTL attribute used to store the expiration time for items in the table.
    @[JSON::Field(key: "AttributeName")]
    property attribute_name : String

    def initialize(
      @enabled : Bool,
      @attribute_name : String,
    )
    end
  end
end
