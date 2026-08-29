module Amazonite::SsmV1
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
  end
end
