module Amazonite::SsmV1
  class ListAssociationsRequest
    include JSON::Serializable

    @[JSON::Field(key: "AssociationFilterList")]
    property association_filter_list : Array(AssociationFilter) | Nil

    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @association_filter_list : Array(AssociationFilter) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
