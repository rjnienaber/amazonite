private alias AEB = Amazonite::EventBridgeV1
private alias Core = Amazonite::Core

module Amazonite::EventBridgeV1
  # A global endpoint used to improve your application's availability by making it regional-fault
  # tolerant. For more information about global endpoints, see [Making applications Regional-fault
  # tolerant with global endpoints and event
  # replication](https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-global-endpoints.html)
  # in the * *Amazon EventBridge User Guide* *.
  class Endpoint
    include JSON::Serializable

    # The name of the endpoint.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # A description for the endpoint.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    # The ARN of the endpoint.
    @[JSON::Field(key: "Arn")]
    property arn : String | Nil

    # The routing configuration of the endpoint.
    @[JSON::Field(key: "RoutingConfig")]
    property routing_config : RoutingConfig | Nil

    # Whether event replication was enabled or disabled for this endpoint. The default state is
    # `ENABLED` which means you must supply a `RoleArn`. If you don't have a `RoleArn` or you don't
    # want event replication enabled, set the state to `DISABLED`.
    @[JSON::Field(key: "ReplicationConfig")]
    property replication_config : ReplicationConfig | Nil

    # The event buses being used by the endpoint.
    @[JSON::Field(key: "EventBuses")]
    property event_buses : Array(EndpointEventBus) | Nil

    # The ARN of the role used by event replication for the endpoint.
    @[JSON::Field(key: "RoleArn")]
    property role_arn : String | Nil

    # The URL subdomain of the endpoint. For example, if the URL for Endpoint is
    # https://abcde.veo.endpoints.event.amazonaws.com, then the EndpointId is `abcde.veo`.
    @[JSON::Field(key: "EndpointId")]
    property endpoint_id : String | Nil

    # The URL of the endpoint.
    @[JSON::Field(key: "EndpointUrl")]
    property endpoint_url : String | Nil

    # The current state of the endpoint.
    @[JSON::Field(key: "State", converter: AEB::EndpointState)]
    property state : EndpointState | Nil

    # The reason the endpoint is in its current state.
    @[JSON::Field(key: "StateReason")]
    property state_reason : String | Nil

    # The time the endpoint was created.
    @[JSON::Field(key: "CreationTime", converter: Core::AWSEpochConverter)]
    property creation_time : Time | Nil

    # The last time the endpoint was modified.
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

      if value = @endpoint_id
        raise Core::ValidationError.new("EndpointId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("EndpointId length must be <= 50") if value.size > 50
        raise Core::ValidationError.new("EndpointId does not match the required pattern") unless value.matches?(Regex.new("^[A-Za-z0-9\\-]+[\\.][A-Za-z0-9\\-]+$"))
      end

      if value = @endpoint_url
        raise Core::ValidationError.new("EndpointUrl length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("EndpointUrl length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("EndpointUrl does not match the required pattern") unless value.matches?(Regex.new("^(https://)?[\\.\\-a-z0-9]+$"))
      end

      if value = @state_reason
        raise Core::ValidationError.new("StateReason length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StateReason length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("StateReason does not match the required pattern") unless value.matches?(Regex.new(".*"))
      end
    end

    def_equals_and_hash(@name, @description, @arn, @routing_config, @replication_config, @event_buses, @role_arn, @endpoint_id, @endpoint_url, @state, @state_reason, @creation_time, @last_modified_time)
  end
end
