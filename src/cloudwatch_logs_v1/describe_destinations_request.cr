private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogsV1
  class DescribeDestinationsRequest
    include JSON::Serializable

    # The prefix to match. If you don't specify a value, no prefix filter is applied.
    @[JSON::Field(key: "DestinationNamePrefix")]
    property destination_name_prefix : String | Nil

    # The token for the next set of items to return. (You received this token from a previous call.)
    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    # The maximum number of items returned. If you don't specify a value, the default maximum value of
    # 50 items is used.
    @[JSON::Field(key: "limit")]
    property limit : Int32 | Nil

    def initialize(
      @destination_name_prefix : String | Nil = nil,
      @next_token : String | Nil = nil,
      @limit : Int32 | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @destination_name_prefix
        raise Core::ValidationError.new("DestinationNamePrefix length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("DestinationNamePrefix length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("DestinationNamePrefix does not match the required pattern") unless value.matches?(Regex.new("^[^:*]*$"))
      end

      if value = @next_token
        raise Core::ValidationError.new("nextToken length must be >= 1") if value.size < 1
      end

      if value = @limit
        raise Core::ValidationError.new("limit value must be >= 1") if value < 1
        raise Core::ValidationError.new("limit value must be <= 50") if value > 50
      end
    end

    def_equals_and_hash(@destination_name_prefix, @next_token, @limit)
  end
end
