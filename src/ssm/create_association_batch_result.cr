private alias Core = Amazonite::Core

module Amazonite::Ssm
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

    def validate! : Nil
      if value = @successful
        value.each(&.validate!)
      end

      if value = @failed
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@successful, @failed)
  end
end
