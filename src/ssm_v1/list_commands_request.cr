module Amazonite::SsmV1
  class ListCommandsRequest
    include JSON::Serializable

    # (Optional) If provided, lists only the specified command.
    @[JSON::Field(key: "CommandId")]
    property command_id : String | Nil

    # (Optional) Lists commands issued against this managed node ID.
    #
    # You can't specify a managed node ID in the same command that you specify `Status` = `Pending`.
    # This is because the command hasn't reached the managed node yet.
    @[JSON::Field(key: "InstanceId")]
    property instance_id : String | Nil

    # (Optional) The maximum number of items to return for this call. The call also returns a token
    # that you can specify in a subsequent call to get the next set of results.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    # (Optional) The token for the next set of items to return. (You received this token from a
    # previous call.)
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    # (Optional) One or more filters. Use a filter to return a more specific list of results.
    @[JSON::Field(key: "Filters")]
    property filters : Array(CommandFilter) | Nil

    def initialize(
      @command_id : String | Nil = nil,
      @instance_id : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
      @filters : Array(CommandFilter) | Nil = nil,
    )
    end
  end
end
