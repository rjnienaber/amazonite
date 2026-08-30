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
  end
end
