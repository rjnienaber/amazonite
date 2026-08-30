private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @name
        raise Core::ValidationError.new("Name length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Name length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("Name does not match the required pattern") unless value.matches?(Regex.new("^[\\.\\-_A-Za-z0-9]+$"))
      end

      if value = @description
        raise Core::ValidationError.new("Description length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Description length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("Description does not match the required pattern") unless value.matches?(Regex.new(".*"))
      end

      if value = @routing_config
        value.validate!
      end

      if value = @replication_config
        value.validate!
      end

      if value = @event_buses
        raise Core::ValidationError.new("EventBuses must have at least 2 item(s)") if value.size < 2
        raise Core::ValidationError.new("EventBuses must have at most 2 item(s)") if value.size > 2
        value.each(&.validate!)
      end

      if value = @role_arn
        raise Core::ValidationError.new("RoleArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("RoleArn length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("RoleArn does not match the required pattern") unless value.matches?(Regex.new("^arn:aws[a-z-]*:iam::\\d{12}:role\\/[\\w+=,.@/-]+$"))
      end
    end

    def_equals_and_hash(@name, @description, @routing_config, @replication_config, @event_buses, @role_arn)
  end
end
