private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class ListTagsForResourceRequest
    include JSON::Serializable

    @[JSON::Field(key: "ResourceType", converter: AS::ResourceTypeForTagging)]
    property resource_type : ResourceTypeForTagging

    @[JSON::Field(key: "ResourceId")]
    property resource_id : String

    def initialize(
      @resource_type : ResourceTypeForTagging,
      @resource_id : String
    )
    end
  end
end
