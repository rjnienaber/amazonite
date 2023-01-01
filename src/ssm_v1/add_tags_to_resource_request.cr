private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class AddTagsToResourceRequest
    include JSON::Serializable

    @[JSON::Field(key: "ResourceType", converter: AS::ResourceTypeForTagging)]
    property resource_type : ResourceTypeForTagging

    @[JSON::Field(key: "ResourceId")]
    property resource_id : String

    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag)

    def initialize(
      @resource_type : ResourceTypeForTagging,
      @resource_id : String,
      @tags : Array(Tag)
    )
    end
  end
end
