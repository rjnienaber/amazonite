private alias Core = Amazonite::Core

module Amazonite::Ssm
  class UpdateOpsMetadataRequest
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the OpsMetadata Object to update.
    @[JSON::Field(key: "OpsMetadataArn")]
    property ops_metadata_arn : String

    # Metadata to add to an OpsMetadata object.
    @[JSON::Field(key: "MetadataToUpdate")]
    property metadata_to_update : Hash(String, MetadataValue) | Nil

    # The metadata keys to delete from the OpsMetadata object.
    @[JSON::Field(key: "KeysToDelete")]
    property keys_to_delete : Array(String) | Nil

    def initialize(
      @ops_metadata_arn : String,
      @metadata_to_update : Hash(String, MetadataValue) | Nil = nil,
      @keys_to_delete : Array(String) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @ops_metadata_arn
        raise Core::ValidationError.new("OpsMetadataArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("OpsMetadataArn length must be <= 1011") if value.size > 1011
        raise Core::ValidationError.new("OpsMetadataArn does not match the required pattern") unless value.matches?(Regex.new("^arn:(aws[a-zA-Z-]*)?:ssm:[a-z0-9-\\.]{0,63}:[a-z0-9-\\.]{0,63}:opsmetadata\\/([a-zA-Z0-9-_\\.\\/]*)$"))
      end

      if value = @metadata_to_update
        raise Core::ValidationError.new("MetadataToUpdate must have at least 1 entry(s)") if value.size < 1
        raise Core::ValidationError.new("MetadataToUpdate must have at most 5 entry(s)") if value.size > 5
        value.each_value(&.validate!)
      end

      if value = @keys_to_delete
        raise Core::ValidationError.new("KeysToDelete must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("KeysToDelete must have at most 10 item(s)") if value.size > 10
      end
    end

    def_equals_and_hash(@ops_metadata_arn, @metadata_to_update, @keys_to_delete)
  end
end
