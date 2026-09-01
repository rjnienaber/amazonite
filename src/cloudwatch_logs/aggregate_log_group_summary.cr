private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
  # Contains an aggregate summary of log groups grouped by data source characteristics, including
  # the count of log groups and their grouping identifiers.
  class AggregateLogGroupSummary
    include JSON::Serializable

    # The number of log groups in this aggregate summary group.
    @[JSON::Field(key: "logGroupCount")]
    property log_group_count : Int32 | Nil

    # An array of key-value pairs that identify the data source characteristics used to group the log
    # groups.
    #
    # The size and content of this array depends on the `groupBy` parameter specified in the request.
    @[JSON::Field(key: "groupingIdentifiers")]
    property grouping_identifiers : Array(GroupingIdentifier) | Nil

    def initialize(
      @log_group_count : Int32 | Nil = nil,
      @grouping_identifiers : Array(GroupingIdentifier) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @grouping_identifiers
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@log_group_count, @grouping_identifiers)
  end
end
