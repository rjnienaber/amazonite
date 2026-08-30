private alias AEB = Amazonite::EventBridgeV1
private alias Core = Amazonite::Core

module Amazonite::EventBridgeV1
  class UpdateConnectionResponse
    include JSON::Serializable

    # The ARN of the connection that was updated.
    @[JSON::Field(key: "ConnectionArn")]
    property connection_arn : String | Nil

    # The state of the connection that was updated.
    @[JSON::Field(key: "ConnectionState", converter: AEB::ConnectionState)]
    property connection_state : ConnectionState | Nil

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
      @connection_state : ConnectionState | Nil = nil,
      @creation_time : Time | Nil = nil,
      @last_modified_time : Time | Nil = nil,
      @last_authorized_time : Time | Nil = nil,
    )
    end

    def_equals_and_hash(@connection_arn, @connection_state, @creation_time, @last_modified_time, @last_authorized_time)
  end
end
