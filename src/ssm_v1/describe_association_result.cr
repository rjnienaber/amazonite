private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @association_description
        value.validate!
      end
    end

    def_equals_and_hash(@association_description)
  end
end
