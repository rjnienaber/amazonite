module Amazonite::SsmV1
  class AssociateOpsItemRelatedItemRequest
    include JSON::Serializable

    @[JSON::Field(key: "OpsItemId")]
    property ops_item_id : String

    @[JSON::Field(key: "AssociationType")]
    property association_type : String

    @[JSON::Field(key: "ResourceType")]
    property resource_type : String

    @[JSON::Field(key: "ResourceUri")]
    property resource_uri : String

    def initialize(
      @ops_item_id : String,
      @association_type : String,
      @resource_type : String,
      @resource_uri : String
    )
    end
  end
end
