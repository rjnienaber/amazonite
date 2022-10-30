module Amazonite::ApplicationDiscoveryServiceV2
  class AgentConfigurationStatus
    include JSON::Serializable

    @[JSON::Field(key: "agentId")]
    property agent_id : String | Nil

    @[JSON::Field(key: "operationSucceeded")]
    property operation_succeeded : Bool | Nil

    @[JSON::Field(key: "description")]
    property description : String | Nil

    def initialize(
      @agent_id : String | Nil = nil,
      @operation_succeeded : Bool | Nil = nil,
      @description : String | Nil = nil
    )
    end
  end
end
