module Amazonite::SsmV1
  class UpdateAssociationStatusResult
    include JSON::Serializable

    @[JSON::Field(key: "AssociationDescription")]
    property association_description : AssociationDescription | Nil

    def initialize(
      @association_description : AssociationDescription | Nil = nil
    )
    end
  end
end
