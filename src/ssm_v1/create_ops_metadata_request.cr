module Amazonite::SsmV1
  class CreateOpsMetadataRequest
    include JSON::Serializable

    @[JSON::Field(key: "ResourceId")]
    property resource_id : String

    @[JSON::Field(key: "Metadata")]
    property metadata : Hash(String, MetadataValue) | Nil

    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) | Nil

    def initialize(
      @resource_id : String,
      @metadata : Hash(String, MetadataValue) | Nil = nil,
      @tags : Array(Tag) | Nil = nil
    )
    end
  end
end
