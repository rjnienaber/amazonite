module Amazonite::DynamoDBv2
  class Endpoint
    include JSON::Serializable

    @[JSON::Field(key: "Address")]
    property address : String

    @[JSON::Field(key: "CachePeriodInMinutes")]
    property cache_period_in_minutes : Int64

    def initialize(
      @address : String,
      @cache_period_in_minutes : Int64
    )
    end
  end
end
