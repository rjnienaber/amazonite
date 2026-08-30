private alias AEB = Amazonite::EventBridgeV1
private alias Core = Amazonite::Core

module Amazonite::EventBridgeV1
  # Contains information about a connection.
  class Connection
    include JSON::Serializable

    # The ARN of the connection.
    @[JSON::Field(key: "ConnectionArn")]
    property connection_arn : String | Nil

    # The name of the connection.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # The state of the connection.
    @[JSON::Field(key: "ConnectionState", converter: AEB::ConnectionState)]
    property connection_state : ConnectionState | Nil

    # The reason that the connection is in the connection state.
    @[JSON::Field(key: "StateReason")]
    property state_reason : String | Nil

    # The authorization type specified for the connection.
    #
    # OAUTH tokens are refreshed when a 401 or 407 response is returned.
    @[JSON::Field(key: "AuthorizationType", converter: AEB::ConnectionAuthorizationType)]
    property authorization_type : ConnectionAuthorizationType | Nil

    # A time stamp for the time that the connection was created.
    @[JSON::Field(key: "CreationTime", converter: Core::AWSEpochConverter)]
    property creation_time : Time | Nil

    # A time stamp for the time that the connection was last modified.
    @[JSON::Field(key: "LastModifiedTime", converter: Core::AWSEpochConverter)]
    property last_modified_time : Time | Nil

    # A time stamp for the time that the connection was last authorized.
    @[JSON::Field(key: "LastAuthorizedTime", converter: Core::AWSEpochConverter)]
    property last_authorized_time : Time | Nil

    def initialize(
      @connection_arn : String | Nil = nil,
      @name : String | Nil = nil,
      @connection_state : ConnectionState | Nil = nil,
      @state_reason : String | Nil = nil,
      @authorization_type : ConnectionAuthorizationType | Nil = nil,
      @creation_time : Time | Nil = nil,
      @last_modified_time : Time | Nil = nil,
      @last_authorized_time : Time | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @connection_arn
        raise Core::ValidationError.new("ConnectionArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ConnectionArn length must be <= 1600") if value.size > 1600
        raise Core::ValidationError.new("ConnectionArn does not match the required pattern") unless value.matches?(Regex.new("^arn:aws([a-z]|\\-)*:events:([a-z]|\\d|\\-)*:([0-9]{12})?:connection\\/[\\.\\-_A-Za-z0-9]+\\/[\\-A-Za-z0-9]+$"))
      end

      if value = @name
        raise Core::ValidationError.new("Name length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Name length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("Name does not match the required pattern") unless value.matches?(Regex.new("^[\\.\\-_A-Za-z0-9]+$"))
      end

      if value = @state_reason
        raise Core::ValidationError.new("StateReason length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("StateReason length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("StateReason does not match the required pattern") unless value.matches?(Regex.new(".*"))
      end
    end

    def_equals_and_hash(@connection_arn, @name, @connection_state, @state_reason, @authorization_type, @creation_time, @last_modified_time, @last_authorized_time)
  end
end
