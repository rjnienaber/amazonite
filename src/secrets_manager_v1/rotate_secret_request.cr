module Amazonite::SecretsManagerV1
  class RotateSecretRequest
    include JSON::Serializable

    @[JSON::Field(key: "SecretId")]
    property secret_id : String

    @[JSON::Field(key: "ClientRequestToken")]
    property client_request_token : String | Nil

    @[JSON::Field(key: "RotationLambdaARN")]
    property rotation_lambda_arn : String | Nil

    @[JSON::Field(key: "RotationRules")]
    property rotation_rules : RotationRulesType | Nil

    @[JSON::Field(key: "ExternalSecretRotationMetadata")]
    property external_secret_rotation_metadata : Array(ExternalSecretRotationMetadataItem) | Nil

    @[JSON::Field(key: "ExternalSecretRotationRoleArn")]
    property external_secret_rotation_role_arn : String | Nil

    @[JSON::Field(key: "RotateImmediately")]
    property rotate_immediately : Bool | Nil

    def initialize(
      @secret_id : String,
      @client_request_token : String | Nil = nil,
      @rotation_lambda_arn : String | Nil = nil,
      @rotation_rules : RotationRulesType | Nil = nil,
      @external_secret_rotation_metadata : Array(ExternalSecretRotationMetadataItem) | Nil = nil,
      @external_secret_rotation_role_arn : String | Nil = nil,
      @rotate_immediately : Bool | Nil = nil,
    )
    end
  end
end
