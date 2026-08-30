module Amazonite::SsmV1
  class ListComplianceItemsRequest
    include JSON::Serializable

    # One or more compliance filters. Use a filter to return a more specific list of results.
    @[JSON::Field(key: "Filters")]
    property filters : Array(ComplianceStringFilter) | Nil

    # The ID for the resources from which to get compliance information. Currently, you can only
    # specify one resource ID.
    @[JSON::Field(key: "ResourceIds")]
    property resource_ids : Array(String) | Nil

    # The type of resource from which to get compliance information. Currently, the only supported
    # resource type is `ManagedInstance`.
    @[JSON::Field(key: "ResourceTypes")]
    property resource_types : Array(String) | Nil

    # A token to start the list. Use this token to get the next set of results.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    # The maximum number of items to return for this call. The call also returns a token that you can
    # specify in a subsequent call to get the next set of results.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    def initialize(
      @filters : Array(ComplianceStringFilter) | Nil = nil,
      @resource_ids : Array(String) | Nil = nil,
      @resource_types : Array(String) | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
    )
    end

    def_equals_and_hash(@filters, @resource_ids, @resource_types, @next_token, @max_results)
  end
end
