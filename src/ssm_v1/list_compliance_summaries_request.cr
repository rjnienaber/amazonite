module Amazonite::SsmV1
  class ListComplianceSummariesRequest
    include JSON::Serializable

    @[JSON::Field(key: "Filters")]
    property filters : Array(ComplianceStringFilter) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    def initialize(
      @filters : Array(ComplianceStringFilter) | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil
    )
    end
  end
end
