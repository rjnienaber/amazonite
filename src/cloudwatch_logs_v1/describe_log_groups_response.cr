private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @log_groups
        value.each(&.validate!)
      end

      if value = @next_token
        raise Core::ValidationError.new("nextToken length must be >= 1") if value.size < 1
      end
    end

    def_equals_and_hash(@log_groups, @next_token)
  end
end
