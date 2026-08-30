module Amazonite::CloudWatchLogsV1
  class DescribeLogGroupsResponse
    include JSON::Serializable

    # An array of structures, where each structure contains the information about one log group.
    @[JSON::Field(key: "logGroups")]
    property log_groups : Array(LogGroup) | Nil

    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    def initialize(
      @log_groups : Array(LogGroup) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
