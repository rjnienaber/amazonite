private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogsV1
  class DescribeIndexPoliciesRequest
    include JSON::Serializable

    # An array containing the name or ARN of the log group that you want to retrieve field index
    # policies for.
    @[JSON::Field(key: "logGroupIdentifiers")]
    property log_group_identifiers : Array(String) = [] of String

    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    def initialize(
      @log_group_identifiers : Array(String),
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @log_group_identifiers
        raise Core::ValidationError.new("logGroupIdentifiers must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("logGroupIdentifiers must have at most 1 item(s)") if value.size > 1
      end

      if value = @next_token
        raise Core::ValidationError.new("nextToken length must be >= 1") if value.size < 1
      end
    end

    def_equals_and_hash(@log_group_identifiers, @next_token)
  end
end
