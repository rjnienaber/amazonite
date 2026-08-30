module Amazonite::SsmV1
  class ListAssociationsRequest
    include JSON::Serializable

    # One or more filters. Use a filter to return a more specific list of results.
    #
    # Filtering associations using the `InstanceID` attribute only returns legacy associations created
    # using the `InstanceID` attribute. Associations targeting the managed node that are part of the
    # Target Attributes `ResourceGroup` or `Tags` aren't returned.
    @[JSON::Field(key: "AssociationFilterList")]
    property association_filter_list : Array(AssociationFilter) | Nil

    # The maximum number of items to return for this call. The call also returns a token that you can
    # specify in a subsequent call to get the next set of results.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    # The token for the next set of items to return. (You received this token from a previous call.)
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @association_filter_list : Array(AssociationFilter) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def_equals_and_hash(@association_filter_list, @max_results, @next_token)
  end
end
