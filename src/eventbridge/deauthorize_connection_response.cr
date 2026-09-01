private alias AEB = Amazonite::EventBridge
private alias Core = Amazonite::Core

module Amazonite::EventBridge
  class DeauthorizeConnectionResponse
    include JSON::Serializable

    # The ARN of the connection that authorization was removed from.
    @[JSON::Field(key: "ConnectionArn")]
    property connection_arn : String | Nil

    # The state of the connection.
    @[JSON::Field(key: "ConnectionState", converter: AEB::ConnectionState)]
    property connection_state : ConnectionState | Nil

    # A time stamp for the time that the connection was created.
    @[JSON::Field(key: "CreationTime", converter: Core::AWSEpochConverter)]
    property creation_time : Time | Nil

    # A time stamp for the time that the connection was last updated.
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

    def validate! : Nil
      if value = @connection_arn
        raise Core::ValidationError.new("ConnectionArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ConnectionArn length must be <= 1600") if value.size > 1600
        raise Core::ValidationError.new("ConnectionArn does not match the required pattern") unless value.matches?(Regex.new("^arn:aws([a-z]|\\-)*:events:([a-z]|\\d|\\-)*:([0-9]{12})?:connection\\/[\\.\\-_A-Za-z0-9]+\\/[\\-A-Za-z0-9]+$"))
      end
    end

    def_equals_and_hash(@connection_arn, @connection_state, @creation_time, @last_modified_time, @last_authorized_time)
  end
end
