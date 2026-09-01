private alias Core = Amazonite::Core

module Amazonite::Ssm
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

    def validate! : Nil
      if value = @command_id
        raise Core::ValidationError.new("CommandId length must be >= 36") if value.size < 36
        raise Core::ValidationError.new("CommandId length must be <= 36") if value.size > 36
      end

      if value = @instance_id
        raise Core::ValidationError.new("InstanceId does not match the required pattern") unless value.matches?(Regex.new("^(^i-(\\w{8}|\\w{17})$)|(^mi-\\w{17}$)$"))
      end

      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxResults value must be <= 50") if value > 50
      end

      if value = @filters
        raise Core::ValidationError.new("Filters must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("Filters must have at most 5 item(s)") if value.size > 5
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@command_id, @instance_id, @max_results, @next_token, @filters)
  end
end
