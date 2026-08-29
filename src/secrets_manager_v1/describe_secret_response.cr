private alias Core = Amazonite::Core

module Amazonite::SecretsManagerV1
  class DescribeSecretResponse
    include JSON::Serializable

    @[JSON::Field(key: "ARN")]
    property arn : String | Nil

    @[JSON::Field(key: "Name")]
    property name : String | Nil

    @[JSON::Field(key: "Type")]
    property type : String | Nil

    @[JSON::Field(key: "Description")]
    property description : String | Nil

    @[JSON::Field(key: "KmsKeyId")]
    property kms_key_id : String | Nil

    @[JSON::Field(key: "RotationEnabled")]
    property rotation_enabled : Bool | Nil

    @[JSON::Field(key: "RotationLambdaARN")]
    property rotation_lambda_arn : String | Nil

    @[JSON::Field(key: "RotationRules")]
    property rotation_rules : RotationRulesType | Nil

    @[JSON::Field(key: "ExternalSecretRotationMetadata")]
    property external_secret_rotation_metadata : Array(ExternalSecretRotationMetadataItem) | Nil

    @[JSON::Field(key: "ExternalSecretRotationRoleArn")]
    property external_secret_rotation_role_arn : String | Nil

    @[JSON::Field(key: "LastRotatedDate", converter: Core::AWSEpochConverter)]
    property last_rotated_date : Time | Nil

    @[JSON::Field(key: "LastChangedDate", converter: Core::AWSEpochConverter)]
    property last_changed_date : Time | Nil

    @[JSON::Field(key: "LastAccessedDate", converter: Core::AWSEpochConverter)]
    property last_accessed_date : Time | Nil

    @[JSON::Field(key: "DeletedDate", converter: Core::AWSEpochConverter)]
    property deleted_date : Time | Nil

    @[JSON::Field(key: "NextRotationDate", converter: Core::AWSEpochConverter)]
    property next_rotation_date : Time | Nil

    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) | Nil

    @[JSON::Field(key: "VersionIdsToStages")]
    property version_ids_to_stages : Hash(String, Array(String)) | Nil

    @[JSON::Field(key: "OwningService")]
    property owning_service : String | Nil

    @[JSON::Field(key: "CreatedDate", converter: Core::AWSEpochConverter)]
    property created_date : Time | Nil

    @[JSON::Field(key: "PrimaryRegion")]
    property primary_region : String | Nil

    @[JSON::Field(key: "ReplicationStatus")]
    property replication_status : Array(ReplicationStatusType) | Nil

    def initialize(
      @arn : String | Nil = nil,
      @name : String | Nil = nil,
      @type : String | Nil = nil,
      @description : String | Nil = nil,
      @kms_key_id : String | Nil = nil,
      @rotation_enabled : Bool | Nil = nil,
      @rotation_lambda_arn : String | Nil = nil,
      @rotation_rules : RotationRulesType | Nil = nil,
      @external_secret_rotation_metadata : Array(ExternalSecretRotationMetadataItem) | Nil = nil,
      @external_secret_rotation_role_arn : String | Nil = nil,
      @last_rotated_date : Time | Nil = nil,
      @last_changed_date : Time | Nil = nil,
      @last_accessed_date : Time | Nil = nil,
      @deleted_date : Time | Nil = nil,
      @next_rotation_date : Time | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @version_ids_to_stages : Hash(String, Array(String)) | Nil = nil,
      @owning_service : String | Nil = nil,
      @created_date : Time | Nil = nil,
      @primary_region : String | Nil = nil,
      @replication_status : Array(ReplicationStatusType) | Nil = nil,
    )
    end
  end
end
