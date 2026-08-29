module Amazonite::EventBridgeV1
  class UpdateEndpointRequest
    include JSON::Serializable

    # The name of the endpoint you want to update.
    @[JSON::Field(key: "Name")]
    property name : String

    # A description for the endpoint.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    # Configure the routing policy, including the health check and secondary Region.
    @[JSON::Field(key: "RoutingConfig")]
    property routing_config : RoutingConfig | Nil

    # Whether event replication was enabled or disabled by this request.
    @[JSON::Field(key: "ReplicationConfig")]
    property replication_config : ReplicationConfig | Nil

    # Define event buses used for replication.
    @[JSON::Field(key: "EventBuses")]
    property event_buses : Array(EndpointEventBus) | Nil

    # The ARN of the role used by event replication for this request.
    @[JSON::Field(key: "RoleArn")]
    property role_arn : String | Nil

    def initialize(
      @name : String,
      @description : String | Nil = nil,
      @routing_config : RoutingConfig | Nil = nil,
      @replication_config : ReplicationConfig | Nil = nil,
      @event_buses : Array(EndpointEventBus) | Nil = nil,
      @role_arn : String | Nil = nil,
    )
    end
  end
end
