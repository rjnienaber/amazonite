private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogsV1
  class DescribeSubscriptionFiltersRequest
    include JSON::Serializable

    # The name of the log group.
    @[JSON::Field(key: "logGroupName")]
    property log_group_name : String

    # The prefix to match. If you don't specify a value, no prefix filter is applied.
    @[JSON::Field(key: "filterNamePrefix")]
    property filter_name_prefix : String | Nil

    # The token for the next set of items to return. (You received this token from a previous call.)
    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    # The maximum number of items returned. If you don't specify a value, the default is up to 50
    # items.
    @[JSON::Field(key: "limit")]
    property limit : Int32 | Nil

    def initialize(
      @log_group_name : String,
      @filter_name_prefix : String | Nil = nil,
      @next_token : String | Nil = nil,
      @limit : Int32 | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @log_group_name
        raise Core::ValidationError.new("logGroupName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("logGroupName length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("logGroupName does not match the required pattern") unless value.matches?(Regex.new("^[\\.\\-_/#A-Za-z0-9]+$"))
      end

      if value = @filter_name_prefix
        raise Core::ValidationError.new("filterNamePrefix length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("filterNamePrefix length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("filterNamePrefix does not match the required pattern") unless value.matches?(Regex.new("^[^:*]*$"))
      end

      if value = @next_token
        raise Core::ValidationError.new("nextToken length must be >= 1") if value.size < 1
      end

      if value = @limit
        raise Core::ValidationError.new("limit value must be >= 1") if value < 1
        raise Core::ValidationError.new("limit value must be <= 50") if value > 50
      end
    end

    def_equals_and_hash(@log_group_name, @filter_name_prefix, @next_token, @limit)
  end
end
