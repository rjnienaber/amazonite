module Amazonite::SsmV1
  class ListComplianceSummariesResult
    include JSON::Serializable

    @[JSON::Field(key: "ComplianceSummaryItems")]
    property compliance_summary_items : Array(ComplianceSummaryItem) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @compliance_summary_items : Array(ComplianceSummaryItem) | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
