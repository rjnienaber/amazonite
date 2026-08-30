private alias AEB = Amazonite::EventBridgeV1

module Amazonite::EventBridgeV1
  class CreateEndpointResponse
    include JSON::Serializable

    # The name of the endpoint that was created by this request.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # The ARN of the endpoint that was created by this request.
    @[JSON::Field(key: "Arn")]
    property arn : String | Nil

    # The routing configuration defined by this request.
    @[JSON::Field(key: "RoutingConfig")]
    property routing_config : RoutingConfig | Nil

    # Whether event replication was enabled or disabled by this request.
    @[JSON::Field(key: "ReplicationConfig")]
    property replication_config : ReplicationConfig | Nil

    # The event buses used by this request.
    @[JSON::Field(key: "EventBuses")]
    property event_buses : Array(EndpointEventBus) | Nil

    # The ARN of the role used by event replication for this request.
    @[JSON::Field(key: "RoleArn")]
    property role_arn : String | Nil

    # The state of the endpoint that was created by this request.
    @[JSON::Field(key: "State", converter: AEB::EndpointState)]
    property state : EndpointState | Nil

    def initialize(
      @name : String | Nil = nil,
      @arn : String | Nil = nil,
      @routing_config : RoutingConfig | Nil = nil,
      @replication_config : ReplicationConfig | Nil = nil,
      @event_buses : Array(EndpointEventBus) | Nil = nil,
      @role_arn : String | Nil = nil,
      @state : EndpointState | Nil = nil,
    )
    end

    def_equals_and_hash(@name, @arn, @routing_config, @replication_config, @event_buses, @role_arn, @state)
  end
end
