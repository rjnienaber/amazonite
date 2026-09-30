private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
  class DescribeDeliverySourcesRequest
    include JSON::Serializable

    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    # Optionally specify the maximum number of delivery sources to return in the response.
    @[JSON::Field(key: "limit")]
    property limit : Int32 | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @limit : Int32 | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @next_token
        raise Core::ValidationError.new("nextToken length must be >= 1") if value.size < 1
      end

      if value = @limit
        raise Core::ValidationError.new("limit value must be >= 1") if value < 1
        raise Core::ValidationError.new("limit value must be <= 50") if value > 50
      end
    end

    def_equals_and_hash(@next_token, @limit)
  end
end
