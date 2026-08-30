module Amazonite::SsmV1
  class DisassociateOpsItemRelatedItemRequest
    include JSON::Serializable

    # The ID of the OpsItem for which you want to delete an association between the OpsItem and a
    # related item.
    @[JSON::Field(key: "OpsItemId")]
    property ops_item_id : String

    # The ID of the association for which you want to delete an association between the OpsItem and a
    # related item.
    @[JSON::Field(key: "AssociationId")]
    property association_id : String

    def initialize(
      @ops_item_id : String,
      @association_id : String,
    )
    end

    def_equals_and_hash(@ops_item_id, @association_id)
  end
end
