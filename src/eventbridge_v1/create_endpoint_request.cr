module Amazonite::EventBridgeV1
  class CreateEndpointRequest
    include JSON::Serializable

    # The name of the global endpoint. For example, `"Name":"us-east-2-custom_bus_A-endpoint"`.
    @[JSON::Field(key: "Name")]
    property name : String

    # A description of the global endpoint.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    # Configure the routing policy, including the health check and secondary Region..
    @[JSON::Field(key: "RoutingConfig")]
    property routing_config : RoutingConfig

    # Enable or disable event replication. The default state is `ENABLED` which means you must supply
    # a `RoleArn`. If you don't have a `RoleArn` or you don't want event replication enabled, set the
    # state to `DISABLED`.
    @[JSON::Field(key: "ReplicationConfig")]
    property replication_config : ReplicationConfig | Nil

    # Define the event buses used.
    #
    # The names of the event buses must be identical in each Region.
    @[JSON::Field(key: "EventBuses")]
    property event_buses : Array(EndpointEventBus) = [] of EndpointEventBus

    # The ARN of the role used for replication.
    @[JSON::Field(key: "RoleArn")]
    property role_arn : String | Nil

    def initialize(
      @name : String,
      @routing_config : RoutingConfig,
      @event_buses : Array(EndpointEventBus),
      @description : String | Nil = nil,
      @replication_config : ReplicationConfig | Nil = nil,
      @role_arn : String | Nil = nil,
    )
    end

    def_equals_and_hash(@name, @description, @routing_config, @replication_config, @event_buses, @role_arn)
  end
end
