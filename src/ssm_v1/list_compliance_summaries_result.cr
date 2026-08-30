module Amazonite::SsmV1
  class ListComplianceSummariesResult
    include JSON::Serializable

    # A list of compliant and non-compliant summary counts based on compliance types. For example,
    # this call returns State Manager associations, patches, or custom compliance types according to
    # the filter criteria that you specified.
    @[JSON::Field(key: "ComplianceSummaryItems")]
    property compliance_summary_items : Array(ComplianceSummaryItem) | Nil

    # The token for the next set of items to return. Use this token to get the next set of results.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @compliance_summary_items : Array(ComplianceSummaryItem) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
