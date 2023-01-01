module Amazonite::SsmV1
  class GetOpsMetadataResult
    include JSON::Serializable

    @[JSON::Field(key: "ResourceId")]
    property resource_id : String | Nil

    @[JSON::Field(key: "Metadata")]
    property metadata : Hash(String, MetadataValue) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @resource_id : String | Nil = nil,
      @metadata : Hash(String, MetadataValue) | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
