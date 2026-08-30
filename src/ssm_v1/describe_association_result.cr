module Amazonite::SsmV1
  class DescribeAssociationResult
    include JSON::Serializable

    # Information about the association.
    @[JSON::Field(key: "AssociationDescription")]
    property association_description : AssociationDescription | Nil

    def initialize(
      @association_description : AssociationDescription | Nil = nil,
    )
    end
  end
end
