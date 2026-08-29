module Amazonite::ApplicationDiscoveryServiceV2
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
  end
end
