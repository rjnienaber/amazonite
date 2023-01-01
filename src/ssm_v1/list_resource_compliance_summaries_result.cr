module Amazonite::SsmV1
  class ListResourceComplianceSummariesResult
    include JSON::Serializable

    @[JSON::Field(key: "ResourceComplianceSummaryItems")]
    property resource_compliance_summary_items : Array(ResourceComplianceSummaryItem) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @resource_compliance_summary_items : Array(ResourceComplianceSummaryItem) | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
