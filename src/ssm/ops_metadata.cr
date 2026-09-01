private alias Core = Amazonite::Core

module Amazonite::Ssm
  # Operational metadata for an application in Application Manager.
  class OpsMetadata
    include JSON::Serializable

    # The ID of the Application Manager application.
    @[JSON::Field(key: "ResourceId")]
    property resource_id : String | Nil

    # The Amazon Resource Name (ARN) of the OpsMetadata Object or blob.
    @[JSON::Field(key: "OpsMetadataArn")]
    property ops_metadata_arn : String | Nil

    # The date the OpsMetadata object was last updated.
    @[JSON::Field(key: "LastModifiedDate", converter: Core::AWSEpochConverter)]
    property last_modified_date : Time | Nil

    # The user name who last updated the OpsMetadata object.
    @[JSON::Field(key: "LastModifiedUser")]
    property last_modified_user : String | Nil

    # The date the OpsMetadata objects was created.
    @[JSON::Field(key: "CreationDate", converter: Core::AWSEpochConverter)]
    property creation_date : Time | Nil

    def initialize(
      @resource_id : String | Nil = nil,
      @ops_metadata_arn : String | Nil = nil,
      @last_modified_date : Time | Nil = nil,
      @last_modified_user : String | Nil = nil,
      @creation_date : Time | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @resource_id
        raise Core::ValidationError.new("ResourceId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ResourceId length must be <= 1024") if value.size > 1024
        raise Core::ValidationError.new("ResourceId does not match the required pattern") unless value.matches?(Regex.new("^(?!\\s*$).+$"))
      end

      if value = @ops_metadata_arn
        raise Core::ValidationError.new("OpsMetadataArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("OpsMetadataArn length must be <= 1011") if value.size > 1011
        raise Core::ValidationError.new("OpsMetadataArn does not match the required pattern") unless value.matches?(Regex.new("^arn:(aws[a-zA-Z-]*)?:ssm:[a-z0-9-\\.]{0,63}:[a-z0-9-\\.]{0,63}:opsmetadata\\/([a-zA-Z0-9-_\\.\\/]*)$"))
      end
    end

    def_equals_and_hash(@resource_id, @ops_metadata_arn, @last_modified_date, @last_modified_user, @creation_date)
  end
end
