module Amazonite::SsmV1
  class DescribePatchGroupsRequest
    include JSON::Serializable

    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    @[JSON::Field(key: "Filters")]
    property filters : Array(PatchOrchestratorFilter) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @max_results : Int32 | Nil = nil,
      @filters : Array(PatchOrchestratorFilter) | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
