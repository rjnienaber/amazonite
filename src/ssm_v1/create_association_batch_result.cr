module Amazonite::SsmV1
  class CreateAssociationBatchResult
    include JSON::Serializable

    # Information about the associations that succeeded.
    @[JSON::Field(key: "Successful")]
    property successful : Array(AssociationDescription) | Nil

    # Information about the associations that failed.
    @[JSON::Field(key: "Failed")]
    property failed : Array(FailedCreateAssociation) | Nil

    def initialize(
      @successful : Array(AssociationDescription) | Nil = nil,
      @failed : Array(FailedCreateAssociation) | Nil = nil,
    )
    end
  end
end
