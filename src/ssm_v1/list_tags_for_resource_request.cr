private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class ListTagsForResourceRequest
    include JSON::Serializable

    # Returns a list of tags for a specific resource type.
    @[JSON::Field(key: "ResourceType", converter: AS::ResourceTypeForTagging)]
    property resource_type : ResourceTypeForTagging

    # The resource ID for which you want to see a list of tags.
    @[JSON::Field(key: "ResourceId")]
    property resource_id : String

    def initialize(
      @resource_type : ResourceTypeForTagging,
      @resource_id : String,
    )
    end
  end
end
