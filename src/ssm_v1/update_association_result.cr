module Amazonite::SsmV1
  class UpdateAssociationResult
    include JSON::Serializable

    # The description of the association that was updated.
    @[JSON::Field(key: "AssociationDescription")]
    property association_description : AssociationDescription | Nil

    def initialize(
      @association_description : AssociationDescription | Nil = nil,
    )
    end
  end
end
