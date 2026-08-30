module Amazonite::DynamoDBV2
  # An endpoint information details.
  class Endpoint
    include JSON::Serializable

    # IP address of the endpoint.
    @[JSON::Field(key: "Address")]
    property address : String

    # Endpoint cache time to live (TTL) value.
    @[JSON::Field(key: "CachePeriodInMinutes")]
    property cache_period_in_minutes : Int64

    def initialize(
      @address : String,
      @cache_period_in_minutes : Int64,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@address, @cache_period_in_minutes)
  end
end
