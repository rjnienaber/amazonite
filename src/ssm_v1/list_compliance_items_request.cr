module Amazonite::SsmV1
  class ListComplianceItemsRequest
    include JSON::Serializable

    @[JSON::Field(key: "Filters")]
    property filters : Array(ComplianceStringFilter) | Nil

    @[JSON::Field(key: "ResourceIds")]
    property resource_ids : Array(String) | Nil

    @[JSON::Field(key: "ResourceTypes")]
    property resource_types : Array(String) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    def initialize(
      @filters : Array(ComplianceStringFilter) | Nil = nil,
      @resource_ids : Array(String) | Nil = nil,
      @resource_types : Array(String) | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil
    )
    end
  end
end
