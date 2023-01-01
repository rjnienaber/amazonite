module Amazonite::SsmV1
  class UpdateOpsMetadataRequest
    include JSON::Serializable

    @[JSON::Field(key: "OpsMetadataArn")]
    property ops_metadata_arn : String

    @[JSON::Field(key: "MetadataToUpdate")]
    property metadata_to_update : Hash(String, MetadataValue) | Nil

    @[JSON::Field(key: "KeysToDelete")]
    property keys_to_delete : Array(String) | Nil

    def initialize(
      @ops_metadata_arn : String,
      @metadata_to_update : Hash(String, MetadataValue) | Nil = nil,
      @keys_to_delete : Array(String) | Nil = nil
    )
    end
  end
end
