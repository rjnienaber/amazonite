module Amazonite::SsmV1
  class ListCommandInvocationsRequest
    include JSON::Serializable

    # (Optional) The invocations for a specific command ID.
    @[JSON::Field(key: "CommandId")]
    property command_id : String | Nil

    # (Optional) The command execution details for a specific managed node ID.
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

    # (Optional) If set this returns the response of the command executions and any command output.
    # The default value is `false`.
    @[JSON::Field(key: "Details")]
    property details : Bool | Nil

    def initialize(
      @command_id : String | Nil = nil,
      @instance_id : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
      @filters : Array(CommandFilter) | Nil = nil,
      @details : Bool | Nil = nil,
    )
    end

    def_equals_and_hash(@command_id, @instance_id, @max_results, @next_token, @filters, @details)
  end
end
