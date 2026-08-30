module Amazonite::SsmV1
  class DescribeMaintenanceWindowExecutionsRequest
    include JSON::Serializable

    # The ID of the maintenance window whose executions should be retrieved.
    @[JSON::Field(key: "WindowId")]
    property window_id : String

    # Each entry in the array is a structure containing:
    #
    # - Key. A string between 1 and 128 characters. Supported keys include `ExecutedBefore` and
    # `ExecutedAfter`.
    #
    # - Values. An array of strings, each between 1 and 256 characters. Supported values are date/time
    # strings in a valid ISO 8601 date/time format, such as `2024-11-04T05:00:00Z`.
    @[JSON::Field(key: "Filters")]
    property filters : Array(MaintenanceWindowFilter) | Nil

    # The maximum number of items to return for this call. The call also returns a token that you can
    # specify in a subsequent call to get the next set of results.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    # The token for the next set of items to return. (You received this token from a previous call.)
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @window_id : String,
      @filters : Array(MaintenanceWindowFilter) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def_equals_and_hash(@window_id, @filters, @max_results, @next_token)
  end
end
