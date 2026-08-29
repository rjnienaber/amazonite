private alias AEB = Amazonite::EventBridgeV1
private alias Core = Amazonite::Core

module Amazonite::EventBridgeV1
  class DescribeEndpointResponse
    include JSON::Serializable

    # The name of the endpoint you asked for information about.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # The description of the endpoint you asked for information about.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    # The ARN of the endpoint you asked for information about.
    @[JSON::Field(key: "Arn")]
    property arn : String | Nil

    # The routing configuration of the endpoint you asked for information about.
    @[JSON::Field(key: "RoutingConfig")]
    property routing_config : RoutingConfig | Nil

    # Whether replication is enabled or disabled for the endpoint you asked for information about.
    @[JSON::Field(key: "ReplicationConfig")]
    property replication_config : ReplicationConfig | Nil

    # The event buses being used by the endpoint you asked for information about.
    @[JSON::Field(key: "EventBuses")]
    property event_buses : Array(EndpointEventBus) | Nil

    # The ARN of the role used by the endpoint you asked for information about.
    @[JSON::Field(key: "RoleArn")]
    property role_arn : String | Nil

    # The ID of the endpoint you asked for information about.
    @[JSON::Field(key: "EndpointId")]
    property endpoint_id : String | Nil

    # The URL of the endpoint you asked for information about.
    @[JSON::Field(key: "EndpointUrl")]
    property endpoint_url : String | Nil

    # The current state of the endpoint you asked for information about.
    @[JSON::Field(key: "State", converter: AEB::EndpointState)]
    property state : EndpointState | Nil

    # The reason the endpoint you asked for information about is in its current state.
    @[JSON::Field(key: "StateReason")]
    property state_reason : String | Nil

    # The time the endpoint you asked for information about was created.
    @[JSON::Field(key: "CreationTime", converter: Core::AWSEpochConverter)]
    property creation_time : Time | Nil

    # The last time the endpoint you asked for information about was modified.
    @[JSON::Field(key: "LastModifiedTime", converter: Core::AWSEpochConverter)]
    property last_modified_time : Time | Nil

    def initialize(
      @name : String | Nil = nil,
      @description : String | Nil = nil,
      @arn : String | Nil = nil,
      @routing_config : RoutingConfig | Nil = nil,
      @replication_config : ReplicationConfig | Nil = nil,
      @event_buses : Array(EndpointEventBus) | Nil = nil,
      @role_arn : String | Nil = nil,
      @endpoint_id : String | Nil = nil,
      @endpoint_url : String | Nil = nil,
      @state : EndpointState | Nil = nil,
      @state_reason : String | Nil = nil,
      @creation_time : Time | Nil = nil,
      @last_modified_time : Time | Nil = nil,
    )
    end
  end
end
