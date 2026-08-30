private alias AEB = Amazonite::EventBridgeV1
private alias Core = Amazonite::Core

module Amazonite::EventBridgeV1
  class UpdateConnectionRequest
    include JSON::Serializable

    # The name of the connection to update.
    @[JSON::Field(key: "Name")]
    property name : String

    # A description for the connection.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    # The type of authorization to use for the connection.
    @[JSON::Field(key: "AuthorizationType", converter: AEB::ConnectionAuthorizationType)]
    property authorization_type : ConnectionAuthorizationType | Nil

    # The authorization parameters to use for the connection.
    @[JSON::Field(key: "AuthParameters")]
    property auth_parameters : UpdateConnectionAuthRequestParameters | Nil

    # For connections to private APIs, the parameters to use for invoking the API.
    #
    # For more information, see [Connecting to private
    # APIs](https://docs.aws.amazon.com/eventbridge/latest/userguide/connection-private.html) in the *
    # *Amazon EventBridge User Guide* *.
    @[JSON::Field(key: "InvocationConnectivityParameters")]
    property invocation_connectivity_parameters : ConnectivityResourceParameters | Nil

    # The identifier of the KMS customer managed key for EventBridge to use, if you choose to use a
    # customer managed key to encrypt this connection. The identifier can be the key Amazon Resource
    # Name (ARN), KeyId, key alias, or key alias ARN.
    #
    # If you do not specify a customer managed key identifier, EventBridge uses an Amazon Web Services
    # owned key to encrypt the connection.
    #
    # For more information, see [Identify and view
    # keys](https://docs.aws.amazon.com/kms/latest/developerguide/viewing-keys.html) in the *Key
    # Management Service Developer Guide*.
    @[JSON::Field(key: "KmsKeyIdentifier")]
    property kms_key_identifier : String | Nil

    def initialize(
      @name : String,
      @description : String | Nil = nil,
      @authorization_type : ConnectionAuthorizationType | Nil = nil,
      @auth_parameters : UpdateConnectionAuthRequestParameters | Nil = nil,
      @invocation_connectivity_parameters : ConnectivityResourceParameters | Nil = nil,
      @kms_key_identifier : String | Nil = nil,
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

      if value = @auth_parameters
        value.validate!
      end

      if value = @invocation_connectivity_parameters
        value.validate!
      end

      if value = @kms_key_identifier
        raise Core::ValidationError.new("KmsKeyIdentifier length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("KmsKeyIdentifier length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("KmsKeyIdentifier does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-/:]*$"))
      end
    end

    def_equals_and_hash(@name, @description, @authorization_type, @auth_parameters, @invocation_connectivity_parameters, @kms_key_identifier)
  end
end
