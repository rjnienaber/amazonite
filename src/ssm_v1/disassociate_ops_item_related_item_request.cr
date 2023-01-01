module Amazonite::SsmV1
  class DisassociateOpsItemRelatedItemRequest
    include JSON::Serializable

    @[JSON::Field(key: "OpsItemId")]
    property ops_item_id : String

    @[JSON::Field(key: "AssociationId")]
    property association_id : String

    def initialize(
      @ops_item_id : String,
      @association_id : String
    )
    end
  end
end
