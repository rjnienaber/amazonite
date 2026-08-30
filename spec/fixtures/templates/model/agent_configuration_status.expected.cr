private alias Core = Amazonite::Core

module Amazonite::ApplicationDiscoveryService
  # Information about agents that were instructed to start collecting data. Information includes the
  # agent ID, a description of the operation, and whether the agent configuration was updated.
  class AgentConfigurationStatus
    include JSON::Serializable

    # The agent ID.
    @[JSON::Field(key: "agentId")]
    property agent_id : String | Nil

    # Information about the status of the `StartDataCollection` and `StopDataCollection` operations.
    # The system has recorded the data collection operation. The agent receives this command the next
    # time it polls for a new command.
    @[JSON::Field(key: "operationSucceeded")]
    property operation_succeeded : Bool | Nil

    # A description of the operation performed.
    @[JSON::Field(key: "description")]
    property description : String | Nil

    def initialize(
      @agent_id : String | Nil = nil,
      @operation_succeeded : Bool | Nil = nil,
      @description : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @agent_id
        raise Core::ValidationError.new("agentId length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("agentId length must be <= 10000") if value.size > 10000
        raise Core::ValidationError.new("agentId does not match the required pattern") unless value.matches?(Regex.new("^[\\s\\S]*$"))
      end

      if value = @description
        raise Core::ValidationError.new("description length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("description length must be <= 10000") if value.size > 10000
        raise Core::ValidationError.new("description does not match the required pattern") unless value.matches?(Regex.new("^[\\s\\S]*$"))
      end
    end

    def_equals_and_hash(@agent_id, @operation_succeeded, @description)
  end
end
