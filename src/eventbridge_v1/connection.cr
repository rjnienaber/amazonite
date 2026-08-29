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
  end
end
