private alias AEB = Amazonite::EventBridge
private alias Core = Amazonite::Core

module Amazonite::EventBridge
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

    def validate! : Nil
      if value = @name
        raise Core::ValidationError.new("Name length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Name length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("Name does not match the required pattern") unless value.matches?(Regex.new("^[\\.\\-_A-Za-z0-9]+$"))
      end

      if value = @arn
        raise Core::ValidationError.new("Arn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Arn length must be <= 1600") if value.size > 1600
        raise Core::ValidationError.new("Arn does not match the required pattern") unless value.matches?(Regex.new("^arn:aws([a-z]|\\-)*:events:([a-z]|\\d|\\-)*:([0-9]{12})?:endpoint\\/[/\\.\\-_A-Za-z0-9]+$"))
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

    def_equals_and_hash(@name, @arn, @routing_config, @replication_config, @event_buses, @role_arn, @state)
  end
end
