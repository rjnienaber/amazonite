private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
  class ListLogGroupsForQueryResponse
    include JSON::Serializable

    # An array of the names and ARNs of the log groups that were processed in the query.
    @[JSON::Field(key: "logGroupIdentifiers")]
    property log_group_identifiers : Array(String) | Nil

    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    def initialize(
      @log_group_identifiers : Array(String) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @next_token
        raise Core::ValidationError.new("nextToken length must be >= 1") if value.size < 1
      end
    end

    def_equals_and_hash(@log_group_identifiers, @next_token)
  end
end
