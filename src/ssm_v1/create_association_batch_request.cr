module Amazonite::SsmV1
  class CreateAssociationBatchRequest
    include JSON::Serializable

    @[JSON::Field(key: "Entries")]
    property entries : Array(CreateAssociationBatchRequestEntry) = [] of CreateAssociationBatchRequestEntry

    @[JSON::Field(key: "AssociationDispatchAssumeRole")]
    property association_dispatch_assume_role : String | Nil

    def initialize(
      @entries : Array(CreateAssociationBatchRequestEntry),
      @association_dispatch_assume_role : String | Nil = nil,
    )
    end
  end
end
