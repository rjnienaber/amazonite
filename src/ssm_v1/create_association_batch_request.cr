module Amazonite::SsmV1
  class CreateAssociationBatchRequest
    include JSON::Serializable

    @[JSON::Field(key: "Entries")]
    property entries : Array(CreateAssociationBatchRequestEntry)

    def initialize(
      @entries : Array(CreateAssociationBatchRequestEntry)
    )
    end
  end
end
