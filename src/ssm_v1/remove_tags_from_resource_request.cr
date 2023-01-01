private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class RemoveTagsFromResourceRequest
    include JSON::Serializable

    @[JSON::Field(key: "ResourceType", converter: AS::ResourceTypeForTagging)]
    property resource_type : ResourceTypeForTagging

    @[JSON::Field(key: "ResourceId")]
    property resource_id : String

    @[JSON::Field(key: "TagKeys")]
    property tag_keys : Array(String)

    def initialize(
      @resource_type : ResourceTypeForTagging,
      @resource_id : String,
      @tag_keys : Array(String)
    )
    end
  end
end
