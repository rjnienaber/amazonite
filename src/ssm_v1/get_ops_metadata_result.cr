module Amazonite::SsmV1
  class GetOpsMetadataResult
    include JSON::Serializable

    # The resource ID of the Application Manager application.
    @[JSON::Field(key: "ResourceId")]
    property resource_id : String | Nil

    # OpsMetadata for an Application Manager application.
    @[JSON::Field(key: "Metadata")]
    property metadata : Hash(String, MetadataValue) | Nil

    # The token for the next set of items to return. Use this token to get the next set of results.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @resource_id : String | Nil = nil,
      @metadata : Hash(String, MetadataValue) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def_equals_and_hash(@resource_id, @metadata, @next_token)
  end
end
