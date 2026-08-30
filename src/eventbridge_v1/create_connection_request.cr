private alias AEB = Amazonite::EventBridgeV1

module Amazonite::EventBridgeV1
  class CreateConnectionRequest
    include JSON::Serializable

    # The name for the connection to create.
    @[JSON::Field(key: "Name")]
    property name : String

    # A description for the connection to create.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    # The type of authorization to use for the connection.
    #
    # OAUTH tokens are refreshed when a 401 or 407 response is returned.
    @[JSON::Field(key: "AuthorizationType", converter: AEB::ConnectionAuthorizationType)]
    property authorization_type : ConnectionAuthorizationType

    # The authorization parameters to use to authorize with the endpoint.
    #
    # You must include only authorization parameters for the `AuthorizationType` you specify.
    @[JSON::Field(key: "AuthParameters")]
    property auth_parameters : CreateConnectionAuthRequestParameters

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
      @authorization_type : ConnectionAuthorizationType,
      @auth_parameters : CreateConnectionAuthRequestParameters,
      @description : String | Nil = nil,
      @invocation_connectivity_parameters : ConnectivityResourceParameters | Nil = nil,
      @kms_key_identifier : String | Nil = nil,
    )
    end
  end
end
