module Amazonite::SsmV1
  class AssociateOpsItemRelatedItemResponse
    include JSON::Serializable

    # The association ID.
    @[JSON::Field(key: "AssociationId")]
    property association_id : String | Nil

    def initialize(
      @association_id : String | Nil = nil,
    )
    end
  end
end
