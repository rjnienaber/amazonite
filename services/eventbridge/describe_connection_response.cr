private alias AEB = Amazonite::EventBridge
private alias Core = Amazonite::Core

module Amazonite::EventBridge
  class DescribeConnectionResponse
    include JSON::Serializable

    # The ARN of the connection retrieved.
    @[JSON::Field(key: "ConnectionArn")]
    property connection_arn : String | Nil

    # The name of the connection retrieved.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # The description for the connection retrieved.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    # For connections to private APIs The parameters EventBridge uses to invoke the resource endpoint.
    #
    # For more information, see [Connecting to private
    # APIs](https://docs.aws.amazon.com/eventbridge/latest/userguide/connection-private.html) in the *
    # *Amazon EventBridge User Guide* *.
    @[JSON::Field(key: "InvocationConnectivityParameters")]
    property invocation_connectivity_parameters : DescribeConnectionConnectivityParameters | Nil

    # The state of the connection retrieved.
    @[JSON::Field(key: "ConnectionState", converter: AEB::ConnectionState)]
    property connection_state : ConnectionState | Nil

    # The reason that the connection is in the current connection state.
    @[JSON::Field(key: "StateReason")]
    property state_reason : String | Nil

    # The type of authorization specified for the connection.
    @[JSON::Field(key: "AuthorizationType", converter: AEB::ConnectionAuthorizationType)]
    property authorization_type : ConnectionAuthorizationType | Nil

    # The ARN of the secret created from the authorization parameters specified for the connection.
    @[JSON::Field(key: "SecretArn")]
    property secret_arn : String | Nil

    # The identifier of the KMS customer managed key for EventBridge to use to encrypt the connection,
    # if one has been specified.
    #
    # For more information, see [Encrypting
    # connections](https://docs.aws.amazon.com/eventbridge/latest/userguide/encryption-connections.html)
    # in the *Amazon EventBridge User Guide*.
    @[JSON::Field(key: "KmsKeyIdentifier")]
    property kms_key_identifier : String | Nil

    # The parameters to use for authorization for the connection.
    @[JSON::Field(key: "AuthParameters")]
    property auth_parameters : ConnectionAuthResponseParameters | Nil

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
      @description : String | Nil = nil,
      @invocation_connectivity_parameters : DescribeConnectionConnectivityParameters | Nil = nil,
      @connection_state : ConnectionState | Nil = nil,
      @state_reason : String | Nil = nil,
      @authorization_type : ConnectionAuthorizationType | Nil = nil,
      @secret_arn : String | Nil = nil,
      @kms_key_identifier : String | Nil = nil,
      @auth_parameters : ConnectionAuthResponseParameters | Nil = nil,
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

      if value = @description
        raise Core::ValidationError.new("Description length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Description length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("Description does not match the required pattern") unless value.matches?(Regex.new(".*"))
      end

      if value = @invocation_connectivity_parameters
        value.validate!
      end

      if value = @state_reason
        raise Core::ValidationError.new("StateReason length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("StateReason length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("StateReason does not match the required pattern") unless value.matches?(Regex.new(".*"))
      end

      if value = @secret_arn
        raise Core::ValidationError.new("SecretArn length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("SecretArn length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("SecretArn does not match the required pattern") unless value.matches?(Regex.new("^arn:aws([a-z]|\\-)*:secretsmanager:([a-z]|\\d|\\-)*:([0-9]{12})?:secret:[\\/_+=\\.@\\-A-Za-z0-9]+$"))
      end

      if value = @kms_key_identifier
        raise Core::ValidationError.new("KmsKeyIdentifier length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("KmsKeyIdentifier length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("KmsKeyIdentifier does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-/:]*$"))
      end

      if value = @auth_parameters
        value.validate!
      end
    end

    def_equals_and_hash(@connection_arn, @name, @description, @invocation_connectivity_parameters, @connection_state, @state_reason, @authorization_type, @secret_arn, @kms_key_identifier, @auth_parameters, @creation_time, @last_modified_time, @last_authorized_time)
  end
end
