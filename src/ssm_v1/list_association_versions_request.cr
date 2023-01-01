module Amazonite::SsmV1
  class ListAssociationVersionsRequest
    include JSON::Serializable

    @[JSON::Field(key: "AssociationId")]
    property association_id : String

    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @association_id : String,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
